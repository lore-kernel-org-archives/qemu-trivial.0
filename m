Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VxzOv-0003Xw-7G
	for mharc-qemu-trivial@gnu.org; Tue, 31 Dec 2013 08:30:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40682)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <keweihk@gmail.com>) id 1VxzOr-0003Sk-4V
	for qemu-trivial@nongnu.org; Tue, 31 Dec 2013 08:30:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <keweihk@gmail.com>) id 1VxzOp-0007TN-Qt
	for qemu-trivial@nongnu.org; Tue, 31 Dec 2013 08:30:25 -0500
Received: from mail-ig0-x22e.google.com ([2607:f8b0:4001:c05::22e]:35497)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <keweihk@gmail.com>)
	id 1VxzOj-0007Si-Bc; Tue, 31 Dec 2013 08:30:17 -0500
Received: by mail-ig0-f174.google.com with SMTP id hk11so37757110igb.1
	for <multiple recipients>; Tue, 31 Dec 2013 05:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=A0rhVvaR8kSictjpHkURBBw8X7KGubGAziQMSiOZNwo=;
	b=yrSsyuPjMteu9UBuhDht0EbPook9gEMXRMvJJLNHF3GZ4liG+LhcTat8VUcq9UYbWD
	8ZmEt7qjU6ii7cfK40UL4bjaB7KI8BC2A26ALys6q/M8iMszW5ZDz4g2RPb/8Hbpqe2h
	EQfeTSQf8bSE9A/+1i9cf/0EUuDCvjvHUSlGhOtuB+DruMyMApE59SDbzS5222AxBFSz
	cERbAEMiOmiqdvKfGqEoH7g+0mgTdRxLMwSbBparNt8Rnze4wkbfDGfapNMc0+0hjmYa
	J7e5x1l+qwk79XkxPNupVK/1Q97iJXx+JQPCQbpXFQKMPzlLeZKOaMQZDtTX57G7FD52
	x7MA==
X-Received: by 10.43.71.200 with SMTP id yl8mr7180823icb.74.1388496616744;
	Tue, 31 Dec 2013 05:30:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.227.44 with HTTP; Tue, 31 Dec 2013 05:29:56 -0800 (PST)
In-Reply-To: <CAEgOgz54Zj9w8gQaMNBvVCiFQX5raPFXLGODy97PrD-TmYSBvw@mail.gmail.com>
References: <1388464944-26911-1-git-send-email-keweihk@gmail.com>
	<CAEgOgz54Zj9w8gQaMNBvVCiFQX5raPFXLGODy97PrD-TmYSBvw@mail.gmail.com>
From: Kewei Yu <keweihk@gmail.com>
Date: Tue, 31 Dec 2013 21:29:56 +0800
Message-ID: <CAJBZ5eP8tRvaQf6qW-zzUs_WQ2WcwTyo0i5Xz3ak8SSprU9vmQ@mail.gmail.com>
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Content-Type: multipart/alternative; boundary=001a11c1e3d49cecc504eed48f80
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4001:c05::22e
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 1/1] qtest: Fix the bug
 about disabling vnc causes "make check" hang
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
X-List-Received-Date: Tue, 31 Dec 2013 13:30:26 -0000

--001a11c1e3d49cecc504eed48f80
Content-Type: text/plain; charset=ISO-8859-1

2013/12/31 Peter Crosthwaite <peter.crosthwaite@xilinx.com>

> On Tue, Dec 31, 2013 at 2:42 PM, Kewei Yu <keweihk@gmail.com> wrote:
> > When we disabling vnc from "./configure", the qemu can't use the vnc
> option.
>
> "disable", -"the", "QEMU",
>
Do you mean "s/disabling/disable; s/the\ qemu/QEMU"?

>
> > So qtest can't use the "vnc -none ", otherwise "make check" will hang.
> >
>
> Curious, why exactly does make check hang? Shouldn't it just fail with
> an error result in this case?
>
Yeah, there is an error result "VNC support is disabled".

