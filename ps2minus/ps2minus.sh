#!/bin/bash
#################################################################################################################################
#--------------------------------------------------------------------------------------------------------------------------------

app=ps2minus
url=https://github.com/PCSX2/pcsx2/releases/download/v1.6.0/pcsx2-v1.6.0-linux-AppImage-32bit.AppImage

#--------------------------------------------------------------------------------------------------------------------------------
#################################################################################################################################
# optional: ---------------------------------------------------------------------------------------------------------------------
prefix="" 		# install directory, default: /userdata/system/pro/$app
name=""			# custom install info-name for app/package/system etc 
ext="" 			# default: extras.txt, filelist for download for get-extras
dep="" 			# get app dependencies (libs)  
repo=""			# specify custom repo (hosting)
mode="" 		# screen / text, default=screen
theme=""  		# color / bw, default=color
loader="" 		# loading animation yes/no, default=yes 
custom="" 		# run app-custom/post/install script, default=/extras/custom.sh  
port="" 		# add port (name), none = /extras/port.sh (to $app.sh), or /extras/launcher.sh 
#################################################################################################################################
#--------------------------------------------------------------------------------------------------------------------------------
				cd /tmp ; c=/tmp/batocera.pro-config ; rm $c 2>/dev/null
				echo "app="$app"" >> $c
				echo "url="$url"" >> $c
				echo "prefix="$prefix"" >> $c
				echo "name="$name"" >> $c
				echo "ext="$ext"" >> $c
				echo "dep="$dep"" >> $c
				echo "repo="$repo"" >> $c 
				echo "mode="$mode"" >> $c 
				echo "theme="$theme"" >> $c 
				echo "loader="$loader"" >> $c 
				echo "custom="$custom"" >> $c 
				echo "port="$port"" >> $c 
#################################################################################################################################
# start pro-framework 
cd /tmp/ ; rm /tmp/pro-framework.sh 2>/dev/null ; 
wget --no-check-certificate --no-cache --no-cookies -q -O /tmp/pro-framework.sh \
https://raw.githubusercontent.com/DRLEdition19/batocera.drl/main/.dep/pro-framework.sh ; 
dos2unix /tmp/pro-framework.sh ; source /tmp/pro-framework.sh 
#################################################################################################################################
#--------------------------------------------------------------------------------------------------------------------------------
say-hi
#################################################################################################################################
#--------------------------------------------------------------------------------------------------------------------------------
mkdir -p /userdata/system/pro/ps2minus/pcsx2/ 2>/dev/null
get-appimage "$url" "/userdata/system/pro/ps2minus/pcsx2" "pcsx2.AppImage"
#################################################################################################################################
#--------------------------------------------------------------------------------------------------------------------------------
get-extras
#################################################################################################################################
#--------------------------------------------------------------------------------------------------------------------------------
add-custom
#################################################################################################################################
#--------------------------------------------------------------------------------------------------------------------------------
# add-port 
#################################################################################################################################
#--------------------------------------------------------------------------------------------------------------------------------
add-autostart
#################################################################################################################################
#--------------------------------------------------------------------------------------------------------------------------------
say-bye
#################################################################################################################################
#--------------------------------------------------------------------------------------------------------------------------------

