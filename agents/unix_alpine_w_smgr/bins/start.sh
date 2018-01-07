#!/bin/sh

# Global settings normally to be set with environment variables

# prefix="DA"
# system="AUTOMIC1"
# cp="localhost:2017"


# Set all the necessary variables
path="/Automic"
exec="ucxjlx6"
exec_md="ucxjlx6m"
smgr="ucybsmgr"
sufix=$(hostname | cut -c1-8)
agent="${prefix}_${sufix}"

# Print out the global variables
echo "Starting agent with the following setup:"
echo " System:  ${system}"
echo " CP:      ${cp}"
echo " Prefix:  ${prefix}"
echo "===================="

# Generate the configuration file
cd ${path}/agent
template=$(find . -name "*_template")
config=$(echo ${template} | sed 's/_template//g')

cat ${template} | sed -e "s/#AGENT#/${agent}/g" -e "s/#CP#/${cp}/g" -e "s/#SYSTEM#/${system}/g" > ${config}

# Set the necesary permissions
chown root ${path}/agent/bin/${exec}
chmod 4755 ${path}/agent/bin/${exec}
chmod 755 ${path}/agent/bin/${exec_md}
ls -l ${path}/agent/bin/${exec}

# Export the libs
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${path}/smgr/bin/

# Start the agent
${path}/smgr/bin/${smgr}
