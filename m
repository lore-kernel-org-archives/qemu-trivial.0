Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73EDCCD5BD0
	for <qemu-trivial@archiver.kernel.org>; Wed, 27 May 2026 14:20:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wSF7P-00087d-7e; Wed, 27 May 2026 10:20:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wSF7J-00080x-Hu
 for qemu-trivial@nongnu.org; Wed, 27 May 2026 10:20:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wSF7G-0000n3-S4
 for qemu-trivial@nongnu.org; Wed, 27 May 2026 10:20:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779891612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/CyR+hoe9vR314KuvqQ15RZNDTK8wLvlM1fSxzpZ7X4=;
 b=QwaXXMQPvA+pHxzPJkRtdo0/0a6NF0vhgLiMMLMNwRsZmqZ+5PoDbKpLJTMFuUOlWb4t9k
 lhpO4GvGoWqJ9D1QUqX4EEp9C+wYG5+gsZTqI1In3+BdhT6Go8miFHUpi0ZyO+5bgFgQL6
 Wjmdlp0LN7GItzufnYlcLeXd84pUZB0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-110-oWl1JKLHMAGm-Y2zMA95yg-1; Wed, 27 May 2026 10:20:06 -0400
X-MC-Unique: oWl1JKLHMAGm-Y2zMA95yg-1
X-Mimecast-MFC-AGG-ID: oWl1JKLHMAGm-Y2zMA95yg_1779891605
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-49048bcbeb8so61392725e9.2
 for <qemu-trivial@nongnu.org>; Wed, 27 May 2026 07:20:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779891605; x=1780496405;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/CyR+hoe9vR314KuvqQ15RZNDTK8wLvlM1fSxzpZ7X4=;
 b=nUV1CI+O0IMhHSdxpyyfGcJzFQsU19/RByS3qRPCO+MHnzLd4cKREcLr7JDGqKpyfn
 MNZEKcXKlUF0TX2RiKRSlhnSaD9lMvAk7xEO/P583SL4oHLUh7EjrRQWLuIEet3LeVYx
 r260U35armmFUt1ChReq2dmLeS4JSFphWKRR3GRwDmfpw42kKs2N55etEHRx3iXIQwT/
 6xYsRbNg8fRbSZTkKVxWggfyxeiqjS6qmSMGl0dnkOxc3Penu4rLSZ415rw8lggByGWn
 c1hVDcp00EOrG9kAwiiWTiTHN15eYC3WsGRCuiRbbMveQTvFk/wRWcqxJUtnIL93nixS
 DwpA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/LO51sTJmR4U3Moel9HZ/xb1mGR/RtSHA2SsjxLIEwjx3F3z7neGc8eJGuMg56aozORa/6tuMN2rYTxe0=@nongnu.org
X-Gm-Message-State: AOJu0YzGL/VE9rq+JPhioRVz2glE0rVb08qsoLiix93DCZLVuWAWyxlz
 iF6UG5NuVMLRgLXbopNw5YibdFKSjS5ZJotQIqFY1wwJ7pat4LX/ESduCNJQFH3AMi0qRThBnNW
 QuDOnaaTR63eq3NWJ15AXb2aY2UjI6OTNk6DSmEVqN9zEfXL44U2OxigktJ0=
X-Gm-Gg: Acq92OFduv5FeusBSGjqLoF6qFD8Z6ywKrjRWcrpN/3mArz9JcMhfJPNT/w16cUtlHi
 CkPr9rHbgwSQMC1OKdR6rN/6PgGtCFtcbkFfOelRaMP7olGos3hYUvyGnbxFkhxFYvezyjTEXEw
 LeSZvVM3Fc2zaBA5aEXiOVahPW/aZ6iuOaWp+uWzamIQikQqbm6o1Rx+Oood/MqJ6ObXNPhFQ95
 mYVfCaGOzcAjjxYE+LWr6Hf+zfaBagZsP/drrZjISICOYcHZtBNEmePWrFeRBSwNsnTjJt9iWkT
 7Ehq5v+Si4uhapulQPu7RFOhzFzyCs/47WgFe7geH/3WV2KAKw4yUw4UBCJziTLBSLp0T+gdQ8G
 Ql7AbMjMk3kt/DuE60hzgthY=
X-Received: by 2002:a7b:cb8b:0:b0:490:3fdd:d353 with SMTP id
 5b1f17b1804b1-490424ad5d3mr250614945e9.8.1779891604016; 
 Wed, 27 May 2026 07:20:04 -0700 (PDT)
X-Received: by 2002:a7b:cb8b:0:b0:490:3fdd:d353 with SMTP id
 5b1f17b1804b1-490424ad5d3mr250614495e9.8.1779891603605; 
 Wed, 27 May 2026 07:20:03 -0700 (PDT)
Received: from redhat.com ([31.187.78.155]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45edb5a2a7esm6395843f8f.20.2026.05.27.07.20.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 07:20:03 -0700 (PDT)
Date: Wed, 27 May 2026 10:20:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH] hw/i386/pc: Add a proper owner for the ioport memory
 regions
Message-ID: <20260527101952-mutt-send-email-mst@kernel.org>
References: <20260217141827.534426-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20260217141827.534426-1-thuth@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: amDsqa2L7-jGd1wMdpwxu3rieagQ1wYF99ShddW8Jjw_1779891605
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

On Tue, Feb 17, 2026 at 03:18:27PM +0100, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> Without a proper owner, the memory regions show up in /machine/unattached
> in the QOM tree, which is something that should be avoided.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

queued, thanks!

> ---
>  hw/i386/pc.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 0dd3fd01d98..ee72dd47590 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1127,10 +1127,12 @@ void pc_basic_device_init(struct PCMachineState *pcms,
>      MemoryRegion *ioportF0_io = g_new(MemoryRegion, 1);
>      X86MachineState *x86ms = X86_MACHINE(pcms);
>  
> -    memory_region_init_io(ioport80_io, NULL, &ioport80_io_ops, NULL, "ioport80", 1);
> +    memory_region_init_io(ioport80_io, OBJECT(pcms), &ioport80_io_ops, NULL,
> +                          "ioport80", 1);
>      memory_region_add_subregion(isa_bus->address_space_io, 0x80, ioport80_io);
>  
> -    memory_region_init_io(ioportF0_io, NULL, &ioportF0_io_ops, NULL, "ioportF0", 1);
> +    memory_region_init_io(ioportF0_io, OBJECT(pcms), &ioportF0_io_ops, NULL,
> +                          "ioportF0", 1);
>      memory_region_add_subregion(isa_bus->address_space_io, 0xf0, ioportF0_io);
>  
>      /*
> -- 
> 2.53.0


