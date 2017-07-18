Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXQgp-0006IX-4j
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 07:29:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37596)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1dXQgm-0006GZ-EY
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 07:29:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1dXQgl-0000B0-OS
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 07:29:16 -0400
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:34249)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1dXQgl-0000Ah-HI; Tue, 18 Jul 2017 07:29:15 -0400
Received: by mail-lf0-x244.google.com with SMTP id p11so1464041lfd.1;
	Tue, 18 Jul 2017 04:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=6rJylQRD0RaJkRJdc7qk4uBIybBqFl6HAJQL8eSQxa8=;
	b=WYSNAGBkAhDZypxPPaLcO+Jy0FSw2WpF7CALoMwrIy8blyqWyziGsTdr4FuFJ06gmy
	MHBGp+qlNPn28FvCvDLY3iGwRqrlNPyV67DD4EWgdwjgTwDfByEqZ1IE+e6+b0lKjuch
	vicg5mvFY+TXAZ2Zd/OeX/V4BvdzIRyRF6zdihWNd+zSohTl9ZzC0BKR6BWTXChgAE4R
	v7HGoK3sv52u0j3EgACWXQItwRMNERT0S0Wm15PUpB2ES7O0DdUDSJFtAYPPvJvIQw+J
	SEIa9KRsrVQbZL/KchLh9uUGXR+NSgkuIoA2g2xhfrgGKhUbzPp/4sDWuxCYVYGDJ9y0
	otyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=6rJylQRD0RaJkRJdc7qk4uBIybBqFl6HAJQL8eSQxa8=;
	b=RcdqoFvQdHSjUnkbW5teNKfzWUyN0U9QS7y6zfXy45frMb/rCL3JhMOuEkAXnYmYPv
	v3rCudAPHFHpbTcpZaiP/uGWjzP8Ywfd+p0VklaCwVRZ0VyxYOaL9AEOjE6dJtt5HEep
	VqCK8y4lzZ7jklXMiMc536h/XJ1phm41/ddiM5AtpZdqaGPe0CrYRwFmP83apAJxsxBZ
	pd08hsvgtbcKu7M1kjwocFfsqWv4LR2uT2x0ZaGv88Vgn7IysEEIYG5md17cfDN+w9EK
	WJDKEI45wre2aBgzoYGW6rxKxRw7+5BYZMjM4TJjKXvY5srGWIXndoJAIAh5usxWRJmm
	ncBg==
X-Gm-Message-State: AIVw111ObgInXrupltm7FJDyaJT+rhy4BuFeWUcfsX/+DW02i+ZJ/e6S
	IaFPvVks7cpN5gjiea78IqnSDlVJSg==
X-Received: by 10.46.22.72 with SMTP id 8mr563881ljw.126.1500377354227; Tue,
	18 Jul 2017 04:29:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.59.145 with HTTP; Tue, 18 Jul 2017 04:29:13 -0700 (PDT)
In-Reply-To: <20170718061005.29518-22-f4bug@amsat.org>
References: <20170718061005.29518-1-f4bug@amsat.org>
	<20170718061005.29518-22-f4bug@amsat.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 18 Jul 2017 04:29:13 -0700
Message-ID: <CAJ+F1CLPBCL5XQ+gmZLF_fjguYekQSpss7XNsd2AtPPJqRc7+A@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: qemu trival <qemu-trivial@nongnu.org>,
	Michael Roth <mdroth@linux.vnet.ibm.com>, QEMU <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 21/29] qga: use ARRAY_SIZE
 macro
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
X-List-Received-Date: Tue, 18 Jul 2017 11:29:17 -0000

On Mon, Jul 17, 2017 at 11:09 PM, Philippe Mathieu-Daud=C3=A9
<f4bug@amsat.org> wrote:
> Applied using the Coccinelle semantic patch scripts/coccinelle/use_osdep.=
cocci
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  qga/commands-posix.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index d8e412275e..2a5d5cb4ba 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -896,7 +896,7 @@ static void build_guest_fsinfo_for_real_device(char c=
onst *syspath,
>      if (p && sscanf(q, "%u", &host) =3D=3D 1) {
>          has_host =3D true;
>          nhosts =3D build_hosts(syspath, p, has_ata, hosts,
> -                             sizeof(hosts) / sizeof(hosts[0]), errp);
> +                             ARRAY_SIZE(hosts), errp);
>          if (nhosts < 0) {
>              goto cleanup;
>          }
> --
> 2.13.2
>
>



--=20
Marc-Andr=C3=A9 Lureau

