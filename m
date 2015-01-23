Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YEbA8-0006jX-Ii
	for mharc-qemu-trivial@gnu.org; Fri, 23 Jan 2015 05:08:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38310)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YEbA3-0006j8-M0
	for qemu-trivial@nongnu.org; Fri, 23 Jan 2015 05:08:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YEb9z-0003rk-Kp
	for qemu-trivial@nongnu.org; Fri, 23 Jan 2015 05:08:19 -0500
Received: from mail-la0-f43.google.com ([209.85.215.43]:42239)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YEb9z-0003rc-E6
	for qemu-trivial@nongnu.org; Fri, 23 Jan 2015 05:08:15 -0500
Received: by mail-la0-f43.google.com with SMTP id q1so6457295lam.2
	for <qemu-trivial@nongnu.org>; Fri, 23 Jan 2015 02:08:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=lq5d2vXnQB4aDv8rm9L0Jw2BERhkC61i3r4AY5rsPKI=;
	b=auHXvTK+gMG/JsfEbiVhCY8abSIyncUrUbGAqKYlBY3gxZMb4rwMf9Gzo2xeuaDKF8
	BrhL9yvQ74GE1f4xU2bl3Sw+0n2YRss8Uv8ejWKQpXAA+X07nkSqr9Guy/Pw7R3sDTza
	53y1anZgyL3e0VUiWm3XUbsE7fbcfwjB65oRln9FOfudHj2v6BkxUEta31Oy1W+bUDiN
	+CrUne9NHVUzA9EBOMcp0PoyJHxPo8niU9BZENt3YMDQFz0WicsDyNGLrx8+Uv6dTosp
	FSzGOq5Ef372r55x5Exw9uTG6fawBHgSqcGzLESy6ml6SQP1h+el2xPJCasXQrT+rU0y
	0q6w==
X-Gm-Message-State: ALoCoQniEN5vj7IWtM4Z/+77HbwKHoxrcX/+mum9kyGnJP3YqX/gieKuEkNFq7qF5shaUDlJtjf7
X-Received: by 10.152.29.129 with SMTP id k1mr6518647lah.10.1422007694696;
	Fri, 23 Jan 2015 02:08:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.21.34 with HTTP; Fri, 23 Jan 2015 02:07:54 -0800 (PST)
In-Reply-To: <54C21BE5.9080100@sunrus.com.cn>
References: <54C21BE5.9080100@sunrus.com.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Jan 2015 10:07:54 +0000
Message-ID: <CAFEAcA9+5RgVFOTt91s0rnH8BW6Tk6ByYgKBurDvfnEnFQRFHg@mail.gmail.com>
To: Chen Gang S <gang.chen@sunrus.com.cn>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.43
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Riku Voipio <riku.voipio@iki.fi>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] linux-user/syscall.c:
 Free the vec[i] in failure processing code block
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
X-List-Received-Date: Fri, 23 Jan 2015 10:08:23 -0000

On 23 January 2015 at 10:01, Chen Gang S <gang.chen@sunrus.com.cn> wrote:
> When failure occurs during allocating vec[i], also need free all
> allocated vec[i] in failure processing code block before return.
>
> In unlock_user(), it will check vec[i].iov_base whether is NULL, so need
> not check it again outside.
>
> If error is EFAULT when "i == 0", vec[i].iov_base is NULL, then can just
> skip it, so can still use "while (--i >= 0)" for the free looping.
>
> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
> ---
>  linux-user/syscall.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 290fdea..a66c2ae 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -1873,6 +1873,11 @@ static struct iovec *lock_iovec(int type, abi_ulong target_addr,
>      return vec;
>
>   fail:
> +    while (--i >= 0) {
> +        if (tswapal(target_vec[i].iov_len) > 0) {
> +            unlock_user(vec[i].iov_base, tswapal(target_vec[i].iov_base), 0);
> +        }
> +    }
>      unlock_user(target_vec, target_addr, 0);
>   fail2:
>      free(vec);
> --
> 1.9.3 (Apple Git-50)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM




-- 
12345678901234567890123456789012345678901234567890123456789012345678901234567890
         1         2         3         4         5         6         7         8

