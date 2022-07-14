---
title: "Linux의 심볼릭/하드 링크"
excerpt: "처음 접했을 때 헷갈렸던 개념 다시 톺아보기"

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

file_link라는 심볼릭 링크를 만들고, 그 심볼릭 링크를 file.txt에 연결한다는 의미. 바로가기를 만들었다고 이해하면 될 것 같다.

![](/assets/posts/220714/hardlink.png)

file1.txt와 file2.txt는 **이름은 다르지만 내용은 동일하다**. file1과 file2는 스토리지 내부에서 동일한 위치를 가리키고 있기 때문에 file1을 열어보면 "hello world"라는 텍스트가 나오고, file2 역시 동일하다. 
file1을 수정해도 file2에서도 변경된 내용이 표출된다.

file1.txt를 삭제하면 어떻게 될까?

file1.txt는 지워져도 "hello world"는 file2.txt를 통해 접근할 수 있다.
왜냐하면 이 둘은 근본적으로 동일한 저장소 주소를 가리키고 있기 때문이다.


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
	hard link 대신 symbolic link를 생성합니다.



---

이게 뭐라고 이렇게 어려워했지?
