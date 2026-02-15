# If Log In Persist
docker exec -it myjenkins bash - Check first the config.xml file in terminal
jenkins@5299f1163f80:/$ ls /var/jenkins_home

docker cp myjenkins:/var/jenkins_home/config.xml ./config.xml
nano ./config.xml
<useSecurity>true</useSecurity> set to <useSecurity>false</useSecurity>
- Ctrl + O (write out)
- Enter (confirm filename)
- Ctrl + X (exit)
docker cp ./config.xml myjenkins:/var/jenkins_home/config.xml
docker restart myjenkins
