Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oqUJ5-0002s4-Q3
	for mharc-qemu-trivial@gnu.org; Thu, 03 Nov 2022 03:06:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oqUJ4-0002rs-Dp
 for qemu-trivial@nongnu.org; Thu, 03 Nov 2022 03:06:30 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oqUJ2-0006Jx-TA
 for qemu-trivial@nongnu.org; Thu, 03 Nov 2022 03:06:30 -0400
Received: by mail-wr1-x42d.google.com with SMTP id j15so1288280wrq.3
 for <qemu-trivial@nongnu.org>; Thu, 03 Nov 2022 00:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xmmt1VFgqqmw3JbVsjL9/NxTUd7IhQvG2sty4Lc05eo=;
 b=g+vduDRgyLTEuHL11jfx5u+irKIrkrIPyEQDqJmTk5EB9SqfJxUeh41MpJ3av6MVuS
 YZlVb/Ki1edprcJTTS9FU9XS2jRjHTWMTAzKqAofTvLyIrqGMS/KqQuoIOoUMjfyXS/v
 r6z85yG+hGRa5sd3ykvYN7y8Ebzm8I5kXG28c5d77N8LwfoyEU+Hgnn9igqQvJJVIJCV
 odj8Dszpan35T3gYyhSkO+yZX4Pfzwk6VaIENqn6dRgD3xJn/KzbnVfvVFPwPnFIsA5H
 lcJ+3qihJ4iRhCDl5IpdiOdDom+Tq7tEH543JCryfUfa2Q3at7nXhN/QzDoitRXZa9HR
 Ek/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xmmt1VFgqqmw3JbVsjL9/NxTUd7IhQvG2sty4Lc05eo=;
 b=Pt06sEDU2newwVvnEOMxhArPAl8qBH1RVmPuh4DgzzaITIvF6Xbi5TK3NiC8sTPnFj
 n7ijrECTB8fKchy3DSBTygbffQbzdbAVDXWcsarqOTBI0FZ9qT/BD70Uea/mI03Zf/M3
 DlJkdouuuQLzWJ6T7JJiggCTrBOfF9tivb//W7vIBlUd4/JlVKOlPULfu6bosBBirIyP
 gs9/8dAvVkayLuJIrB9worcGddwlnra0DpEy9rQ+HEF0jop7SZ83Nr8LeiF9teMMhSxX
 ell1qWZu8YwvgjSMQ/QUaZ1EHoakp6BIyueee65NTtN07pWCbvT7OrK2euPTicObZgFq
 +GaQ==
X-Gm-Message-State: ACrzQf0kqfvdPby1zPelqFjgH6GswNS9VG0Ulg/0o7XCfNS5ob5tpTMg
 DcSf4e18X6CoQaamkvC4qc7NpA==
X-Google-Smtp-Source: AMsMyM7oxd5Ax01H/F5np74378P9Sz7Eysm6ZMStzIgrtRHC6vlX5r/Y2c/4djj8RpDDHVVD/wUXYQ==
X-Received: by 2002:a05:6000:614:b0:236:747d:47d5 with SMTP id
 bn20-20020a056000061400b00236747d47d5mr17643357wrb.457.1667459186827; 
 Thu, 03 Nov 2022 00:06:26 -0700 (PDT)
Received: from [192.168.11.175] (216.red-88-29-181.dynamicip.rima-tde.net.
 [88.29.181.216]) by smtp.gmail.com with ESMTPSA id
 e6-20020a5d65c6000000b00236cb3fec8fsm40147wrw.9.2022.11.03.00.06.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 00:06:25 -0700 (PDT)
Message-ID: <3827e4e1-c095-25a4-9836-88972cc4a7ef@linaro.org>
Date: Thu, 3 Nov 2022 08:06:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH] tests/qtest/libqos/e1000e: Refer common PCI ID definitions
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20221103015017.19947-1-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221103015017.19947-1-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 03 Nov 2022 07:06:30 -0000

On 3/11/22 02:50, Akihiko Odaki wrote:
> This is yet another minor cleanup to ease understanding and
> future refactoring of the tests.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   tests/qtest/libqos/e1000e.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/qtest/libqos/e1000e.c b/tests/qtest/libqos/e1000e.c
> index 2ea5db65d8..1f2ccccb8f 100644
> --- a/tests/qtest/libqos/e1000e.c
> +++ b/tests/qtest/libqos/e1000e.c
> @@ -18,6 +18,7 @@
>   
>   #include "qemu/osdep.h"
>   #include "hw/net/e1000_regs.h"
> +#include "hw/pci/pci_ids.h"
>   #include "../libqtest.h"
>   #include "pci-pc.h"
>   #include "qemu/sockets.h"
> @@ -217,8 +218,8 @@ static void *e1000e_pci_create(void *pci_bus, QGuestAllocator *alloc,
>   static void e1000e_register_nodes(void)
>   {
>       QPCIAddress addr = {
> -        .vendor_id = 0x8086,
> -        .device_id = 0x10D3,
> +        .vendor_id = PCI_VENDOR_ID_INTEL,
> +        .device_id = E1000_DEV_ID_82574L,
>       };
>   
>       /* FIXME: every test using this node needs to setup a -netdev socket,id=hs0

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


