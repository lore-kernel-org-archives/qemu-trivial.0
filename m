Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sesB9-0007Ka-En
	for mharc-qemu-trivial@gnu.org; Fri, 16 Aug 2024 04:19:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1sesB8-0007Fl-Bn
 for qemu-trivial@nongnu.org; Fri, 16 Aug 2024 04:19:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1sesB6-0003aF-Ix
 for qemu-trivial@nongnu.org; Fri, 16 Aug 2024 04:19:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723796359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MjGlFvMeZNehK1w5wtaKUP74GiBi92a6em/Iv+rrTAo=;
 b=HrfIgJt4K//cdCwJFtubkeAzldorZ6J4pUF3TGebC7Pflzv5gR6gQzfTeEIj0NOR/slBs8
 k8LY9Xnm5XshrbrmPa6vUgJQywVqzrIHP5RbEnkz0poiCaIZoT/Neb1e01pXXieTQltZ9J
 9wViCbUxkpddDmzrxPSdcKuWknH2+PA=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-VWFlNV5-O9mhKKCJro23fA-1; Fri, 16 Aug 2024 04:19:17 -0400
X-MC-Unique: VWFlNV5-O9mhKKCJro23fA-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-52efd58cc5dso1875290e87.1
 for <qemu-trivial@nongnu.org>; Fri, 16 Aug 2024 01:19:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723796356; x=1724401156;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MjGlFvMeZNehK1w5wtaKUP74GiBi92a6em/Iv+rrTAo=;
 b=ikQu2+j9egBLepye6DcpELMU6fupM11rOM2icE96FjER3uMuStRenyzEKCcBVZefCO
 Qa+YnuMF37Vp+MMDAN7Hx42PsCrZFUdFgqbGUTklN4R711QKg3JD3alhhpZslG4rrhYz
 PhpjTldAe18EMF3z2EqOW+n64cvkay88YsVFsdGPR3KfRx7gpD9jD6H1a50NJSzZRg53
 3s2LXr//58TtW5hDqY0FMenv3Zaf9Ka2ExDH4AntO+g/xIGChw9cx7cf/oC97+hwjI9F
 r7tHu/9OF+2AT7b3zM3iMP46lYUox93CDhIPwls9MBc+sX3n9uxgrCdICu1Sug0G8kL1
 obig==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXPUY3zNzEY27JjD9QrVuq1bbHjU5u6gBB+w72kG12LZ1GdzqDiitWXM1SpVQtCYF/DQ+/ZxEwpfOXeEozkdEgVa2RLvBg6w==
X-Gm-Message-State: AOJu0Yz2J5znc3wPT5Tf6AK1gvhqMkpMsc+L1YsIF6Ntcay2RkyaHcHk
 +hYqQBsJFNurlIUvZn6WSyCDNlgVGPWnbNxDqHUVV69yQYTJb1366mwnAuuB6dSiy3VLO/341po
 0KgLeJzWb0tR9D6UYbQiVIlD6HGhO7ONUUIbekeBJG+vtMEh/ZK67I5M=
X-Received: by 2002:a05:6512:1085:b0:52c:a016:5405 with SMTP id
 2adb3069b0e04-5331c6914a6mr1571269e87.8.1723796355766; 
 Fri, 16 Aug 2024 01:19:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETUpoGQAUzUH4RwR7T53nNjTGrischl3/TwsHI0X5+ohyTf+2GXpQiTYjm3/yLiMF/VyElPg==
X-Received: by 2002:a05:6512:1085:b0:52c:a016:5405 with SMTP id
 2adb3069b0e04-5331c6914a6mr1571230e87.8.1723796354919; 
 Fri, 16 Aug 2024 01:19:14 -0700 (PDT)
Received: from redhat.com ([2a02:14f:17d:3378:6322:e9ee:713:b9ed])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a83838cfaffsm218902366b.76.2024.08.16.01.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2024 01:19:14 -0700 (PDT)
Date: Fri, 16 Aug 2024 04:19:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Kamil =?utf-8?Q?Szcz=C4=99k?= <kamil@szczek.dev>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Joelle van Dyne <j@getutm.app>, Bernhard Beschow <shentey@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH-for-9.1 v2] hw/i386/pc: Ensure vmport prerequisites are
 fulfilled
