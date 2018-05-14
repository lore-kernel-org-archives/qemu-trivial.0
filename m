Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fIHEs-0005Pi-8b
	for mharc-qemu-trivial@gnu.org; Mon, 14 May 2018 13:26:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42170)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1fIHEq-0005Nx-3e
	for qemu-trivial@nongnu.org; Mon, 14 May 2018 13:26:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1fIHEp-0002dL-88
	for qemu-trivial@nongnu.org; Mon, 14 May 2018 13:26:20 -0400
Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243]:46615)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1fIHEn-0002bF-5D; Mon, 14 May 2018 13:26:17 -0400
Received: by mail-wr0-x243.google.com with SMTP id a12-v6so13165713wrn.13;
	Mon, 14 May 2018 10:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=mbt8Hu2kjLpSD4WTX/4FFxmDuE7v8DfjTrnKfXwBzM0=;
	b=es36tE1+Ab/LeF7feEdk+5erIaPgEM7CqmBeYBdXIfowWaN+fSq7CuAuKLk+GL1u4/
	VWmYRz8sTj3EjzNu6NI9sbd8BLyd5cDsmZy9vU7iAxpmN8ekvBnUUloeVoYsKsouoycy
	a2nUTwzq8p1237E0OV3CvY7myvpTWyZmBbWa/XdYig0Lz8pN/mPW5IJ4RTsPIg6CY7ub
	ygZ1phnuyZQdfpfjhim454hbsRogMiB1FpFicxs+15Nr2EybZRwQXYm1K6eqTqbBuSXq
	LbRzcN8VyrWbU0HWl4EfYGd3nuU/2B8qWp90q6MBxh1urkn5+hnAM091xV1fhw4E4iVk
	5C9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=mbt8Hu2kjLpSD4WTX/4FFxmDuE7v8DfjTrnKfXwBzM0=;
	b=feZ1o5WceTsUeY9kIIouhHD0xmqDualL3D9MZA+Mde94Lgj0YNSgusw0ejjp8jPoP5
	PmIwBKfWWBWu9FHxSOQEGAufB9wOD4igiyHKaioTP3cfit++dT3MjxqmJYJmw3CexfbU
	K99yzpkxsZhoK6O8jIb6oqIsEb0Gog1feV1cT9RcM/ESx2He1ELkqdtw9u8+/CG2gP9l
	c9shelSTzDquapbGyBd7i2b5yZZp1ZR5VButy6iJLVR6teg0tUKsukPZbDxGjTONcQyl
	c3ryOSWuVVatLVwmW86Mu7xHxFWDpAtmQfMbc+KzntflMkBfY1BhxumopwIuul1+lvbQ
	Br6g==
X-Gm-Message-State: ALKqPwchT9Q+3Oao9bd/XGfa1se6xbSdVK1pEEgwEifMLkOlnK2vBiR4
	p4Zf0FxTxrjo1sdF5E9zU/NssqO8SjU+JQYCIZ4=
X-Google-Smtp-Source: AB8JxZo+ZBb6GqSkLH0S7LTC6k7d6acsAmg8euLpiDMqGiTzRZ4dcCfYzaGYQxTcHQqwtdudqEYFU+hKOwkpYVEqy8o=
X-Received: by 2002:adf:b00f:: with SMTP id
	f15-v6mr8677700wra.254.1526318775643; 
	Mon, 14 May 2018 10:26:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.156.209 with HTTP; Mon, 14 May 2018 10:26:14 -0700 (PDT)
In-Reply-To: <9dbde2b5d864d126b75d8c0d7bae2011e8cc7e9b.1526305502.git.mprivozn@redhat.com>
References: <9dbde2b5d864d126b75d8c0d7bae2011e8cc7e9b.1526305502.git.mprivozn@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 14 May 2018 19:26:14 +0200
Message-ID: <CAJ+F1CKMq-nTSW3r4cwTTDcqMaqLBD4ShgUUJEMQ7QfRcU2UUA@mail.gmail.com>
To: Michal Privoznik <mprivozn@redhat.com>
Cc: QEMU <qemu-devel@nongnu.org>, qemu trival <qemu-trivial@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-options: Allow
 -no-user-config again
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
X-List-Received-Date: Mon, 14 May 2018 17:26:21 -0000

On Mon, May 14, 2018 at 3:45 PM, Michal Privoznik <mprivozn@redhat.com> wro=
te:
> After 1217d6ca2bf28c0febe1bd7d5b3fa912bbf6af2a we error out
> explicitly if an unknown -option was passed on the command line.
> However, we are doing two pass command line option parsing. In
> the first pass we just look for -no-user-config or -nodefconfig
> being present which determines whether we load user config or
> not. Then in the second pass we finally parse everything else
> throwing an error if an unsupported -option was found. Problem is
> that in the second pass -no-user-config and -nodefconfig are not
> handled explicitly which makes us throw the unsupported option
> error.
>
> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  vl.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/vl.c b/vl.c
> index b9f6b42779..846cd29d8a 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -4015,6 +4015,10 @@ int main(int argc, char **argv, char **envp)
>                      exit(1);
>                  }
>                  break;
> +            case QEMU_OPTION_nodefconfig:
> +            case QEMU_OPTION_nouserconfig:
> +                /* Nothing to be parsed here. Especially, do not error o=
ut below. */
> +                break;
>              default:
>                  if (os_parse_cmd_args(popt->index, optarg)) {
>                      error_report("Option not supported in this build");
> --
> 2.16.1
>
>



--=20
Marc-Andr=C3=A9 Lureau

