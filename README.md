# HPuTTYDist

HPuTTY를 installer로 배포하기 위한 도구

## 사용 방법

1. [NSIS](http://nsis.sourceforge.net/) 를 설치합니다.
2. 빌드 할 폴더를 생성합니다. (예: D:\Dev)
3. 위에서 생성한 폴더에 HPuTTY, HPuTTYDist 프로젝트를 클론 합니다. (예: D:\Dev\HPuTTY, D:\Dev\HPuTTYDist)
4. [Visual Studio 2015 Community로 빌드하기](https://github.com/teamnop/HPuTTY/wiki/Visual-Studio-2015-Community-%EB%A1%9C-%EB%B9%8C%EB%93%9C%ED%95%98%EA%B8%B0) 문서를 참고하여 HPuTTY 폴더에서 빌드를 진행합니다.
5. PuTTY 클라이언트가 제대로 작동하는지 테스트 합니다
6. "VS2015용 MSBuild 명령 프롬프트"를 실행합니다
7. HPuTTYDist 폴더로 이동합니다. (예: D:\Dev\HPuTTYDist)
8. build-deploay '버전'을 입력하여 빌드를 실행합니다. (예: 'p0.66-t027-h01')
9. HPuTTY 폴더에 hputty-'버전'-installer.exe 가 생성 되었으면 이 파일을 배포합니다.
