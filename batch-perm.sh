#!/bin/bash

# This script will process every file in contentfilepath against every file in stylefilepath

script_path="neural_style.lua"

contentfilepath="/home/vaelek/content/auto/*.*"
stylefilepath="/home/vaelek/styles/auto/*.*"

iterations="500"
save_iter="10"
image_size="256"
style_scale="1"
init="image"
output_path="/home/vaelek/outpics/proc"  # Path must exist, Don't put a trailing /
output_ext="png"

##### EDIT ABOVE THIS LINE ######

print_iter="1"
iteration="0"

for contentfile in $contentfilepath
do
	for stylefile in $stylefilepath
	do
		FILE1i=$(basename $contentfile)
		FILE1=${FILE1i::-4}
		FILE2i=$(basename $stylefile)
		FILE2=${FILE2i::-4}

		OUTFILE="$output_path/$FILE1++$FILE2.$output_ext"

		ExecCMD="th $script_path -content_image $contentfile -style_image $stylefile -num_iterations $iterations -save_iter $save_iter -print_iter $print_iter -init $init -image_size $image_size -style_scale $style_scale -output_image $OUTFILE -gpu -1"
		#echo "$ExecCMD"
		$ExecCMD
		((iteration+=1))
	done
done