>
> > Signed-off-by: Kewei Yu <keweihk@gmail.com>
> > ---
> >  v2: Consolidate VNC macro's #ifdef'ery to one central point
> (tests/libqtest.c).
> >
> >  tests/fdc-test.c |    5 +----
> >  tests/ide-test.c |    3 ---
> >  tests/libqtest.c |    8 ++++++++
> >  3 files changed, 9 insertions(+), 7 deletions(-)
> >
> > diff --git a/tests/fdc-test.c b/tests/fdc-test.c
> > index 38b5b17..37096dc 100644
> > --- a/tests/fdc-test.c
> > +++ b/tests/fdc-test.c
> > @@ -518,7 +518,6 @@ static void fuzz_registers(void)
> >  int main(int argc, char **argv)
> >  {
> >      const char *arch = qtest_get_arch();
> > -    char *cmdline;
> >      int fd;
> >      int ret;
> >
> > @@ -538,9 +537,7 @@ int main(int argc, char **argv)
> >      /* Run the tests */
> >      g_test_init(&argc, &argv, NULL);
> >
> > -    cmdline = g_strdup_printf("-vnc none ");
> > -
> > -    qtest_start(cmdline);
> > +    qtest_start(NULL);
> >      qtest_irq_intercept_in(global_qtest, "ioapic");
> >      qtest_add_func("/fdc/cmos", test_cmos);
> >      qtest_add_func("/fdc/no_media_on_start", test_no_media_on_start);
> > diff --git a/tests/ide-test.c b/tests/ide-test.c
> > index d5cec5a..4a0d97f 100644
> > --- a/tests/ide-test.c
> > +++ b/tests/ide-test.c
> > @@ -380,7 +380,6 @@ static void test_bmdma_no_busmaster(void)
> >  static void test_bmdma_setup(void)
> >  {
> >      ide_test_start(
> > -        "-vnc none "
> >          "-drive file=%s,if=ide,serial=%s,cache=writeback "
> >          "-global ide-hd.ver=%s",
> >          tmp_path, "testdisk", "version");
> > @@ -410,7 +409,6 @@ static void test_identify(void)
> >      int ret;
> >
> >      ide_test_start(
> > -        "-vnc none "
> >          "-drive file=%s,if=ide,serial=%s,cache=writeback "
> >          "-global ide-hd.ver=%s",
> >          tmp_path, "testdisk", "version");
> > @@ -455,7 +453,6 @@ static void test_flush(void)
> >      uint8_t data;
> >
> >      ide_test_start(
> > -        "-vnc none "
> >          "-drive file=blkdebug::%s,if=ide,cache=writeback",
> >          tmp_path);
> >
> > diff --git a/tests/libqtest.c b/tests/libqtest.c
> > index 359d571..921391c 100644
> > --- a/tests/libqtest.c
> > +++ b/tests/libqtest.c
> > @@ -35,6 +35,12 @@
> >
> >  #define MAX_IRQ 256
> >
> > +#ifdef CONFIG_VNC
> > +static const char *qtest_vnc_param = "-vnc none ";
> > +#else
> > +static const char *qtest_vnc_param = NULL;
> > +#endif
> > +
> >  QTestState *global_qtest;
> >
> >  struct QTestState
> > @@ -136,8 +142,10 @@ QTestState *qtest_init(const char *extra_args)
> >                                    "-pidfile %s "
> >                                    "-machine accel=qtest "
> >                                    "-display none "
> > +                                  "%s"
> >                                    "%s", qemu_binary, s->socket_path,
> >                                    s->qmp_socket_path, pid_file,
> > +                                  qtest_vnc_param ?: "",
>
> I do vaguely remember someone going to efforts to remove uses of "? :
> foo" (with the blank true value).

 I'm not clear the sentence's meaning.

>
> Regards,
> Peter
>
> >                                    extra_args ?: "");
> >          execlp("/bin/sh", "sh", "-c", command, NULL);
> >          exit(1);
> > --
> > 1.7.1
> >
> >
>

Thanks
Kewei

--001a11c1e3d49cecc504eed48f80
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">2013=
/12/31 Peter Crosthwaite <span dir=3D"ltr">&lt;<a href=3D"mailto:peter.cros=
thwaite@xilinx.com" target=3D"_blank">peter.crosthwaite@xilinx.com</a>&gt;<=
/span><br>


<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div>On Tue, Dec 31, 2013 at 2:42 PM, Kewei Yu &lt;<a href=
=3D"mailto:keweihk@gmail.com" target=3D"_blank">keweihk@gmail.com</a>&gt; w=
rote:<br>



&gt; When we disabling vnc from &quot;./configure&quot;, the qemu can&#39;t=
 use the vnc option.<br>
<br>
</div>&quot;disable&quot;, -&quot;the&quot;, &quot;QEMU&quot;,<br></blockqu=
ote><div>Do you mean &quot;s/disabling/disable; s/the\ qemu/QEMU&quot;?</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid=
;padding-left:1ex">


<div><br>
&gt; So qtest can&#39;t use the &quot;vnc -none &quot;, otherwise &quot;mak=
e check&quot; will hang.<br>
&gt;<br>
<br>
</div>Curious, why exactly does make check hang? Shouldn&#39;t it just fail=
 with<br>
an error result in this case?<br></blockquote><div>Yeah, there is an error=
=A0result=A0<font color=3D"#000000">&quot;<span style=3D"font-family:Consol=
as,&#39;Liberation Mono&#39;,Courier,monospace;font-size:12px;line-height:1=
8px;white-space:pre">VNC support is disabled</span>&quot;.</font></div>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">
<div><div><br>
&gt; Signed-off-by: Kewei Yu &lt;<a href=3D"mailto:keweihk@gmail.com" targe=
t=3D"_blank">keweihk@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =A0v2: Consolidate VNC macro&#39;s #ifdef&#39;ery to one central point=
 (tests/libqtest.c).<br>
&gt;<br>
&gt; =A0tests/fdc-test.c | =A0 =A05 +----<br>
&gt; =A0tests/ide-test.c | =A0 =A03 ---<br>
&gt; =A0tests/libqtest.c | =A0 =A08 ++++++++<br>
&gt; =A03 files changed, 9 insertions(+), 7 deletions(-)<br>
&gt;<br>
&gt; diff --git a/tests/fdc-test.c b/tests/fdc-test.c<br>
&gt; index 38b5b17..37096dc 100644<br>
&gt; --- a/tests/fdc-test.c<br>
&gt; +++ b/tests/fdc-test.c<br>
&gt; @@ -518,7 +518,6 @@ static void fuzz_registers(void)<br>
&gt; =A0int main(int argc, char **argv)<br>
&gt; =A0{<br>
&gt; =A0 =A0 =A0const char *arch =3D qtest_get_arch();<br>
&gt; - =A0 =A0char *cmdline;<br>
&gt; =A0 =A0 =A0int fd;<br>
&gt; =A0 =A0 =A0int ret;<br>
&gt;<br>
&gt; @@ -538,9 +537,7 @@ int main(int argc, char **argv)<br>
&gt; =A0 =A0 =A0/* Run the tests */<br>
&gt; =A0 =A0 =A0g_test_init(&amp;argc, &amp;argv, NULL);<br>
&gt;<br>
&gt; - =A0 =A0cmdline =3D g_strdup_printf(&quot;-vnc none &quot;);<br>
&gt; -<br>
&gt; - =A0 =A0qtest_start(cmdline);<br>
&gt; + =A0 =A0qtest_start(NULL);<br>
&gt; =A0 =A0 =A0qtest_irq_intercept_in(global_qtest, &quot;ioapic&quot;);<b=
r>
&gt; =A0 =A0 =A0qtest_add_func(&quot;/fdc/cmos&quot;, test_cmos);<br>
&gt; =A0 =A0 =A0qtest_add_func(&quot;/fdc/no_media_on_start&quot;, test_no_=
media_on_start);<br>
&gt; diff --git a/tests/ide-test.c b/tests/ide-test.c<br>
&gt; index d5cec5a..4a0d97f 100644<br>
&gt; --- a/tests/ide-test.c<br>
&gt; +++ b/tests/ide-test.c<br>
&gt; @@ -380,7 +380,6 @@ static void test_bmdma_no_busmaster(void)<br>
&gt; =A0static void test_bmdma_setup(void)<br>
&gt; =A0{<br>
&gt; =A0 =A0 =A0ide_test_start(<br>
&gt; - =A0 =A0 =A0 =A0&quot;-vnc none &quot;<br>
&gt; =A0 =A0 =A0 =A0 =A0&quot;-drive file=3D%s,if=3Dide,serial=3D%s,cache=
=3Dwriteback &quot;<br>
&gt; =A0 =A0 =A0 =A0 =A0&quot;-global ide-hd.ver=3D%s&quot;,<br>
&gt; =A0 =A0 =A0 =A0 =A0tmp_path, &quot;testdisk&quot;, &quot;version&quot;=
);<br>
&gt; @@ -410,7 +409,6 @@ static void test_identify(void)<br>
&gt; =A0 =A0 =A0int ret;<br>
&gt;<br>
&gt; =A0 =A0 =A0ide_test_start(<br>
&gt; - =A0 =A0 =A0 =A0&quot;-vnc none &quot;<br>
&gt; =A0 =A0 =A0 =A0 =A0&quot;-drive file=3D%s,if=3Dide,serial=3D%s,cache=
=3Dwriteback &quot;<br>
&gt; =A0 =A0 =A0 =A0 =A0&quot;-global ide-hd.ver=3D%s&quot;,<br>
&gt; =A0 =A0 =A0 =A0 =A0tmp_path, &quot;testdisk&quot;, &quot;version&quot;=
);<br>
&gt; @@ -455,7 +453,6 @@ static void test_flush(void)<br>
&gt; =A0 =A0 =A0uint8_t data;<br>
&gt;<br>
&gt; =A0 =A0 =A0ide_test_start(<br>
&gt; - =A0 =A0 =A0 =A0&quot;-vnc none &quot;<br>
&gt; =A0 =A0 =A0 =A0 =A0&quot;-drive file=3Dblkdebug::%s,if=3Dide,cache=3Dw=
riteback&quot;,<br>
&gt; =A0 =A0 =A0 =A0 =A0tmp_path);<br>
&gt;<br>
&gt; diff --git a/tests/libqtest.c b/tests/libqtest.c<br>
&gt; index 359d571..921391c 100644<br>
&gt; --- a/tests/libqtest.c<br>
&gt; +++ b/tests/libqtest.c<br>
&gt; @@ -35,6 +35,12 @@<br>
&gt;<br>
&gt; =A0#define MAX_IRQ 256<br>
&gt;<br>
&gt; +#ifdef CONFIG_VNC<br>
&gt; +static const char *qtest_vnc_param =3D &quot;-vnc none &quot;;<br>
&gt; +#else<br>
&gt; +static const char *qtest_vnc_param =3D NULL;<br>
&gt; +#endif<br>
&gt; +<br>
&gt; =A0QTestState *global_qtest;<br>
&gt;<br>
&gt; =A0struct QTestState<br>
&gt; @@ -136,8 +142,10 @@ QTestState *qtest_init(const char *extra_args)<br=
>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0&quot;-pidfile %s &quot;<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0&quot;-machine accel=3Dqtest &quot;<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0&quot;-display none &quot;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&=
quot;%s&quot;<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0&quot;%s&quot;, qemu_binary, s-&gt;socket_path,<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0s-&gt;qmp_socket_path, pid_file,<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0q=
test_vnc_param ?: &quot;&quot;,<br>
<br>
</div></div>I do vaguely remember someone going to efforts to remove uses o=
f &quot;? :<br>
foo&quot; (with the blank true value).</blockquote><div>=A0I&#39;m not clea=
r the sentence&#39;s meaning.</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(20=
4,204,204);border-left-style:solid;padding-left:1ex">


<br>
Regards,<br>
Peter<br>
<div><div><br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0extra_args ?: &quot;&quot;);<br>
&gt; =A0 =A0 =A0 =A0 =A0execlp(&quot;/bin/sh&quot;, &quot;sh&quot;, &quot;-=
c&quot;, command, NULL);<br>
&gt; =A0 =A0 =A0 =A0 =A0exit(1);<br>
&gt; --<br>
&gt; 1.7.1<br>
&gt;<br>
&gt;</div></div></blockquote><div><br></div></div>Thanks</div><div class=3D=
"gmail_extra">Kewei</div><div class=3D"gmail_extra"><br></div></div>

--001a11c1e3d49cecc504eed48f80--

