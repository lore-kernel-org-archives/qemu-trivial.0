Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bpWXk-00020k-HR
	for mharc-qemu-trivial@gnu.org; Thu, 29 Sep 2016 04:18:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52132)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1bpWXh-0001yf-Qe
	for qemu-trivial@nongnu.org; Thu, 29 Sep 2016 04:18:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1bpWXg-0002nT-Oj
	for qemu-trivial@nongnu.org; Thu, 29 Sep 2016 04:18:09 -0400
Received: from mail-lf0-x231.google.com ([2a00:1450:4010:c07::231]:34707)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>)
	id 1bpWXg-0002mp-Gx; Thu, 29 Sep 2016 04:18:08 -0400
Received: by mail-lf0-x231.google.com with SMTP id y6so72786047lff.1;
	Thu, 29 Sep 2016 01:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nrMcGItPrqt25urknx/O2DeYkrvo3I9Kl5acOzQwt8k=;
	b=dwr8DqVG9NE+XjY6hZcwqCWy10vKEACJZos+aF2NtlDkNuwJUlD5e22bp11MaD6FPl
	l+LUVZIRWwOuvKxoLyWEH44wbnvimQA40q8mCWg7969FcbT0fXSu/VorccndsxbfldGl
	trQDpcELvSLQL9kuGRtAXQZfUt0j10ncnjq4ZOr4dzMyiG/De7jlr5GdPk54yhFWu30+
	fFb9D3UnEJ7cXtapZLrr4rQwP61IEEA4eBcVaDqv/zbDcdFaiw5jo1J4CHbf5fJTMnwX
	6N0t7uPaS9Yw7+HQW4aGODBCylJCOYceAlMsCX0ReCJgwZ9KiQ7he6KPTuX4D7b/N895
	pYbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nrMcGItPrqt25urknx/O2DeYkrvo3I9Kl5acOzQwt8k=;
	b=AxOeZvDlFPR4ZjN16HL1kCrA+EayR1ryokGZRq/W3cmLWRLvujzVRLdydvlmkorkl8
	qYV5O14DbL3S4cX8w9JmqxF696b3hWZqa087p4fgwtQEU1KQSlQTs/9YcWePp+v8nlno
	31htyTuU6WnDPBHgwKBCJS4IZO/lZFIHeyV/6fW9y3+Mkc9qWo2wmA053uA+hS5D7jPM
	XSpxz+Z0XedZnmxDEduT6Kj4bFrTAJWqW9ufosCd8iDuY0pLmrjQGXdc/g/Q4yoDSWJY
	oqSquaLH08bYW4haZiYBRbck17dj9kElhtLPMFfSjxVoWwrLhP2Zz8xEdQilxtmVhnrZ
	DAJA==
X-Gm-Message-State: AA6/9Rm/Jy4D9zDys+WtxeukrWBZocXxSJKgGdueGBAxMzGYGU9m2tzuMeQrUam9dcyb/H7wkuGqjSCVAAVEKg==
X-Received: by 10.46.5.2 with SMTP id 2mr79961ljf.73.1475137087178; Thu, 29
	Sep 2016 01:18:07 -0700 (PDT)
MIME-Version: 1.0
References: <1475107128-5101-1-git-send-email-david@gibson.dropbear.id.au>
In-Reply-To: <1475107128-5101-1-git-send-email-david@gibson.dropbear.id.au>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 29 Sep 2016 08:17:56 +0000
Message-ID: <CAJ+F1CK7X2KH+JMK6EnegzJQJc+wxFs2BFi6JbT4-J7Wk9DeNw@mail.gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>, qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary=001a114a72c0138ca0053da11eda
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::231
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Update .gitignore
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
X-List-Received-Date: Thu, 29 Sep 2016 08:18:11 -0000

--001a114a72c0138ca0053da11eda
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 29, 2016 at 3:59 AM David Gibson <david@gibson.dropbear.id.au>
wrote:

> This adds one generated header, and a couple of testcase binaries to the
> .gitignore files, which haven't yet been included.
>
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> ---
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

 .gitignore       | 1 +
>  tests/.gitignore | 2 ++
>  2 files changed, 3 insertions(+)
>
> diff --git a/.gitignore b/.gitignore
> index c91d018..1babcc2 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -20,6 +20,7 @@
>  /trace/generated-ust.c
>  /ui/shader/texture-blit-frag.h
>  /ui/shader/texture-blit-vert.h
> +module_block.h
>  *-timestamp
>  /*-softmmu
>  /*-darwin-user
> diff --git a/tests/.gitignore b/tests/.gitignore
> index 0f0c79b..9f3d2ee 100644
> --- a/tests/.gitignore
> +++ b/tests/.gitignore
> @@ -12,7 +12,9 @@ rcutorture
>  test-aio
>  test-base64
>  test-bitops
> +test-blockjob
>  test-blockjob-txn
> +test-bufferiszero
>  test-clone-visitor
>  test-coroutine
>  test-crypto-afsplit
> --
> 2.7.4
>
>
> --
Marc-Andr=C3=A9 Lureau

--001a114a72c0138ca0053da11eda
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu=
, Sep 29, 2016 at 3:59 AM David Gibson &lt;<a href=3D"mailto:david@gibson.d=
ropbear.id.au">david@gibson.dropbear.id.au</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">This adds one generated header, and a couple of test=
case binaries to the<br>
.gitignore files, which haven&#39;t yet been included.<br>
<br>
Signed-off-by: David Gibson &lt;<a href=3D"mailto:david@gibson.dropbear.id.=
au" target=3D"_blank">david@gibson.dropbear.id.au</a>&gt;<br>
---<br></blockquote><div><br>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a hre=
f=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt=
;<br><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">
=C2=A0.gitignore=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
=C2=A0tests/.gitignore | 2 ++<br>
=C2=A02 files changed, 3 insertions(+)<br>
<br>
diff --git a/.gitignore b/.gitignore<br>
index c91d018..1babcc2 100644<br>
--- a/.gitignore<br>
+++ b/.gitignore<br>
@@ -20,6 +20,7 @@<br>
=C2=A0/trace/generated-ust.c<br>
=C2=A0/ui/shader/texture-blit-frag.h<br>
=C2=A0/ui/shader/texture-blit-vert.h<br>
+module_block.h<br>
=C2=A0*-timestamp<br>
=C2=A0/*-softmmu<br>
=C2=A0/*-darwin-user<br>
diff --git a/tests/.gitignore b/tests/.gitignore<br>
index 0f0c79b..9f3d2ee 100644<br>
--- a/tests/.gitignore<br>
+++ b/tests/.gitignore<br>
@@ -12,7 +12,9 @@ rcutorture<br>
=C2=A0test-aio<br>
=C2=A0test-base64<br>
=C2=A0test-bitops<br>
+test-blockjob<br>
=C2=A0test-blockjob-txn<br>
+test-bufferiszero<br>
=C2=A0test-clone-visitor<br>
=C2=A0test-coroutine<br>
=C2=A0test-crypto-afsplit<br>
--<br>
2.7.4<br>
<br>
<br>
</blockquote></div></div><div dir=3D"ltr">-- <br></div><div data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr">Marc-Andr=C3=A9 Lureau<br></div></div=
>

--001a114a72c0138ca0053da11eda--

