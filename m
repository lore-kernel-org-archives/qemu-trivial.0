Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1r4c9D-0005v8-Gs
	for mharc-qemu-trivial@gnu.org; Sun, 19 Nov 2023 02:23:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1r4c9B-0005tu-FM
 for qemu-trivial@nongnu.org; Sun, 19 Nov 2023 02:23:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1r4c99-000655-Tq
 for qemu-trivial@nongnu.org; Sun, 19 Nov 2023 02:23:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700378590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TN4sOBoSVfmd+VX2vQCCsfwf3+ug7nS0Of1c2PxtFe8=;
 b=NHOCwbvfXSSuHIuWSEAFxm46lf1Y9rf+k1T16DhavaW/MUyOdU2g0v99KB01kn3EnFBLiY
 DEIFpphrNB8/YYQ9V7d0y1Ng7iIqcSMhDl6rOzpdtwebSpDlrBO1XbQrFoE33Iu7qkAzXs
 N/BNFl1Wx2H0ju2kzSR0T2qWfAlye+E=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-191-08XwuLVqMS-lEuRNjCo8IQ-1; Sun, 19 Nov 2023 02:23:07 -0500
X-MC-Unique: 08XwuLVqMS-lEuRNjCo8IQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-40a36dd4a58so6536435e9.3
 for <qemu-trivial@nongnu.org>; Sat, 18 Nov 2023 23:23:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700378586; x=1700983386;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TN4sOBoSVfmd+VX2vQCCsfwf3+ug7nS0Of1c2PxtFe8=;
 b=pU24VIFqpti4bGjkfyUZ0nT8S9vvyjenbdSG1obIXNtwbnJMyJdJ/e+pi5hTUppIFa
 95ApLa14XtYUQ91lsHDunTSQNDm08wix5jglpEWUYaiqObg+L56IfpNzwAGhawkW6c7q
 sUdgIx5CV30Sl37TE1hvYIMTOnCHooBGVyqP6sjKNjDLcRzHET9O+/uuZsSNvJ9q9izP
 7JqzIX2vKSydYnWC/J2MfbH2gdqeTchjI3fxoNSzqmlyiGG3ncPx+uzufUHv12Z2dm/X
 zkfCMnsmojTZzG6/ppFN3w5COK73DlgCcd7Fps+vkRrK/fGYCYD+jZXRojOQcQ/ppFFx
 mLYQ==
X-Gm-Message-State: AOJu0YzGXFee8YSHGnekINxju6l/dQ44aGayOgoLbGn2e0mH5TUn1XZ8
 6dnYI0xWgwbYyL3jYcY4zrqrfP1Ip4ol6VE7FPd6GmiThlQ6W5lOFbnIC8h5iskxNwN5RI8U3Zj
 RJ/MLQ9gLuco4GXDlGw==
X-Received: by 2002:a05:600c:154b:b0:409:c1e:7fe8 with SMTP id
 f11-20020a05600c154b00b004090c1e7fe8mr3201777wmg.19.1700378586470; 
 Sat, 18 Nov 2023 23:23:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIUdah6CK31TCTHWxG+12bc4VZPYqw90j+NxVX9oNtWW7ixZRFZPRKLnLiSvVdG41HeJS02A==
X-Received: by 2002:a05:600c:154b:b0:409:c1e:7fe8 with SMTP id
 f11-20020a05600c154b00b004090c1e7fe8mr3201764wmg.19.1700378586167; 
 Sat, 18 Nov 2023 23:23:06 -0800 (PST)
Received: from redhat.com ([2a02:14f:1f0:586e:2896:c607:1259:244a])
 by smtp.gmail.com with ESMTPSA id
 l39-20020a05600c1d2700b003fe23b10fdfsm13633941wms.36.2023.11.18.23.23.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Nov 2023 23:23:05 -0800 (PST)
Date: Sun, 19 Nov 2023 02:23:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel Hoffman <dhoff749@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH] hw/i386: fix short-circuit logic with non-optimizing
 builds
Message-ID: <20231119022223-mutt-send-email-mst@kernel.org>
References: <20231118182531.2619772-1-dhoff749@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20231118182531.2619772-1-dhoff749@gmail.com>
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
X-List-Received-Date: Sun, 19 Nov 2023 07:23:13 -0000

On Sat, Nov 18, 2023 at 10:25:31AM -0800, Daniel Hoffman wrote:
> `kvm_enabled()` is compiled down to `0` and short-circuit logic is
> used to remmove references to undefined symbols at the compile stage.
> Some build configurations with some compilers don't attempt to
> simplify this logic down in some cases (the pattern appears to be
> that the literal false must be the first term) and this was causing
> some builds to emit references to undefined symbols.
> 
> Signed-off-by: Daniel Hoffman <dhoff749@gmail.com>

Could we add a bit more detail here? Will help make sure
this does not break again in the future.

> ---
>  hw/i386/x86.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index b3d054889bb..d339c8f3ef8 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -132,7 +132,7 @@ void x86_cpus_init(X86MachineState *x86ms, int default_cpu_version)
>       * Can we support APIC ID 255 or higher?  With KVM, that requires
>       * both in-kernel lapic and X2APIC userspace API.
>       */
> -    if (x86ms->apic_id_limit > 255 && kvm_enabled() &&
> +    if (kvm_enabled() && x86ms->apic_id_limit > 255 &&
>          (!kvm_irqchip_in_kernel() || !kvm_enable_x2apic())) {
>          error_report("current -smp configuration requires kernel "
>                       "irqchip and X2APIC API support.");
> @@ -418,8 +418,8 @@ void x86_cpu_pre_plug(HotplugHandler *hotplug_dev,
>      }
>      cpu->thread_id = topo_ids.smt_id;
>  
> -    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_VPINDEX) &&
> -        kvm_enabled() && !kvm_hv_vpindex_settable()) {
> +    if (kvm_enabled() && hyperv_feat_enabled(cpu, HYPERV_FEAT_VPINDEX) &&
> +        !kvm_hv_vpindex_settable()) {
>          error_setg(errp, "kernel doesn't allow setting HyperV VP_INDEX");
>          return;
>      }
> -- 
> 2.40.1


