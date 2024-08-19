#!/bin/bash

# Print text in blue color
echo -e "\e[34mBashScan! - A fast port scanner in Bash!  \e[0m"
# Array of dialogues
dialogues=(
  "Scanning the depths of the network!"
  "Hunting for open ports, one packet at a time!"
  "Stealth mode activated, let's find those services!"
  "Mapping the network, hold tight!"
  "Time to reveal what's hidden in the shadows!"
  "Searching for weak points, stay sharp!"
  "Every open port is a door to opportunity!"
  "Probing the system for potential entries!"
  "No port left unchecked, let's do this!"
  "Uncovering the secrets of the network!"
  "Your network's about to be exposed!"
  "Digging into the network's hidden treasures!"
  "BashScan in action, let’s unveil the ports!"
  "Preparing to dissect the network's defenses!"
  "Networking layers are about to be unraveled!"
  "The hunt begins, tracking down those services!"
  "Cracking open the network, one port at a time!"
  "Delving into the digital underworld!"
  "Unmasking the network’s secrets, stay alert!"
  "Decoding the pathways, let’s discover the access points!"
  "Real hackers don’t wait for timeouts—they create them!"
  "Ports are like secrets, the open ones are the most interesting!"
  "Why do hackers love port 22? Because it’s always SSHhh!"
  "Scanning faster than a hacker at DEF CON!"
  "This port scan is so fast, the packets haven’t realized they’ve left yet!"
  "Did you hear about the hacker who crossed the road? They just wanted to ping the other side!"
  "If hacking was easy, they'd call it IT support!"
  "Hackers never sleep—they just wait for packets!"
  "Port scanning: the art of knocking on doors without permission!"
  "You know you're a pentester when your Wi-Fi connects faster than your coffee brews!"
  "The only firewall a hacker fears is the one they didn’t build!"
  "Pentesting: where every port is a potential adventure!"
  "Ever wonder why ports are called 'open'? Because they're waiting for a hacker’s knock!"
  "Hackers have two modes: scanning and attacking!"
  "Don’t worry, the ports won’t feel a thing… hopefully!"
  "Why did the pentester bring a ladder? To bypass the security layers!"
  "Ports may be small, but they can open big doors!"
  "Time to play 'Find the Open Port'—the favorite game of hackers!"
  "In the world of ports, closed is just a suggestion!"
  "Hackers see ports like cats see closed doors—they must open them!"
  "Scanning the digital frontier—nothing escapes our eyes!"
  "Port by port, we uncover the network’s hidden gems!"
  "The hunt is on—let’s track down those open ports!"
  "Exploring the network, one packet at a time!"
  "Sifting through the digital noise for open ports!"
  "The network is a puzzle—let’s solve it together!"
  "Revealing the network’s secrets, one port at a time!"
  "The network is full of mysteries—let’s expose them!"
  "Let’s see which doors are unlocked on the network!"
  "In the world of ports, there’s always more to discover!"
  "The network’s fortress is about to be breached!"
  "Uncovering hidden pathways through the network!"
  "Every open port tells a story—let’s find them all!"
  "The digital landscape is vast—let’s map it out!"
  "No stone left unturned in the search for open ports!"
  "Decoding the network’s secrets, one scan at a time!"
  "Ports are like clues—let’s find them all!"
  "The network holds many secrets—let’s reveal them!"
  "In the game of port scanning, we always play to win!"
  "Uncovering the hidden treasures of the digital world!"
  "Pentesters: the only people who can legally poke around in your system!"
  "Cybersecurity experts: keeping the digital world safe, one vulnerability at a time!"
  "Black hats might have tricks, but white hats have the skills to outsmart them!"
  "Why do black hats prefer dark mode? Because their secrets are better hidden!"
  "White hats and black hats: the ultimate game of cat and mouse in the cyber world!"
  "Pentesting: where breaking in is the only way to show how to lock it down!"
  "Why did the cybersecurity expert cross the road? To get to the other firewall!"
  "Black hats think they're clever, but white hats always have the last laugh!"
  "Pentesters: making the digital world a safer place, one exploit at a time!"
  "How do you know if a hacker is lying? Their lips are moving and the URL is suspicious!"
  "White hats are like superheroes: they may not wear capes, but they save the day!"
  "Why did the pentester bring a flashlight? To find all the hidden vulnerabilities!"
  "Cybersecurity experts: battling the bad guys with knowledge, not just firewalls!"
  "What’s a black hat’s favorite tool? The ‘exploit’ button!"
  "Pentesting: where every discovered vulnerability is a step towards a more secure system!"
  "Why don’t hackers get lost? They always follow the breadcrumbs!"
  "White hats don’t need luck—just skills, tools, and a lot of coffee!"
  "Black hats might try to crack the system, but white hats build it stronger!"
  "In the world of cybersecurity, black hats might be sneaky, but white hats always have the upper hand!"
)
# Randomly select a dialogue
random_dialogue=${dialogues[$RANDOM % ${#dialogues[@]}]}

# Print the selected dialogue in blue
echo -e "\e[34m$random_dialogue\e[0m"

# Function to convert CIDR notation to a range of IP addresses
cidr_to_ips() {
    local cidr=$1
    local base_ip
    local mask
    local ip_dec
    local network
    local first_ip
    local last_ip
    local ip_list=()

    IFS='/' read -r base_ip mask <<< "$cidr"
    IFS='.' read -r i1 i2 i3 i4 <<< "$base_ip"
    ip_dec=$(( (i1 << 24) + (i2 << 16) + (i3 << 8) + i4 ))
    network=$(( ip_dec & (0xFFFFFFFF << (32 - mask)) ))
    local range=$(( (1 << (32 - mask)) - 1 ))
    local first_ip_dec=$(( network + 1 ))
    local last_ip_dec=$(( network + range - 1 ))

    # Convert decimal IP to dotted format
    ip_list+=($(printf "%d.%d.%d.%d" $(( (first_ip_dec >> 24) & 0xFF )) $(( (first_ip_dec >> 16) & 0xFF )) $(( (first_ip_dec >> 8) & 0xFF )) $(( first_ip_dec & 0xFF ))))
    ip_list+=($(printf "%d.%d.%d.%d" $(( (last_ip_dec >> 24) & 0xFF )) $(( (last_ip_dec >> 16) & 0xFF )) $(( (last_ip_dec >> 8) & 0xFF )) $(( last_ip_dec & 0xFF ))))

    # Generate IP range
    local start_ip_dec=$first_ip_dec
    local end_ip_dec=$last_ip_dec
    while [ $start_ip_dec -le $end_ip_dec ]; do
        IFS=' ' read -r i1 i2 i3 i4 <<< "$(printf "%d.%d.%d.%d" $(( (start_ip_dec >> 24) & 0xFF )) $(( (start_ip_dec >> 16) & 0xFF )) $(( (start_ip_dec >> 8) & 0xFF )) $(( start_ip_dec & 0xFF )))"
        ip_list+=("$i1.$i2.$i3.$i4")
        ((start_ip_dec++))
    done

    echo "${ip_list[@]}"
}

# Function to check if the IP address is valid
is_valid_ip() {
    local ip=$1
    [[ $ip =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]] && [[ $ip != */* ]]
}

# Main Script starts from here xd
if [ $# -lt 3 ]; then
    echo -e "\e[31merror : Huh! Give Some enough Arguments otherwise The Script cant Fight :(\e[0m"
    echo "Usage: ./$0 <host> <start_port> <end_port>"
    echo "Example: ./$0 127.0.0.1 1 65535"
    echo "Optional! method argument: ./$0 127.0.0.1 1 65535 nc or ./$0 127.0.0.1 1 65535 devtcp"
    exit 1
fi

target=$1
start_port=$2
end_port=$3
method=${4:-devtcp}
concurrent_jobs=30 # Not recommended to raise this value above 50 as it might load the cpu and the pcc might crash
current_jobs=0

if [[ $target == */* ]]; then
    echo -e "\e[32m[+] CIDR notation detected, scanning the IP range...\e[0m"
    ip_list=$(cidr_to_ips "$target")
else
    if ! is_valid_ip "$target"; then
        echo -e "\e[31merror : The Ip is not Valid !\e[0m"
        exit 1
    fi
    ip_list="$target"
fi

if ! [[ "$start_port" =~ ^[0-9]+$ ]] || ! [[ "$end_port" =~ ^[0-9]+$ ]]; then
    echo -e "\e[31merror : The Port must be numbers !\e[0m"
    exit 1
elif (( start_port < 1 || start_port > 65535 || end_port < 1 || end_port > 65535 )); then
    echo -e "\e[31merror : The Port must be between 1 and 65535 !\e[0m"
    exit 1 
fi

nc_scan() {
    local ip=$1
    local port=$2
    nc -z -w 1 $ip $port &> /dev/null
    if [ $? -eq 0 ]; then
        echo -e "\e[32m[+] Port $port is open\e[0m"
    fi
}

scan_devtcp() {
    local ip=$1
    local port=$2
    (echo > /dev/tcp/$ip/$port) &> /dev/null
    if [ $? -eq 0 ]; then
        echo -e "\e[32m[+] Port $port is open\e[0m"
    fi
}

scan() {
    local method=$1 
    for ip in $ip_list; do
        for (( port=$start_port; port<=$end_port; port++ )); do
            if [ "$method" == "nc" ]; then
                nc_scan $ip $port &
            elif [ "$method" == "devtcp" ]; then
                scan_devtcp $ip $port &
            fi
            ((current_jobs++))
            if [ $current_jobs -ge $concurrent_jobs ]; then
                wait -n
                ((current_jobs--))
            fi
        done
    done
    wait  
}

if [ "$method" == "devtcp" ]; then
    echo -e "\e[32m[+] Default scanning method /dev/tcp is used ! \e[0m"
    scan devtcp
elif [ "$method" == "nc" ]; then
    if command -v nc &>/dev/null; then
        echo -e "\e[32m[+] nc available ! \e[0m"
        scan nc
    else
        echo -e "\e[31m[-] nc not available ! Defaulting to /dev/tcp/\e[0m"
        scan devtcp
    fi
else
    echo -e "\e[31m[-] Unknown method ! Defaulting to /dev/tcp/\e[0m"
    scan devtcp
fi
