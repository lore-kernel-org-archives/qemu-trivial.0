Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qnyVF-0003OQ-8B
	for mharc-qemu-trivial@gnu.org; Wed, 04 Oct 2023 05:49:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qnyVE-0003O9-Il
 for qemu-trivial@nongnu.org; Wed, 04 Oct 2023 05:49:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qnyVD-0008Mg-2t
 for qemu-trivial@nongnu.org; Wed, 04 Oct 2023 05:49:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696412950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pm/DtyYHeZRb1EslrlRBvgIX5Yx2sC1Cfhq7VKNRRy8=;
 b=RVcbyHXVdYRKebVCfxQ06wZfBirse19ztUjRZustVG9cpdF2NXd4VMSQMX38TjKxKyiy7a
 vn5Z1/ZzkfeT/VxtD6X7SxaJUPfS+8mQZwUWbm03jOY1xRGC6CfwPAFg/exSSqZmKqGCw5
 wQDCTAEhsyM7q897MnIMa2pRqsJUtMw=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-14-5u0FLB5rO5O1unxiCH32KQ-1; Wed, 04 Oct 2023 05:49:09 -0400
X-MC-Unique: 5u0FLB5rO5O1unxiCH32KQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-77422b0e373so228865985a.3
 for <qemu-trivial@nongnu.org>; Wed, 04 Oct 2023 02:49:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696412948; x=1697017748;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Pm/DtyYHeZRb1EslrlRBvgIX5Yx2sC1Cfhq7VKNRRy8=;
 b=OFy32jntYDu0IYPLGO7LB2FBZAO/2i+1XDxNp4B+YhVrdSOIhWuaPiMEBu0ocAKAaY
 HlQZ1wpb5Nl+EVXE+CuANKvmJ8Q0gBG2RuM9eEw2PUBOxENp+MafyRSrTD2KGoQ/xDxG
 1v30+V5dpVYPdCfSbmx56XICXOYXla6K7Wzz0ckH2Vlv0gJxaS35LLuXM0zyGJCwPcwy
 4L0mJT7l1VwWTAiql48Sf8JonNOSwYEP7G3hmPV1NZVgSpiohdyQVM1zrroKAd/jXWml
 hI6bkOepdrI0AvJPgbH0S0+vhZb2yjJe/2TSYzsCH91tS6+ViONrcHlJ88ZN7Z+vOGKI
 gWUg==
X-Gm-Message-State: AOJu0Yz9X3d2vhVyF85aXj2Xv2go+SASEy3bTLVOSuMYDBLsfd0wD/r2
 fgDh3wevP/+i90Vcqms8Q/M0Uy8c9urMO7en6JRoQMQYPvPleOF6Y7vTADvAiVssCWacxBm7FO0
 3WgD+snz30xgeOj1dRg==
X-Received: by 2002:a05:620a:254c:b0:760:7760:fdaa with SMTP id
 s12-20020a05620a254c00b007607760fdaamr2193815qko.12.1696412948594; 
 Wed, 04 Oct 2023 02:49:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzgWzi1apz0z6CkltKLAtLmRej02bCMsWm2cTmUt/PJdzC9FoGb0es/AElCGg0kPjZY9jqwg==
X-Received: by 2002:a05:620a:254c:b0:760:7760:fdaa with SMTP id
 s12-20020a05620a254c00b007607760fdaamr2193801qko.12.1696412948342; 
 Wed, 04 Oct 2023 02:49:08 -0700 (PDT)
Received: from [10.33.192.181] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 c7-20020ae9e207000000b007757acf488esm1136909qkc.39.2023.10.04.02.49.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Oct 2023 02:49:08 -0700 (PDT)
Message-ID: <bbda26f2-28cf-a52e-1622-95afc6638eac@redhat.com>
Date: Wed, 4 Oct 2023 11:49:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] hw/virtio/virtio-pci: Avoid compiler warning with -Wshadow
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-trivial@nongnu.org
References: <20231004075536.48219-1-thuth@redhat.com>
In-Reply-To: <20231004075536.48219-1-thuth@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 04 Oct 2023 09:49:12 -0000

On 04/10/2023 09.55, Thomas Huth wrote:
> "len" is used as parameter of the function virtio_write_config()
> and as a local variable, so this causes a compiler warning
> when compiling with "-Wshadow" and can be confusing for the reader.
> Rename the local variable to "caplen" to avoid this problem.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   hw/virtio/virtio-pci.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index edbc0daa18..d0ef1edd66 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -780,15 +780,15 @@ static void virtio_write_config(PCIDevice *pci_dev, uint32_t address,
>                                                                     pci_cfg_data),
>                          sizeof cfg->pci_cfg_data)) {
>           uint32_t off;
> -        uint32_t len;
> +        uint32_t caplen;
>   
>           cfg = (void *)(proxy->pci_dev.config + proxy->config_cap);
>           off = le32_to_cpu(cfg->cap.offset);
> -        len = le32_to_cpu(cfg->cap.length);
> +        caplen = le32_to_cpu(cfg->cap.length);
>   
> -        if (len == 1 || len == 2 || len == 4) {
> -            assert(len <= sizeof cfg->pci_cfg_data);
> -            virtio_address_space_write(proxy, off, cfg->pci_cfg_data, len);
> +        if (caplen == 1 || caplen == 2 || caplen == 4) {
> +            assert(caplen <= sizeof cfg->pci_cfg_data);
> +            virtio_address_space_write(proxy, off, cfg->pci_cfg_data, caplen);
>           }
>       }
>   }

Ooops, there is a second warning in this file, in the virtio_read_config() 
... I somehow missed that in the crowded console output, sorry. I'll send a v2.

  Thomas


