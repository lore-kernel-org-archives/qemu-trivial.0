Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwsYT-0006cZ-9Q
	for mharc-qemu-trivial@gnu.org; Tue, 26 Sep 2017 12:17:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48130)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <carenas@gmail.com>) id 1dwsYJ-0006Tj-5J
	for qemu-trivial@nongnu.org; Tue, 26 Sep 2017 12:17:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <carenas@gmail.com>) id 1dwsXk-0004SZ-0K
	for qemu-trivial@nongnu.org; Tue, 26 Sep 2017 12:17:43 -0400
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:38573)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <carenas@gmail.com>)
	id 1dwsW7-0001wt-SX; Tue, 26 Sep 2017 12:15:28 -0400
Received: by mail-wm0-x244.google.com with SMTP id x17so9553211wmd.5;
	Tue, 26 Sep 2017 09:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OGtdW95oB0n5jTLER7I/5cZVP44rFlCSnt/6b7SZe2I=;
	b=h0aVbu8gTbIVUQg7PBF9j+XqF3Ns/SeiKmUuHUgWGd6yh1N8uVeBd9+MoLwvNALF6O
	4oMEBqzhxvIVocC01gvT29be9hOdC9sZ7+JV7xlXpj03IKBF4kh59Uw7Rbuvacv9Am0D
	i84d1rH0Otgg8qjaVU+NNgb/HkaVIh5QUDcMqObWuaqSccQirOuENZtoEXvNmyzHNQhg
	0XumRN41HKAimCp6drXsd7OnYFMb0Fob114WUQ9bPrMnGstzuaHFVKPMYP29EAkPjTBK
	oJMTOVUw4eco21d/CKKh9Gl1A8GyiGpkdnjEspn6bg/K1XKAG/RgeCVaO7t+YevCDe9N
	P7SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OGtdW95oB0n5jTLER7I/5cZVP44rFlCSnt/6b7SZe2I=;
	b=ATywIjJ/9oV3ElUo62OiQS0m0ZUDqPLOA67SnBZiGw3TYQB3ozgAw7SVZlwAgfujva
	MxOE5iJFlHZ2sFVvukwU2jn3RreAH57NvD8qFrxjcMIXkrZYed7i+TVfNaEmWeWvDR4l
	9yGTzx1qACrwdgvTbV5UJWvwZCMxZSthG+DwM07+qpd7WkgSbJHsNk4bKbekZhUKPBCN
	dy4tJYVqecXvKXUfT9pUOuLbro/YK+/W2AX1Zm0TGBmP4agmXXeZV2dNTdYB/WirciiP
	Gfe+2s79EH+nE8gl/KDily0pyDoae2n4FbGskZCiBZhGwSrQPJS/8kn+o7SC9mZevkRm
	Lbsg==
X-Gm-Message-State: AHPjjUhx83GBDropKi1e7kv+aKT1fmoAPFt+wtPKbKP4rkk6rp61tTQr
	DLQiEW+c3UfIYqajRdp5rtwGL/BZ8rfUhJOU+p0=
X-Google-Smtp-Source: AOwi7QDUNyaLdb6klbSTwnP0ZWF+UMXBWowE/W37a2Ws6/XFQcmL27aKLHNryx37ux2WPdjgEm1nalncEMNXrRzmS+A=
X-Received: by 10.80.221.71 with SMTP id u7mr18158783edk.86.1506442524184;
	Tue, 26 Sep 2017 09:15:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.166.150 with HTTP; Tue, 26 Sep 2017 09:15:23 -0700 (PDT)
In-Reply-To: <20170926151421.14557-1-eblake@redhat.com>
References: <20170926151421.14557-1-eblake@redhat.com>
From: Carlo Arenas <carenas@gmail.com>
Date: Tue, 26 Sep 2017 09:15:23 -0700
Message-ID: <CAPUEspivA58rgYWwNB8mi1esu-kfn7-j7m-6EAfg91e2PzxTnQ@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, pbonzini@redhat.com
Content-Type: multipart/alternative; boundary="f403043e536887532a055a19fbae"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] scsi: Ignore executable for
 in-tree builds
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
X-List-Received-Date: Tue, 26 Sep 2017 16:17:52 -0000

--f403043e536887532a055a19fbae
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Carlo Marcelo Arenas Bel=C3=B3n <carenas@gmail.com>

On Tue, Sep 26, 2017 at 8:14 AM, Eric Blake <eblake@redhat.com> wrote:

> The new qemu-pr-helper (commit b855f8d17) should not be checked in,
> even when doing in-tree builds.
>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  .gitignore | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/.gitignore b/.gitignore
> index 40acfcb9e2..3a7e01dc6a 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -49,6 +49,7 @@
>  /qemu-version.h
>  /qemu-version.h.tmp
>  /module_block.h
> +/scsi/qemu-pr-helper
>  /vscclient
>  /vhost-user-scsi
>  /fsdev/virtfs-proxy-helper
> --
> 2.13.5
>
>
>

--f403043e536887532a055a19fbae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Carlo Marcelo Arenas Bel=C3=B3n &lt;<a href=
=3D"mailto:carenas@gmail.com">carenas@gmail.com</a>&gt;</div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Tue, Sep 26, 2017 at 8:14 AM=
, Eric Blake <span dir=3D"ltr">&lt;<a href=3D"mailto:eblake@redhat.com" tar=
get=3D"_blank">eblake@redhat.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">The new qemu-pr-helper (commit b855f8d17) should not be check=
ed in,<br>
even when doing in-tree builds.<br>
<br>
Signed-off-by: Eric Blake &lt;<a href=3D"mailto:eblake@redhat.com">eblake@r=
edhat.com</a>&gt;<br>
---<br>
=C2=A0.gitignore | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/.gitignore b/.gitignore<br>
index 40acfcb9e2..3a7e01dc6a 100644<br>
--- a/.gitignore<br>
+++ b/.gitignore<br>
@@ -49,6 +49,7 @@<br>
=C2=A0/qemu-version.h<br>
=C2=A0/qemu-version.h.tmp<br>
=C2=A0/module_block.h<br>
+/scsi/qemu-pr-helper<br>
=C2=A0/vscclient<br>
=C2=A0/vhost-user-scsi<br>
=C2=A0/fsdev/virtfs-proxy-helper<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.13.5<br>
<br>
<br>
</font></span></blockquote></div><br></div>

--f403043e536887532a055a19fbae--

