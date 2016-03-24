Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aj8Wd-0007Gt-Bj
	for mharc-qemu-trivial@gnu.org; Thu, 24 Mar 2016 12:54:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36417)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aj8Wb-0007G7-Bl
	for qemu-trivial@nongnu.org; Thu, 24 Mar 2016 12:54:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aj8Wa-0005Fi-Dk
	for qemu-trivial@nongnu.org; Thu, 24 Mar 2016 12:54:21 -0400
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:36334)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aj8Wa-0005F2-9y
	for qemu-trivial@nongnu.org; Thu, 24 Mar 2016 12:54:20 -0400
Received: by mail-vk0-x235.google.com with SMTP id z68so67009487vkg.3
	for <qemu-trivial@nongnu.org>; Thu, 24 Mar 2016 09:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=O6S0epHsOOZQMUYP8U4byMONNtqh0vM+ouApyr3r8Jw=;
	b=Zy+yVfyVDn/FMlklr0D1xP9HO6WhTiqqGvy2x8Sn7Ih3gG4tg4Ii+1fdPqKCaEe+kc
	rxLaah4jLmz0eWqWBVMmE2bZLULWQlFcckNWYfe4aJo9yXDVmQ8TNj+t/sIUKIksAVLM
	shV6+3k8081FEihRCMwPLMzJgtwNlVOLcmLLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=O6S0epHsOOZQMUYP8U4byMONNtqh0vM+ouApyr3r8Jw=;
	b=HzBfQcEJGfKpRh6GVQ0/PM/JtgMeIb3UkhTEDquT+1uyY5wmDZpOqQplWYZ6aaH7+v
	M6fzw1aoppTERK1DElfF2T8pUzyZ1+gCROZhvEdkktrEi7+RmBTt7QuGxR2VuIxwIKHL
	iFjG9bKxqNogAo8EfKrsXlksEE6TPKJ0mdjSD5+tby4C16UMsU6Gm7VvgUdqy6YI+nAb
	MOL5gK/QGUIT99+o6PBleMU3+Rw+LLigcEw4KnY8PGyIRlPIfwAqw6pUNCUFjNftdon/
	8Aeqf2aX0IN3WxXVQLrcv0QjNUqTKRe9EV9wweXVfOPUGRScblKl/H0aZcdykGV+3C9M
	V6sw==
X-Gm-Message-State: AD7BkJJWQZdqRNa9BCDcNUZTqCIkkgnz8Zg+t1+elcFhFALOIIfx5UbzDFDa43TmvNiBAQTOdLvdt7wClZniowom
X-Received: by 10.159.35.72 with SMTP id 66mr4508893uae.119.1458838458717;
	Thu, 24 Mar 2016 09:54:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Thu, 24 Mar 2016 09:53:59 -0700 (PDT)
In-Reply-To: <1458837548-10413-1-git-send-email-sw@weilnetz.de>
References: <1458837548-10413-1-git-send-email-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Mar 2016 16:53:59 +0000
Message-ID: <CAFEAcA_Tvn3-eRz7HBCETmbT1QGyGb8q21ymbucuk2k00VuMkQ@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developer <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] pxa2xx: Fix warnings from cgcc
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
X-List-Received-Date: Thu, 24 Mar 2016 16:54:22 -0000

On 24 March 2016 at 16:39, Stefan Weil <sw@weilnetz.de> wrote:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>
> This patch is rather old, but it still can be applied.
> It avoids duplicate definitions for some array indices
> (which are allowed by gcc, but cgcc complains).
>
>  hw/arm/pxa2xx_pic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/pxa2xx_pic.c b/hw/arm/pxa2xx_pic.c
> index 8a39b1c..a8a68e8 100644
> --- a/hw/arm/pxa2xx_pic.c
> +++ b/hw/arm/pxa2xx_pic.c
> @@ -204,7 +204,6 @@ static void pxa2xx_pic_mem_write(void *opaque, hwaddr offset,
>
>  /* Interrupt Controller Coprocessor Space Register Mapping */
>  static const int pxa2xx_cp_reg_map[0x10] = {
> -    [0x0 ... 0xf] = -1,
>      [0x0] = ICIP,
>      [0x1] = ICMR,
>      [0x2] = ICLR,
> @@ -216,6 +215,7 @@ static const int pxa2xx_cp_reg_map[0x10] = {
>      [0x8] = ICLR2,
>      [0x9] = ICFP2,
>      [0xa] = ICPR2,
> +    [0xb ... 0xf] = -1,
>  };

This is more bug-prone than the current code, because now
if we add or remove an entry in the array we have to change
the final line. The point of [ 0x0 ... 0xf ] is to specify
a default value for the array.

We use -Wno-initializer-overrides to silence a clang warning
about this, because we want to be able to use this "set the
default" idiom.

thanks
-- PMM

