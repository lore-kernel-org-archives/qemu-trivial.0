Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n94g8-0007JA-Vd
	for mharc-qemu-trivial@gnu.org; Sun, 16 Jan 2022 07:30:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n94g0-0007IN-4q
 for qemu-trivial@nongnu.org; Sun, 16 Jan 2022 07:30:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n94fx-0007UW-B7
 for qemu-trivial@nongnu.org; Sun, 16 Jan 2022 07:30:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642336223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jLUr74tIyzu/6e3VJoJipXVjzUsexHbMar7SzXBcC1Y=;
 b=TZlGUNSX/M4ooVIL9b0Fnt3OoymuLQTd3I5zwCa1f1hje9ly4LeU/G3xO4ZDSC8T2FxCaj
 Zp/aYIFGzN5Hqgr9N82+gNw1j4SVbirKa23RngIZ8FYg1I692nmYb6zM4CkuNrkxDNHaeR
 LXWcv3DS5IvG3Rowc79XVV8H4upHL1o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-548-7VpQkdXFNySLbdC1Cddbjw-1; Sun, 16 Jan 2022 07:30:16 -0500
X-MC-Unique: 7VpQkdXFNySLbdC1Cddbjw-1
Received: by mail-wm1-f72.google.com with SMTP id
 bg32-20020a05600c3ca000b00349f2aca1beso8855784wmb.9
 for <qemu-trivial@nongnu.org>; Sun, 16 Jan 2022 04:30:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jLUr74tIyzu/6e3VJoJipXVjzUsexHbMar7SzXBcC1Y=;
 b=teAp8bMqDpe4wZMl/C3n47B994PDPKZPTP7aBPWfEimJEMsqynoblkIT0gWVAHASrx
 Ry0YaSA43CSWHWvub/i2ONGH5CP4JJbijomqH3fGVJHFEZWsef0XFuP0BSQAED7aE0nK
 4GvM4CSTwQM3xH3ewOxYWviB7f1xV1QYwsyjJos5cWvXxtQBZt9tZsoKxYlQDtNuVX8t
 o2DEUeyrtBoBz6hxDR9G2rfUE/HzHQLpf47u/c03gPid3wNG+b9EoxFdFLTewynjAN42
 8n1/Og9Jj4iJfaKb5AEccaBsIB+npPXtB+QqLFqV/piNBMLN+lA6P0HuUQBxycvEBwTB
 ogPA==
X-Gm-Message-State: AOAM532TJbbDD+P8I/np8dtxuoy68RMVQbvwtjZBsBx67iQnLAj3jZwQ
 G+jVt9ysm/48l8Kqecp2gJjMt+Hkfv1wQL53vucfF813gdgUP3j1h/aHLS8zOR8vYwzUVHiCnu5
 wBv7Mzk0WoELPPfIahw==
X-Received: by 2002:adf:a443:: with SMTP id e3mr15364739wra.183.1642336215601; 
 Sun, 16 Jan 2022 04:30:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxYONXPZ98q2X+C3x+zZOsnKtjNcIwHg9JfOR7KBllM97K+Yz5lXQ7OjNuaghwmxQpikb5Z4g==
X-Received: by 2002:adf:a443:: with SMTP id e3mr15364728wra.183.1642336215392; 
 Sun, 16 Jan 2022 04:30:15 -0800 (PST)
Received: from redhat.com ([2.55.158.159])
 by smtp.gmail.com with ESMTPSA id p2sm13530838wmg.44.2022.01.16.04.30.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 04:30:14 -0800 (PST)
Date: Sun, 16 Jan 2022 07:30:10 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH] intc: Unexport InterruptStatsProviderClass-related
 functions
Message-ID: <20220116072958-mutt-send-email-mst@kernel.org>
References: <20220116122327.73048-1-shentey@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20220116122327.73048-1-shentey@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
X-List-Received-Date: Sun, 16 Jan 2022 12:30:29 -0000

