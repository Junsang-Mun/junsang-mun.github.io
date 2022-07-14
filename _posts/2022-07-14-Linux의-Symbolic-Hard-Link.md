---
title: "Linux의 심볼릭/하드 링크"
exceprt: "처음 접했을 때 헷갈렸던 개념 다시 톺아보기"

categories:
  - Linux
tags:
  - [Linux, Dev]

date: 2022-07-14
---

Symbolic link랑 Hard link의 개념이 처음 접했을 때 왜 헷갈렸는지 모르겠다. 다시 정리해봄

# Symbolic Link

**심볼릭 링크**(aka. 소프트 링크)는 기본적으로 **바로가기**와 동일한 개념이다.

원본 파일이 삭제된 경우 심볼릭 링크 파일 자체는 존재하나 원본 파일을 참조할 수는 없다.


# Hard Link

**하드 링크**는 저장소 공간 상에 위치한 파일의 새로운 접근 경로를 열어놓는 것이라고 볼 수 있다(머릿속으로는 개념을 이해했는데 글로 쓰기는 어렵네)

하드 링크 혹은 원본 파일 중 하나가 삭제되어도 둘 중 살아남은 쪽은 계속해서 제 기능을 한다.


# 야! 한국어가 너무 어렵다!

내가 이해한대로 모식도를 그려봤다.

![](/assets/posts/220714/slink.png)

![](/assets/posts/220714/hardlink.png)


# ln 명령어

Man 상에는

```
ln - make links between files
```

이라고 나와있다. 아래부터는 man에서 필요한 부분만 발췌/번역했다.

## ln(1) man

```
ln [OPTION]... [-T] TARGET LINK_NAME
```

TARGET에 대한 링크를 LINK_NAME이란 이름으로 만드는 명령어입니다.
기본적으로 hard link를 생성하고, symbolic link는 --symbolic 옵션으로 생성할 수 있습니다.

기본적으로 LINK_NAME은 이미 존재하는 이름이지 않아야 합니다.
hard link를 생성할 때, 각 TARGET은 반드시 존재해야 합니다.

### OPTION 설명

-f, --force
	기 존재하는 LINK_NAME 이름의 파일을 제거합니다.

-s, --symbolic
	hard link 대신 soft link를 생성합니다.



---

이게 뭐라고 이렇게 어려워했지?
