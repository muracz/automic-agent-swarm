#!/bin/sh

# Global settings normally to be set with environment variables

# prefix="DA"
# system="AUTOMIC1"
# cp="localhost:2017"


# Set all the necessary variables
path="/Automic"
exec="ucxjlx6"
exec="ucxjlx6m"
sufix=$(hostname | cut -c1-8)
agent="${prefix}_${sufix}"

# Print out the global variables
echo "Starting agent with the following setup:"
echo " System:  ${system}"
echo " CP:      ${cp}"
echo " Prefix:  ${prefix}"
echo "===================="

# Generate the configuration file
cd ${path}
template=$(find . -name "*_template")
config=$(echo ${template} | sed 's/_template//g')

cat ${template} | sed -e "s/#AGENT#/${agent}/g" -e "s/#CP#/${cp}/g" -e "s/#SYSTEM#/${system}/g" > ${config}

# Set the necesary permissions
chown root ${path}/bin/${exec}
chmod 4755 ${path}/bin/${exec}
chmod 755 ${path}/agent/bin/${exec_md}
ls -l ${path}/bin/${exec}

# Start the agent
${path}/bin/${exec}
