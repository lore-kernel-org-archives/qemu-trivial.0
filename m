Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ihQT4-0005IG-5y
	for mharc-qemu-trivial@gnu.org; Tue, 17 Dec 2019 22:57:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44402)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ihQT1-0005I0-LV
 for qemu-trivial@nongnu.org; Tue, 17 Dec 2019 22:57:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ihQT0-0004lq-Gb
 for qemu-trivial@nongnu.org; Tue, 17 Dec 2019 22:57:43 -0500
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:55084)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ihQT0-0004kY-Ak
 for qemu-trivial@nongnu.org; Tue, 17 Dec 2019 22:57:42 -0500
Received: by mail-pj1-x1044.google.com with SMTP id ep17so233737pjb.4
 for <qemu-trivial@nongnu.org>; Tue, 17 Dec 2019 19:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=a9L2IvHq3lvHENt4BJuUXxmzubNR9R5kCR+Q0ZyNE0E=;
 b=OxB7crqDw7G7jgcja/rWjajqtEfYWMDYoCB/nRXWwLOk1i1ch3fpfEHgbhoZepXFWY
 hLIR85QCq4OKW2hu/pGXB/7K43lwA9bJ1SdK4tLZ1MM8/ek/htsltUgkHouRwPMCRGDF
 EMiJlRFVUXkfsX+jd9IKipqarMjWRUbFgCHmcq70ORz9sbQjOeosQNQsUHZCAiieXMQ5
 XKbhdxcEqIbdyrrD6NuHh5TGblE5d9ab5MzYBwr3wWC70Kmlu2f/mpFYl6vDX8DosHjz
 COEKaBJp93Rybv40XaZnX5ZPZtgLn+PMYdZG5zTtpn6Kf4h/1Ciq03dNGsWWO9FnZpnl
 J3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a9L2IvHq3lvHENt4BJuUXxmzubNR9R5kCR+Q0ZyNE0E=;
 b=VCanVYFc/HFi+vWaUjM9YLUsdNsb4iNppfzVNSS/OCP1c1mgKwz/sntu7FeqNRtKWf
 jUZJhzblb+Qpva2kKXgBRPMAauKbQx35j5uL5JItEaYNrn7FGEGeDpzitiBSKu0BD6lY
 GWaDrSQWXI51Ey1JeO+auFhD5MuxkYVih90QI23/jPwsXWgSCAc0AD1iu1QUylH/i6vB
 OPXstPrzfptIYga27FVcHj/nBRBS2S/4QFfsOmN06pnPwg46sUuAdxFpucl20NLGJ5K7
 07Au+v5lScPAmwhMf66R0giCG1JQKFY1nl+dyO92G/9K0slzZhVvXte3e/XUa2ZyeCD7
 Hc4A==
X-Gm-Message-State: APjAAAVtzV3y6phUqLithVVcU8ujjIlkcZ5VM6/Sv5mTAy6uDY6ZkWXG
 vPovPamIISpwhP/SjIG2ty7IXg==
X-Google-Smtp-Source: APXvYqxY5FnOrHByhsz6NB3Byi1IJ4oVWVYb2yVR2aEYE2LfQmvwi/TEnr4LjIBdvwbqc/2xBWIXvQ==
X-Received: by 2002:a17:902:7484:: with SMTP id
 h4mr299494pll.206.1576641461001; 
 Tue, 17 Dec 2019 19:57:41 -0800 (PST)
Received: from ?IPv6:2605:e000:c74f:dc00:6838:d2b2:17e2:8445?
 ([2605:e000:c74f:dc00:6838:d2b2:17e2:8445])
 by smtp.gmail.com with ESMTPSA id l8sm484706pjy.24.2019.12.17.19.57.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2019 19:57:40 -0800 (PST)
Subject: Re: [PATCH 2/6] hw/display/tcx: Add missing fall through comments
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Olivier Danet <odanet@caramail.com>
References: <20191217173425.5082-1-philmd@redhat.com>
 <20191217173425.5082-3-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <be844995-0bdd-9273-75e9-47f20b25c6ec@linaro.org>
Date: Tue, 17 Dec 2019 17:57:36 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191217173425.5082-3-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1044
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
X-List-Received-Date: Wed, 18 Dec 2019 03:57:44 -0000

On 12/17/19 7:34 AM, Philippe Mathieu-Daudé wrote:
> GCC9 is confused by this comment when building with
> CFLAG -Wimplicit-fallthrough=2:
> 
>   hw/display/tcx.c: In function ‘tcx_dac_writel’:
>   hw/display/tcx.c:453:26: error: this statement may fall through [-Werror=implicit-fallthrough=]
>     453 |             s->dac_index = (s->dac_index + 1) & 0xff; /* Index autoincrement */
>         |             ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
>   hw/display/tcx.c:454:9: note: here
>     454 |         default:
>         |         ^~~~~~~
>   hw/display/tcx.c: In function ‘tcx_dac_readl’:
>   hw/display/tcx.c:412:22: error: this statement may fall through [-Werror=implicit-fallthrough=]
>     412 |         s->dac_index = (s->dac_index + 1) & 0xff; /* Index autoincrement */
>         |         ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
>   hw/display/tcx.c:413:5: note: here
>     413 |     default:
>         |     ^~~~~~~
>   cc1: all warnings being treated as errors
> 
> Add the missing fall through comments.
> 
> Fixes: 55d7bfe22
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Cc: Olivier Danet <odanet@caramail.com>
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/display/tcx.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

