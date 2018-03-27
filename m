Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f0x4O-00049k-7a
	for mharc-qemu-trivial@gnu.org; Tue, 27 Mar 2018 18:27:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58360)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mlureau@redhat.com>) id 1f0x4M-00049W-Bo
	for qemu-trivial@nongnu.org; Tue, 27 Mar 2018 18:27:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mlureau@redhat.com>) id 1f0x4J-0004NS-8H
	for qemu-trivial@nongnu.org; Tue, 27 Mar 2018 18:27:54 -0400
Received: from mail-it0-f68.google.com ([209.85.214.68]:50853)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mlureau@redhat.com>) id 1f0x4J-0004N7-3o
	for qemu-trivial@nongnu.org; Tue, 27 Mar 2018 18:27:51 -0400
Received: by mail-it0-f68.google.com with SMTP id r19-v6so1245399itc.0
	for <qemu-trivial@nongnu.org>; Tue, 27 Mar 2018 15:27:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=3MQa23SSntmtYAlCTmje35Klf9aT64mrSFD5Lva/pnc=;
	b=gaTF2BcmMWuovDkU1escSh3PJboFFJtaaqhVeJ5i9oTQmSGR55iQEVZhhOV7/d7JZC
	5EZPrJt5s8GrK1srqVI1OF5BRmymfYBNBcVnK+aBCLcgU46eEBAVdXxp0loW3SxNf47a
	JpfHGXUJSZ+XMyg3uYvBMJifyNr1qDQJ2XNmtUyT/Z5ogZF1IcnmcwsjkXd60scx3eqQ
	BPSBA7iAJ0K/BUlWeBXN1/cHZwtSn6dMbyAwuP7FrNciH0rqXxE+edh6ut27xdSznHEl
	VdMx8t5xBJWHr+IWFjOPyJAxVSpvNfodThY8HAhTNf4/vckFQoR/aVzvc4Xk0FG4NjNw
	2ucA==
X-Gm-Message-State: AElRT7HUrbuyMIlrz4U4dIZGaEBm7Z2kYqazHFuAPqtuPp0BDnO+/mx9
	Rym1ZUwkzC7ZwksenNYaEAg9ri0hoanKwsam4o7NDg==
X-Google-Smtp-Source: AIpwx4/1w99ChRnYjBHlgCx+uVrQ4U+VXLkGSVhsnG63XB03YLMI9CL9XT23BOQ/98IdAUzrwx6QxZV0BMf8JaLGPJ8=
X-Received: by 2002:a24:5bd5:: with SMTP id
	g204-v6mr1111792itb.55.1522189670278; 
	Tue, 27 Mar 2018 15:27:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.151.212 with HTTP; Tue, 27 Mar 2018 15:27:49 -0700 (PDT)
In-Reply-To: <20180327202152.1799131-1-eblake@redhat.com>
References: <20180327202152.1799131-1-eblake@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 28 Mar 2018 00:27:49 +0200
Message-ID: <CAMxuvayh20TQem5X=NNqWauLaRJdFhcOELhs+Aaq4Ji66b71rA@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.214.68
Subject: Re: [Qemu-trivial] [PATCH for-2.12] dump: Fix build with newer gcc
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
X-List-Received-Date: Tue, 27 Mar 2018 22:27:55 -0000

On Tue, Mar 27, 2018 at 10:21 PM, Eric Blake <eblake@redhat.com> wrote:
> gcc 8 on rawhide is picky enough to complain:
>
> /home/dummy/qemu/dump.c: In function 'create_header32':
> /home/dummy/qemu/dump.c:817:5: error: 'strncpy' output truncated before t=
erminating nul copying 8 bytes from a string of the same length [-Werror=3D=
stringop-truncation]
>      strncpy(dh->signature, KDUMP_SIGNATURE, strlen(KDUMP_SIGNATURE));
>      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> But we already have SIG_LEN defined as the right length without needing
> to do a strlen(), and memcpy() is better than strncpy() when we know
> we do not want a trailing NUL byte.
>
> Signed-off-by: Eric Blake <eblake@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  dump.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/dump.c b/dump.c
> index 669f715274d..b54cd42b217 100644
> --- a/dump.c
> +++ b/dump.c
> @@ -814,7 +814,7 @@ static void create_header32(DumpState *s, Error **err=
p)
>      size =3D sizeof(DiskDumpHeader32);
>      dh =3D g_malloc0(size);
>
> -    strncpy(dh->signature, KDUMP_SIGNATURE, strlen(KDUMP_SIGNATURE));
> +    memcpy(dh->signature, KDUMP_SIGNATURE, SIG_LEN);
>      dh->header_version =3D cpu_to_dump32(s, 6);
>      block_size =3D s->dump_info.page_size;
>      dh->block_size =3D cpu_to_dump32(s, block_size);
> @@ -926,7 +926,7 @@ static void create_header64(DumpState *s, Error **err=
p)
>      size =3D sizeof(DiskDumpHeader64);
>      dh =3D g_malloc0(size);
>
> -    strncpy(dh->signature, KDUMP_SIGNATURE, strlen(KDUMP_SIGNATURE));
> +    memcpy(dh->signature, KDUMP_SIGNATURE, SIG_LEN);
>      dh->header_version =3D cpu_to_dump32(s, 6);
>      block_size =3D s->dump_info.page_size;
>      dh->block_size =3D cpu_to_dump32(s, block_size);
> --
> 2.14.3
>

