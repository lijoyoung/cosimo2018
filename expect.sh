#!/usr/bin/expect -f

# mysql_temp_pass=$(grep 'temporary password' /var/log/mysqld.log | sed -n -e 's/^.*root@localhost: //p')
# echo $mysql_temp_pass

# sed -i 's|xxxxx|'\"$mysql_temp_pass\"'|g' /tmp/expect.sh

set timeout 2
set mysql_temp_pass xxxxx
set mysql_new_pass "2/XzS6atdd=h"

spawn mysql_secure_installation

expect "Enter password for user root:"

send "$mysql_temp_pass\r"

expect "New password:"

send "$mysql_new_pass\r"

expect "Re-enter new password:"

send "$mysql_new_pass\r"

expect "*any other key for No) :"

send "n\r"

expect "#"

send "n\r"

expect "#"

send "n\r"

expect "#"

send "n\r"

expect "#"

send "y\r"

expect eof