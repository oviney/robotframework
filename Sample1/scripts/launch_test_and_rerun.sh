#!/usr/bin/env bash

# clean previous output files
rm -f results/output.xml
rm -f results/rerun.xml
rm -f results/first_run_log.html
rm -f results/second_run_log.html

echo
echo "#######################################"
echo "# Running portfolio a first time      #"
echo "#######################################"
echo
pabot --outputdir results $@

# we stop the script here if all the tests were OK
if [ $? -eq 0 ]; then
	echo "we don't run the tests again as everything was OK on first try"
	exit 0
fi
# otherwise we go for another round with the failing tests

# we keep a copy of the first log file
cp results/log.html  results/first_run_log.html

# we launch the tests that failed
echo
echo "#######################################"
echo "# Running again the tests that failed #"
echo "#######################################"
echo
pabot --outputdir results --nostatusrc --rerunfailed results/output.xml --output rerun.xml $@
# => Robot Framework generates file rerun.xml

# we keep a copy of the second log file
cp results/log.html  results/second_run_log.html

# Merging output files
echo
echo "########################"
echo "# Merging output files #"
echo "########################"
echo
rebot --nostatusrc --outputdir results --output output.xml --merge results/output.xml  results/rerun.xml
# => Robot Framework generates a new output.xml