# Builds and starts the Jenkins container for Lab 07.
# Jenkins UI: http://localhost:8090
# (Port 8090 on the PC, because 8080 is already used by the nextcloud-app container.)
# Run from PowerShell:  .\start-jenkins.ps1

$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

docker build -t jenkins-docker .

# Remove an old container if it exists (Jenkins data is kept in the jenkins_home volume).
docker rm -f jenkins 2>$null | Out-Null

docker run -d --name jenkins `
  --restart unless-stopped `
  -p 8090:8080 `
  -v jenkins_home:/var/jenkins_home `
  -v /var/run/docker.sock:/var/run/docker.sock `
  --group-add 0 `
  jenkins-docker

Write-Host "Jenkins is starting at http://localhost:8090"
Write-Host "Initial admin password (first start only):"
Start-Sleep -Seconds 20
docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
