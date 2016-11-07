Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c3hgQ-0008QL-8m
	for mharc-qemu-trivial@gnu.org; Mon, 07 Nov 2016 06:01:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38302)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1c3hgO-0008PQ-5E
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2016 06:01:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1c3hgN-0000Zm-Ct
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2016 06:01:44 -0500
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:33765)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1c3hgE-0000W4-5d; Mon, 07 Nov 2016 06:01:34 -0500
Received: by mail-lf0-x241.google.com with SMTP id 98so5588460lfs.0;
	Mon, 07 Nov 2016 03:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=m8DWIloEPiNiaiObPvYZyicvtMG+YotX8ZrPVs3zZ78=;
	b=Ms5mu2+uXqosDzslVxpJG/7JpcZ4CoTqK2msfCi+e2qnZZU0kEY1aLj3T65bXHpyBl
	eQnvoi50hYlgwn2/Xshzrw5XDoOaynZ4uIqtkG8kiMFMds65yD0bzwbA1b2HWRHQVjxX
	lBiwj9CCP6q3YCu6Q9r3Emsa7uwUwnTKcjWias5FZcxzyn/HbbnA6LxLtbSWeGv9lzIA
	30cAMMXo7EaJsSaksWtXhOaOalEjEBD1TYigF9B0qAE4QQdf4Qmzj4aGtiqkbDleAOWN
	4srs7JVHM7fMJQZg/p77516254UMNqmtkwntPbg6Usy6772YPgtfkqRMRFlDsADcnZr7
	u/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=m8DWIloEPiNiaiObPvYZyicvtMG+YotX8ZrPVs3zZ78=;
	b=T3BFqx+kHI0qQJAp65ipnRqGNjlRyDfe4mQTFZs5zWhqj1mWHKzr2PgCy8EOmeIhGI
	RK+31p3PcGAjnDpAtQkTTT9ngveh1ENyUCo05OxWGYUkODxIwNuT+BBon7utIlFYy+ws
	nbMKr3c12x5cEFIP7GH8mJ0Jnv7vA1//pcM2QlKXr7KwEWW/EcquZPYDtULGRbOcKxUy
	m4oxo/OzRj4R6B5nhBfqILvXxWPoAANsSOhz+soa2iV1jEomMv6C9Lwe5tuWPI/PiDNo
	ytbzybjhjIYoxs26j7FKk4AJ+DNPjO6m4+6P4q2DoQBgcbguJ8ZIqunLmaSIvjcSa91F
	qw1w==
X-Gm-Message-State: ABUngvcc7xIVRIbhy68pI18sInsGJ6QBN5GyyB5T1LSO1lMr3pYGRXBi9dbG95vZYtxyQoowKIaYhecqH9LVxw==
X-Received: by 10.25.169.200 with SMTP id s191mr165125lfe.24.1478516491928;
	Mon, 07 Nov 2016 03:01:31 -0800 (PST)
MIME-Version: 1.0
References: <1478494765-13233-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
In-Reply-To: <1478494765-13233-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 07 Nov 2016 11:01:21 +0000
Message-ID: <CAJ+F1CJxcgTOroM3Oy=bSLP0PrxS=uBBD3k8iZnvZ2riJsqRJg@mail.gmail.com>
To: Changlong Xie <xiecl.fnst@cn.fujitsu.com>,
	qemu devel <qemu-devel@nongnu.org>, qemu trival <qemu-trivial@nongnu.org>
Content-Type: multipart/alternative; boundary=001a114065864bcb5b0540b3f2cc
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tests/.gitignore: Ignore
 test-char
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
X-List-Received-Date: Mon, 07 Nov 2016 11:01:45 -0000

--001a114065864bcb5b0540b3f2cc
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 7, 2016 at 8:52 AM Changlong Xie <xiecl.fnst@cn.fujitsu.com>
wrote:

> Signed-off-by: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
>

Introduced in commit  ea3af47d7

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  tests/.gitignore | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tests/.gitignore b/tests/.gitignore
> index c0d7857..e9b182e 100644
> --- a/tests/.gitignore
> +++ b/tests/.gitignore
> @@ -16,6 +16,7 @@ test-bitops
>  test-blockjob
>  test-blockjob-txn
>  test-bufferiszero
> +test-char
>  test-clone-visitor
>  test-coroutine
>  test-crypto-afsplit
> --
> 1.9.3
>
>
>
>
> --
Marc-Andr=C3=A9 Lureau

--001a114065864bcb5b0540b3f2cc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon=
, Nov 7, 2016 at 8:52 AM Changlong Xie &lt;<a href=3D"mailto:xiecl.fnst@cn.=
fujitsu.com">xiecl.fnst@cn.fujitsu.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">Signed-off-by: Changlong Xie &lt;<a href=3D"mailto:xiecl=
.fnst@cn.fujitsu.com" class=3D"gmail_msg" target=3D"_blank">xiecl.fnst@cn.f=
ujitsu.com</a>&gt;<br class=3D"gmail_msg"></blockquote><div><br></div><div>=
Introduced in commit=C2=A0 ea3af47d7</div><div><br>Reviewed-by: Marc-Andr=
=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.=
lureau@redhat.com</a>&gt;<br><br>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>
---<br class=3D"gmail_msg">
=C2=A0tests/.gitignore | 1 +<br class=3D"gmail_msg">
=C2=A01 file changed, 1 insertion(+)<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
diff --git a/tests/.gitignore b/tests/.gitignore<br class=3D"gmail_msg">
index c0d7857..e9b182e 100644<br class=3D"gmail_msg">
--- a/tests/.gitignore<br class=3D"gmail_msg">
+++ b/tests/.gitignore<br class=3D"gmail_msg">
@@ -16,6 +16,7 @@ test-bitops<br class=3D"gmail_msg">
=C2=A0test-blockjob<br class=3D"gmail_msg">
=C2=A0test-blockjob-txn<br class=3D"gmail_msg">
=C2=A0test-bufferiszero<br class=3D"gmail_msg">
+test-char<br class=3D"gmail_msg">
=C2=A0test-clone-visitor<br class=3D"gmail_msg">
=C2=A0test-coroutine<br class=3D"gmail_msg">
=C2=A0test-crypto-afsplit<br class=3D"gmail_msg">
--<br class=3D"gmail_msg">
1.9.3<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
</blockquote></div></div><div dir=3D"ltr">-- <br></div><div data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr">Marc-Andr=C3=A9 Lureau<br></div></div=
>

--001a114065864bcb5b0540b3f2cc--

