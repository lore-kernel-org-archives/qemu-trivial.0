Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ioLae-0002d9-2S
	for mharc-qemu-trivial@gnu.org; Mon, 06 Jan 2020 01:10:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52019)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ioLac-0002cu-5A
 for qemu-trivial@nongnu.org; Mon, 06 Jan 2020 01:10:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ioLaa-0000Av-NJ
 for qemu-trivial@nongnu.org; Mon, 06 Jan 2020 01:10:09 -0500
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:33520)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ioLaa-0000AP-G9
 for qemu-trivial@nongnu.org; Mon, 06 Jan 2020 01:10:08 -0500
Received: by mail-pj1-x1043.google.com with SMTP id u63so4075554pjb.0
 for <qemu-trivial@nongnu.org>; Sun, 05 Jan 2020 22:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IaFMdYrQh6moNLyiHY/tsJKmyR2OVajlOoepIbh5I0Y=;
 b=NRoLpNBWP5tMk7BJZTIp9x96sqhIBT4GzEKVbk6oeV7RXFbWhmQOOcRsm4Nt84POrO
 dtmutQE5Ae92j/O1+PU8mxbLAXXhSU1sIGrCL5WYGxqEJNNFu0s0jlrxHR9pde9oT1M2
 ZUB0t1KUwou2kx/wHAC+AHxgzLOJ6kD3vbBMHOGyQLRUPmGw11EIWPjU30WzCc2VnTC5
 f8fuy5v3izvC/anb1XdpclVibvrz+gfpiX8SZKZ803nw0cR0dvGYkoyk//uvk4sv8YbH
 cQYBmogWSNb5TSeAS8VtnDuVZQyAV9L0MiiYrz+azGx2iKfc56wlotDux+nWI+Qb+rY5
 ctaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IaFMdYrQh6moNLyiHY/tsJKmyR2OVajlOoepIbh5I0Y=;
 b=HCQkkcnGXH8s8+308c+O96xC8oaZC7xafjeOr+bInpXKv6K88yhpwmBz840uzWyH/E
 q9yGvv/5nu9VrkBb3tJlZusptTyOhegkA6H6SeXK8U6V3pzxlyAxgU3EC24XKRu4dgnJ
 PBF9gIjg3U39xbv8zI5758NRZVF5YujVGVx7vXPBN1n596seKpY9BKfQXiktyLag9op1
 MiQW8LYWixks5QSFxwiOwI02D865TGNt/Ig5KzzywLR52jTjPvhjBNT46trQUv+IuAIH
 IGKGS4jjFvYBNnvqVwpJ9Tcz/PbmSalmsuysHArUr12ZI2yuO8zYUmTX7+Gszbgvnqb+
 CKLg==
X-Gm-Message-State: APjAAAVBTTBNp6FF2J9EF56hmMBOflmFqCoAC/MMj1LJiP7D5842zQqZ
 0hYq6HwFhuYU9x1x1Do+eNdnlQ==
X-Google-Smtp-Source: APXvYqwFHCzMCA0UuPh4Qr+0a/IMN1U8xGGs0WfBqXT7uzHJRe1Rp/JwotW0quPvzrH5bse1prqNfw==
X-Received: by 2002:a17:90a:1a50:: with SMTP id
 16mr42169259pjl.14.1578291007310; 
 Sun, 05 Jan 2020 22:10:07 -0800 (PST)
Received: from ?IPv6:2001:44b8:2176:c800:f1c3:9f9c:2e9f:1ebd?
 (2001-44b8-2176-c800-f1c3-9f9c-2e9f-1ebd.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:f1c3:9f9c:2e9f:1ebd])
 by smtp.gmail.com with ESMTPSA id p21sm75481720pfn.103.2020.01.05.22.10.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Jan 2020 22:10:06 -0800 (PST)
Subject: Re: [PATCH] MAINTAINERS: Remove Claudio Fontana bouncing email
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Claudio Fontana <claudio.fontana@gmail.com>
References: <20191230111801.26315-1-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9a15dd8b-02fb-c8ab-6a7c-294feb258609@linaro.org>
Date: Mon, 6 Jan 2020 16:10:01 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191230111801.26315-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1043
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
X-List-Received-Date: Mon, 06 Jan 2020 06:10:11 -0000

On 12/30/19 9:18 PM, Philippe Mathieu-Daudé wrote:
> Claudio Fontana Huawei email is bouncing, remove it.
> 
>   The message you sent to claudio.fontana@huawei.com couldn't be
>   delivered due to: Recipient email address is possibly incorrect.
> 
>   Further information:
>     5.1.1 Error: invalid recipients
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 387879aebc..8db4de6b9a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2383,7 +2383,6 @@ F: plugins/
>  F: tests/plugin
>  
>  AArch64 TCG target
> -M: Claudio Fontana <claudio.fontana@huawei.com>
>  M: Claudio Fontana <claudio.fontana@gmail.com>
>  S: Maintained
>  L: qemu-arm@nongnu.org
> 

In

  https://lists.gnu.org/archive/html/qemu-devel/2019-05/msg06872.html

Claudio asks to be removed from the section entirely.
I can take it up.


r~

