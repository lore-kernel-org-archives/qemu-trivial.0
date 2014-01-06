Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VzzqI-00042o-P6
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jan 2014 21:23:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46356)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <keweihk@gmail.com>) id 1VzzqF-0003zC-GS
	for qemu-trivial@nongnu.org; Sun, 05 Jan 2014 21:23:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <keweihk@gmail.com>) id 1VzzqE-0006bx-6L
	for qemu-trivial@nongnu.org; Sun, 05 Jan 2014 21:22:59 -0500
Received: from mail-wg0-x235.google.com ([2a00:1450:400c:c00::235]:34979)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <keweihk@gmail.com>)
	id 1VzzqB-0006bS-2C; Sun, 05 Jan 2014 21:22:55 -0500
Received: by mail-wg0-f53.google.com with SMTP id k14so15062259wgh.8
	for <multiple recipients>; Sun, 05 Jan 2014 18:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=JqRu54wKdV1l0AiMQTFmAZtQ6ZhoP3/amm1Evl4Zsdo=;
	b=KpM/+kdd2pvPavTmeiWeWvOM9WLFdqPpJcankG8VqOTNbTK2BC70+RG5qC9n2AFUrr
	LoL7xWLGFHRedgLlF6uxSz/asJl9vL9AOpyhiqO4VJ6jcQL4BKVAQpyztb6sM6js70c2
	GszIEFzckFXRF17K8Ouwa/jWVd7X5+8fiKxxJzFK0GbhJ+9AYBBc9LSFzEr7f5TYo0Cg
	AJYkPMj8XVizPwL0aJRPitLh6oZ7zG6iF4EAP0Mpbu15VdRXrnl/IO5bpM61EVsaLAGH
	pHz8tuZrDiExLhBTPRmqTri97mIz4fTFh8SQhaoCXs5AjpQDB5dxchhu0kSeLarHX6fW
	dh3Q==
X-Received: by 10.180.14.37 with SMTP id m5mr9074364wic.46.1388974970257; Sun,
	05 Jan 2014 18:22:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.108.74 with HTTP; Sun, 5 Jan 2014 18:22:30 -0800 (PST)
In-Reply-To: <1388629202-29482-1-git-send-email-keweihk@gmail.com>
References: <1388629202-29482-1-git-send-email-keweihk@gmail.com>
From: Kewei Yu <keweihk@gmail.com>
Date: Mon, 6 Jan 2014 10:22:30 +0800
Message-ID: <CAJBZ5eMmkhBqCuLpR0iRx-2=mwsRhM2fhFckA9vrRnN5bMo1Rg@mail.gmail.com>
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	kwolf@redhat.com
Content-Type: multipart/alternative; boundary=f46d04138ca7b4467504ef43ef91
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::235
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH v3 1/1] qtest: Fix the bug about disable
 vnc causes "make check" fail
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
X-List-Received-Date: Mon, 06 Jan 2014 02:23:00 -0000

--f46d04138ca7b4467504ef43ef91
Content-Type: text/plain; charset=ISO-8859-1

Ping.

Faithfully yours
Kewei Yu


2014/1/2 Kewei Yu <keweihk@gmail.com>

