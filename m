Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIPwA-0000wV-PW
	for mharc-qemu-trivial@gnu.org; Thu, 19 Jan 2023 03:06:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pIPw8-0000w4-Fk
 for qemu-trivial@nongnu.org; Thu, 19 Jan 2023 03:06:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pIPvm-0001mu-HC
 for qemu-trivial@nongnu.org; Thu, 19 Jan 2023 03:06:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674115455;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tJ/9xHZClFctyMKhjMFBoHIMe6ziuEM5qs/YV83DNd8=;
 b=MFGFQ5K2aNKhJSd5zlTHtaS4jKpizoA4N+lJUZ3XPOKaE/+hzcFLl+A1e9Tq1KK+lxPK6i
 dB8Ktaggo0fnBm6QhkBx5kGTflywwuk1JF8ap7KxMnSi/e03nqB/0hpiDLjFj8hRn/aR4z
 RjK5NXcxhuuj5aE0ZkYVN5jw0tGfOTQ=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-467-7pSTmLAaMu22-cy-NQ5dsQ-1; Thu, 19 Jan 2023 03:04:14 -0500
X-MC-Unique: 7pSTmLAaMu22-cy-NQ5dsQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 y6-20020a0cec06000000b005346d388b7aso634921qvo.6
 for <qemu-trivial@nongnu.org>; Thu, 19 Jan 2023 00:04:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tJ/9xHZClFctyMKhjMFBoHIMe6ziuEM5qs/YV83DNd8=;
 b=vrW8yPMGGAbNrW/1358kp2/ybZ8gC0QjuwHTZ1VtmTwCCRk8YLWnacnruSFcILAWpO
 JE+iDp85prwVQL17NhdLTmWiCJ7wN2lRvE6fBio8yZ1Pr91HaEOmxhdduxOWHWlGKV1D
 eoRtIbXTIm5zs7Cy5p3VFv/f+SfZ2XxNEM4fPtFvgZLHLEAjzHph6myxYLlsuGHWwCOP
 FRkrk9wzdK0t1sSeUWhMhdI2G2xt+4dWItOSrQ3v3qZ4nd+aq/bzWkVX1fZG9qb+KiQ9
 AEgu24kNYpBPdRxVpiqNWf+PhBllR8Fsi+HTmj3tiPTGtLhvdoUmi/DBmBg+yKAp4B5F
 gJDw==
X-Gm-Message-State: AFqh2koZglTqcL3xq9GTNxOMbGnJaYFKfq/+aPnhmhZusGoY+5WHdskM
 B2be90kQFMhV2Q/bplyR0GiNpLHBnlgFGJfrqpTP2YCUn4uJUBm1pjuTO+txutUPesPjxfN+Qao
 RJpAdTQJqSiMArJ80Mw==
X-Received: by 2002:ac8:44a7:0:b0:3b1:54da:d629 with SMTP id
 a7-20020ac844a7000000b003b154dad629mr12762034qto.34.1674115453778; 
 Thu, 19 Jan 2023 00:04:13 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsnr5HB7Yf1o+89+VVAt0oNSLG81nLt2qEcG+EZ303+vDKJndPp2ozbrP7uZTwr717MBRPoTw==
X-Received: by 2002:ac8:44a7:0:b0:3b1:54da:d629 with SMTP id
 a7-20020ac844a7000000b003b154dad629mr12762004qto.34.1674115453498; 
 Thu, 19 Jan 2023 00:04:13 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 e25-20020ac86719000000b003b2d890752dsm3228569qtp.88.2023.01.19.00.04.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 00:04:12 -0800 (PST)
Message-ID: <692489e7-6ed3-4bd7-9813-0d320f4f5be9@redhat.com>
Date: Thu, 19 Jan 2023 09:04:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH] hw: Use TYPE_PCI_BUS definition where appropriate
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230117193014.83502-1-philmd@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230117193014.83502-1-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 19 Jan 2023 08:06:16 -0000

Hi Philippe,

On 1/17/23 20:30, Philippe Mathieu-Daudé wrote:
> Use the proper QOM type definition instead of magic string.
> This also helps during eventual refactor while using git-grep.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
>  hw/arm/smmu-common.c     | 3 ++-
>  hw/virtio/virtio-iommu.c | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 54186f31cb..733c964778 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -535,7 +535,8 @@ static void smmu_base_reset_hold(Object *obj)
>  
>  static Property smmu_dev_properties[] = {
>      DEFINE_PROP_UINT8("bus_num", SMMUState, bus_num, 0),
> -    DEFINE_PROP_LINK("primary-bus", SMMUState, primary_bus, "PCI", PCIBus *),
> +    DEFINE_PROP_LINK("primary-bus", SMMUState, primary_bus,
> +                     TYPE_PCI_BUS, PCIBus *),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index 23c470977e..1cd258135d 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -1366,7 +1366,8 @@ static const VMStateDescription vmstate_virtio_iommu = {
>  };
>  
>  static Property virtio_iommu_properties[] = {
> -    DEFINE_PROP_LINK("primary-bus", VirtIOIOMMU, primary_bus, "PCI", PCIBus *),
> +    DEFINE_PROP_LINK("primary-bus", VirtIOIOMMU, primary_bus,
> +                     TYPE_PCI_BUS, PCIBus *),
>      DEFINE_PROP_BOOL("boot-bypass", VirtIOIOMMU, boot_bypass, true),
>      DEFINE_PROP_END_OF_LIST(),
>  };


