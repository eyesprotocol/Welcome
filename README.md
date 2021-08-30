# EYES/Dev Welcome script
아이즈개발팀 개발환경 자동화 스크립트

## 시작하기
### 사전조건
 - Windows 10 이상
 - [.NET Framework v4.5](https://dotnet.microsoft.com/download) 이상
 - [Windows Terminal](http://aka.ms/terminal) (추천)

### 설치
1. 관리자 권한으로 **Windows Terminal** 실행
2. 터미널이 명령 크롬프트(CMD)일 경우 파워셀로 변경
3. 실행 권한 추가
	```powershell
	Set-ExecutionPolicy RemoteSigned -scope CurrentUser
	```
4. 설치 스크립트 실행
	```powershell
	iwr -useb cdn.eyesprotocol.io/windows | iex
	```
