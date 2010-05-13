#!/usr/bin/env ruby
require 'rubygems'
require 'yaml'
require 'highline/import'
require 'db-user'

BASE_DIR = File.expand_path("~/rites_host")
DATABASE_PROPERTIES_FILE="#{BASE_DIR}/database_properties.yml"
%x[cd #{BASE_DIR}]

@credentials = {}
def get_database_props
  if File.exist?(DATABASE_PROPERTIES_FILE)
    puts "using db properties found in #{DATABASE_PROPERTIES_FILE}"
    puts "delete this file (#{DATABASE_PROPERTIES_FILE}) to reset"    
    @credentials = YAML.load_file(DATABASE_PROPERTIES_FILE)
  else
    %w[ ccportal rails ].each do |name|
      username = ask("db USERNAME for #{name}: ") do |q| 
        q.default = 'portal_admin'
        q.echo = true
      end
      password = ask("db PASSWORD for #{name}: ") do |q|
        q.default = 's33kr3t'
        q.echo = '*'
      end
      @credentials[name] = {
        :username => username,
        :password => password
      }
    end
    File.open(DATABASE_PROPERTIES_FILE, 'w' ) do |out|
      YAML.dump(@credentials, out )
    end
    return @credentials
  end
end

def create_database(db_name)
  %x[echo mysqladmin -f -u root drop #{db_name}]
  %x[echo mysqladmin -f -u root create #{db_name}]
end

get_database_props
db_names = %w[mystery4 ccportal sunflower rails]
db_names.each { |db_name| create_database(db_name) }


db_add_user(@credentials['ccportal'][:username],@credentials['ccportal'][:pass], %w[ mystery4 ccportal sunflower])
db_add_user(@credentials['rails'][:username],@credentials['rails'][:pass], %w[ rails ])
#$BASE_DIR/db-user.rb $PORTAL_USER $PORTAL_PASS mystery4 ccportal sunflower
#$BASE_DIR/db-user.rb $RAILS_USER $RAILS_PASS rails
