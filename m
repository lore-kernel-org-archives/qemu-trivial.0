Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXQ96-0006oh-C2
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 06:54:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49141)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1dXQ94-0006n2-Hs
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 06:54:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1dXQ93-0007VF-Pi
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 06:54:26 -0400
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:33357)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1dXQ93-0007Uf-IV; Tue, 18 Jul 2017 06:54:25 -0400
Received: by mail-lf0-x242.google.com with SMTP id t72so1396580lff.0;
	Tue, 18 Jul 2017 03:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=jcwQFy7bT+YnCKCAvx8XmXTg4x1KCs+Fz+hUOTPVRww=;
	b=n1vAIFdkgIXf65LqkDab+7LTmP5QRiFcM3pFOtq27bDOGYOhfR2tSuu9XoyTGLWneQ
	evD8gue9+nD79ONQ//kC6eWI8xMrxM+1/aaTj3isnKX8oSXzDHuEfL7b1J2Y/Veo9F5D
	rkL+SToGf8B9Oi6woEPm+Db7MJlXEtl3d5mJH/am/EXG8vL1zpc9phc49L1Ijfp7EwTx
	x+EaNQBAvg55CJ0HkVbQ3ZrnUTuYxSgEcB6eVKU4VAhFLpWK7ibU0951sTYZqnlg3Ti1
	ixcSlvR3ZFhMUQHYs/kO36/etlwtEL08lk7+lxN/VSxKh2EMbGWClatwj1pf1ovDCHKW
	gajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=jcwQFy7bT+YnCKCAvx8XmXTg4x1KCs+Fz+hUOTPVRww=;
	b=gaTQOjGHjNCfGEThEF62IesMgUflR3nM6CcTOsuiVgblr0mQgcwrbF0FyIWEYu+MwT
	oyXGUvdJ8K/Os1Qfh5gprMyjNOLVnKxp0a4863AAkTN4qXYG/f0CefVK6Nm4O7qU8k5s
	ycu+NEWB46iM6YuvOZuWbxNq1aLX1qE2hYCm0Qnjkcz8ueAt5e5YM3VIvjnY75YwtaIU
	9uDegM2G36FzNkxCjBFlyZADSUFsvdPu8d5mUo2ZyeacmyHqF04RhlNAUWEEVy5SmFsN
	WrdQ8gO4yCKnyc/tFIGYfWr3PxRyJ1A5RoULuKxXgHZG+fVbelXE3vHIHO7vkwOicI2C
	tx7g==
X-Gm-Message-State: AIVw111Rmzsdi362Emp1EIGvNscUu+VoqK3QFB468Ek1mHTkr4gfTtio
	pfWfRnqQb3Hw+4R8bWPkCO6kqaQ4nQ==
X-Received: by 10.80.152.106 with SMTP id h39mr71552edb.73.1500375264247; Tue,
	18 Jul 2017 03:54:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.175.70 with HTTP; Tue, 18 Jul 2017 03:54:23 -0700 (PDT)
In-Reply-To: <20170718061005.29518-24-f4bug@amsat.org>
References: <20170718061005.29518-1-f4bug@amsat.org>
	<20170718061005.29518-24-f4bug@amsat.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 18 Jul 2017 03:54:23 -0700
Message-ID: <CAJ+F1CKM++cYHT2KL6LJeUFeYbDQsNS9b1D3hT=+NMSw7yhv-g@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: qemu trival <qemu-trivial@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <famz@redhat.com>,
	"open list:Block layer core" <qemu-block@nongnu.org>,
	QEMU <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 23/29] async: use ARRAY_SIZE
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
X-List-Received-Date: Tue, 18 Jul 2017 10:54:27 -0000

On Mon, Jul 17, 2017 at 11:09 PM, Philippe Mathieu-Daud=C3=A9
<f4bug@amsat.org> wrote:
> Applied using the Coccinelle semantic patch scripts/coccinelle/use_osdep.=
cocci
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  util/aio-posix.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/util/aio-posix.c b/util/aio-posix.c
> index 2d51239ec6..e89fd7024a 100644
> --- a/util/aio-posix.c
> +++ b/util/aio-posix.c
> @@ -119,7 +119,7 @@ static int aio_epoll(AioContext *ctx, GPollFD *pfds,
>      }
>      if (timeout <=3D 0 || ret > 0) {
>          ret =3D epoll_wait(ctx->epollfd, events,
> -                         sizeof(events) / sizeof(events[0]),
> +                         ARRAY_SIZE(events),
>                           timeout);
>          if (ret <=3D 0) {
>              goto out;
> --
> 2.13.2
>
>



--=20
Marc-Andr=C3=A9 Lureau

