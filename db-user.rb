#!/usr/bin/env ruby
#USER=ARGV.shift
#PASSWORD=ARGV.shift
#DB_NAMES=ARGV

# TODO: get rid of constants?
DEBUG=false
HOSTS = %w| %.concord.org 63.138.119.%  localhost 127.0.0.1 |
  
# puts "User: #{USER}      Pass: #{PASSWORD}       Databases:  #{DB_NAMES.join(", ")}"

def run(command) 
  if DEBUG  
    puts command
  else
    %x[#{command}]
  end
end

def db_add_user(username,password, dbnames)
  puts "User: #{username}      Pass: #{password}       Databases:  #{dbnames.join(", ")}"
  HOSTS.each do |host|
    run "mysql mysql -u root -e \"drop user '#{username}'@'#{host}';\""
    run "mysql mysql -u root -e \"create user '#{username}'@'#{host}' identified by '#{password}';\""
  end

  dbnames.each do | db_name | 
    HOSTS.each do |host|
      run "mysql mysql -u root -e \"grant all privileges on #{db_name}.* to '#{username}'@'#{host}' with grant option;\""
    end
  end
end

