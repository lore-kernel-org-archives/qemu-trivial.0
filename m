Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j6Wdp-00055h-LE
	for mharc-qemu-trivial@gnu.org; Tue, 25 Feb 2020 04:36:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54644)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6Wdn-00054V-Qs
 for qemu-trivial@nongnu.org; Tue, 25 Feb 2020 04:36:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6Wdm-0005yk-Kk
 for qemu-trivial@nongnu.org; Tue, 25 Feb 2020 04:36:35 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:21714
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6Wdm-0005yO-HV
 for qemu-trivial@nongnu.org; Tue, 25 Feb 2020 04:36:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582623394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7KjT0CTZTWIUeOqi2YG+7sHvIjQlRTpL/HxX7X+vDAY=;
 b=DoiWIjQoJ06nXOiFLiKYeRw+/41k+OCocZSqINo8++H3xqPrEqjLbMmpLhZlIZ+eJ+M20+
 d6mJbzyeAxHphTK012oBjIa4+CzRoM1pQgi5AZawj8zxjWOvURgamJNbfechUnY11bkF2r
 J1u1RyaxA9VZdppFihYS4KZr+ZvJZGU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-VZprAT2fPmSkOQSJkdYqLw-1; Tue, 25 Feb 2020 04:36:30 -0500
X-MC-Unique: VZprAT2fPmSkOQSJkdYqLw-1
Received: by mail-ed1-f70.google.com with SMTP id k6so8657615edq.8
 for <qemu-trivial@nongnu.org>; Tue, 25 Feb 2020 01:36:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7KjT0CTZTWIUeOqi2YG+7sHvIjQlRTpL/HxX7X+vDAY=;
 b=fcc48u5YRUdHYsF3koUne/LS8sNXVnnjtiQsShllnpK7e/bhlwAZ0lkR4JFiok0Fzs
 Tpf2Vko5TNMK6I1TIxcP61M/km5v9nbZczsU1F0fKjDKVR3VlJMFNlts83312wSPzLq3
 7p99Xh7qLbeecREBJ9uOhwIMSnFDNzQL+B3SG5FgWHnwml4yQX8NdXwFiqPJ5t3jg3pG
 0EyAD3fGB2cyxEcv6J+puxDf8sK1ohEtOXwodtRC/JRfNyUuZ15YxAdWbjn95yxSu3zl
 BRTwAZiWFgQGWC5204BxRQ6sSuXvWjWCo9Y9uiOJRvLCPZ2IedyVNyrrAOfne7hdGzQf
 xSzA==
X-Gm-Message-State: APjAAAUAdEopnparB/fmJITH5a+8suH8SUPwhw0/o1nkDUX65PGoESA/
 Xp/cXE7bCMqpR6yTmzqJEPcrYS5DZgMHJ5v5U9G9tY96iqYqSx2YjuGgMvQqkcCHefYre/BNEQa
 /xf4PJiavrbObC5rb6A==
X-Received: by 2002:aa7:cf83:: with SMTP id z3mr49905223edx.166.1582623389080; 
 Tue, 25 Feb 2020 01:36:29 -0800 (PST)
X-Google-Smtp-Source: APXvYqzw8G34c00OGWinf9NomAlCgmCvPvI8D0k+BcfH4hKWZtKlk0loLyuXeKQysTNwCTQxdSf+Bg==
X-Received: by 2002:aa7:cf83:: with SMTP id z3mr49905203edx.166.1582623388888; 
 Tue, 25 Feb 2020 01:36:28 -0800 (PST)
Received: from [192.168.1.35] (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id j24sm1120838edr.57.2020.02.25.01.36.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2020 01:36:27 -0800 (PST)
Subject: Re: [PATCH 09/13] dma/xlnx-zdma: Remove redundant statement in
 zdma_write_dst()
To: kuhn.chenqun@huawei.com, qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org
References: <20200225020937.25028-1-kuhn.chenqun@huawei.com>
 <20200225020937.25028-10-kuhn.chenqun@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6d31ac16-adc6-235e-8784-51bf86e33b72@redhat.com>
Date: Tue, 25 Feb 2020 10:36:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200225020937.25028-10-kuhn.chenqun@huawei.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Tue, 25 Feb 2020 09:36:37 -0000

On 2/25/20 3:09 AM, kuhn.chenqun@huawei.com wrote:
> From: Chen Qun <kuhn.chenqun@huawei.com>
> 
> Clang static code analyzer show warning:
> hw/dma/xlnx-zdma.c:399:13: warning: Value stored to 'dst_type' is never read
>              dst_type = FIELD_EX32(s->dsc_dst.words[3], ZDMA_CH_DST_DSCR_WORD3,
>              ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> ---
> Cc: Alistair Francis <alistair@alistair23.me>
> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> ---
>   hw/dma/xlnx-zdma.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/hw/dma/xlnx-zdma.c b/hw/dma/xlnx-zdma.c
> index 8fb83f5b07..45355c5d59 100644
> --- a/hw/dma/xlnx-zdma.c
> +++ b/hw/dma/xlnx-zdma.c
> @@ -396,8 +396,6 @@ static void zdma_write_dst(XlnxZDMA *s, uint8_t *buf, uint32_t len)
>               zdma_load_descriptor(s, next, &s->dsc_dst);
>               dst_size = FIELD_EX32(s->dsc_dst.words[2], ZDMA_CH_DST_DSCR_WORD2,
>                                     SIZE);
> -            dst_type = FIELD_EX32(s->dsc_dst.words[3], ZDMA_CH_DST_DSCR_WORD3,
> -                                  TYPE);

Maybe move dst_type to this if() statement now?

>           }
>   
>           /* Match what hardware does by ignoring the dst_size and only using
> 


