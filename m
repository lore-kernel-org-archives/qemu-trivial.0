Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZks6-0008Tb-EE
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 17:26:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35250)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dZks4-0008S3-89
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 17:26:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dZks3-0004oi-FY
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 17:26:32 -0400
Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235]:36201)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dZks3-0004nv-A3
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 17:26:31 -0400
Received: by mail-wm0-x235.google.com with SMTP id t201so29945000wmt.1
	for <qemu-trivial@nongnu.org>; Mon, 24 Jul 2017 14:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=GyBg50090LSaC9FgC0I7fP4A38Jw1aXPKiwd0OwN62Q=;
	b=XZ5mOPXUCNykVVSLm04pr6FoNcrj86MtFTi4oimLK2g/1KFGvxMGuzOuEowvmONkF4
	NXu71f+Ie0wGGSS1d9dJXGuZzpCxsqMMWCaA7H0MS68MfLGXItG0wqK2ijh0TPR/UOQa
	j8pdEmbYFJGTCh3TtBk91XgqgPmKeAj4Nf7iY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=GyBg50090LSaC9FgC0I7fP4A38Jw1aXPKiwd0OwN62Q=;
	b=hnUszqoOtG75gBitifi3hcubqptsWS67SQgI5bG0Zgk0TALL2rTCpaGOf3YuPcJ7Ny
	KK3Bo0tOPi1U3Vo+T/q4Smz5leoXmyAOHr0jsRqoaDRxroYz8UHVRLxT0cUBoLSYcA/u
	OfS57ZXGFDgBNEKCZVpLfBv6z0d48MoqmdweOz9p3fqtASYgnoOMhb/Kqz9/tPuoRfcC
	y8+5YPzYrddLsEIyUTN0rtXSjT3DkGw+sF5v3I9pTyjj4gYzYuRp25A0TafG3eu7tHfP
	NABPWl5xOw12ajlOb6TFTBj6JUe1omL48Z8x5SNkMAYGzYxVyDQNSUxxhNZWddZ0U8Xc
	FO5w==
X-Gm-Message-State: AIVw110TV3aNR6rkRzNaYtuHPNnI2ff/XE6vYOpXydLtzQFCunnS0G40
	+EMPMxOVz8K5JY1J8gjgnfp2auhSwCme
X-Received: by 10.28.161.3 with SMTP id k3mr6030318wme.155.1500931590333; Mon,
	24 Jul 2017 14:26:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Mon, 24 Jul 2017 14:26:09 -0700 (PDT)
In-Reply-To: <20170724182751.18261-28-f4bug@amsat.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-28-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Jul 2017 22:26:09 +0100
Message-ID: <CAFEAcA86cuTukJ4HXVKDjewpxy2myPU1Gdbn671zqxJq6d09Wg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Eric Blake <eblake@redhat.com>,
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>, 
	QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::235
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for 2.10 27/35] syscall: fix
 dereference of undefined pointer
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
X-List-Received-Date: Mon, 24 Jul 2017 21:26:33 -0000

On 24 July 2017 at 19:27, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wro=
te:
> Clang's scan-build-5.0 reports:
>
> linux-user/syscall.c:5581:9: warning: Dereference of undefined pointer va=
lue
>     if (*host_rt_dev_ptr !=3D 0) {
>         ^~~~~~~~~~~~~~~~
>
> Reported-by: Clang Static Analyzer
> Suggested-by: Laurent Vivier <lvivier@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  linux-user/syscall.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index fcd20fa276..e79b5baec4 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -5524,7 +5524,7 @@ static abi_long do_ioctl_rt(const IOCTLEntry *ie, u=
int8_t *buf_temp,
>      int target_size;
>      void *argptr;
>      abi_ulong *target_rt_dev_ptr;
> -    unsigned long *host_rt_dev_ptr;
> +    unsigned long *host_rt_dev_ptr =3D NULL;
>      abi_long ret;
>      int i;
>
> @@ -5570,6 +5570,7 @@ static abi_long do_ioctl_rt(const IOCTLEntry *ie, u=
int8_t *buf_temp,
>      unlock_user(argptr, arg, 0);
>
>      ret =3D get_errno(safe_ioctl(fd, ie->host_cmd, buf_temp));
> +    assert(host_rt_dev_ptr);

There's not much point in this assert because it doesn't
tell us anything we're not about to find out immediately
by dereferencing the pointer...

>      if (*host_rt_dev_ptr !=3D 0) {
>          unlock_user((void *)*host_rt_dev_ptr,
>                      *target_rt_dev_ptr, 0);
> --
> 2.13.3

thanks
-- PMM

