Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1romGu-0005GX-M9
	for mharc-qemu-trivial@gnu.org; Mon, 25 Mar 2024 11:30:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1romGt-0005Fm-GL
 for qemu-trivial@nongnu.org; Mon, 25 Mar 2024 11:29:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1romGr-0000Jk-SX
 for qemu-trivial@nongnu.org; Mon, 25 Mar 2024 11:29:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711380596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kXdhjWLcZVSrCzqzMNe5+sdh72XKz5BSXFIujU5V2iM=;
 b=QgdmYOrW1REdXmDJCsBo0Yu46vQI8XxEQj7YTviPUJaIVhmyaFWDQhfo/utlKuS4Wx8KIP
 UUB1NtSURJXYVqYVQncifRw4d2pwRRzqRwrguoIO7+hLCrxc0DX4f09iWjBnSid/2V7Qj2
 kuRBh+pOMcgcKTvrldzNeQnHGlufvFA=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-357-mpqfBnwoNN-giy008wMOUQ-1; Mon, 25 Mar 2024 11:29:54 -0400
X-MC-Unique: mpqfBnwoNN-giy008wMOUQ-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2d6c94d98afso16520771fa.3
 for <qemu-trivial@nongnu.org>; Mon, 25 Mar 2024 08:29:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711380592; x=1711985392;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kXdhjWLcZVSrCzqzMNe5+sdh72XKz5BSXFIujU5V2iM=;
 b=Fxa7h2nvFRuWu2tWc1XG9GEP2Tuw4nAsPT8SDx2HBevI7WUitMZ/ugtwMXHi595SPY
 nIZRvgrfXn8dpNwihvZOidTlnOudU87JF2mJAlL3rAw5EG4674KleEsGZh4vkVfDM7Sl
 MG9ZYzHf8igzEtAoV1R6VeV2+hagqrDgRZywCkEeQWlsvVGiKpCUVNAQrVNMSeHuQOHA
 oKob+GGUFRiKDU7kSeUyoA//fMB66raOti9vzJY4li7o/hymiypPa57yVbgGLlX5fzsx
 qUDxdVIjtA1+/4cJ7wJt32+F2v9BpJPGjK07fsFsWivoYADqfuCyj3pItv+72D7iLIgL
 nSqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtkcSbwA75FjDp883eyKA85b8hMkACDxdsmHVp1hTleWclzewev9vimg7RJMAYJ6xsxtnkpbm5slmbtlHPzPJFTDBGOPD4UQ==
X-Gm-Message-State: AOJu0Yw4y5l0lb7hguUW6r6nxo/HlBEb92282x/PvIfXnAriSkNmQ4f1
 MMi4luRnuhdgbJq5T5l7ii0EHP5kbf51h0wxz4u1i5Xwj/GRc/4nZb77ThsSX+RjViysXSRqpDP
 jlMWKOZSfIxmkvQr/CDgm83KiVKeCgGHQfk0sCWKoQO53BFCnxKp1xEYQb+3vw4g=
X-Received: by 2002:a2e:7a0e:0:b0:2d6:cb40:e0a2 with SMTP id
 v14-20020a2e7a0e000000b002d6cb40e0a2mr98614ljc.53.1711380592403; 
 Mon, 25 Mar 2024 08:29:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHePtAuOG+6IWrEAQOeI4+FXXtjMz3xtZeNU9g/eXmDML9zOpwT7pAfuR78Cz1uUtTNtQxWlw==
X-Received: by 2002:a2e:7a0e:0:b0:2d6:cb40:e0a2 with SMTP id
 v14-20020a2e7a0e000000b002d6cb40e0a2mr98594ljc.53.1711380592053; 
 Mon, 25 Mar 2024 08:29:52 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 k2-20020a2e8882000000b002d2a710f864sm1498636lji.24.2024.03.25.08.29.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 08:29:51 -0700 (PDT)
Date: Mon, 25 Mar 2024 16:29:50 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, "Michael S . Tsirkin"
 <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>
Subject: Re: [PATCH trivial for-9.0] hw/i386/fw_cfg.c: fix non-legacy smbios
 build
Message-ID: <20240325162950.0b8f29c5@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240325130920.349521-1-mjt@tls.msk.ru>
References: <20240325130920.349521-1-mjt@tls.msk.ru>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.065,
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
X-List-Received-Date: Mon, 25 Mar 2024 15:29:59 -0000

On Mon, 25 Mar 2024 16:09:20 +0300
Michael Tokarev <mjt@tls.msk.ru> wrote:

> When building qemu with smbios but not legacy mode (eg minimal microvm build),
> link fails with:
> 
>   hw/i386/fw_cfg.c:74: undefined reference to `smbios_get_table_legacy'
> 
> This is because fw_cfg interface can call this function if CONFIG_SMBIOS
> is defined.  Made this code block to depend on CONFIG_SMBIOS_LEGACY.
> 
> Fixes: b42b0e4daaa5 "smbios: build legacy mode code only for 'pc' machine"
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>


hmh, it looks like MICROVM doesn't select SMBIOS nor FW_CFG_DMA

which looks broken to me,
does following help:

diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index a6ee052f9a..54c77b5bcc 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -119,6 +119,8 @@ config MICROVM
     select PCI_EXPRESS_GENERIC_BRIDGE
     select USB_XHCI_SYSBUS
     select I8254
+    select SMBIOS
+    select FW_CFG_DMA
 
 config X86_IOMMU
     bool


> ---
>  hw/i386/fw_cfg.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/i386/fw_cfg.c b/hw/i386/fw_cfg.c
> index d802d2787f..d5e78a9183 100644
> --- a/hw/i386/fw_cfg.c
> +++ b/hw/i386/fw_cfg.c
> @@ -70,6 +70,7 @@ void fw_cfg_build_smbios(PCMachineState *pcms, FWCfgState *fw_cfg,
>      /* tell smbios about cpuid version and features */
>      smbios_set_cpuid(cpu->env.cpuid_version, cpu->env.features[FEAT_1_EDX]);
>  
> +#ifdef CONFIG_SMBIOS_LEGACY
>      if (pcmc->smbios_legacy_mode) {
>          smbios_tables = smbios_get_table_legacy(&smbios_tables_len,
>                                                  &error_fatal);
> @@ -77,6 +78,7 @@ void fw_cfg_build_smbios(PCMachineState *pcms, FWCfgState *fw_cfg,
>                           smbios_tables, smbios_tables_len);
>          return;
>      }
> +#endif
>  
>      /* build the array of physical mem area from e820 table */
>      mem_array = g_malloc0(sizeof(*mem_array) * e820_get_num_entries());


