Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l6yi2-0006RX-3o
	for mharc-qemu-trivial@gnu.org; Tue, 02 Feb 2021 11:39:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l6yhy-0006O3-V8
 for qemu-trivial@nongnu.org; Tue, 02 Feb 2021 11:39:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l6yhw-0004tY-3C
 for qemu-trivial@nongnu.org; Tue, 02 Feb 2021 11:39:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612283955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=upnt39CyCVwBoTycKyW7rsDh22PJi9fn/RtxLu9lyuM=;
 b=XJIj4CVuOXIbXba3uXtKtrnaOq+uQ44BWiothUsTonfEyZyMDOa0wyaJllX1KM1j0rebSs
 NlRe+86rO/kD88PQ7gQREl3DxCPnGaQ2Hj933Hz4irAPL7Mnhg2XCCDqasiOG6JkOTsAj6
 GbrJ964JhnmSXAV8qWOtJl8Gq46V168=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-kXTkBCESPrSGOuZBk_zEdg-1; Tue, 02 Feb 2021 11:39:13 -0500
X-MC-Unique: kXTkBCESPrSGOuZBk_zEdg-1
Received: by mail-ej1-f69.google.com with SMTP id k3so10222655ejr.16
 for <qemu-trivial@nongnu.org>; Tue, 02 Feb 2021 08:39:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=upnt39CyCVwBoTycKyW7rsDh22PJi9fn/RtxLu9lyuM=;
 b=e8uIg7tNS7xwwU103975qtRnvmTuGBqkU1KFHNIckxSpksvzmLxQ5oho38Gn24ax1Y
 o4ihpxYkeWJIte9aIi+Fy2ydmYvLHnpLwpUW2/CKUtESxlKvvuWknH8PB7TApfGYlSn6
 fQF4zMm0ODaJNnJAjBHX1NdClVDupyKmSTvywKqoJ7pK3V/PjZYkLPXGwP+lchopX5uQ
 i+FrX+mZp65i2nvnjwFp61VMQKzdcE0p6eYwmwpzy1h5erct7Dg6XFUPoDw8u3E7Adpc
 ENUNQ1Tb9tPmeeE5voe0eApCZrS34D2/rARsFr0On7w7ZCmuRFr6xofKLpsoxZX5vDu/
 oaKg==
X-Gm-Message-State: AOAM532ZYGueTnI6jemX0cPG8A8iMErxkn90urnsWwJ0FGHVg7P+g8U2
 wMgjpchtvrXT4KsTmtpe6FCLfnz2TL1CoUlLkfaRLnchpDNwMC0m/aYlLKt4t+QJGmrs3FmAYje
 5QpYFUfIS+rXyV0Mys8BfHSNuvqXqeKtgi4LKlSe15+YAPhsMv48dU6Qs7yCTuK4AHtFTvA==
X-Received: by 2002:a17:906:c049:: with SMTP id
 bm9mr22307626ejb.535.1612283951927; 
 Tue, 02 Feb 2021 08:39:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz2tklvRYuU9l0qDykZvY93YU17wJ9cDOV5rFXjVQAhMAYZL/Panns/oGzBvmoCNoRhjmIqiA==
X-Received: by 2002:a17:906:c049:: with SMTP id
 bm9mr22307596ejb.535.1612283951672; 
 Tue, 02 Feb 2021 08:39:11 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id b1sm3313895eju.15.2021.02.02.08.39.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Feb 2021 08:39:10 -0800 (PST)
Subject: Re: [PATCH] hw/i386/xen: Remove dead code
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
References: <20210202155644.998812-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <13e06470-e13d-31ef-f7a7-9370a01d8b1c@redhat.com>
Date: Tue, 2 Feb 2021 17:39:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210202155644.998812-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 02 Feb 2021 16:39:19 -0000

On 02/02/21 16:56, Philippe Mathieu-Daudé wrote:
> 'drivers_blacklisted' is never accessed, remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   hw/i386/xen/xen_platform.c | 13 ++-----------
>   1 file changed, 2 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
> index 7c4db35debb..01ae1fb1618 100644
> --- a/hw/i386/xen/xen_platform.c
> +++ b/hw/i386/xen/xen_platform.c
> @@ -60,7 +60,6 @@ struct PCIXenPlatformState {
>       MemoryRegion bar;
>       MemoryRegion mmio_bar;
>       uint8_t flags; /* used only for version_id == 2 */
> -    int drivers_blacklisted;
>       uint16_t driver_product_version;
>   
>       /* Log from guest drivers */
> @@ -245,18 +244,10 @@ static void platform_fixed_ioport_writeb(void *opaque, uint32_t addr, uint32_t v
>   
>   static uint32_t platform_fixed_ioport_readw(void *opaque, uint32_t addr)
>   {
> -    PCIXenPlatformState *s = opaque;
> -
>       switch (addr) {
>       case 0:
> -        if (s->drivers_blacklisted) {
> -            /* The drivers will recognise this magic number and refuse
> -             * to do anything. */
> -            return 0xd249;
> -        } else {
> -            /* Magic value so that you can identify the interface. */
> -            return 0x49d2;
> -        }
> +        /* Magic value so that you can identify the interface. */
> +        return 0x49d2;
>       default:
>           return 0xffff;
>       }
> 

Cc: qemu-trivial@nongnu.org


