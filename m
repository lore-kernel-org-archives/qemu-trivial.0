Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ogVNp-0002tM-G4
	for mharc-qemu-trivial@gnu.org; Thu, 06 Oct 2022 14:14:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogVNi-0002po-QY
 for qemu-trivial@nongnu.org; Thu, 06 Oct 2022 14:14:04 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:45958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogVNg-0008LK-5t
 for qemu-trivial@nongnu.org; Thu, 06 Oct 2022 14:14:01 -0400
Received: by mail-pl1-x631.google.com with SMTP id u24so2398332plq.12
 for <qemu-trivial@nongnu.org>; Thu, 06 Oct 2022 11:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5HvEw5JkXmpR706M+L+SS+52Zw8qNa0L+at6Hxs7y7U=;
 b=VqReS+JPM6jAeSeBUD+dpBgFt8nTk7PbPNR57omMppnes27zPFhkXAsqy0y2Hx6qpT
 DIl8Q0DHxQIsalaVblx8BDAAO3PFhyFo6u+1J3GeTMIsuOvSOoszfWf6eeuFqOwKhbZs
 x2WDy59vq9kl0Z0ekWq1CMBGm17glhF6Xrzh25F3Bm7sTwGuQZHZIryfNPpttD9XqU3Q
 JO2hDmLesPMKnP1+6HVt41cDgSRQzJtAclajj6QKWHVdMZ8oogQcjNPzDdc9I64RcQhe
 RhE4P39k61KRrsoj3BMKdLlhAQkw2v0PtdIO85L7n680humksWmTYJoorFCT92KRgiKX
 Mr3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5HvEw5JkXmpR706M+L+SS+52Zw8qNa0L+at6Hxs7y7U=;
 b=l/8pt3efAjFEodTjC5PVtMmv5VluKI7NHAULkAZLpMipCtE939WTUU7wvvO+2EOeyk
 +MQolYlTtohEOkv2Y6eKf6JfvOUcnvgH44Qs1pu53LLaSQOmzincJIHQUEhz+1p/Ry2h
 7PuGB2c6RQCzSmkoSjjAEG7juo4BOyXElDWrlQagJwFF7eoY8eKHIvhzumws/P/Pfn/h
 RPQon1pHyCXG5Lyb9bZKsqNWRdmycOWs+MbVjqUlHqxBZvlfDnKeh03jpkgyzIpuPcXk
 bzczLbZ3pUtpa2D79mRjGBo/S4ZEZ3++bvbCDSoY6V5XwQBGxC7U8vvKgP8f0xORHdfu
 2bCw==
X-Gm-Message-State: ACrzQf1Mk92FgcX3dge4vWS129aIiwYSu19cbsl5qHH/AAPQFCDde5eB
 3L18xLoEkN3ueiQvT2M2LN0YsDHOEl+dGdmypKxwWg==
X-Google-Smtp-Source: AMsMyM76FjHhqqnW9g2+gXTDx02850lPYbqEyXtMHOBPSAuSF/er9rBH38ODzNAASIQIOw9og7SwZPPXEkA6MbRkh0Q=
X-Received: by 2002:a17:90a:fe92:b0:20a:daaf:75ea with SMTP id
 co18-20020a17090afe9200b0020adaaf75eamr11570326pjb.221.1665080038105; Thu, 06
 Oct 2022 11:13:58 -0700 (PDT)
MIME-Version: 1.0
References: <20221006153841.10750-1-sisshiki@mac.com>
In-Reply-To: <20221006153841.10750-1-sisshiki@mac.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Oct 2022 19:13:45 +0100
Message-ID: <CAFEAcA-fXq47T2kNUcjbpZ9fQbLdc=jzkT_phMqJ5wyKrdXNmg@mail.gmail.com>
Subject: Re: [PATCH] linux-user: mprotect() should returns 0 when len is 0.
To: Soichiro Isshiki <sisshiki@isshiki-clinic.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 sisshiki1969 <sisshiki@mac.com>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Oct 2022 18:14:04 -0000

On Thu, 6 Oct 2022 at 19:05, Soichiro Isshiki
<sisshiki@isshiki-clinic.com> wrote:
>
> From: sisshiki1969 <sisshiki@mac.com>
>
> For now, qemu-x86_64 returns ENOMEM when mprotect() was called with an argument
> len is 0 from a guest process.
> This behavior is incompatible with the current Linux implementation,
> which mprotect() with len = 0 does nothing and returns 0,
> although it does not appear to be explicitly described in man.
>
> This is due to the following function which always returns false if len = 0.
>
> ```C
> static inline bool guest_range_valid_untagged(abi_ulong start, abi_ulong len)
> {
>     return len - 1 <= GUEST_ADDR_MAX && start <= GUEST_ADDR_MAX - len + 1;
> }
>
> ```
>
> This patch fix this incompatibility problem.
>
> Signed-off-by: sisshiki1969 <sisshiki@mac.com>
> ---
>  linux-user/mmap.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/linux-user/mmap.c b/linux-user/mmap.c
> index 28f3bc85ed..1ed79459ea 100644
> --- a/linux-user/mmap.c
> +++ b/linux-user/mmap.c
> @@ -130,12 +130,12 @@ int target_mprotect(abi_ulong start, abi_ulong len, int target_prot)
>      }
>      len = TARGET_PAGE_ALIGN(len);
>      end = start + len;
> -    if (!guest_range_valid_untagged(start, len)) {
> -        return -TARGET_ENOMEM;
> -    }
>      if (len == 0) {
>          return 0;
>      }
> +    if (!guest_range_valid_untagged(start, len)) {
> +        return -TARGET_ENOMEM;
> +    }
>
>      mmap_lock();
>      host_start = start & qemu_host_page_mask;

Cc'ing Richard -- is this the right fix, or would it be better instead
to make guest_range_valid_untagged() correctly handle a zero-length
range ?

thanks
-- PMM

