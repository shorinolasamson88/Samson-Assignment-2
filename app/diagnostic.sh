#!/bin/bash


command=$1
host=$2

if ! [ -z "$command" ] 
 then

    if [ "$command" == "system" ]
     then

         if [ -z "$host" ]
          then
  
            echo "====================================================="
            echo "                System Information                   "
            echo "====================================================="


            # Displaying hostname
            echo "Hostname: $(hostname)"

            # Displaying current user
            echo "Current User: $(whoami)"

            # Displaying date and time
            echo "Date/Time: $(date)"

            # Displaying operating system
            echo "Operating System: $(grep '^PRETTY_NAME=' /etc/os-release | cut -d'"' -f2)"

            # Displaying kernel version
            echo "Kernel Version: $(uname -r)"

            # Displaying uptime
            echo "Uptime: $(uptime)"

            # Displaying CPU information
            echo "CPU Information: $(lscpu | grep -E 'Architecture|CPU\(s\):|Model name|Core\(s\) per socket|Thread\(s\) per core')"

            # Displaying memory information
            echo "Memory Information: $(free -h)"

            # Displaying current working directory
            echo "Current Working Directory: $(pwd)"

            echo "====================================================="
            echo "     System Information Check Completed.              "
            echo "====================================================="

        else 

            echo " diagnostic: '$host' is not a valid command. See 'diagnostic help'."

            exit 2

        fi


    elif [ "$command" == "network" ]
     then
	        
        if [ -z "$host" ]
         then
        
            echo "diagnostic: error: argument is required. See 'diagnostic help'."

  
            exit 2
    
        fi

        # Validation of hostname
        if  getent ahosts "$host" &>/dev/null
         then 

	    echo "==============================================="
            echo "           Network Status Check "
            echo "==============================================="
	    echo "Valid Hostname Input"
        
            echo " IP Address: $(getent ahosts "$host" | head -n 1 | awk '{ print $1}')"
        
            echo " Checking Network Connectivity..."
       
            # Checking if the hostname is reachable
            if ping -c 1 "$host" &>/dev/null
             then
   
                echo "Network Connection check successful"

                echo "==============================================="
                echo "           Network Check Completed             "
                echo "==============================================="
        
            else
   
		        echo "==============================================="
	            echo "           Network Status Check "
	            echo "==============================================="
     
                echo "Network Connection Failed"

                echo "==============================================="
                echo "           Network Check Completed             "
                echo "==============================================="


                exit 1
            fi

    
            
        else

            echo "==============================================="
            echo "           Network Status Check "
            echo "==============================================="
    
            echo "            Hostname is Invalid                "  


            echo "==============================================="
            echo "           Network Check Completed             "
            echo "==============================================="
   

            exit 2

        fi
 
    elif [ "$command" == "disk" ]
     then
        
        if [ -z "$host" ]
         then
        
            echo "====================================================="
            echo "             Disk Usage Information                  "
            echo "====================================================="
 
            df -h

    
            
            echo "====================================================="
            echo "         Disk Usage Information Completed.           "
            echo "====================================================="
    
        else 

            echo " diagnostic: '$host' is not a valid command. See 'diagnostic help'."

            exit 2

        fi


    elif [ "$command" == "help" ]
     then

        echo "====================================================="
        echo "                    Help Menu                      "
        echo "====================================================="

        echo "NAME"
        echo ""          
        echo " diagnostic - the powerful checker"
    
        echo ""
        echo ""
        echo " Diagnostic is a fast, scalable and powerful CLI tool used to check linux system, network and disk information"

        echo ""

        echo " USAGE "
        echo ""

        echo " diagnostic [COMMAND]  "
        echo ""

        echo " for system, disk, help no option is required"
        echo ""

        echo " diagnostic [COMMAND] [OPTION] "
        echo ""

        echo " for network option is required"
        echo ""

        echo "COMMANDS"
        echo ""

        echo " system -  Display useful Linux system information "
        echo " network - Check the supplied host information "
        echo " disk - Display disk information "
        echo " help - Display commands and usage "

        echo ""

        echo "OPTION"
        echo ""
        echo " Hostname or IP address to resolve and check connectivity "
        echo " e.g google.com, example.com, 8.8.8.8 "

        echo "====================================================="
        echo "                    Completed                       "
        echo "====================================================="


    else

        echo " diagnostic: '$command' is not a valid command. See 'diagnostic help'."

        exit 2

    fi

else 

    echo " diagnostic: No command specified. See 'diagnostic help' for valid diagnostic commands ."

 exit 2
fi









    
            
         
       
    
      
		
 
            
         
       
    
      

		
 
    



