#@/bin/bash
java --version
if [ $? ne 0 ]
then
echo "Java is not there but you can install with apt install default-jre"
exit 1
else

apt install default-jre
if [ $? ne 0 ]
then
echo "Failure"
exit 1
else
echo "Success"
fi