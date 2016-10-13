Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1budNw-0006I8-Ao
	for mharc-qemu-trivial@gnu.org; Thu, 13 Oct 2016 06:37:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55134)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1budNt-0006Fm-Vk
	for qemu-trivial@nongnu.org; Thu, 13 Oct 2016 06:37:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1budNs-0005NP-RQ
	for qemu-trivial@nongnu.org; Thu, 13 Oct 2016 06:37:09 -0400
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:34557)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1budNs-0005N1-NE
	for qemu-trivial@nongnu.org; Thu, 13 Oct 2016 06:37:08 -0400
Received: by mail-vk0-x22b.google.com with SMTP id b186so72825528vkb.1
	for <qemu-trivial@nongnu.org>; Thu, 13 Oct 2016 03:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=31UnuJCIa8uUN5Wta0HFP4uLuV5C5tVjJIl9/L5aGNg=;
	b=MRE3O7HVsW29psgr/DpslFlxcclFhieSEYgXFwCKu4QEJ0hUq1JmGA7DYQl8itlAnB
	CmydUmVBK2x8BDtRZNijix5L+jLnK47TNZmrwyxgbcfUAbtzx/2Wh1g4p2ANd+h60zta
	nUpfh1qTl8nVnr0KkdVGUmF+Gk07PdFzRH11g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=31UnuJCIa8uUN5Wta0HFP4uLuV5C5tVjJIl9/L5aGNg=;
	b=fiGU7M6e50hoP+D8yxl4p9tl9yPDv7gKlTvY5EMFZ+ftsF4kUHlxYOjpHausCdzhCS
	84R456Of5yDKhUPm25fze95V/VQ9w60YdRhOWSb6657maCRDEUuiyapr1U5WkIKatXOy
	RhtOLWFv/unfTruvEtvkyeavVc4wGLOXBLMJsr6UWLxjZJxmUz6WGgC6xts6aviUjGLf
	eHHHhDL5YzrjTCoR9uINgnMlzucmvSSx6MiWlUb6iiz4+FcB/HEpJdZfcTu7Ll/Gvzoe
	xiryKUMgQvG1/pQ6yvpNIkYleFqH8zHuW4WAUNGIpfY71vpfAa3tM1TOpqufpV4ZSEcl
	hX1A==
X-Gm-Message-State: AA6/9Rn3MDCz2nTvEIUCPax90i/RNqNYIySfomF7mmDnVhLIBoUkek7HFi0SlAKjH99p1qgJKPynT+KSrZXxkH5a
X-Received: by 10.31.16.73 with SMTP id g70mr4037918vki.175.1476355028258;
	Thu, 13 Oct 2016 03:37:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Thu, 13 Oct 2016 03:36:47 -0700 (PDT)
In-Reply-To: <1476311708-14792-2-git-send-email-michael@walle.cc>
References: <1476311708-14792-1-git-send-email-michael@walle.cc>
	<1476311708-14792-2-git-send-email-michael@walle.cc>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Oct 2016 11:36:47 +0100
Message-ID: <CAFEAcA8EiJcHOERHsYbWjnEJp-yZwYqgzeyavm47VWxNPNdEZQ@mail.gmail.com>
To: Michael Walle <michael@walle.cc>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22b
Subject: Re: [Qemu-trivial] [PATCH 2/4] target-lm32: disable asm logging via
 LOG_DIS()
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
X-List-Received-Date: Thu, 13 Oct 2016 10:37:11 -0000

On 12 October 2016 at 23:35, Michael Walle <michael@walle.cc> wrote:
> The lm32 target already has a disassembler which logs the assembly
> instructions with "-d in_asm". Therefore, turn of the LOG_DIS() macro to
> prevent logging the assembly instructions twice. Also turn the macro in a
> one which is always compiled to catch any errors while the macro is turned
> off.
>
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  target-lm32/translate.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/target-lm32/translate.c b/target-lm32/translate.c
> index fa8416a..792637f 100644
> --- a/target-lm32/translate.c
> +++ b/target-lm32/translate.c
> @@ -33,12 +33,14 @@
>  #include "exec/log.h"
>
>
> -#define DISAS_LM32 1
> -#if DISAS_LM32
> -#  define LOG_DIS(...) qemu_log_mask(CPU_LOG_TB_IN_ASM, ## __VA_ARGS__)
> -#else
> -#  define LOG_DIS(...) do { } while (0)
> -#endif
> +#define DISAS_LM32 0
> +
> +#define LOG_DIS(...) \
> +    do { \
> +        if (DISAS_LM32) { \
> +            qemu_log_mask(CPU_LOG_TB_IN_ASM, ## __VA_ARGS__); \
> +        } \
> +    } while (0)
>
>  #define EXTRACT_FIELD(src, start, end) \
>              (((src) >> start) & ((1 << (end - start + 1)) - 1))
> --
> 2.1.4

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

