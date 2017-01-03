Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cOUCj-0006zf-8d
	for mharc-qemu-trivial@gnu.org; Tue, 03 Jan 2017 13:53:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54520)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1cOUCg-0006xo-Sj
	for qemu-trivial@nongnu.org; Tue, 03 Jan 2017 13:52:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1cOUCf-0007JO-Ro
	for qemu-trivial@nongnu.org; Tue, 03 Jan 2017 13:52:58 -0500
Received: from mail-yw0-x244.google.com ([2607:f8b0:4002:c05::244]:33293)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1cOUCc-0007IG-Um; Tue, 03 Jan 2017 13:52:55 -0500
Received: by mail-yw0-x244.google.com with SMTP id s68so39352197ywg.0;
	Tue, 03 Jan 2017 10:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=cs2iqZmz7d/rUEMIskYnHzHFwIHUyuNUo1WQCWa44IM=;
	b=Hw+q//Pwii6lQabzR+okqKWcwmm24EhffPtz/nyW8JyrL1EioZXYoidUFGanitX9Rs
	ryBisCXdxs22nW+gWnW7sgzyqzomns3drB7IMBLIz0iXU6zoWPmClm8qm9rpEvSA8EWM
	oogUHvTJTXGXDJpTMrr+qsVOEGhiwxOr5RgnH79duZHC3MP8pVdKO5N6dKrC2mDACAXo
	Y2T/SMEPWoZZu/zqbYyhqn0dEZ5uV63c+9w6YEBM7iCMgAiZ2gryAxvfnkgOYk940NUN
	gaJ3NkWrbYDXDmJj96vwWIwR/YyADtU+lz5qpDSUDBy8XWTzuCpT5YFmwCzFudD8zR48
	Zz+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cs2iqZmz7d/rUEMIskYnHzHFwIHUyuNUo1WQCWa44IM=;
	b=tFCNVZxihT9b+IWs8t2+HZupyUWjwVsd69DIeFo54Hn3CLiIDt4E9s2HXKaTXiXNFb
	qol/JF8UBUBSUlzx7Y85bKfeHDbI4D2V/aL+LgyiuCZ42umLwky99TxHkPNPkaSh1g7a
	dpPNEtYmlINPO4XcsYGF6DroAnpA/WhU85it89o5mMzdtgh1ajE/6Xx3vDWVcv+48YRT
	Tbrc5BVuZY9n2PFpiMnlPiN2Qk7OyyjN4WzxFpAy4Is67wZyWNxIDiuJhQiG7YZvkZqv
	Fy7P/V4tdcJcjcxZdl4AbPD/D3eB5CXwn80JH47MT2v346O0JpGVcTxe/UxT1PGdkb+i
	w79w==
X-Gm-Message-State: AIkVDXIIJnLnQN64RcJZ3rUUSNgduHlM54GIV3SDMIcbjOTBiDvOSCzDbTaWMbqlcqZGIP0nrW9DA3pFO8YUTg==
X-Received: by 10.13.195.67 with SMTP id f64mr58121753ywd.249.1483469572666;
	Tue, 03 Jan 2017 10:52:52 -0800 (PST)
MIME-Version: 1.0
References: <1465919097-21453-1-git-send-email-berrange@redhat.com>
In-Reply-To: <1465919097-21453-1-git-send-email-berrange@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 03 Jan 2017 18:52:42 +0000
Message-ID: <CAJ+F1CJjQHo9EBQj2D5XUV8N9v_7PGDng7nyLJFM1fww3WpxqA@mail.gmail.com>
To: "Daniel P. Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Content-Type: multipart/alternative; boundary=001a114d6500e9fca90545352cef
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4002:c05::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] win32: don't run subprocess
 tests on Mingw32 platform
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
X-List-Received-Date: Tue, 03 Jan 2017 18:53:00 -0000

--001a114d6500e9fca90545352cef
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Jun 14, 2016 at 6:34 PM Daniel P. Berrange <berrange@redhat.com>
wrote:

> The g_test_trap_subprocess() method does not work on the
> Mingw32 platform, causing the test-qdev-global-props
> test case to abort
>
> (test-logging.exe:230): GLib-ERROR **: g_test_trap_subprocess()
> failed: Failed to execute helper program (No such file or directory)
>
> This failure was introduced a while ago in
>
>   commit 2177801a4899bf29108b3d471417a5b4d701ec29
>   Author: Eduardo Habkost <ehabkost@redhat.com>
>   Date:   Fri Aug 8 16:03:27 2014 -0300
>
>     test-qdev-global-props: Run tests on subprocess
>
> Modify the configure time check to avoid enabling this feature
> on Mingw, rather than trying to rewrite the test to avoid this
> feature.
>
> Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
> ---
>  configure | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/configure b/configure
> index 8c2f90b..aa291e8 100755
> --- a/configure
> +++ b/configure
> @@ -5167,7 +5167,7 @@ if test "$bluez" =3D "yes" ; then
>    echo "CONFIG_BLUEZ=3Dy" >> $config_host_mak
>    echo "BLUEZ_CFLAGS=3D$bluez_cflags" >> $config_host_mak
>  fi
> -if test "$glib_subprocess" =3D "yes" ; then
> +if test "$glib_subprocess" =3D "yes" && test "$mingw32" !=3D "yes" ; the=
n
>    echo "CONFIG_HAS_GLIB_SUBPROCESS_TESTS=3Dy" >> $config_host_mak
>  fi
>

