#!/bin/bash -xe
#
# jenkins restore  scripts
#
# Usage: ./jenkins-restore.sh /path/to/jenkins_home /path/to/jenkins_archive/archive.tar.gz

JENKINS_HOME="$1"
JENKINS_BACKUP_DIR=$(dirname $2)
JENKINS_ARCHIVE=$(basename $2)


function usage(){
  echo "usage: $(basename $0) /path/to/jenkins_home /path/to/jenkins_archive/archive.tar.gz"
}

function main() {
  sudo /etc/init.d/jenkins stop
  cd "${JENKINS_BACKUP_DIR}"
  tar xzvf "${JENKINS_ARCHIVE}"
  sudo cp -R jenkins-backup/* "${JENKINS_HOME}"/
  sudo chown jenkins:jenkins -R "${JENKINS_HOME}"/
  sudo /etc/init.d/jenkins start
}

main
