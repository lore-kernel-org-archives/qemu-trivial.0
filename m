Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W00qB-0003ll-At
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jan 2014 22:26:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54856)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <keweihk@gmail.com>) id 1W00q5-0003ey-Ne
	for qemu-trivial@nongnu.org; Sun, 05 Jan 2014 22:26:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <keweihk@gmail.com>) id 1W00q3-0005KY-U0
	for qemu-trivial@nongnu.org; Sun, 05 Jan 2014 22:26:53 -0500
Received: from mail-we0-x235.google.com ([2a00:1450:400c:c03::235]:57862)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <keweihk@gmail.com>)
	id 1W00q0-0005Ju-Ia; Sun, 05 Jan 2014 22:26:48 -0500
Received: by mail-we0-f181.google.com with SMTP id x55so14889801wes.26
	for <multiple recipients>; Sun, 05 Jan 2014 19:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=i0v30Y16gkGbldW8t+KDGZJdG5YILH8jzAK2PEDGx6E=;
	b=TT939qjFFupf9DjdaW8Id28BWne+u1Jg9HztkiQzMJAMrJWss1Y9POj8HQ4Eo98Q1z
	3ApGz0Ec/fWAhf05DFroxh6+mxZKcv2wEWY+6Bvz9YeB7Twlnmeu9/o59OkJeUr6VksY
	mK6buGQHI75Esg2L0ygZz/LrBeoxP9EyeXK/d6Cr9cnnKi7TmKeYZlT7iVnhS7mzNO9n
	6sunKITk+MgRcGRLwrsWCDh4NpNPjAbZjkTn47974/QCLFTeqGmVJ4JkiyGtPs6VCxXK
	PEwPdz4qeZNPngBFdenUW30ROIumJ7WF/j3QRdnb9VaJrtrdDHTD91Aa8a2tbcq20UPV
	4xsg==
X-Received: by 10.180.210.131 with SMTP id mu3mr7274501wic.36.1388978807570;
	Sun, 05 Jan 2014 19:26:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.108.74 with HTTP; Sun, 5 Jan 2014 19:26:27 -0800 (PST)
In-Reply-To: <CAEgOgz5d0hLEj1qr_BDAwg2MWmUyAaC4CqUmKOAN8VXGHCg9uA@mail.gmail.com>
References: <1388629202-29482-1-git-send-email-keweihk@gmail.com>
	<CAJBZ5eMmkhBqCuLpR0iRx-2=mwsRhM2fhFckA9vrRnN5bMo1Rg@mail.gmail.com>
	<CAEgOgz5d0hLEj1qr_BDAwg2MWmUyAaC4CqUmKOAN8VXGHCg9uA@mail.gmail.com>
From: Kewei Yu <keweihk@gmail.com>
Date: Mon, 6 Jan 2014 11:26:27 +0800
Message-ID: <CAJBZ5eNJE7gPG6aQYEY7Y9D-fYnVGeMtVX9R+4bMiL8w-96GiA@mail.gmail.com>
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Content-Type: multipart/alternative; boundary=001a11c38d706d05dc04ef44d44b
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c03::235
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-trivial <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	=?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3 1/1] qtest: Fix the bug
 about disable vnc causes "make check" fail
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
X-List-Received-Date: Mon, 06 Jan 2014 03:26:55 -0000

--001a11c38d706d05dc04ef44d44b
Content-Type: text/plain; charset=ISO-8859-1

OK, I'm viewing the code about the two parameters.
Thanks for your reply.

Faithfully yours
Kewei Yu


2014/1/6 Peter Crosthwaite <peter.crosthwaite@xilinx.com>

