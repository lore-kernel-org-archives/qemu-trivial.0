Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V2q3k-00073o-NR
	for mharc-qemu-trivial@gnu.org; Fri, 26 Jul 2013 18:00:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58281)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gilles.mouchard@gmail.com>) id 1V2oxC-0003rn-L5
	for qemu-trivial@nongnu.org; Fri, 26 Jul 2013 16:49:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gilles.mouchard@gmail.com>) id 1V2oxA-0000uR-1L
	for qemu-trivial@nongnu.org; Fri, 26 Jul 2013 16:49:34 -0400
Received: from mail-qc0-x22e.google.com ([2607:f8b0:400d:c01::22e]:62172)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gilles.mouchard@gmail.com>) id 1V2ox9-0000tr-Tz
	for qemu-trivial@nongnu.org; Fri, 26 Jul 2013 16:49:31 -0400
Received: by mail-qc0-f174.google.com with SMTP id o10so411422qcv.5
	for <qemu-trivial@nongnu.org>; Fri, 26 Jul 2013 13:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=GaBcuQ0pG5BWBZ1nmW+bEgQ7wplP99wvoiHvcao2dBw=;
	b=WjkUgorFXks6K+s+S2hK0fuTm2gf8hoP40uMfV/ZpXbIA5ZcyY+182aoCMhmigTmbT
	lbGRj96/WviX8iZEJQA72Vj/zhI3lbxA8YBQpJd0N+PZ94svYg4fhtMMzmD6Gjf2Y6KR
	C8m7L3oSF2gwICUZWrXOS83Ni0vLFLlndt2Dr4QveSowt5aKL6d/O9LIiu/CpHUEgyIo
	q1UkHEgUCzgJplc1duQFe43sCnTOJPRru+JuPPnGZdbna5fgl2Pg0gp2/nySt5sRUM4R
	j6Z4LAQ9kIG5lFz8uSwggHRwe5QKb2JEaGy+wnlVs1pgCuFY6SooiRv8lFe8RQYeqhkv
	NIfg==
MIME-Version: 1.0
X-Received: by 10.49.26.202 with SMTP id n10mr56812409qeg.60.1374871771208;
	Fri, 26 Jul 2013 13:49:31 -0700 (PDT)
Received: by 10.224.181.134 with HTTP; Fri, 26 Jul 2013 13:49:31 -0700 (PDT)
Date: Fri, 26 Jul 2013 22:49:31 +0200
Message-ID: <CA+ffuG5bmpr7OUV0=ypXguo-4DfzrLRjx5hYwsJ3-5Avw1tuWw@mail.gmail.com>
From: Gilles Mouchard <gilles.mouchard@gmail.com>
To: qemu-trivial@nongnu.org
Content-Type: multipart/mixed; boundary=047d7b6d970c88e60f04e270474c
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c01::22e
X-Mailman-Approved-At: Fri, 26 Jul 2013 18:00:22 -0400
Subject: [Qemu-trivial] syscall _llseek does not work with file offset >= 2
	GB
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Jul 2013 20:49:37 -0000

--047d7b6d970c88e60f04e270474c
Content-Type: multipart/alternative; boundary=047d7b6d970c88e60a04e270474a

--047d7b6d970c88e60a04e270474a
Content-Type: text/plain; charset=ISO-8859-1

Hello,

In Linux user mode, system call _llseek returns EINVAL when offset_low >= 2
GB.
Replacing __NR_llseek by __NR__llseek has solved the bug (note the missing
underscore).

diff -Naur qemu-1.5.2-orig/linux-user/openrisc/syscall_nr.h
qemu-1.5.2-new/linux-user/openrisc/syscall_nr.h
--- qemu-1.5.2-orig/linux-user/openrisc/syscall_nr.h    2013-07-25
23:01:44.000000000 +0200
+++ qemu-1.5.2-new/linux-user/openrisc/syscall_nr.h    2013-07-26
22:30:12.894996804 +0200
@@ -493,7 +493,7 @@
 #define TARGET_NR_fstatfs64 TARGET_NR_3264_fstatfs
 #define TARGET_NR_truncate64 TARGET_NR_3264_truncate
 #define TARGET_NR_ftruncate64 TARGET_NR_3264_ftruncate
-#define TARGET_NR_llseek TARGET_NR_3264_lseek
+#define TARGET_NR__llseek TARGET_NR_3264_lseek
 #define TARGET_NR_sendfile64 TARGET_NR_3264_sendfile
 #define TARGET_NR_fstatat64 TARGET_NR_3264_fstatat
 #define TARGET_NR_fstat64 TARGET_NR_3264_fstat
diff -Naur qemu-1.5.2-orig/linux-user/syscall.c
qemu-1.5.2-new/linux-user/syscall.c
--- qemu-1.5.2-orig/linux-user/syscall.c    2013-07-25 23:01:44.000000000
+0200
+++ qemu-1.5.2-new/linux-user/syscall.c    2013-07-26 22:26:19.203918344
+0200
@@ -227,7 +227,7 @@
 #if defined(TARGET_NR_getdents64) && defined(__NR_getdents64)
 _syscall3(int, sys_getdents64, uint, fd, struct linux_dirent64 *, dirp,
uint, count);
 #endif
