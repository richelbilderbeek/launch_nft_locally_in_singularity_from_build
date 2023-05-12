#!/bin/bash
#
# Updates gradle:
#
# (base) richel@richel-latitude-7430:~/GitHubs/nbis_data_experiment_private/issue_6/nf-tower$ git diff
# diff --git a/gradle/wrapper/gradle-wrapper.properties b/gradle/wrapper/gradle-wrapper.properties
# index 1bb7c98..9a09707 100644
# --- a/gradle/wrapper/gradle-wrapper.properties
# +++ b/gradle/wrapper/gradle-wrapper.properties
# @@ -3,4 +3,4 @@ distributionBase=GRADLE_USER_HOME
#  distributionPath=wrapper/dists
#  zipStoreBase=GRADLE_USER_HOME
#  zipStorePath=wrapper/dists
# -distributionUrl=https\://services.gradle.org/distributions/gradle-5.5.1-all.zip
# +distributionUrl=https\://services.gradle.org/distributions/gradle-8.1.1-all.zip
#
#
# This script lets gradle use a newer version
#
# When running '2_build_and_fail.sh' one gets:
#
# ./gradlew assemble
#
# FAILURE: Build failed with an exception.
#
# * What went wrong:
# Could not initialize class org.codehaus.groovy.runtime.InvokerHelper
# > Exception java.lang.NoClassDefFoundError: Could not initialize class org.codehaus.groovy.reflection.ReflectionCache [in thread "Daemon worker"]
#
Rscript 2_update_gradle.R

