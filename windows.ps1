# 인코딩 설정
$env:LC_ALL='C.UTF-8'
[System.Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# 시스템 환경 구성
Write-Output "Check system enviroment ..."
## Scoop 설치 함수
function install($app) {
  if (installed $app) {
    scoop update $app
  } else {
    scoop install $app
  }
}

# .NET framework 4.5 체크
if ([System.Enum]::GetNames([System.Net.SecurityProtocolType]) -notcontains 'Tls12') {
	Write-Output "Please install .NET Framework"
	Start-Process "https://dotnet.microsoft.com/download"
}

# Scoop 설치
$defaultScoopPath = "$env:SCOOP"

if ($defaultScoopPath -eq "") {
	$defaultScoopPath = "$env:USERPROFILE\Scoop"
}

$scoopPath = Read-Host "Directory to install packages (default: $defaultScoopPath)"

if ($scoopPath -eq "") {
	$scoopPath = $defaultScoopPath
}

[Environment]::SetEnvironmentVariable("SCOOP", $scoopPath, 'User')

# 필요한 함수 추가
$core_url = 'https://raw.githubusercontent.com/lukesampson/scoop/master/lib/core.ps1'
Invoke-Expression (new-object net.webclient).downloadstring($core_url)

if (-not (installed 'scoop')) {
	Invoke-WebRequest -useb get.scoop.sh | Invoke-Expression
  }

# Scoop 버킷 추가
install("git")

scoop bucket add java
scoop bucket add versions

# 자바 설치
install("adopt8-hotspot") # OpenJDK v1.8 (벤더: Adoptium, JVM: 오라클 핫스팟) 설치
install("adopt11-hotspot") # OpenJDK v11 (벤더: Adoptium, JVM: 오라클 핫스팟) 설치

# Node.js 설치
install("nodejs14") # Node.js v14 설치

# Node.js 설정
npm install -g yarn

yarn config set "@eyesvault:registry" "https://registry.eyesvault.dev/repository/npm/"
yarn config set init-version "0.0.0"
yarn config set init-license "UNLICENSED"

# Git 글로벌 설정 추가
git config --global init.defaultBranch main
git config --global core.eol lf
git config --global autocrlf input

Write-Output "✔ Success"