-#if defined(TARGET_NR__llseek) && defined(__NR_llseek)
+#if defined(TARGET_NR__llseek) && defined(__NR__llseek)
 _syscall5(int, _llseek,  uint,  fd, ulong, hi, ulong, lo,
           loff_t *, res, uint, wh);
 #endif
@@ -7106,7 +7106,7 @@
     case TARGET_NR__llseek:
         {
             int64_t res;
-#if !defined(__NR_llseek)
+#if !defined(__NR__llseek)
             res = lseek(arg1, ((uint64_t)arg2 << 32) | arg3, arg5);
             if (res == -1) {
                 ret = get_errno(res);

--047d7b6d970c88e60a04e270474a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hello,<br><br></div>In Linux user mode, system c=
all _llseek returns EINVAL when offset_low &gt;=3D 2 GB.<br>Replacing __NR_=
llseek by __NR__llseek has solved the bug (note the missing underscore).<br=
>
</div><div><div><div><div><div><br>diff -Naur qemu-1.5.2-orig/linux-user/op=
enrisc/syscall_nr.h qemu-1.5.2-new/linux-user/openrisc/syscall_nr.h<br>--- =
qemu-1.5.2-orig/linux-user/openrisc/syscall_nr.h=A0=A0=A0 2013-07-25 23:01:=
44.000000000 +0200<br>
+++ qemu-1.5.2-new/linux-user/openrisc/syscall_nr.h=A0=A0=A0 2013-07-26 22:=
30:12.894996804 +0200<br>@@ -493,7 +493,7 @@<br>=A0#define TARGET_NR_fstatf=
s64 TARGET_NR_3264_fstatfs<br>=A0#define TARGET_NR_truncate64 TARGET_NR_326=
4_truncate<br>
=A0#define TARGET_NR_ftruncate64 TARGET_NR_3264_ftruncate<br>-#define TARGE=
T_NR_llseek TARGET_NR_3264_lseek<br>+#define TARGET_NR__llseek TARGET_NR_32=
64_lseek<br>=A0#define TARGET_NR_sendfile64 TARGET_NR_3264_sendfile<br>=A0#=
define TARGET_NR_fstatat64 TARGET_NR_3264_fstatat<br>
=A0#define TARGET_NR_fstat64 TARGET_NR_3264_fstat<br>diff -Naur qemu-1.5.2-=
orig/linux-user/syscall.c qemu-1.5.2-new/linux-user/syscall.c<br>--- qemu-1=
.5.2-orig/linux-user/syscall.c=A0=A0=A0 2013-07-25 23:01:44.000000000 +0200=
<br>
+++ qemu-1.5.2-new/linux-user/syscall.c=A0=A0=A0 2013-07-26 22:26:19.203918=
344 +0200<br>@@ -227,7 +227,7 @@<br>=A0#if defined(TARGET_NR_getdents64) &a=
mp;&amp; defined(__NR_getdents64)<br>=A0_syscall3(int, sys_getdents64, uint=
, fd, struct linux_dirent64 *, dirp, uint, count);<br>
=A0#endif<br>-#if defined(TARGET_NR__llseek) &amp;&amp; defined(__NR_llseek=
)<br>+#if defined(TARGET_NR__llseek) &amp;&amp; defined(__NR__llseek)<br>=
=A0_syscall5(int, _llseek,=A0 uint,=A0 fd, ulong, hi, ulong, lo,<br>=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 loff_t *, res, uint, wh);<br>
=A0#endif<br>@@ -7106,7 +7106,7 @@<br>=A0=A0=A0=A0 case TARGET_NR__llseek:<=
br>=A0=A0=A0=A0=A0=A0=A0=A0 {<br>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int64=
_t res;<br>-#if !defined(__NR_llseek)<br>+#if !defined(__NR__llseek)<br>=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 res =3D lseek(arg1, ((uint64_t)arg2 &lt;&=
lt; 32) | arg3, arg5);<br>
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (res =3D=3D -1) {<br>=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D get_errno(res);<br><br></div><=
/div></div></div></div></div>

--047d7b6d970c88e60a04e270474a--
--047d7b6d970c88e60f04e270474c
Content-Type: application/octet-stream; 
	name="qemu-1.5.2-syscall-_llseek.patch"
Content-Disposition: attachment; filename="qemu-1.5.2-syscall-_llseek.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hjlv4w8b0

ZGlmZiAtTmF1ciBxZW11LTEuNS4yLW9yaWcvbGludXgtdXNlci9vcGVucmlzYy9zeXNjYWxsX25y
LmggcWVtdS0xLjUuMi1uZXcvbGludXgtdXNlci9vcGVucmlzYy9zeXNjYWxsX25yLmgKLS0tIHFl
bXUtMS41LjItb3JpZy9saW51eC11c2VyL29wZW5yaXNjL3N5c2NhbGxfbnIuaAkyMDEzLTA3LTI1
IDIzOjAxOjQ0LjAwMDAwMDAwMCArMDIwMAorKysgcWVtdS0xLjUuMi1uZXcvbGludXgtdXNlci9v
cGVucmlzYy9zeXNjYWxsX25yLmgJMjAxMy0wNy0yNiAyMjozMDoxMi44OTQ5OTY4MDQgKzAyMDAK
QEAgLTQ5Myw3ICs0OTMsNyBAQAogI2RlZmluZSBUQVJHRVRfTlJfZnN0YXRmczY0IFRBUkdFVF9O
Ul8zMjY0X2ZzdGF0ZnMKICNkZWZpbmUgVEFSR0VUX05SX3RydW5jYXRlNjQgVEFSR0VUX05SXzMy
NjRfdHJ1bmNhdGUKICNkZWZpbmUgVEFSR0VUX05SX2Z0cnVuY2F0ZTY0IFRBUkdFVF9OUl8zMjY0
X2Z0cnVuY2F0ZQotI2RlZmluZSBUQVJHRVRfTlJfbGxzZWVrIFRBUkdFVF9OUl8zMjY0X2xzZWVr
CisjZGVmaW5lIFRBUkdFVF9OUl9fbGxzZWVrIFRBUkdFVF9OUl8zMjY0X2xzZWVrCiAjZGVmaW5l
IFRBUkdFVF9OUl9zZW5kZmlsZTY0IFRBUkdFVF9OUl8zMjY0X3NlbmRmaWxlCiAjZGVmaW5lIFRB
UkdFVF9OUl9mc3RhdGF0NjQgVEFSR0VUX05SXzMyNjRfZnN0YXRhdAogI2RlZmluZSBUQVJHRVRf
TlJfZnN0YXQ2NCBUQVJHRVRfTlJfMzI2NF9mc3RhdApkaWZmIC1OYXVyIHFlbXUtMS41LjItb3Jp
Zy9saW51eC11c2VyL3N5c2NhbGwuYyBxZW11LTEuNS4yLW5ldy9saW51eC11c2VyL3N5c2NhbGwu
YwotLS0gcWVtdS0xLjUuMi1vcmlnL2xpbnV4LXVzZXIvc3lzY2FsbC5jCTIwMTMtMDctMjUgMjM6
MDE6NDQuMDAwMDAwMDAwICswMjAwCisrKyBxZW11LTEuNS4yLW5ldy9saW51eC11c2VyL3N5c2Nh
bGwuYwkyMDEzLTA3LTI2IDIyOjI2OjE5LjIwMzkxODM0NCArMDIwMApAQCAtMjI3LDcgKzIyNyw3
IEBACiAjaWYgZGVmaW5lZChUQVJHRVRfTlJfZ2V0ZGVudHM2NCkgJiYgZGVmaW5lZChfX05SX2dl
dGRlbnRzNjQpCiBfc3lzY2FsbDMoaW50LCBzeXNfZ2V0ZGVudHM2NCwgdWludCwgZmQsIHN0cnVj
dCBsaW51eF9kaXJlbnQ2NCAqLCBkaXJwLCB1aW50LCBjb3VudCk7CiAjZW5kaWYKLSNpZiBkZWZp
bmVkKFRBUkdFVF9OUl9fbGxzZWVrKSAmJiBkZWZpbmVkKF9fTlJfbGxzZWVrKQorI2lmIGRlZmlu
ZWQoVEFSR0VUX05SX19sbHNlZWspICYmIGRlZmluZWQoX19OUl9fbGxzZWVrKQogX3N5c2NhbGw1
KGludCwgX2xsc2VlaywgIHVpbnQsICBmZCwgdWxvbmcsIGhpLCB1bG9uZywgbG8sCiAgICAgICAg
ICAgbG9mZl90ICosIHJlcywgdWludCwgd2gpOwogI2VuZGlmCkBAIC03MTA2LDcgKzcxMDYsNyBA
QAogICAgIGNhc2UgVEFSR0VUX05SX19sbHNlZWs6CiAgICAgICAgIHsKICAgICAgICAgICAgIGlu
dDY0X3QgcmVzOwotI2lmICFkZWZpbmVkKF9fTlJfbGxzZWVrKQorI2lmICFkZWZpbmVkKF9fTlJf
X2xsc2VlaykKICAgICAgICAgICAgIHJlcyA9IGxzZWVrKGFyZzEsICgodWludDY0X3QpYXJnMiA8
PCAzMikgfCBhcmczLCBhcmc1KTsKICAgICAgICAgICAgIGlmIChyZXMgPT0gLTEpIHsKICAgICAg
ICAgICAgICAgICByZXQgPSBnZXRfZXJybm8ocmVzKTsK
--047d7b6d970c88e60f04e270474c--