On Sun, Jan 16, 2022 at 01:23:26PM +0100, Bernhard Beschow wrote:
> The functions are only used within their respective source files, so no
> need for exporting.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  hw/intc/i8259_common.c            | 6 +++---
>  hw/intc/ioapic_common.c           | 2 +-
>  include/hw/i386/ioapic_internal.h | 1 -
>  include/hw/isa/i8259_internal.h   | 3 ---
>  4 files changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/intc/i8259_common.c b/hw/intc/i8259_common.c
> index d90b40fe4c..af2e4a2241 100644
> --- a/hw/intc/i8259_common.c
> +++ b/hw/intc/i8259_common.c
> @@ -116,8 +116,8 @@ void pic_stat_update_irq(int irq, int level)
>      }
>  }
>  
> -bool pic_get_statistics(InterruptStatsProvider *obj,
> -                        uint64_t **irq_counts, unsigned int *nb_irqs)
> +static bool pic_get_statistics(InterruptStatsProvider *obj,
> +                               uint64_t **irq_counts, unsigned int *nb_irqs)
>  {
>      PICCommonState *s = PIC_COMMON(obj);
>  
> @@ -132,7 +132,7 @@ bool pic_get_statistics(InterruptStatsProvider *obj,
>      return true;
>  }
>  
> -void pic_print_info(InterruptStatsProvider *obj, Monitor *mon)
> +static void pic_print_info(InterruptStatsProvider *obj, Monitor *mon)
>  {
>      PICCommonState *s = PIC_COMMON(obj);
>  
> diff --git a/hw/intc/ioapic_common.c b/hw/intc/ioapic_common.c
> index 3cccfc1556..aa5f760871 100644
> --- a/hw/intc/ioapic_common.c
> +++ b/hw/intc/ioapic_common.c
> @@ -76,7 +76,7 @@ static void ioapic_irr_dump(Monitor *mon, const char *name, uint32_t bitmap)
>      monitor_printf(mon, "\n");
>  }
>  
> -void ioapic_print_redtbl(Monitor *mon, IOAPICCommonState *s)
> +static void ioapic_print_redtbl(Monitor *mon, IOAPICCommonState *s)
>  {
>      static const char *delm_str[] = {
>          "fixed", "lowest", "SMI", "...", "NMI", "INIT", "...", "extINT"};
> diff --git a/include/hw/i386/ioapic_internal.h b/include/hw/i386/ioapic_internal.h
> index 021e715f11..9880443cc7 100644
> --- a/include/hw/i386/ioapic_internal.h
> +++ b/include/hw/i386/ioapic_internal.h
> @@ -112,7 +112,6 @@ struct IOAPICCommonState {
>  
>  void ioapic_reset_common(DeviceState *dev);
>  
> -void ioapic_print_redtbl(Monitor *mon, IOAPICCommonState *s);
>  void ioapic_stat_update_irq(IOAPICCommonState *s, int irq, int level);
>  
>  #endif /* QEMU_IOAPIC_INTERNAL_H */
> diff --git a/include/hw/isa/i8259_internal.h b/include/hw/isa/i8259_internal.h
> index a6ae8a583f..d272d879fb 100644
> --- a/include/hw/isa/i8259_internal.h
> +++ b/include/hw/isa/i8259_internal.h
> @@ -72,8 +72,5 @@ struct PICCommonState {
>  void pic_reset_common(PICCommonState *s);
>  ISADevice *i8259_init_chip(const char *name, ISABus *bus, bool master);
>  void pic_stat_update_irq(int irq, int level);
> -bool pic_get_statistics(InterruptStatsProvider *obj,
> -                        uint64_t **irq_counts, unsigned int *nb_irqs);
> -void pic_print_info(InterruptStatsProvider *obj, Monitor *mon);
>  
>  #endif /* QEMU_I8259_INTERNAL_H */
> -- 
> 2.34.1


