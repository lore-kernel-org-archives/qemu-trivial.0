Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YEb48-0002S0-PH
	for mharc-qemu-trivial@gnu.org; Fri, 23 Jan 2015 05:02:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37070)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YEb43-0002Lv-J2
	for qemu-trivial@nongnu.org; Fri, 23 Jan 2015 05:02:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YEb3t-0001op-Gf
	for qemu-trivial@nongnu.org; Fri, 23 Jan 2015 05:02:07 -0500
Received: from mail-lb0-f180.google.com ([209.85.217.180]:63730)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YEb3t-0001ob-AE
	for qemu-trivial@nongnu.org; Fri, 23 Jan 2015 05:01:57 -0500
Received: by mail-lb0-f180.google.com with SMTP id b6so6133322lbj.11
	for <qemu-trivial@nongnu.org>; Fri, 23 Jan 2015 02:01:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=g/qS+aIw22VYhp5wYE0h4zUDj1dZKzRqbsvIXXdJ22U=;
	b=lto6kuJx7DxbJVtRpLw3wJV4uquYKbjIKL5M6Lazbq5t77Q+iKqGkAtWZxrZXTPks9
	sMqFeV1wBYl0g0UfBpler+tm9fmcbXOtlrXyvUProa8hQ9TvFjFz9DFuIBp6Kg/Hu2Ir
	ohI8qzAMJW2yPID0RHw06UiXjW5ST0hEKmV9Z9vx/Qvt+zZZU0QOPZDm/UqMnLTQ0QDK
	q2RqLCvhaJKSpXcjcBvDnGXDQwB1g/0xPmT6+/V/1Cdz29S0AkuQQWHC62xdWI3rrb4Y
	Wb2Dsd3XU9ae9vCjd9WawvWkArTYGePdb6n9Br//d9NyshNnbYQ5xU7AYYF8+Ll1bPgd
	gD3w==
X-Gm-Message-State: ALoCoQllTMsauWrtaMi6uhNubs6RSB/VZiskWawcsS1N7fg7tlETZGrNdgYpgdC1Acja9cgr/xue
X-Received: by 10.152.7.180 with SMTP id k20mr6513524laa.4.1422007316416; Fri,
	23 Jan 2015 02:01:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.21.34 with HTTP; Fri, 23 Jan 2015 02:01:36 -0800 (PST)
In-Reply-To: <54C20C26.6010204@sunrus.com.cn>
References: <54C20C26.6010204@sunrus.com.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Jan 2015 10:01:36 +0000
Message-ID: <CAFEAcA8ouuFXLJcTdM5B1hbj5_cZ1TKQgrJtFiCpaUJaYjGEAw@mail.gmail.com>
To: Chen Gang S <gang.chen@sunrus.com.cn>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.180
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Riku Voipio <riku.voipio@iki.fi>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user/syscall.c: Need
 call unlock_user() before go to failure return in default case
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
X-List-Received-Date: Fri, 23 Jan 2015 10:02:11 -0000

On 23 January 2015 at 08:53, Chen Gang S <gang.chen@sunrus.com.cn> wrote:
> In abi_long do_ioctl_dm(), after calls lock_user(), it does not call
> unlock_user() before go to failure return in default case.
>
> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
> ---
>  linux-user/syscall.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index aaac6a2..290fdea 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -3681,6 +3681,7 @@ static abi_long do_ioctl_dm(const IOCTLEntry *ie, uint8_t *buf_temp, int fd,
>          }
>          default:
>              ret = -TARGET_EINVAL;
> +            unlock_user(argptr, guest_data, 0);
>              goto out;
>          }
>          unlock_user(argptr, guest_data, guest_data_size);
> --
> 1.9.3 (Apple Git-50)

Correct as far as it goes, but notice that we have the identical
bug in the other switch (ie->host_cmd) as well...

thanks
-- PMM

