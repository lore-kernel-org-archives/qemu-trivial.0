Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pDTFr-0004Wg-KG
	for mharc-qemu-trivial@gnu.org; Thu, 05 Jan 2023 11:38:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDTFq-0004WL-Sk
 for qemu-trivial@nongnu.org; Thu, 05 Jan 2023 11:38:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDTFp-00010V-De
 for qemu-trivial@nongnu.org; Thu, 05 Jan 2023 11:38:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672936688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g4K+6AIWx6oVKkNJsy4CXAkubzvequbWzm6PO+UX1KA=;
 b=PRYvUrgWBDPc/TLghI+58Kij+l+g+QUE7oIzmpUo9oD7oRj0myK+0c/IF2v0KRtpf7weqa
 FMZkgOdgS/vhxEG/AI3XM3wVNto80fOm5SGmJOUo0H59r1ycj+/0fbBWvyjSeD5Qc2mYfH
 vrc6q9aK7GyrdW1dYXg8axVUk9SRUS0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-155-49VfwGO4PiSe2sxmtTDA-w-1; Thu, 05 Jan 2023 11:38:07 -0500
X-MC-Unique: 49VfwGO4PiSe2sxmtTDA-w-1
Received: by mail-ed1-f69.google.com with SMTP id
 x13-20020a05640226cd00b0047ac11c9774so23981173edd.17
 for <qemu-trivial@nongnu.org>; Thu, 05 Jan 2023 08:38:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g4K+6AIWx6oVKkNJsy4CXAkubzvequbWzm6PO+UX1KA=;
 b=2O6x4UzxBDpYb3/5AZy0zx7wYLQ0+3SRYWp1+sfSCOcqlRKCPNNN0MSboVnv5jej/L
 erWGOq5GzLURWgPy26M4IDCyLvLuXh4n4XXph+4u6btt5oNAsTNZrnvqznVt7aYaa2as
 cAOiU4+em2QlTzdikrN6A7ZFYlg6I+ivsbhpH3pkG8y1KcY2wOjc/gu9mUeDjDOnlWh4
 SlBYqIVKoG/TjKX4i0SwR3WYeP++oaAj83I41zoo7QBqdt9mp3xVppf9z22BwpGYH+zh
 fxEn0VUqwAhMCtVMCl/ZSzyVz1CoziVMFzt28rn3FC2pEUt+WtcXZcWVU/+IJaN+BeCE
 OdFw==
X-Gm-Message-State: AFqh2kqBC7WkpmlUiE+R9wqGRdPcsgGg3aqSQNnUA//7vR7cCzxGP+Zg
 h/6uYGBHuYIXhf5vvT1ego2WNEt4oSFyJ0V/tgKtSsojvMRvaoCKGd0cX8UYswYRmR4et4yirVG
 XuO+RQQ9+yDSipt8VLg==
X-Received: by 2002:a17:907:c296:b0:820:4046:1586 with SMTP id
 tk22-20020a170907c29600b0082040461586mr42690238ejc.12.1672936686646; 
 Thu, 05 Jan 2023 08:38:06 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs01fvCqDpW/OZFTTlNGe9yw6NjkGIbseW3hNTW4bh1A+B3ukkjni7VrAoxZcQ/az+vqtCT0Q==
X-Received: by 2002:a17:907:c296:b0:820:4046:1586 with SMTP id
 tk22-20020a170907c29600b0082040461586mr42690229ejc.12.1672936686470; 
 Thu, 05 Jan 2023 08:38:06 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 c17-20020a17090618b100b0084c723a626csm10992731ejf.209.2023.01.05.08.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:38:06 -0800 (PST)
Date: Thu, 5 Jan 2023 11:38:02 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH] hw/i386/pc: Remove unused 'owner' argument from
 pc_pci_as_mapping_init
Message-ID: <20230105113554-mutt-send-email-mst@kernel.org>
References: <20230105144044.51822-1-philmd@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20230105144044.51822-1-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 05 Jan 2023 16:38:11 -0000

On Thu, Jan 05, 2023 at 03:40:44PM +0100, Philippe Mathieu-Daudé wrote:
> This argument was added 9 years ago in commit 83d08f2673

add ("commit subject")

> and has never been used since, so remote it.

remote -> remove

> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  hw/i386/pc.c         | 2 +-
>  hw/pci-host/i440fx.c | 3 +--
>  hw/pci-host/q35.c    | 3 +--
>  include/hw/i386/pc.h | 2 +-
>  4 files changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index d489ecc0d1..6e592bd969 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -782,7 +782,7 @@ void pc_guest_info_init(PCMachineState *pcms)
>  }
>  
>  /* setup pci memory address space mapping into system address space */
> -void pc_pci_as_mapping_init(Object *owner, MemoryRegion *system_memory,
> +void pc_pci_as_mapping_init(MemoryRegion *system_memory,
>                              MemoryRegion *pci_address_space)
>  {
>      /* Set to lower priority than RAM */
> diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
> index d5426ef4a5..262f82c303 100644
> --- a/hw/pci-host/i440fx.c
> +++ b/hw/pci-host/i440fx.c
> @@ -272,8 +272,7 @@ PCIBus *i440fx_init(const char *pci_type,
>                       IO_APIC_DEFAULT_ADDRESS - 1);
>  
>      /* setup pci memory mapping */
> -    pc_pci_as_mapping_init(OBJECT(f), f->system_memory,
> -                           f->pci_address_space);
> +    pc_pci_as_mapping_init(f->system_memory, f->pci_address_space);
>  
>      /* if *disabled* show SMRAM to all CPUs */
>      memory_region_init_alias(&f->smram_region, OBJECT(d), "smram-region",
> diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
> index 20da121374..26390863d6 100644
> --- a/hw/pci-host/q35.c
> +++ b/hw/pci-host/q35.c
> @@ -574,8 +574,7 @@ static void mch_realize(PCIDevice *d, Error **errp)
>      }
>  
>      /* setup pci memory mapping */
> -    pc_pci_as_mapping_init(OBJECT(mch), mch->system_memory,
> -                           mch->pci_address_space);
> +    pc_pci_as_mapping_init(mch->system_memory, mch->pci_address_space);
>  
>      /* if *disabled* show SMRAM to all CPUs */
>      memory_region_init_alias(&mch->smram_region, OBJECT(mch), "smram-region",
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 991f905f5d..88a120bc23 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -156,7 +156,7 @@ void pc_guest_info_init(PCMachineState *pcms);
>  #define PCI_HOST_ABOVE_4G_MEM_SIZE     "above-4g-mem-size"
>  
>  
> -void pc_pci_as_mapping_init(Object *owner, MemoryRegion *system_memory,
> +void pc_pci_as_mapping_init(MemoryRegion *system_memory,
>                              MemoryRegion *pci_address_space);
>  
>  void xen_load_linux(PCMachineState *pcms);
> -- 
> 2.38.1