> When we disable vnc from "./configure", QEMU can't use the vnc option.
> So qtest can't use the "vnc -none ", otherwise "make check" fails.
>
> Signed-off-by: Kewei Yu <keweihk@gmail.com>
> ---
>  v2: Consolidate VNC macro's #ifdef'ery to one central point
> (tests/libqtest.c).
>  v3: Fix the spelling and terminology error: "s/disabling/disable; s/the\
> qemu/QEMU; s/hangs/fails;"
> ---
>
>  tests/fdc-test.c |    5 +----
>  tests/ide-test.c |    3 ---
>  tests/libqtest.c |    8 ++++++++
>  3 files changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/tests/fdc-test.c b/tests/fdc-test.c
> index 38b5b17..37096dc 100644
> --- a/tests/fdc-test.c
> +++ b/tests/fdc-test.c
> @@ -518,7 +518,6 @@ static void fuzz_registers(void)
>  int main(int argc, char **argv)
>  {
>      const char *arch = qtest_get_arch();
> -    char *cmdline;
>      int fd;
>      int ret;
>
> @@ -538,9 +537,7 @@ int main(int argc, char **argv)
>      /* Run the tests */
>      g_test_init(&argc, &argv, NULL);
>
> -    cmdline = g_strdup_printf("-vnc none ");
> -
> -    qtest_start(cmdline);
> +    qtest_start(NULL);
>      qtest_irq_intercept_in(global_qtest, "ioapic");
>      qtest_add_func("/fdc/cmos", test_cmos);
>      qtest_add_func("/fdc/no_media_on_start", test_no_media_on_start);
> diff --git a/tests/ide-test.c b/tests/ide-test.c
> index d5cec5a..4a0d97f 100644
> --- a/tests/ide-test.c
> +++ b/tests/ide-test.c
> @@ -380,7 +380,6 @@ static void test_bmdma_no_busmaster(void)
>  static void test_bmdma_setup(void)
>  {
>      ide_test_start(
> -        "-vnc none "
>          "-drive file=%s,if=ide,serial=%s,cache=writeback "
>          "-global ide-hd.ver=%s",
>          tmp_path, "testdisk", "version");
> @@ -410,7 +409,6 @@ static void test_identify(void)
>      int ret;
>
>      ide_test_start(
> -        "-vnc none "
>          "-drive file=%s,if=ide,serial=%s,cache=writeback "
>          "-global ide-hd.ver=%s",
>          tmp_path, "testdisk", "version");
> @@ -455,7 +453,6 @@ static void test_flush(void)
>      uint8_t data;
>
>      ide_test_start(
> -        "-vnc none "
>          "-drive file=blkdebug::%s,if=ide,cache=writeback",
>          tmp_path);
>
> diff --git a/tests/libqtest.c b/tests/libqtest.c
> index 359d571..921391c 100644
> --- a/tests/libqtest.c
> +++ b/tests/libqtest.c
> @@ -35,6 +35,12 @@
>
>  #define MAX_IRQ 256
>
> +#ifdef CONFIG_VNC
> +static const char *qtest_vnc_param = "-vnc none ";
> +#else
> +static const char *qtest_vnc_param = NULL;
> +#endif
> +
>  QTestState *global_qtest;
>
>  struct QTestState
> @@ -136,8 +142,10 @@ QTestState *qtest_init(const char *extra_args)
>                                    "-pidfile %s "
>                                    "-machine accel=qtest "
>                                    "-display none "
> +                                  "%s"
>                                    "%s", qemu_binary, s->socket_path,
>                                    s->qmp_socket_path, pid_file,
> +                                  qtest_vnc_param ?: "",
>                                    extra_args ?: "");
>          execlp("/bin/sh", "sh", "-c", command, NULL);
>          exit(1);
> --
> 1.7.1
>
>

--f46d04138ca7b4467504ef43ef91
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ping.<div class=3D"gmail_extra"><br clear=3D"all"><div><di=
v dir=3D"ltr"><font size=3D"3"><span style=3D"color:rgb(0,0,0);font-family:=
&#39;lucida Grande&#39;,Verdana;font-size:12px;line-height:18px"><div><span=
 style=3D"color:rgb(51,51,51);font-family:=E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=
=91,PMingLiU,Verdana,Arial,Helvetica,sans-serif;font-size:13px;line-height:=
22px;background-color:rgb(250,250,250)">Faithfully yours</span></div>

<div><span style=3D"color:rgb(51,51,51);font-family:=E5=BE=AE=E8=BD=AF=E9=
=9B=85=E9=BB=91,PMingLiU,Verdana,Arial,Helvetica,sans-serif;font-size:13px;=
line-height:22px;background-color:rgb(250,250,250)">Kewei Yu</span></div></=
span></font></div></div>
<br><br><div class=3D"gmail_quote">2014/1/2 Kewei Yu <span dir=3D"ltr">&lt;=
<a href=3D"mailto:keweihk@gmail.com" target=3D"_blank">keweihk@gmail.com</a=
>&gt;</span><br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">

When we disable vnc from &quot;./configure&quot;, QEMU can&#39;t use the vn=
c option.<br>
So qtest can&#39;t use the &quot;vnc -none &quot;, otherwise &quot;make che=
ck&quot; fails.<br>
<br>
Signed-off-by: Kewei Yu &lt;<a href=3D"mailto:keweihk@gmail.com">keweihk@gm=
ail.com</a>&gt;<br>
---<br>
=C2=A0v2: Consolidate VNC macro&#39;s #ifdef&#39;ery to one central point (=
tests/libqtest.c).<br>
=C2=A0v3: Fix the spelling and terminology error: &quot;s/disabling/disable=
; s/the\ qemu/QEMU; s/hangs/fails;&quot;<br>
---<br>
<br>
=C2=A0tests/fdc-test.c | =C2=A0 =C2=A05 +----<br>
=C2=A0tests/ide-test.c | =C2=A0 =C2=A03 ---<br>
=C2=A0tests/libqtest.c | =C2=A0 =C2=A08 ++++++++<br>
=C2=A03 files changed, 9 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/tests/fdc-test.c b/tests/fdc-test.c<br>
index 38b5b17..37096dc 100644<br>
--- a/tests/fdc-test.c<br>
+++ b/tests/fdc-test.c<br>
@@ -518,7 +518,6 @@ static void fuzz_registers(void)<br>
=C2=A0int main(int argc, char **argv)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0const char *arch =3D qtest_get_arch();<br>
- =C2=A0 =C2=A0char *cmdline;<br>
=C2=A0 =C2=A0 =C2=A0int fd;<br>
=C2=A0 =C2=A0 =C2=A0int ret;<br>
<br>
@@ -538,9 +537,7 @@ int main(int argc, char **argv)<br>
=C2=A0 =C2=A0 =C2=A0/* Run the tests */<br>
=C2=A0 =C2=A0 =C2=A0g_test_init(&amp;argc, &amp;argv, NULL);<br>
<br>
- =C2=A0 =C2=A0cmdline =3D g_strdup_printf(&quot;-vnc none &quot;);<br>
-<br>
- =C2=A0 =C2=A0qtest_start(cmdline);<br>
+ =C2=A0 =C2=A0qtest_start(NULL);<br>
=C2=A0 =C2=A0 =C2=A0qtest_irq_intercept_in(global_qtest, &quot;ioapic&quot;=
);<br>
=C2=A0 =C2=A0 =C2=A0qtest_add_func(&quot;/fdc/cmos&quot;, test_cmos);<br>
=C2=A0 =C2=A0 =C2=A0qtest_add_func(&quot;/fdc/no_media_on_start&quot;, test=
_no_media_on_start);<br>
diff --git a/tests/ide-test.c b/tests/ide-test.c<br>
index d5cec5a..4a0d97f 100644<br>
--- a/tests/ide-test.c<br>
+++ b/tests/ide-test.c<br>
@@ -380,7 +380,6 @@ static void test_bmdma_no_busmaster(void)<br>
=C2=A0static void test_bmdma_setup(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0ide_test_start(<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;-vnc none &quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;-drive file=3D%s,if=3Dide,serial=3D=
%s,cache=3Dwriteback &quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;-global ide-hd.ver=3D%s&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmp_path, &quot;testdisk&quot;, &quot;ver=
sion&quot;);<br>
@@ -410,7 +409,6 @@ static void test_identify(void)<br>
=C2=A0 =C2=A0 =C2=A0int ret;<br>
<br>
=C2=A0 =C2=A0 =C2=A0ide_test_start(<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;-vnc none &quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;-drive file=3D%s,if=3Dide,serial=3D=
%s,cache=3Dwriteback &quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;-global ide-hd.ver=3D%s&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmp_path, &quot;testdisk&quot;, &quot;ver=
sion&quot;);<br>
@@ -455,7 +453,6 @@ static void test_flush(void)<br>
=C2=A0 =C2=A0 =C2=A0uint8_t data;<br>
<br>
=C2=A0 =C2=A0 =C2=A0ide_test_start(<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;-vnc none &quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;-drive file=3Dblkdebug::%s,if=3Dide=
,cache=3Dwriteback&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmp_path);<br>
<br>
diff --git a/tests/libqtest.c b/tests/libqtest.c<br>
index 359d571..921391c 100644<br>
--- a/tests/libqtest.c<br>
+++ b/tests/libqtest.c<br>
@@ -35,6 +35,12 @@<br>
<br>
=C2=A0#define MAX_IRQ 256<br>
<br>
+#ifdef CONFIG_VNC<br>
+static const char *qtest_vnc_param =3D &quot;-vnc none &quot;;<br>
+#else<br>
+static const char *qtest_vnc_param =3D NULL;<br>
+#endif<br>
+<br>
=C2=A0QTestState *global_qtest;<br>
<br>
=C2=A0struct QTestState<br>
@@ -136,8 +142,10 @@ QTestState *qtest_init(const char *extra_args)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;-pidfile %s &quot=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;-machine accel=3D=
qtest &quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;-display none &qu=
ot;<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;%s&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;%s&quot;, qemu_bi=
nary, s-&gt;socket_path,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;qmp_socket_path, =
pid_file,<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qtest_vnc_param ?: &quot;&quot=
;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0extra_args ?: &quot;&qu=
ot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0execlp(&quot;/bin/sh&quot;, &quot;sh&quot=
;, &quot;-c&quot;, command, NULL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(1);<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.1<br>
<br>
</font></span></blockquote></div><br></div></div>

--f46d04138ca7b4467504ef43ef91--

