# EYES/Dev Welcome script
아이즈개발팀 개발환경 자동화 스크립트

## 시작하기
### 사전조건
 - Windows 10 이상
	* 시스템 로케일이 UTF-8 이어야 함
		1. 제어판
		2. **국가 또는 지역**
		3. 관리자 옵션
		4. 시스템 로캘 변경
		5. **세계 언어 지원을 위해 Uniucode UTF-8 사용** 체크
		6. 재부팅
 - [.NET Framework v4.5](https://dotnet.microsoft.com/download) 이상
 - [Windows Terminal](http://aka.ms/terminal) (추천)
 - [PowerShell Core v7](https://github.com/powershell/powershell) (추천)

### 설치
1. 관리자 권한으로 **Windows Terminal** 실행
2. 터미널이 명령 크롬프트(CMD)일 경우 파워셀로 변경
3. 실행 권한 추가
	```powershell
	Set-ExecutionPolicy RemoteSigned -scope CurrentUser
	```
4. 설치 스크립트 실행
	```powershell
	iwr -useb welcome.eyesvault.dev | iex
	```
