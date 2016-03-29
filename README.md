Script Name:
lu

Description:
Looks up a single, group or all host's prod/non-prod monitoring configuration related to java/httpd/other web related services and 
report unmonitored services or processes that are running.  It will initially verify hosts from DNS and if successful, proceed to identify the host's configuration in the monitoring systems. It is designed to be silent with no output unless the host has an unmonitored service or process detected but when running in 'all' or 'group' mode it will display the host as it goes through the list of servers.  The 'all' and 'group' mode initiates a refresh of monitoring config files; the 'all' mode refreshes `all-servers` file containing all hosts monitored by the monitoring server.  No configuration or host list refresh are performed for 'single' mode, you must remove the files manually from the config directory if you need refresh. Logs are available in the log sub directory (see Logs section below for more information).  The output can be accurate if the monitoring configuration files are formatted properly.

Location:
Prod monitoring server (local) 

Syntax:
Usage: ./lu [hostname] (looks up monitoring config for a single host).
       ./lu [all] (looks up monitoring config for hosts from a list called: all-servers).
       ./lu [grp] (looks up monitoring config for hosts from a user defined list. When prompted enter the file name of the user defined list, relative paths are valid).
       
The run time is interactive if there are hosts that require login authentication.

Logs:
Logs are created in a subdirectory called logs in the following format:  YYYY-MM-DD-HHMM.  The following files are produced:

online_svcs_not_monitored.log - contains hosts with running services or processes that are not monitored
hosts_with_no_services.log - contains hosts with no related services or processes, these hosts does not need to be monitored
online_unexpected_svcs.log - contains hosts with unexpected services or processes that are running, these hosts may need to be researched and may or may not be in the monitoring system already
online_svcs_monitored.log - contains hosts with service or processes that are already monitored
hostsvcs.log - contains the host's configuration block from the monitoring config and changes every time the script is called, it is used internally by the script
hosts_with_no_access.log - contains host that the script cannot access because of ssh or DNS is not set for this server or the server has been decomissioned but have not been removed from the list
awol_hosts.log - experimental list of hosts that may be used to identify hosts that are not in any of the monitoring servers

Config:

This directory contains the configuration files and list of hosts:
analysis.cfg - production xymon configuration file
hobbit-clients.cfg - non-production xymon configuration file
hosts-all.txt - lists of servers containing either the complete list of hosts or list of user defined hosts.
