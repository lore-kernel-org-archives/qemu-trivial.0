Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lJkq3-0000bR-KR
	for mharc-qemu-trivial@gnu.org; Tue, 09 Mar 2021 17:28:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJkq1-0000aH-7E; Tue, 09 Mar 2021 17:28:25 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:35050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJkpz-00054j-RU; Tue, 09 Mar 2021 17:28:24 -0500
Received: by mail-ed1-x536.google.com with SMTP id p1so23712091edy.2;
 Tue, 09 Mar 2021 14:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=maW90UHM8vBY5BbDXdicQp73IoxTkpurgTYRz5hzpEY=;
 b=vYf58LUcfA7zO3iyv0hCDQHYFOcdgYKx3m4eUdE2XL9Li+eawuVB3ZMlNn+AhSRVlr
 17FbKfxlIMm4OzHzPiobddzw+gu76h0Za0UsS+yzBapJYIszcj0Ouc3uUgyt62/4sYGD
 SwsUZaykFqC+bRMnZYD0kOJVlX7BxI+msZpIDhvomfXEUwmTr13t7xlNi/oszINYtqiu
 MlnGBOEAoYWcTcH1x3cLJG0iq76RS6sS9/ZC63nqVhdLFgAXSlJomEjc60M9f34gENcB
 PNP3AZkRTVlYfpKh+nDE7osJOD6OOLhuybTYYgoeua4EpEUwsGptX/88lady7e+0jKEJ
 0Q3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=maW90UHM8vBY5BbDXdicQp73IoxTkpurgTYRz5hzpEY=;
 b=fNWTChnZU3VkO+lNAU7Dd9/I3stV7Rwuvx5LRIAbMYKJ4TOam1Yk71Be2jKHZHqp+w
 ItTZiwDsUHwcnFxrYkzbiHR7P1dUlDYTUPQBws8rp748t8SWy7RZQYM2Dae7LpYvyVYZ
 4TIofaDAsltVhh2FoYOHS6LABRPwCV/o1X33zUTYMpmpeOudzVpDGb2jvzQBaY4L7mjg
 iP4v8jV/eADqzwzrwy4Y2YFU404ke+KYkr/3L1rNF8gE9bJbdoC0oUfZx8zn6sAVyRAa
 r4BA9BaWY0QcPWnIj+rGsTUnC1wAnBnnOtzaVqu28Bz6I/viYFWstw/Jz1D8VkGuv4Ns
 sIFg==
X-Gm-Message-State: AOAM530bbxOteijDT71cUrg5gdg5+JEgFEhhZqCprKjzrJ1VME4nCE9E
 NP4yx9kjc+p9R/zONQVJv7U=
X-Google-Smtp-Source: ABdhPJzq+N8pvrwbpt8uQkN9hmFz9o7AOIMIyzdcZ+PV4mrUYgPjhASdM/J4dZKqiZunZe3FogYflg==
X-Received: by 2002:aa7:c903:: with SMTP id b3mr6718511edt.156.1615328902238; 
 Tue, 09 Mar 2021 14:28:22 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id d19sm9789072edr.45.2021.03.09.14.28.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 14:28:21 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH] hw/isa/Kconfig: Add missing dependency VIA VT82C686 -> APM
To: qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>
References: <20210302080531.913802-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5d3abcbd-99f0-0c43-4493-9881a38ae980@amsat.org>
Date: Tue, 9 Mar 2021 23:28:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210302080531.913802-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Mar 2021 22:28:25 -0000

ping for review?

On 3/2/21 9:05 AM, Philippe Mathieu-Daudé wrote:
> TYPE_VIA_PM calls apm_init() in via_pm_realize(), so
> requires APM to be selected.
> 
> Reported-by: BALATON Zoltan <balaton@eik.bme.hu>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/isa/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
> index c7f07854f7e..9c026d0c510 100644
> --- a/hw/isa/Kconfig
> +++ b/hw/isa/Kconfig
> @@ -47,6 +47,7 @@ config VT82C686
>      select ACPI_SMBUS
>      select SERIAL_ISA
>      select FDC
> +    select APM
>  
>  config SMC37C669
>      bool
> 

