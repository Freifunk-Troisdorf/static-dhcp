# Static IP Addresses 
Repo for Static DHCP Addresses in the Freifunk Community Troisdorf

Please use IP Addresses in the 10.188.2.xxx range.

Use the following syntax for yout Hosts:

host NAME {
                hardware ethernet xx:xx:xx:xx:xx ; --- Your MAC Address
                fixed-address 10.188.1.27; --- The IP Address you would like to use
                option host-name "database"; --- your hostname
}

Enter your data into the static.conf file and open a Pull request. 

If you dont work with github, send us a E-Mail with your Data.