Message-ID: <20240816041900-mutt-send-email-mst@kernel.org>
References: <CJaQOvoJMl8P04F7-0Pk23paXt29GnSt2ICM-xlruQ9rGsMHocU_xH3RRaRRJEQpqUxGo63sATZb5St7968jHLV0r7NORODN3zHgi_qxpPE=@szczek.dev>
MIME-Version: 1.0
In-Reply-To: <CJaQOvoJMl8P04F7-0Pk23paXt29GnSt2ICM-xlruQ9rGsMHocU_xH3RRaRRJEQpqUxGo63sATZb5St7968jHLV0r7NORODN3zHgi_qxpPE=@szczek.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.131,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 16 Aug 2024 08:19:22 -0000

On Fri, Aug 16, 2024 at 08:01:26AM +0000, Kamil Szczęk wrote:
> Since commit 4ccd5fe22feb95137d325f422016a6473541fe9f ('pc: add option
> to disable PS/2 mouse/keyboard'), the vmport will not be created unless
> the i8042 PS/2 controller is enabled. To avoid confusion, let's fail if
> vmport was explicitly requested, but the i8042 controller is disabled.
> This also changes the behavior of vmport=auto to take i8042 controller
> availability into account.
> 
> Signed-off-by: Kamil Szczęk <kamil@szczek.dev>


tagged, thanks!

> ---
>  hw/i386/pc.c      | 8 ++++++--
>  hw/i386/pc_piix.c | 3 ++-
>  hw/i386/pc_q35.c  | 2 +-
>  qemu-options.hx   | 4 ++--
>  4 files changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index c74931d577..c99f2ce540 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1075,7 +1075,7 @@ static const MemoryRegionOps ioportF0_io_ops = {
>  };
>  
>  static void pc_superio_init(ISABus *isa_bus, bool create_fdctrl,
> -                            bool create_i8042, bool no_vmport)
> +                            bool create_i8042, bool no_vmport, Error **errp)
>  {
>      int i;
>      DriveInfo *fd[MAX_FD];
> @@ -1100,6 +1100,10 @@ static void pc_superio_init(ISABus *isa_bus, bool create_fdctrl,
>      }
>  
>      if (!create_i8042) {
> +        if (!no_vmport) {
> +            error_setg(errp,
> +                       "vmport requires the i8042 controller to be enabled");
> +        }
>          return;
>      }
>  
> @@ -1219,7 +1223,7 @@ void pc_basic_device_init(struct PCMachineState *pcms,
>  
>      /* Super I/O */
>      pc_superio_init(isa_bus, create_fdctrl, pcms->i8042_enabled,
> -                    pcms->vmport != ON_OFF_AUTO_ON);
> +                    pcms->vmport != ON_OFF_AUTO_ON, &error_fatal);
>  }
>  
>  void pc_nic_init(PCMachineClass *pcmc, ISABus *isa_bus, PCIBus *pci_bus)
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index d9e69243b4..cf2e2e3e30 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -312,7 +312,8 @@ static void pc_init1(MachineState *machine, const char *pci_type)
>  
>      assert(pcms->vmport != ON_OFF_AUTO__MAX);
>      if (pcms->vmport == ON_OFF_AUTO_AUTO) {
> -        pcms->vmport = xen_enabled() ? ON_OFF_AUTO_OFF : ON_OFF_AUTO_ON;
> +        pcms->vmport = (xen_enabled() || !pcms->i8042_enabled)
> +            ? ON_OFF_AUTO_OFF : ON_OFF_AUTO_ON;
>      }
>  
>      /* init basic PC hardware */
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 9d108b194e..6c112d804d 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -278,7 +278,7 @@ static void pc_q35_init(MachineState *machine)
>  
>      assert(pcms->vmport != ON_OFF_AUTO__MAX);
>      if (pcms->vmport == ON_OFF_AUTO_AUTO) {
> -        pcms->vmport = ON_OFF_AUTO_ON;
> +        pcms->vmport = pcms->i8042_enabled ? ON_OFF_AUTO_ON : ON_OFF_AUTO_OFF;
>      }
>  
>      /* init basic PC hardware */
> diff --git a/qemu-options.hx b/qemu-options.hx
> index cee0da2014..0bc780a669 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -68,8 +68,8 @@ SRST
>  
>      ``vmport=on|off|auto``
>          Enables emulation of VMWare IO port, for vmmouse etc. auto says
> -        to select the value based on accel. For accel=xen the default is
> -        off otherwise the default is on.
> +        to select the value based on accel and i8042. For accel=xen
> +        and/or i8042=off the default is off otherwise the default is on.
>  
>      ``dump-guest-core=on|off``
>          Include guest memory in a core dump. The default is on.
> -- 
> 2.45.0
> 


