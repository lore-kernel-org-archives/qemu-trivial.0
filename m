Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dzs3Q-0002xs-JF
	for mharc-qemu-trivial@gnu.org; Wed, 04 Oct 2017 18:22:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38339)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <malbarbo@gmail.com>) id 1dzroF-0000M7-TV
	for qemu-trivial@nongnu.org; Wed, 04 Oct 2017 18:06:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <malbarbo@gmail.com>) id 1dzroE-0000vE-Ee
	for qemu-trivial@nongnu.org; Wed, 04 Oct 2017 18:06:31 -0400
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:48470)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <malbarbo@gmail.com>)
	id 1dzroA-0000rx-UG; Wed, 04 Oct 2017 18:06:27 -0400
Received: by mail-lf0-x243.google.com with SMTP id q132so14957975lfe.5;
	Wed, 04 Oct 2017 15:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=8jHCmTdAV4zJ/iOotWRKaFE9dJzz7z3uiEi2ZM7gzvE=;
	b=fFlexBilxW+WwFGOTMiM1FFY8MSWPHRldWm6XO50sFfzfTMCc2dcb3tIWKu40olm6V
	yci2+mI+ptszR0ztCAlxBZLKrZ6T/kgu5gS3PJZBptqwtqh85lrV9BLVpgxrkSrkm9yc
	melUzLfnAgM2GDMcV3JtU26y5JqnHkG/W63MWCh3+CN1pebDjfjdilVC/YV7ITxIKokQ
	BHlwV5wmKNIHNNERFeK88UuPjVKLIiVvnVs87zivIop+RxEnLIYXMf7MS3//A34eoQjg
	qxWF50DJgiOFJh3S4lXnSXThEd4x/eqb+2rTbgEK6H3LeymbNWV5IJfOc4rRdr8YuOjt
	r+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=8jHCmTdAV4zJ/iOotWRKaFE9dJzz7z3uiEi2ZM7gzvE=;
	b=W8Bg2uC/6rgnLbSsQrd+O8qnqoDyOf5Izlcuwz3mRARcrcORozZIUuVhvGkUo4BMwq
	w5jGvbzoaG0eoEp2oFHD2fWTM3/MP/mEl8z3DaJ6ciyWakqbJtrmdMaepsyq2ZuUDFUa
	OaJWcSonnvYFMesWuKaO9HsqNRhcDC6GVfOqyvZGPHookyCRBuSq0Hg5lyvXQyCjFwRp
	mk8tZUoBLGevGgyq+SpkLd/5ZR1i4oDH/C9cqKlWIYLLVMpCWXlq+LeDs6Vi4ymAp3NE
	ektryg7KAzBxtLtfAP5hydNvjTPzmpWv35OOdt/FrrmwofBaec1QQ+R8kIIx6rAWgJo4
	yE1Q==
X-Gm-Message-State: AMCzsaWe+0Ubfs616AaBYqinyFXrX9cvR2ck18IyAogksT1SMU98Af9G
	gwMF3TiBYf3EWqlHjWd0eSFpzoCDnZ2y1+MsF+Bafw==
X-Google-Smtp-Source: AOwi7QC9gavGyCJh4YzbP1KQ9q9Znl8SaSngNVIv9RtMMzHRcyU7j22HcxqRORgvJsSLISsli6pOAc19qMdjZn2G4W4=
X-Received: by 10.25.16.42 with SMTP id f42mr5383692lfi.172.1507154784961;
	Wed, 04 Oct 2017 15:06:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.40.193 with HTTP; Wed, 4 Oct 2017 15:06:24 -0700 (PDT)
From: Marco A L Barbosa <malbarbo@gmail.com>
Date: Wed, 4 Oct 2017 19:06:24 -0300
Message-ID: <CAHpsRN-XzxjJZb=rb0iHMv4Afv=2H3N5U7p4+NNJFPkxgSLMXg@mail.gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Content-Type: multipart/alternative; boundary="001a113fc1d09449a1055abfd19a"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::243
X-Mailman-Approved-At: Wed, 04 Oct 2017 18:22:10 -0400
Subject: [Qemu-trivial] [PATCH] linux-user: Add random ioctls
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Oct 2017 22:06:33 -0000

--001a113fc1d09449a1055abfd19a
Content-Type: text/plain; charset="UTF-8"

I don't know how (and if it is necessary) to add buf field to
rand_pool_info struct. See
https://github.com/torvalds/linux/blob/5924bbecd0267d87c24110cbe2041b5075173a25/include/uapi/linux/random.h#L17

Signed-off-by: Marco A L Barbosa <malbarbo@gmail.com>
---
 linux-user/ioctls.h        | 7 +++++++
 linux-user/syscall.c       | 1 +
 linux-user/syscall_defs.h  | 9 +++++++++
 linux-user/syscall_types.h | 4 ++++
 4 files changed, 21 insertions(+)

diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
index e6997ff230..9240a83f30 100644
--- a/linux-user/ioctls.h
+++ b/linux-user/ioctls.h
@@ -173,6 +173,13 @@
   IOCTL(SIOCGSTAMP, IOC_R, MK_PTR(MK_STRUCT(STRUCT_timeval)))
   IOCTL(SIOCGSTAMPNS, IOC_R, MK_PTR(MK_STRUCT(STRUCT_timespec)))

+  IOCTL(RNDGETENTCNT, IOC_R, MK_PTR(TYPE_INT))
+  IOCTL(RNDADDTOENTCNT, IOC_W, MK_PTR(MK_STRUCT(STRUCT_rand_pool_info)))
+  IOCTL(RNDGETPOOL, IOC_R, MK_PTR(TYPE_INT))
+  IOCTL(RNDADDENTROPY, IOC_W, MK_PTR(MK_STRUCT(STRUCT_rand_pool_info)))
+  IOCTL(RNDZAPENTCNT, 0, TYPE_NULL)
+  IOCTL(RNDCLEARPOOL, 0, TYPE_NULL)
+
   IOCTL(CDROMPAUSE, 0, TYPE_NULL)
   IOCTL(CDROMSTART, 0, TYPE_NULL)
   IOCTL(CDROMSTOP, 0, TYPE_NULL)
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 9b6364a266..d4c21a557c 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -59,6 +59,7 @@ int __clone2(int (*fn)(void *), void *child_stack_base,
 #include <linux/icmp.h>
 #include <linux/icmpv6.h>
 #include <linux/errqueue.h>
+#include <linux/random.h>
 #include "qemu-common.h"
 #ifdef CONFIG_TIMERFD
 #include <sys/timerfd.h>
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 40c5027e93..d14fdd82ce 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -1060,6 +1060,15 @@ struct target_pollfd {

 #define TARGET_SIOCGIWNAME     0x8B01          /* get name == wireless
protocol */

+/* From <linux/random.h> */
+
+#define TARGET_RNDGETENTCNT    TARGET_IOR('R', 0x00, int)
+#define TARGET_RNDADDTOENTCNT  TARGET_IOW('R', 0x01, int)
+#define TARGET_RNDGETPOOL      TARGET_IOR('R', 0x02, struct rand_pool_info)
+#define TARGET_RNDADDENTROPY   TARGET_IOW('R', 0x03, struct rand_pool_info)
+#define TARGET_RNDZAPENTCNT    TARGET_IO('R', 0x04)
+#define TARGET_RNDCLEARPOOL    TARGET_IO('R', 0x06)
+
 /* From <linux/fs.h> */

 #define TARGET_BLKROSET   TARGET_IO(0x12,93) /* set device read-only (0 =
read-write) */
diff --git a/linux-user/syscall_types.h b/linux-user/syscall_types.h
index 24631b09be..2e2e000424 100644
--- a/linux-user/syscall_types.h
+++ b/linux-user/syscall_types.h
@@ -266,3 +266,7 @@ STRUCT(blkpg_ioctl_arg,
        TYPE_INT, /* flags */
        TYPE_INT, /* datalen */
        TYPE_PTRVOID) /* data */
+
+STRUCT(rand_pool_info,
+       TYPE_INT, /* entropy_count */
+       TYPE_INT) /* buf_size */
-- 
2.11.0

-- 
Marco A L Barbosa
http://malbarbo.pro.br
--

--001a113fc1d09449a1055abfd19a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I don&#39;t know how (and if it is necessary) to add buf f=
ield to rand_pool_info struct. See <br><div><a href=3D"https://github.com/t=
orvalds/linux/blob/5924bbecd0267d87c24110cbe2041b5075173a25/include/uapi/li=
nux/random.h#L17">https://github.com/torvalds/linux/blob/5924bbecd0267d87c2=
4110cbe2041b5075173a25/include/uapi/linux/random.h#L17</a><br><br></div><di=
v>Signed-off-by: Marco A L Barbosa &lt;<a href=3D"mailto:malbarbo@gmail.com=
">malbarbo@gmail.com</a>&gt;<br>---<br>=C2=A0linux-user/ioctls.h=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 7 +++++++<br>=C2=A0linux-user/syscall.c=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +<br>=C2=A0linux-user/syscall_defs=
.h=C2=A0 | 9 +++++++++<br>=C2=A0linux-user/syscall_types.h | 4 ++++<br>=C2=
=A04 files changed, 21 insertions(+)<br><br>diff --git a/linux-user/ioctls.=
h b/linux-user/ioctls.h<br>index e6997ff230..9240a83f30 100644<br>--- a/lin=
ux-user/ioctls.h<br>+++ b/linux-user/ioctls.h<br>@@ -173,6 +173,13 @@<br>=
=C2=A0=C2=A0 IOCTL(SIOCGSTAMP, IOC_R, MK_PTR(MK_STRUCT(STRUCT_timeval)))<br=
>=C2=A0=C2=A0 IOCTL(SIOCGSTAMPNS, IOC_R, MK_PTR(MK_STRUCT(STRUCT_timespec))=
)<br>=C2=A0<br>+=C2=A0 IOCTL(RNDGETENTCNT, IOC_R, MK_PTR(TYPE_INT))<br>+=C2=
=A0 IOCTL(RNDADDTOENTCNT, IOC_W, MK_PTR(MK_STRUCT(STRUCT_rand_pool_info)))<=
br>+=C2=A0 IOCTL(RNDGETPOOL, IOC_R, MK_PTR(TYPE_INT))<br>+=C2=A0 IOCTL(RNDA=
DDENTROPY, IOC_W, MK_PTR(MK_STRUCT(STRUCT_rand_pool_info)))<br>+=C2=A0 IOCT=
L(RNDZAPENTCNT, 0, TYPE_NULL)<br>+=C2=A0 IOCTL(RNDCLEARPOOL, 0, TYPE_NULL)<=
br>+<br>=C2=A0=C2=A0 IOCTL(CDROMPAUSE, 0, TYPE_NULL)<br>=C2=A0=C2=A0 IOCTL(=
CDROMSTART, 0, TYPE_NULL)<br>=C2=A0=C2=A0 IOCTL(CDROMSTOP, 0, TYPE_NULL)<br=
>diff --git a/linux-user/syscall.c b/linux-user/syscall.c<br>index 9b6364a2=
66..d4c21a557c 100644<br>--- a/linux-user/syscall.c<br>+++ b/linux-user/sys=
call.c<br>@@ -59,6 +59,7 @@ int __clone2(int (*fn)(void *), void *child_sta=
ck_base,<br>=C2=A0#include &lt;linux/icmp.h&gt;<br>=C2=A0#include &lt;linux=
/icmpv6.h&gt;<br>=C2=A0#include &lt;linux/errqueue.h&gt;<br>+#include &lt;l=
inux/random.h&gt;<br>=C2=A0#include &quot;qemu-common.h&quot;<br>=C2=A0#ifd=
ef CONFIG_TIMERFD<br>=C2=A0#include &lt;sys/timerfd.h&gt;<br>diff --git a/l=
inux-user/syscall_defs.h b/linux-user/syscall_defs.h<br>index 40c5027e93..d=
14fdd82ce 100644<br>--- a/linux-user/syscall_defs.h<br>+++ b/linux-user/sys=
call_defs.h<br>@@ -1060,6 +1060,15 @@ struct target_pollfd {<br>=C2=A0<br>=
=C2=A0#define TARGET_SIOCGIWNAME=C2=A0=C2=A0=C2=A0=C2=A0 0x8B01=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* get name =3D=3D wireless prot=
ocol */<br>=C2=A0<br>+/* From &lt;linux/random.h&gt; */<br>+<br>+#define TA=
RGET_RNDGETENTCNT=C2=A0=C2=A0=C2=A0 TARGET_IOR(&#39;R&#39;, 0x00, int)<br>+=
#define TARGET_RNDADDTOENTCNT=C2=A0 TARGET_IOW(&#39;R&#39;, 0x01, int)<br>+=
#define TARGET_RNDGETPOOL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TARGET_IOR(&#39;R&#=
39;, 0x02, struct rand_pool_info)<br>+#define TARGET_RNDADDENTROPY=C2=A0=C2=
=A0 TARGET_IOW(&#39;R&#39;, 0x03, struct rand_pool_info)<br>+#define TARGET=
_RNDZAPENTCNT=C2=A0=C2=A0=C2=A0 TARGET_IO(&#39;R&#39;, 0x04)<br>+#define TA=
RGET_RNDCLEARPOOL=C2=A0=C2=A0=C2=A0 TARGET_IO(&#39;R&#39;, 0x06)<br>+<br>=
=C2=A0/* From &lt;linux/fs.h&gt; */<br>=C2=A0<br>=C2=A0#define TARGET_BLKRO=
SET=C2=A0=C2=A0 TARGET_IO(0x12,93) /* set device read-only (0 =3D read-writ=
e) */<br>diff --git a/linux-user/syscall_types.h b/linux-user/syscall_types=
.h<br>index 24631b09be..2e2e000424 100644<br>--- a/linux-user/syscall_types=
.h<br>+++ b/linux-user/syscall_types.h<br>@@ -266,3 +266,7 @@ STRUCT(blkpg_=
ioctl_arg,<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TYPE_INT, /* flags=
 */<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TYPE_INT, /* datalen */<b=
r>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TYPE_PTRVOID) /* data */<br>+<=
br>+STRUCT(rand_pool_info,<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TYPE_IN=
T, /* entropy_count */<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TYPE_INT) /=
* buf_size */<br>-- <br>2.11.0<br clear=3D"all"><br>-- <br><div class=3D"gm=
ail_signature">Marco A L Barbosa<br><a href=3D"http://malbarbo.pro.br" targ=
et=3D"_blank">http://malbarbo.pro.br</a><br>--</div>
</div></div>

--001a113fc1d09449a1055abfd19a--

