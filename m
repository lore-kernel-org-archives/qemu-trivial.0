Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qnxC5-0006HU-EF
	for mharc-qemu-trivial@gnu.org; Wed, 04 Oct 2023 04:25:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1qnxC4-0006DV-9T
 for qemu-trivial@nongnu.org; Wed, 04 Oct 2023 04:25:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1qnxC2-0001yV-LE
 for qemu-trivial@nongnu.org; Wed, 04 Oct 2023 04:25:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696407917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1HFi+4XvaZgzW3fTljaqROcsaQzq+XO0ia+9DJlILs8=;
 b=FfmoMT1KC4Uyws4BDxFlHP3kqTO7pH2lDU7rC4tgmMSe663CvFQFtapFj/QLSFZSgA/vLd
 TbHWUAAVS90mefbIOtjG4pDtbx5xFK/o1lntVh6kZUgqq3u5LuayFVQbNpZO4638aQN2rT
 eCc3/LZZ5rsKmMJVNvvkRpoNw8XgtZE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-33-c-HfPxbJP1CO-uFTeJAnyA-1; Wed, 04 Oct 2023 04:25:16 -0400
X-MC-Unique: c-HfPxbJP1CO-uFTeJAnyA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4064b38dc63so2758365e9.1
 for <qemu-trivial@nongnu.org>; Wed, 04 Oct 2023 01:25:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696407915; x=1697012715;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1HFi+4XvaZgzW3fTljaqROcsaQzq+XO0ia+9DJlILs8=;
 b=ogQK29iQgql9ojLx8tHYctuhI74Q79SwCVOdyHSRaG1EocEyZ98JD5ogD7QQNQNWxT
 +ZF4JdG1YTP6Zh4yaELtprpD9X1mUR3fiB1TerXztezeKGxdtVw8vf32yKM/WHCV1T7r
 sV+YEwBne0dtnSHzCjr9NLLxUcHe7ygRgWluBaJrBTgY9LXMR4seLlMmLll1JwBxw8ca
 mSDjKzCadwe7038aGFrJzr8agNO5beetXAi70oqYvYwF3LV8sA+z3JTYAaDasVjraiNl
 /Y2VwylVSHAg+ADwM8uYTCJ/KqAXhYlcfRvINx5C5LOcpQxtXxQrha0xFUtpA5wIKSq5
 eysQ==
X-Gm-Message-State: AOJu0Yz8x3J8aOfpJk/VqOgV5Rdxs18vYQMe53898oDa/O1jKqkDRwFk
 aVA5wVqis1nnC56ic0Y3agFfzX8mjYu7o8lsephNZW285L+PUtWpDEQBWSEzOMdFNuSt9a+0k4C
 5ySJk+akjstE4YM+Eagf9XE2MPg==
X-Received: by 2002:a05:600c:218b:b0:405:784a:d53e with SMTP id
 e11-20020a05600c218b00b00405784ad53emr1025958wme.20.1696407915090; 
 Wed, 04 Oct 2023 01:25:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGH09tX8Nz/XYmAQDciwGBfpzoXPZH6OtnTj/T7YKc6bGAJwrznCrWCOlad3NadzlivXzDxdw==
X-Received: by 2002:a05:600c:218b:b0:405:784a:d53e with SMTP id
 e11-20020a05600c218b00b00405784ad53emr1025937wme.20.1696407914696; 
 Wed, 04 Oct 2023 01:25:14 -0700 (PDT)
Received: from redhat.com ([2.52.137.96]) by smtp.gmail.com with ESMTPSA id
 t14-20020a05600c198e00b0040531f5c51asm918375wmq.5.2023.10.04.01.25.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Oct 2023 01:25:13 -0700 (PDT)
Date: Wed, 4 Oct 2023 04:25:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-trivial@nongnu.org
Subject: Re: [PATCH] hw/virtio/virtio-pci: Avoid compiler warning with -Wshadow
Message-ID: <20231004042441-mutt-send-email-mst@kernel.org>
References: <20231004075536.48219-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20231004075536.48219-1-thuth@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 04 Oct 2023 08:25:20 -0000

On Wed, Oct 04, 2023 at 09:55:36AM +0200, Thomas Huth wrote:
> "len" is used as parameter of the function virtio_write_config()
> and as a local variable, so this causes a compiler warning
> when compiling with "-Wshadow" and can be confusing for the reader.
> Rename the local variable to "caplen" to avoid this problem.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

ok sure

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

feel free to merge with rest of -Wshadow things.

> ---
>  hw/virtio/virtio-pci.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index edbc0daa18..d0ef1edd66 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -780,15 +780,15 @@ static void virtio_write_config(PCIDevice *pci_dev, uint32_t address,
>                                                                    pci_cfg_data),
>                         sizeof cfg->pci_cfg_data)) {
>          uint32_t off;
> -        uint32_t len;
> +        uint32_t caplen;
>  
>          cfg = (void *)(proxy->pci_dev.config + proxy->config_cap);
>          off = le32_to_cpu(cfg->cap.offset);
> -        len = le32_to_cpu(cfg->cap.length);
> +        caplen = le32_to_cpu(cfg->cap.length);
>  
> -        if (len == 1 || len == 2 || len == 4) {
> -            assert(len <= sizeof cfg->pci_cfg_data);
> -            virtio_address_space_write(proxy, off, cfg->pci_cfg_data, len);
> +        if (caplen == 1 || caplen == 2 || caplen == 4) {
> +            assert(caplen <= sizeof cfg->pci_cfg_data);
> +            virtio_address_space_write(proxy, off, cfg->pci_cfg_data, caplen);
>          }
>      }
>  }
> -- 
> 2.41.0


