#/bin/bash
# Purpose: Demonstrate usage of select and case with toggleable flags to indicate choices
# 2013-05-10 - Dennis Williamson

# Modified by Ethan Cline on May 10, 2018
# Email cline@physics.rutgers.edu for questions

choice () {
    local choice=$1
    if [[ ${opts[choice]} ]] # toggle
    then
        opts[choice]=
    else
        opts[choice]=+
    fi
}
PS3='Please enter your choice: '
while :
do
    clear

  echo "Choose an option. Choose again to deselect"
    options=("Read ROOT File ${opts[1]}" "Convert MIDAS File ${opts[2]}" "Analyze ROOT File ${opts[3]}" "Convert and Analyze ${opts[4]}" "Done")
    select opt in "${options[@]}"
    do
        case $opt in
            "Read ROOT File ${opts[1]}")
                choice 1
                break
                ;;
            "Convert MIDAS File ${opts[2]}")
                choice 2
                break
                ;;
            "Analyze ROOT File ${opts[3]}")
                choice 3
                break
                ;;
            "Convert and Analyze ${opts[4]}")
                choice 4
                break
                ;;
	    "Option 5 ${opts[5]}")
                choice 5
                break
                ;;
            "Done")
                break 2
                ;;
            *) printf '%s\n' 'invalid option';;
        esac
    done

done

printf '%s\n' 'Options chosen:'
for opt in "${!opts[@]}"
do
    if [[ ${opts[opt]} ]]
    then
        printf '%s\n' "Option $opt"
    fi
done

if [[ ${opts[1]} ]] 
then
     printf "Read which Root file?\n"
     read -p "Run Number: " RN

     root rootfiles/run$RN*.root
fi


if [[ ${opts[2]} ]]
then
     printf "Convert which MIDAS file?\n"
     read -p "Run Number: " RN1
     echo "$RN1"
     cooker recipes/midasconverter.xml midasfiles/run$RN1.mid rootfiles/run$RN1.root
fi

if [[ ${opts[3]} ]]
then
     printf "Analyze Which ROOT File?\n"
     read -p "Run Number: " RN2
     printf "Which recipe should be used to analyze the file? Options are: \n"
     printf " STT\n SiPM\n SPS\n ToF\n GEM\n Histos\n Hough\n"
     read -p "Recipe: " rec
     cooker recipes/$rec.xml rootfiles/run$RN2.root rootfiles/run$RN2\_cooked_$rec.root
fi

if [[ ${opts[4]} ]] 
then
   printf "Convert and Analyze which run number?\n"
   read -p "Run Number: " RN3
   printf "Which recipe should be used to analyze the file? Options are: \n" 
   printf " STT\n SiPM\n SPS\n ToF\n GEM\n Histos\n Hough\n"
   read -p "Recipe: " rec1
   cooker recipes/midasconverter.xml midasfiles/run$RN3.mid rootfiles/run$RN3.root
   cooker recipes/$rec1.xml rootfiles/run$RN3.root rootfiles/run$RN3\_cooked_$rec1.root
fi

