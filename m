Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gFSQE-0003dZ-Gi
	for mharc-qemu-trivial@gnu.org; Wed, 24 Oct 2018 19:18:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38814)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gFSQC-0003d2-DT
	for qemu-trivial@nongnu.org; Wed, 24 Oct 2018 19:18:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gFSQ9-0004qa-2C
	for qemu-trivial@nongnu.org; Wed, 24 Oct 2018 19:18:40 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50412)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gFSQ6-0004l4-TO
	for qemu-trivial@nongnu.org; Wed, 24 Oct 2018 19:18:35 -0400
Received: by mail-wm1-f67.google.com with SMTP id i8-v6so6996812wmg.0
	for <qemu-trivial@nongnu.org>; Wed, 24 Oct 2018 16:18:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=6GGo3g1VB3T984l0XSFqhhlCgiQKXzbSEvu8/KhME/A=;
	b=nW7T15M5eAzmdI8iILL8riptFyyXmOtpZUjlMoMZlqSdElZm0ODNuD4sLFFHYliVBq
	2kR809oDCqcZzOjXke9uI6x8lNQrXEs9DD8OfzCJQaFT4MQC6ATXIVe4VkbQD2mfGETy
	WwkcYsQ8e+lK7Fs33XhL8lfpgAC89FgczcNpdKVanXpolNTHKjrukA0Nnh+JF4zxNSs8
	YiJ/Yzfq+O2C0hPa8jlxQ5P5Nq2kZJhRWYZUrA2Hs5Iu+knezxEKig8RcdSkbrAylP8e
	N/LNNCvMV4tjfquMh4F8AJwk92UkO7IHCKVHB6vd8AbZy+bcu3zw/NRsb8APwHyO/zEI
	4xXw==
X-Gm-Message-State: AGRZ1gLHSZoqGSJ2bHkmnE4XLlIrKAEslDbbpVdJ2Ajsb10S2RzDBKAi
	e1S2gumJqX21EJAZIxU+895nXw==
X-Google-Smtp-Source: AJdET5dApOjKXe6Zxmi0pfXW9GvkeUgX0my6mrrCF+js3xSQRr1BDp/KTJWOtru885RGSiPW5KsSOw==
X-Received: by 2002:a1c:c708:: with SMTP id
	x8-v6mr4614583wmf.116.1540423112301; 
	Wed, 24 Oct 2018 16:18:32 -0700 (PDT)
Received: from [172.29.28.213] ([185.30.24.106])
	by smtp.gmail.com with ESMTPSA id
	l67-v6sm9975495wma.20.2018.10.24.16.18.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Oct 2018 16:18:31 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, Richard Henderson <rth@twiddle.net>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
	<f4bug@amsat.org>
References: <1540376314-5727-1-git-send-email-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3a04e8e5-22a7-efe4-2187-aaf5fcc95099@redhat.com>
Date: Thu, 25 Oct 2018 01:18:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <1540376314-5727-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configs/alpha: Remove
 unused CONFIG_PARALLEL_ISA switch
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
X-List-Received-Date: Wed, 24 Oct 2018 23:18:41 -0000

On 24/10/18 12:18, Thomas Huth wrote:
> We don't use CONFIG_PARALLEL_ISA in any of our Makefiles, so this
> is just a dead config option which can be removed.
> 
> Fixes: a4cb773928e047b137c6998209cf2eec857fac6b

Oops, this slipped while refactoring the series, this is part of a 
further cleanup that I never finished. Hopefully Kconfig will outdate it.

Thanks for cleaning this!

> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>   default-configs/alpha-softmmu.mak | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/default-configs/alpha-softmmu.mak b/default-configs/alpha-softmmu.mak
> index bbe361f..61435cc 100644
> --- a/default-configs/alpha-softmmu.mak
> +++ b/default-configs/alpha-softmmu.mak
> @@ -8,7 +8,6 @@ CONFIG_I82374=y
>   CONFIG_I8254=y
>   CONFIG_I8257=y
>   CONFIG_PARALLEL=y
> -CONFIG_PARALLEL_ISA=y
>   CONFIG_FDC=y
>   CONFIG_PCKBD=y
>   CONFIG_VGA_CIRRUS=y
> 