> Hi Kewei,
>
> On Mon, Jan 6, 2014 at 12:22 PM, Kewei Yu <keweihk@gmail.com> wrote:
> > Ping.
> >
>
> Paolo's latest query on the other thread is still an open question.
> Does simply substituting "-display none" for "-vnc none" resolve the
> problem? If not why not?
>
> Regards,
> Peter
>
> > Faithfully yours
> > Kewei Yu
> >
> >
> > 2014/1/2 Kewei Yu <keweihk@gmail.com>
> >>
> >> When we disable vnc from "./configure", QEMU can't use the vnc option.
> >> So qtest can't use the "vnc -none ", otherwise "make check" fails.
> >>
> >> Signed-off-by: Kewei Yu <keweihk@gmail.com>
> >> ---
> >>  v2: Consolidate VNC macro's #ifdef'ery to one central point
> >> (tests/libqtest.c).
> >>  v3: Fix the spelling and terminology error: "s/disabling/disable;
> s/the\
> >> qemu/QEMU; s/hangs/fails;"
> >> ---
> >>
> >>  tests/fdc-test.c |    5 +----
> >>  tests/ide-test.c |    3 ---
> >>  tests/libqtest.c |    8 ++++++++
> >>  3 files changed, 9 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/tests/fdc-test.c b/tests/fdc-test.c
> >> index 38b5b17..37096dc 100644
> >> --- a/tests/fdc-test.c
> >> +++ b/tests/fdc-test.c
> >> @@ -518,7 +518,6 @@ static void fuzz_registers(void)
> >>  int main(int argc, char **argv)
> >>  {
> >>      const char *arch = qtest_get_arch();
> >> -    char *cmdline;
> >>      int fd;
> >>      int ret;
> >>
> >> @@ -538,9 +537,7 @@ int main(int argc, char **argv)
> >>      /* Run the tests */
> >>      g_test_init(&argc, &argv, NULL);
> >>
> >> -    cmdline = g_strdup_printf("-vnc none ");
> >> -
> >> -    qtest_start(cmdline);
> >> +    qtest_start(NULL);
> >>      qtest_irq_intercept_in(global_qtest, "ioapic");
> >>      qtest_add_func("/fdc/cmos", test_cmos);
> >>      qtest_add_func("/fdc/no_media_on_start", test_no_media_on_start);
> >> diff --git a/tests/ide-test.c b/tests/ide-test.c
> >> index d5cec5a..4a0d97f 100644
> >> --- a/tests/ide-test.c
> >> +++ b/tests/ide-test.c
> >> @@ -380,7 +380,6 @@ static void test_bmdma_no_busmaster(void)
> >>  static void test_bmdma_setup(void)
> >>  {
> >>      ide_test_start(
> >> -        "-vnc none "
> >>          "-drive file=%s,if=ide,serial=%s,cache=writeback "
> >>          "-global ide-hd.ver=%s",
> >>          tmp_path, "testdisk", "version");
> >> @@ -410,7 +409,6 @@ static void test_identify(void)
> >>      int ret;
> >>
> >>      ide_test_start(
> >> -        "-vnc none "
> >>          "-drive file=%s,if=ide,serial=%s,cache=writeback "
> >>          "-global ide-hd.ver=%s",
> >>          tmp_path, "testdisk", "version");
> >> @@ -455,7 +453,6 @@ static void test_flush(void)
> >>      uint8_t data;
> >>
> >>      ide_test_start(
> >> -        "-vnc none "
> >>          "-drive file=blkdebug::%s,if=ide,cache=writeback",
> >>          tmp_path);
> >>
> >> diff --git a/tests/libqtest.c b/tests/libqtest.c
> >> index 359d571..921391c 100644
> >> --- a/tests/libqtest.c
> >> +++ b/tests/libqtest.c
> >> @@ -35,6 +35,12 @@
> >>
> >>  #define MAX_IRQ 256
> >>
> >> +#ifdef CONFIG_VNC
> >> +static const char *qtest_vnc_param = "-vnc none ";
> >> +#else
> >> +static const char *qtest_vnc_param = NULL;
> >> +#endif
> >> +
> >>  QTestState *global_qtest;
> >>
> >>  struct QTestState
> >> @@ -136,8 +142,10 @@ QTestState *qtest_init(const char *extra_args)
> >>                                    "-pidfile %s "
> >>                                    "-machine accel=qtest "
> >>                                    "-display none "
> >> +                                  "%s"
> >>                                    "%s", qemu_binary, s->socket_path,
> >>                                    s->qmp_socket_path, pid_file,
> >> +                                  qtest_vnc_param ?: "",
> >>                                    extra_args ?: "");
> >>          execlp("/bin/sh", "sh", "-c", command, NULL);
> >>          exit(1);
> >> --
> >> 1.7.1
> >>
> >
>

--001a11c38d706d05dc04ef44d44b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">OK, I&#39;m viewing the code about the two parameters.<div=
>Thanks for your reply.</div></div><div class=3D"gmail_extra"><br clear=3D"=
all"><div><div dir=3D"ltr"><font size=3D"3"><span style=3D"color:rgb(0,0,0)=
;font-family:&#39;lucida Grande&#39;,Verdana;font-size:12px;line-height:18p=
x"><div>

<span style=3D"color:rgb(51,51,51);font-family:=E5=BE=AE=E8=BD=AF=E9=9B=85=
=E9=BB=91,PMingLiU,Verdana,Arial,Helvetica,sans-serif;font-size:13px;line-h=
eight:22px;background-color:rgb(250,250,250)">Faithfully yours</span></div>=
<div><span style=3D"color:rgb(51,51,51);font-family:=E5=BE=AE=E8=BD=AF=E9=
=9B=85=E9=BB=91,PMingLiU,Verdana,Arial,Helvetica,sans-serif;font-size:13px;=
line-height:22px;background-color:rgb(250,250,250)">Kewei Yu</span></div>

</span></font></div></div>
<br><br><div class=3D"gmail_quote">2014/1/6 Peter Crosthwaite <span dir=3D"=
ltr">&lt;<a href=3D"mailto:peter.crosthwaite@xilinx.com" target=3D"_blank">=
peter.crosthwaite@xilinx.com</a>&gt;</span><br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">

Hi Kewei,<br>
<br>
On Mon, Jan 6, 2014 at 12:22 PM, Kewei Yu &lt;<a href=3D"mailto:keweihk@gma=
il.com">keweihk@gmail.com</a>&gt; wrote:<br>
&gt; Ping.<br>
&gt;<br>
<br>
Paolo&#39;s latest query on the other thread is still an open question.<br>
Does simply substituting &quot;-display none&quot; for &quot;-vnc none&quot=
; resolve the<br>
problem? If not why not?<br>
<br>
Regards,<br>
Peter<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; Faithfully yours<br>
&gt; Kewei Yu<br>
&gt;<br>
&gt;<br>
&gt; 2014/1/2 Kewei Yu &lt;<a href=3D"mailto:keweihk@gmail.com">keweihk@gma=
il.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; When we disable vnc from &quot;./configure&quot;, QEMU can&#39;t u=
se the vnc option.<br>
&gt;&gt; So qtest can&#39;t use the &quot;vnc -none &quot;, otherwise &quot=
;make check&quot; fails.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Kewei Yu &lt;<a href=3D"mailto:keweihk@gmail.com">k=
eweihk@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; =C2=A0v2: Consolidate VNC macro&#39;s #ifdef&#39;ery to one centra=
l point<br>
&gt;&gt; (tests/libqtest.c).<br>
&gt;&gt; =C2=A0v3: Fix the spelling and terminology error: &quot;s/disablin=
g/disable; s/the\<br>
&gt;&gt; qemu/QEMU; s/hangs/fails;&quot;<br>
&gt;&gt; ---<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0tests/fdc-test.c | =C2=A0 =C2=A05 +----<br>
&gt;&gt; =C2=A0tests/ide-test.c | =C2=A0 =C2=A03 ---<br>
&gt;&gt; =C2=A0tests/libqtest.c | =C2=A0 =C2=A08 ++++++++<br>
&gt;&gt; =C2=A03 files changed, 9 insertions(+), 7 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/tests/fdc-test.c b/tests/fdc-test.c<br>
&gt;&gt; index 38b5b17..37096dc 100644<br>
&gt;&gt; --- a/tests/fdc-test.c<br>
&gt;&gt; +++ b/tests/fdc-test.c<br>
&gt;&gt; @@ -518,7 +518,6 @@ static void fuzz_registers(void)<br>
&gt;&gt; =C2=A0int main(int argc, char **argv)<br>
&gt;&gt; =C2=A0{<br>
&gt;&gt; =C2=A0 =C2=A0 =C2=A0const char *arch =3D qtest_get_arch();<br>
&gt;&gt; - =C2=A0 =C2=A0char *cmdline;<br>
&gt;&gt; =C2=A0 =C2=A0 =C2=A0int fd;<br>
&gt;&gt; =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt;&gt;<br>
&gt;&gt; @@ -538,9 +537,7 @@ int main(int argc, char **argv)<br>
&gt;&gt; =C2=A0 =C2=A0 =C2=A0/* Run the tests */<br>
&gt;&gt; =C2=A0 =C2=A0 =C2=A0g_test_init(&amp;argc, &amp;argv, NULL);<br>
&gt;&gt;<br>
&gt;&gt; - =C2=A0 =C2=A0cmdline =3D g_strdup_printf(&quot;-vnc none &quot;)=
;<br>
&gt;&gt; -<br>
&gt;&gt; - =C2=A0 =C2=A0qtest_start(cmdline);<br>
&gt;&gt; + =C2=A0 =C2=A0qtest_start(NULL);<br>
&gt;&gt; =C2=A0 =C2=A0 =C2=A0qtest_irq_intercept_in(global_qtest, &quot;ioa=
pic&quot;);<br>
&gt;&gt; =C2=A0 =C2=A0 =C2=A0qtest_add_func(&quot;/fdc/cmos&quot;, test_cmo=
s);<br>
&gt;&gt; =C2=A0 =C2=A0 =C2=A0qtest_add_func(&quot;/fdc/no_media_on_start&qu=
ot;, test_no_media_on_start);<br>
&gt;&gt; diff --git a/tests/ide-test.c b/tests/ide-test.c<br>
&gt;&gt; index d5cec5a..4a0d97f 100644<br>
&gt;&gt; --- a/tests/ide-test.c<br>
&gt;&gt; +++ b/tests/ide-test.c<br>
&gt;&gt; @@ -380,7 +380,6 @@ static void test_bmdma_no_busmaster(void)<br>
&gt;&gt; =C2=A0static void test_bmdma_setup(void)<br>
&gt;&gt; =C2=A0{<br>
&gt;&gt; =C2=A0 =C2=A0 =C2=A0ide_test_start(<br>
&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;-vnc none &quot;<br>
&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;-drive file=3D%s,if=3Dide,=
serial=3D%s,cache=3Dwriteback &quot;<br>
&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;-global ide-hd.ver=3D%s&qu=
ot;,<br>
&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmp_path, &quot;testdisk&quot;, =
&quot;version&quot;);<br>
&gt;&gt; @@ -410,7 +409,6 @@ static void test_identify(void)<br>
&gt;&gt; =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0 =C2=A0 =C2=A0ide_test_start(<br>
&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;-vnc none &quot;<br>
&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;-drive file=3D%s,if=3Dide,=
serial=3D%s,cache=3Dwriteback &quot;<br>
&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;-global ide-hd.ver=3D%s&qu=
ot;,<br>
&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmp_path, &quot;testdisk&quot;, =
&quot;version&quot;);<br>
&gt;&gt; @@ -455,7 +453,6 @@ static void test_flush(void)<br>
&gt;&gt; =C2=A0 =C2=A0 =C2=A0uint8_t data;<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0 =C2=A0 =C2=A0ide_test_start(<br>
&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;-vnc none &quot;<br>
&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;-drive file=3Dblkdebug::%s=
,if=3Dide,cache=3Dwriteback&quot;,<br>
&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmp_path);<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/tests/libqtest.c b/tests/libqtest.c<br>
&gt;&gt; index 359d571..921391c 100644<br>
&gt;&gt; --- a/tests/libqtest.c<br>
&gt;&gt; +++ b/tests/libqtest.c<br>
&gt;&gt; @@ -35,6 +35,12 @@<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0#define MAX_IRQ 256<br>
&gt;&gt;<br>
&gt;&gt; +#ifdef CONFIG_VNC<br>
&gt;&gt; +static const char *qtest_vnc_param =3D &quot;-vnc none &quot;;<br=
>
&gt;&gt; +#else<br>
&gt;&gt; +static const char *qtest_vnc_param =3D NULL;<br>
&gt;&gt; +#endif<br>
&gt;&gt; +<br>
&gt;&gt; =C2=A0QTestState *global_qtest;<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0struct QTestState<br>
&gt;&gt; @@ -136,8 +142,10 @@ QTestState *qtest_init(const char *extra_args=
)<br>
&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;-pidfile %=
s &quot;<br>
&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;-machine a=
ccel=3Dqtest &quot;<br>
&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;-display n=
one &quot;<br>
&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;%s&quot;<br>
&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;%s&quot;, =
qemu_binary, s-&gt;socket_path,<br>
&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;qmp_socket=
_path, pid_file,<br>
&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qtest_vnc_param ?: &=
quot;&quot;,<br>
&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0extra_args ?: &q=
uot;&quot;);<br>
&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0execlp(&quot;/bin/sh&quot;, &quo=
t;sh&quot;, &quot;-c&quot;, command, NULL);<br>
&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(1);<br>
&gt;&gt; --<br>
&gt;&gt; 1.7.1<br>
&gt;&gt;<br>
&gt;<br>
</div></div></blockquote></div><br></div>

--001a11c38d706d05dc04ef44d44b--