Isn't it only because you are missing gspawn-win*-helper.exe?

This seems to be a glib installation issue to me. I can run the
subprocesses tests fine on win32 and wine. I suggest to revert commit
7ad9339e372fcd12d584684d7f52ac259604a4f4, I can send a patch if you agree.



 echo "GLIB_CFLAGS=3D$glib_cflags" >> $config_host_mak
> --
> 2.5.5
>
>
> --
Marc-Andr=C3=A9 Lureau

--001a114d6500e9fca90545352cef
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi<br><div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
>On Tue, Jun 14, 2016 at 6:34 PM Daniel P. Berrange &lt;<a href=3D"mailto:b=
errange@redhat.com">berrange@redhat.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">The g_test_trap_subprocess() method does not work on th=
e<br class=3D"gmail_msg">
Mingw32 platform, causing the test-qdev-global-props<br class=3D"gmail_msg"=
>
test case to abort<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
(test-logging.exe:230): GLib-ERROR **: g_test_trap_subprocess()<br class=3D=
"gmail_msg">
failed: Failed to execute helper program (No such file or directory)<br cla=
ss=3D"gmail_msg">
<br class=3D"gmail_msg">
This failure was introduced a while ago in<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
=C2=A0 commit 2177801a4899bf29108b3d471417a5b4d701ec29<br class=3D"gmail_ms=
g">
=C2=A0 Author: Eduardo Habkost &lt;<a href=3D"mailto:ehabkost@redhat.com" c=
lass=3D"gmail_msg" target=3D"_blank">ehabkost@redhat.com</a>&gt;<br class=
=3D"gmail_msg">
=C2=A0 Date:=C2=A0 =C2=A0Fri Aug 8 16:03:27 2014 -0300<br class=3D"gmail_ms=
g">
<br class=3D"gmail_msg">
=C2=A0 =C2=A0 test-qdev-global-props: Run tests on subprocess<br class=3D"g=
mail_msg">
<br class=3D"gmail_msg">
Modify the configure time check to avoid enabling this feature<br class=3D"=
gmail_msg">
on Mingw, rather than trying to rewrite the test to avoid this<br class=3D"=
gmail_msg">
feature.<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
Signed-off-by: Daniel P. Berrange &lt;<a href=3D"mailto:berrange@redhat.com=
" class=3D"gmail_msg" target=3D"_blank">berrange@redhat.com</a>&gt;<br clas=
s=3D"gmail_msg">
---<br class=3D"gmail_msg">
=C2=A0configure | 2 +-<br class=3D"gmail_msg">
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
diff --git a/configure b/configure<br class=3D"gmail_msg">
index 8c2f90b..aa291e8 100755<br class=3D"gmail_msg">
--- a/configure<br class=3D"gmail_msg">
+++ b/configure<br class=3D"gmail_msg">
@@ -5167,7 +5167,7 @@ if test &quot;$bluez&quot; =3D &quot;yes&quot; ; then=
<br class=3D"gmail_msg">
=C2=A0 =C2=A0echo &quot;CONFIG_BLUEZ=3Dy&quot; &gt;&gt; $config_host_mak<br=
 class=3D"gmail_msg">
=C2=A0 =C2=A0echo &quot;BLUEZ_CFLAGS=3D$bluez_cflags&quot; &gt;&gt; $config=
_host_mak<br class=3D"gmail_msg">
=C2=A0fi<br class=3D"gmail_msg">
-if test &quot;$glib_subprocess&quot; =3D &quot;yes&quot; ; then<br class=
=3D"gmail_msg">
+if test &quot;$glib_subprocess&quot; =3D &quot;yes&quot; &amp;&amp; test &=
quot;$mingw32&quot; !=3D &quot;yes&quot; ; then<br class=3D"gmail_msg">
=C2=A0 =C2=A0echo &quot;CONFIG_HAS_GLIB_SUBPROCESS_TESTS=3Dy&quot; &gt;&gt;=
 $config_host_mak<br class=3D"gmail_msg">
=C2=A0fi<br class=3D"gmail_msg"></blockquote><div><br></div><div>Isn&#39;t =
it only because you are missing gspawn-win*-helper.exe? <br><br>This seems =
to be a glib installation issue to me. I can run the subprocesses tests fin=
e on win32 and wine. I suggest to revert commit 7ad9339e372fcd12d584684d7f5=
2ac259604a4f4, I can send a patch if you agree.<br><br><br><br> </div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">
=C2=A0echo &quot;GLIB_CFLAGS=3D$glib_cflags&quot; &gt;&gt; $config_host_mak=
<br class=3D"gmail_msg">
--<br class=3D"gmail_msg">
2.5.5<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
</blockquote></div></div></div><div dir=3D"ltr">-- <br></div><div data-smar=
tmail=3D"gmail_signature"><div dir=3D"ltr">Marc-Andr=C3=A9 Lureau<br></div>=
</div>

--001a114d6500e9fca90545352cef--

