#!/bin/bash

# cowsay flavors
cmds=(cowsay cowthink)
# FaceMod flags
flags=(-b -d -g -p -s -t -w -y)
# Get available cowfiles with command: cowsay --list
cowfiles=(apt bud-frogs bunny calvin cheese cock cower daemon default dragon
	dragon-and-cow duck elephant elephant-in-snake eyes flaming-sheep fox
	ghostbusters gnu hellokitty kangaroo kiss koala kosh luke-koala
	mech-and-cow milk moofasa moose pony pony-smaller ren sheep skeleton
	snowman stegosaurus stimpy suse three-eyes turkey turtle tux unipony
	unipony-smaller vader vader-koala www)

# Check fortune
if command -v fortune > /dev/null 2>&1; then
	# Get random fortune
	message="$(fortune)"
else
	message="No fortune 🥠"
fi

# Check cowsay & fortune
if command -v fortune > /dev/null 2>&1 && command -v cowsay > /dev/null 2>&1; then
	cmd_len=${#cmds[@]}						# Get cmd_len of cmd array
	flags_len=${#flags[@]}					# Get flags_len of flags array
	cowfiles_len=${#cowfiles[@]}			# Get cowfiles_len of cowfiles array

	cmd_i=$((RANDOM % cmd_len))				# Get random cow_i
	flags_i=$((RANDOM % flags_len))			# Get random flags_i
	cow_i=$((RANDOM % cowfiles_len))		# Get random cow_i

	cmd=${cmds[$cmd_i]}						# Get random cmd
	flag=${flags[$flags_i]}					# Get random flag
	cowfile=${cowfiles[$cow_i]}				# Get random cow

	echo "$($cmd $flag -f $cowfile $message)"
	printf "$cmd $flag -f $cowfile +fortune\n"
else
	printf "$message, no cowsay 🐄\n"
fi

