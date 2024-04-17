#!/bin/sh
/root/preprocessor.sh
cd /root/project/workspace
export MAVEN_HOME=/opt/maven/3.9.5
export TOOL_VERSION=3.9.5
export PROJECT_VERSION=3.10.0
export JAVA_HOME=/lib/jvm/java-17
export ENFORCE_VERSION=

/root/build.sh install -DallowIncompleteProjects -Danimal.sniffer.skip -Dcheckstyle.skip -Dcobertura.skip -Denforcer.skip -Dformatter.skip -Dgpg.skip -Dimpsort.skip -Djapicmp.skip -Dmaven.javadoc.failOnError=false -Dmaven.site.deploy.skip -Dpgpverify.skip -Drat.skip=true -Drevapi.skip -Dsort.skip -Dspotbugs.skip -DskipTests org.apache.maven.plugins:maven-deploy-plugin:3.1.1:deploy 
