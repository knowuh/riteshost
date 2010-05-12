#!/usr/bin/env ruby
USER=ARGV.shift
PASSWORD=ARGV.shift
DB_NAMES=ARGV
DEBUG=true
HOSTS = %w| %.concord.org 63.138.119.%  localhost 127.0.0.1 |
  
puts "User: #{USER}      Pass: #{PASSWORD}       Databases:  #{DB_NAMES.join(", ")}"

def run(command) 
  if DEBUG  
    puts command
  else
    %x |command|
  end
end

HOSTS.each do |host|
  run "mysql mysql -u root -e drop user '#{USER}'@'#{host}';"
  run "mysql mysql -u root -e create user '#{USER}'@'#{host}' identified by '#{PASSWORD}';"
end

DB_NAMES.each do | db_name | 
  HOSTS.each do |host|
    run "mysql mysql -u root -e grant all privileges on #{db_name}.* to '#{USER}'@'#{host}' with grant option;"
  end
end