Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xn7vD-0005dd-1L
	for mharc-qemu-trivial@gnu.org; Sat, 08 Nov 2014 10:27:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48620)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Xn7v7-0005dD-5Z
	for qemu-trivial@nongnu.org; Sat, 08 Nov 2014 10:27:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Xn7v2-000876-RA
	for qemu-trivial@nongnu.org; Sat, 08 Nov 2014 10:27:21 -0500
Received: from mail-lb0-f178.google.com ([209.85.217.178]:48779)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Xn7v2-00085W-Ku
	for qemu-trivial@nongnu.org; Sat, 08 Nov 2014 10:27:16 -0500
Received: by mail-lb0-f178.google.com with SMTP id f15so4446684lbj.37
	for <qemu-trivial@nongnu.org>; Sat, 08 Nov 2014 07:27:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ym+9CDhGzCXMAxF2chlptJVqQGe05C8Rjws1UlqM0Qc=;
	b=Epnjq4xSXVOEKwXlodPf9hpDYhtZhf1nS0TI7xatytLs2eoO5l/e3vokuGj7kP/Lih
	9mgq3BtUHYggQNOmorm8NoZNQJWAnnDHpsavIDYU81OEheVPlrp+0CPHSnx7D/JVqLtb
	9CDGZu4mip2DPY4A2x+fPSVqZvkJ5XLEOJFdu6vl7WvN06ZFCRfBV6plzgvANbRGz7E4
	Hin9NR5QD6oJWHbl2Ee48qoW+lTxw8QKpazT9yoFmSZlxP+FUmXTJ2fUnD0Ed8oDXYQx
	1DfslcLUfTws2kMVwSy/0jkmkDfErL5IvI75jjbNc+rYXwfZRjAPsQ8N+go237COuQac
	3Jqw==
X-Gm-Message-State: ALoCoQkjW2XElDrp68pYhsIWfZjsNcS3j2u7U+Ml9QiIQelTojYgBuidD/G9Qp8/kmSw3DpESsx+
X-Received: by 10.112.52.37 with SMTP id q5mr17882492lbo.32.1415460434600;
	Sat, 08 Nov 2014 07:27:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.173.168 with HTTP; Sat, 8 Nov 2014 07:26:53 -0800 (PST)
In-Reply-To: <545D935F.3070300@lekkertech.net>
References: <545D935F.3070300@lekkertech.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 8 Nov 2014 15:26:53 +0000
Message-ID: <CAFEAcA8gyg=jjbJ0v4iRx+1aTDWFQWFNGwXXa49LZ_WWSA76_Q@mail.gmail.com>
To: Willem Pinckaers <willem_qemu@lekkertech.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.178
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] coroutine-sigaltstack:
	Change jmp_buf to sigjmp_buf
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
X-List-Received-Date: Sat, 08 Nov 2014 15:27:25 -0000

On 8 November 2014 03:51, Willem Pinckaers <willem_qemu@lekkertech.net> wrote:
> This is a simple patch to change the type of old_env from jmp_buf
> to sigjmp_buf.  old_env is used by sigsetjmp and as such should be
> a sigjmp_buf.
>
> This fixes a stack_chk fail in a OSX 32bit build. Since at least on
> OSX sigjmp_buf is four bytes larger then a jmpbuf, resulting in an
> overflow in sigsetjmp. Due to variable reordering this overwrites
> the stack cookie.
>
> Signed-off-by: Willem Pinckaers <willem_qemu@lekkertech.net>
> ---
>  coroutine-sigaltstack.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/coroutine-sigaltstack.c b/coroutine-sigaltstack.c
> index 3de0bb3..63519ff 100644
> --- a/coroutine-sigaltstack.c
> +++ b/coroutine-sigaltstack.c
> @@ -155,7 +155,7 @@ Coroutine *qemu_coroutine_new(void)
>      stack_t oss;
>      sigset_t sigs;
>      sigset_t osigs;
> -    jmp_buf old_env;
> +    sigjmp_buf old_env;
>
>      /* The way to manipulate stack is with the sigaltstack function. We
>       * prepare a stack, with it delivering a signal to ourselves and then

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

I think I must have missed this one when I converted all the jmp_buf
to sigjmp_buf in commit 6ab7e546.

-- PMM

