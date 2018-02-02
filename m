Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ehhyR-0006A4-Uk
	for mharc-qemu-trivial@gnu.org; Fri, 02 Feb 2018 15:30:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39074)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ehhyP-00069Q-Rv
	for qemu-trivial@nongnu.org; Fri, 02 Feb 2018 15:30:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ehhyM-0002ez-N4
	for qemu-trivial@nongnu.org; Fri, 02 Feb 2018 15:30:13 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:33989)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ehhyM-0002eV-I3; Fri, 02 Feb 2018 15:30:10 -0500
Received: by mail-qk0-x241.google.com with SMTP id m130so543899qke.1;
	Fri, 02 Feb 2018 12:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=+mD9A9IVcQm0BEQKEqjs383NxPcs6HvS2H+Hgz+bltE=;
	b=fsExMugQ+MRWdQvnSjH7gVH4MtV1HhfQqnPJzzVCLgHIKCYtNlHaFrQVp7R2j9Lcfc
	S8+tkQhzq5k5dgsKTkPaQyTI+ZT1e18b64KXFzyQTdKEMKa4fiFM2pR4KL2AAOFQL4tA
	Wog+ouV5sTyxvFBbkGqNLNurLg74W+iBkJFGiLKB6l2uhB9iLIi0TND+6/WRzqC+dfzF
	UrVUvxQAEm2BoDIs7ddEjcSlI5rpf0iPaKIyMTC3CVvdcjhvjQYVt80mPS4IKbJoD6rB
	slsirzk6NnE+dv2MCAz+O0EEuDK3qHC1aZz20PU4705r3TovwTMi73k+qJ53+gpFFJSE
	vLdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=+mD9A9IVcQm0BEQKEqjs383NxPcs6HvS2H+Hgz+bltE=;
	b=mnujjdu7HaxM/qfi7Jp8CrcgU+Gl53ziQgV9TTjoq2yUjsIj+7ZcdnvFwjJUsRg7bJ
	TgLc95lsnYuQ60tgpyHpvjFEzzSmrFpSZdT0MvPDQZindGvGiWuVuA39rqixrMxmm9ts
	sNOz9W5fBeUeMrXKSBgLHzFIPj2S6JpaRdi6z99ggZfD6HxnEuljbJSYZcKrHsh0Zt04
	OuZ3VBd8rb4LqCSL1A+d1+AXp6TjnvCnf4M6gE5Ur7CW+NKZ4f+yVxYZjadLToADhbcb
	ACXab/hPGiRppEV11zBlN2XAIlSZCE8gB6KBJxFC/4gs1z1nWssAHrXj77YypWVIf72i
	KQZQ==
X-Gm-Message-State: APf1xPDrLqCZK+A7+6awkE26TSrD0svtWWsJIDPxJCftIgpw0noS6ZFQ
	bRFVUbWlyfC4CUCDIl15dDI=
X-Google-Smtp-Source: AH8x227JCsoU2nMFmX76kRmUXiEHz9Zikih+PsOynZ8ya6f6R/nDr4kypPMxwy+RITcJhN3CGF+GKw==
X-Received: by 10.55.152.70 with SMTP id a67mr5165854qke.62.1517603409950;
	Fri, 02 Feb 2018 12:30:09 -0800 (PST)
Received: from [192.168.43.186] ([181.117.224.46])
	by smtp.gmail.com with ESMTPSA id 68sm1913871qke.80.2018.02.02.12.30.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Feb 2018 12:30:09 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <1517559331-6388-1-git-send-email-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <1fe00c64-16c5-b3e7-13cf-65b0adde5c33@amsat.org>
Date: Fri, 2 Feb 2018 17:30:06 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1517559331-6388-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/timer/mt48t59: Fix
 bit-rotten NVRAM_PRINTF format strings
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
X-List-Received-Date: Fri, 02 Feb 2018 20:30:15 -0000

Hi Thomas,

On 02/02/2018 05:15 AM, Thomas Huth wrote:
> When compiling with NVRAM_PRINTF enabled, gcc currently bails out with:
> 
>   CC      hw/timer/m48t59.o
>   CC      hw/timer/m48t59-isa.o
> hw/timer/m48t59.c: In function ‘NVRAM_writeb’:
> hw/timer/m48t59.c:460:5: error: format ‘%x’ expects argument of type ‘unsigned int’, but argument 3 has type ‘hwaddr’ [-Werror=format=]
>      NVRAM_PRINTF("%s: 0x%08x => 0x%08x\n", __func__, addr, val);
>      ^
> hw/timer/m48t59.c:460:5: error: format ‘%x’ expects argument of type ‘unsigned int’, but argument 4 has type ‘uint64_t’ [-Werror=format=]
> hw/timer/m48t59.c: In function ‘NVRAM_readb’:
> hw/timer/m48t59.c:492:5: error: format ‘%x’ expects argument of type ‘unsigned int’, but argument 3 has type ‘hwaddr’ [-Werror=format=]
>      NVRAM_PRINTF("%s: 0x%08x <= 0x%08x\n", __func__, addr, retval);
> 
> Fix it by using the correct format strings and while we're at it,
> also change the definition of NVRAM_PRINTF so that this can not
> bit-rot so easily again.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/timer/m48t59-internal.h | 9 +++------
>  hw/timer/m48t59.c          | 4 ++--
>  2 files changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/timer/m48t59-internal.h b/hw/timer/m48t59-internal.h
> index 32ae957..d0f0caf 100644
> --- a/hw/timer/m48t59-internal.h
> +++ b/hw/timer/m48t59-internal.h
> @@ -25,13 +25,10 @@
>  #ifndef HW_M48T59_INTERNAL_H
>  #define HW_M48T59_INTERNAL_H 1
>  
> -//#define DEBUG_NVRAM
> +#define M48T59_DEBUG 0
>  
> -#if defined(DEBUG_NVRAM)
> -#define NVRAM_PRINTF(fmt, ...) do { printf(fmt , ## __VA_ARGS__); } while (0)
> -#else
> -#define NVRAM_PRINTF(fmt, ...) do { } while (0)
> -#endif
> +#define NVRAM_PRINTF(fmt, ...) do { \
> +    if (M48T59_DEBUG) { printf(fmt , ## __VA_ARGS__); } } while (0)

While not use tracepoints directly?

>  
>  /*
>   * The M48T02, M48T08 and M48T59 chips are very similar. The newer '59 has
> diff --git a/hw/timer/m48t59.c b/hw/timer/m48t59.c
> index 844aad5..4abb4ac 100644
> --- a/hw/timer/m48t59.c
> +++ b/hw/timer/m48t59.c
> @@ -457,7 +457,7 @@ static void NVRAM_writeb(void *opaque, hwaddr addr, uint64_t val,
>  {
>      M48t59State *NVRAM = opaque;
>  
> -    NVRAM_PRINTF("%s: 0x%08x => 0x%08x\n", __func__, addr, val);
> +    NVRAM_PRINTF("%s: 0x%"HWADDR_PRIx" => 0x%"PRIx64"\n", __func__, addr, val);
>      switch (addr) {
>      case 0:
>          NVRAM->addr &= ~0x00FF;
> @@ -489,7 +489,7 @@ static uint64_t NVRAM_readb(void *opaque, hwaddr addr, unsigned size)
>          retval = -1;
>          break;
>      }
> -    NVRAM_PRINTF("%s: 0x%08x <= 0x%08x\n", __func__, addr, retval);
> +    NVRAM_PRINTF("%s: 0x%"HWADDR_PRIx" <= 0x%08x\n", __func__, addr, retval);
>  
>      return retval;
>  }
> 

