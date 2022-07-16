---
title: "strcpy strncpy strlcpy 차이"
excerpt: "비슷한 함수 같지만 유의해서 사용해야 한다. 작동 방식이 다르기 때문!"

categories:
    - C Programming
tags:
    - [string.h, C]

date: 2022-07-16
---

strcpy, str**n**cpy, str**l**cpy 는 비슷한듯 다르다 ~~당연한 소리~~

결론부터 짧게 얘기하자면

# 결론

|        | strcpy                   | strNcpy                                                                              | strLcpy                                                                              |
| ------ | ------------------------ | ------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------ |
| 인자   | dst, src                 | dst, src, n                                                                                             | dst, src, n                                                                                                                         |
| 작동   | src를 dst에 복사         | 1. strlen(src) < n: src를 dst에 복사하고 n까지 NUL 입력<br />2. strlen(src) > n: src를 n만큼 dst에 복사 | 1. strlen(src) < n: src를 dst에 복사하고 src+1에 NUL 입력<br />2. strlen(src) > n: src의 n - 1까지 dst에 복사하고 dst[n]에 NUL 입력 |
| return | dst                      | dst                                                                                                     | strlen(src)                                                                                                                         |
| NULL   | src의 NUL까지 src에 복사 | (1)은 null-terminate가 보장되나 (2)의 경우 null-terminate가 보장되지 않음.                              | 모든 경우에서 null-terminate가 보장됨                                                                                               |


# 야! 이게 한국어가 맞냐?

라며 의심을 거두지 않으실 분들을 위해

![](/assets/posts/220716/strcpy.png)

![](/assets/posts/220716/strncpy.png)

![](/assets/posts/220716/strlcpy.png)

여기 요점만 정리해 드렸습니다. **다만 strncpy에서는 null-terminate가 보장될 수도 있고 없을 수도 있다는 사실에 반드시 주의가 필요하다.**


# 구현

```C
char* strcpy(char *dst, char *src) {
	int i = 0;
	while (src[i]) {
		dst[i] = src[i];
		i ++;
	}
	dst[i] = '/0';
	return dst;
}

char* strncpy(char *dst, char *src, int n) {
	for (int i = 0; i < n && src[i] != '\0'; i ++)
		dst[i] = src[i];
	for (; i < n; i ++)
		dst[i] = '\0';
	return dst;
}

int strlcpy(char *dst, char *src, const int n) {
	int len = strlen(src), rpt;
	rpt = n - 1 < len ? n - 1 : len;
	for (int i = 0; i < rpt; i ++) {
		dst[i] = src[i];
		dst[i + 1] = '\0';
    }
    return len;
}
```

정리하면서도 헷갈렸다. 정리해두었으니 앞으론 헷갈일 일이 없기를
