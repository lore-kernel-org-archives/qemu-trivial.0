Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mVhZ0-0008BL-U0
	for mharc-qemu-trivial@gnu.org; Wed, 29 Sep 2021 17:56:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mVhYy-0008Ac-94
 for qemu-trivial@nongnu.org; Wed, 29 Sep 2021 17:56:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mVhYv-0006ph-Bs
 for qemu-trivial@nongnu.org; Wed, 29 Sep 2021 17:56:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632952584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lLQsTdulw+5jwiqASL8F5vvvT6YsSpmb40XhW1+sUTA=;
 b=fEMg6Yv6mhCMg7H8UEM5RUYp41ArWzaGLxNrIqaBB2LTagjY29NQJUVuC08jHwzj8Y05r1
 sVHSiY9+L6Wti6CO6zkfi6g6H/HkqaWKPazdPjLeEGxOEXpQYcn5yDdAa7K73pXY45sv4j
 tC5artM+AGgzj5VWP9vhviW+hrIu0hk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-AiNh6UyCPF2TAy2K8U4IGw-1; Wed, 29 Sep 2021 17:56:23 -0400
X-MC-Unique: AiNh6UyCPF2TAy2K8U4IGw-1
Received: by mail-ed1-f70.google.com with SMTP id
 u17-20020a50d511000000b003daa3828c13so3949529edi.12
 for <qemu-trivial@nongnu.org>; Wed, 29 Sep 2021 14:56:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=lLQsTdulw+5jwiqASL8F5vvvT6YsSpmb40XhW1+sUTA=;
 b=AF2JpNn0KroKGUDts0rZfOxiwiWsldRJ4yxeiqNRSz2clPl/MBfTvSrcvL9H0K5nus
 UElT1n7ir+n7I1pu4rB2LgyQBaiFBBXr2lD+XGqid9+fanSuZi2vI0ey9D0jsixN+5ok
 ctkMpwp1zKnHrd23HJWWz4FLdpjtM/vwV6XGOlqX83t4RpNDERzmXTSGG+euR/ykT5eO
 MQy0xw7/fTdWtLXzrOp8Es48hejXLUvWct9k21z0QIimdEPJ2NLqnlxK57jYclsijyGe
 REw+xdNaMN8HOHBM7eIrLd99Zg6U7mqQemXGDnUdx3OGLQ0qnFGXPR0EaETmOuxl655s
 5MLA==
X-Gm-Message-State: AOAM531aMXXscsbUSG5sv8FQTMS1AvWNqea/rosnh3MnxXJBbfgmXo8i
 o0klol57WfmzoaX1RRLKJvCeZVowStqInVpIadpXifK8jonJjLsFs0NO/RGr9IVypLmpN5laXIE
 k3cLALZ+7JFeuQBU7kw==
X-Received: by 2002:a50:dace:: with SMTP id s14mr2770847edj.369.1632952581925; 
 Wed, 29 Sep 2021 14:56:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxt02FT4s7ia2NJuh8uN4A8JtvHKcLZHBWOEaQtWmkmmO1fRHN4q3k0qbYi1t9fcinYAJ6jw==
X-Received: by 2002:a50:dace:: with SMTP id s14mr2770801edj.369.1632952581596; 
 Wed, 29 Sep 2021 14:56:21 -0700 (PDT)
Received: from redhat.com ([2.55.134.220])
 by smtp.gmail.com with ESMTPSA id bq4sm570543ejb.43.2021.09.29.14.56.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 14:56:20 -0700 (PDT)
Date: Wed, 29 Sep 2021 17:56:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, haxm-team@intel.com,
 Eduardo Habkost <ehabkost@redhat.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, qemu-trivial@nongnu.org,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Colin Xu <colin.xu@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kamil Rytarowski <kamil@netbsd.org>, Wenchao Wang <wenchao.wang@intel.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Cameron Esfahani <dirty@apple.com>
Subject: Re: [PATCH v3] target/i386: Include 'hw/i386/apic.h' locally
Message-ID: <20210929175605-mutt-send-email-mst@kernel.org>
References: <20210929163124.2523413-1-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20210929163124.2523413-1-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 29 Sep 2021 21:56:29 -0000

On Wed, Sep 29, 2021 at 06:31:24PM +0200, Philippe Mathieu-Daudé wrote:
> Instead of including a sysemu-specific header in "cpu.h"
> (which is shared with user-mode emulations), include it
> locally when required.
> 
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  target/i386/cpu.h                    | 4 ----
>  hw/i386/kvmvapic.c                   | 1 +
>  hw/i386/x86.c                        | 1 +
>  target/i386/cpu-dump.c               | 1 +
>  target/i386/cpu-sysemu.c             | 1 +
>  target/i386/cpu.c                    | 1 +
>  target/i386/gdbstub.c                | 4 ++++
>  target/i386/hax/hax-all.c            | 1 +
>  target/i386/helper.c                 | 1 +
>  target/i386/hvf/hvf.c                | 1 +
>  target/i386/hvf/x86_emu.c            | 1 +
>  target/i386/nvmm/nvmm-all.c          | 1 +
>  target/i386/tcg/sysemu/misc_helper.c | 1 +
>  target/i386/tcg/sysemu/seg_helper.c  | 1 +
>  target/i386/whpx/whpx-all.c          | 1 +
>  15 files changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index c2954c71ea0..4411718bb7a 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -2045,10 +2045,6 @@ typedef X86CPU ArchCPU;
>  #include "exec/cpu-all.h"
>  #include "svm.h"
>  
> -#if !defined(CONFIG_USER_ONLY)
> -#include "hw/i386/apic.h"
> -#endif
> -
>  static inline void cpu_get_tb_cpu_state(CPUX86State *env, target_ulong *pc,
>                                          target_ulong *cs_base, uint32_t *flags)
>  {
> diff --git a/hw/i386/kvmvapic.c b/hw/i386/kvmvapic.c
> index 43f8a8f679e..7333818bdd1 100644
> --- a/hw/i386/kvmvapic.c
> +++ b/hw/i386/kvmvapic.c
> @@ -16,6 +16,7 @@
>  #include "sysemu/hw_accel.h"
>  #include "sysemu/kvm.h"
>  #include "sysemu/runstate.h"
> +#include "hw/i386/apic.h"
>  #include "hw/i386/apic_internal.h"
>  #include "hw/sysbus.h"
>  #include "hw/boards.h"
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index 00448ed55aa..e0218f8791f 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -43,6 +43,7 @@
>  #include "target/i386/cpu.h"
>  #include "hw/i386/topology.h"
>  #include "hw/i386/fw_cfg.h"
> +#include "hw/i386/apic.h"
>  #include "hw/intc/i8259.h"
>  #include "hw/rtc/mc146818rtc.h"
>  
> diff --git a/target/i386/cpu-dump.c b/target/i386/cpu-dump.c
> index 02b635a52cf..0158fd2bf28 100644
> --- a/target/i386/cpu-dump.c
> +++ b/target/i386/cpu-dump.c
> @@ -22,6 +22,7 @@
>  #include "qemu/qemu-print.h"
>  #ifndef CONFIG_USER_ONLY
>  #include "hw/i386/apic_internal.h"
> +#include "hw/i386/apic.h"
>  #endif
>  
>  /***********************************************************/
> diff --git a/target/i386/cpu-sysemu.c b/target/i386/cpu-sysemu.c
> index 37b7c562f53..4e8a6973d08 100644
> --- a/target/i386/cpu-sysemu.c
> +++ b/target/i386/cpu-sysemu.c
> @@ -30,6 +30,7 @@
>  #include "hw/qdev-properties.h"
>  
>  #include "exec/address-spaces.h"
> +#include "hw/i386/apic.h"
>  #include "hw/i386/apic_internal.h"
>  
>  #include "cpu-internal.h"
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 6b029f1bdf1..52422cbf21b 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -33,6 +33,7 @@
>  #include "standard-headers/asm-x86/kvm_para.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/i386/topology.h"
> +#include "hw/i386/apic.h"
>  #ifndef CONFIG_USER_ONLY
>  #include "exec/address-spaces.h"
>  #include "hw/boards.h"
> diff --git a/target/i386/gdbstub.c b/target/i386/gdbstub.c
> index 098a2ad15a9..5438229c1a9 100644
> --- a/target/i386/gdbstub.c
> +++ b/target/i386/gdbstub.c
> @@ -21,6 +21,10 @@
>  #include "cpu.h"
>  #include "exec/gdbstub.h"
>  
> +#ifndef CONFIG_USER_ONLY
> +#include "hw/i386/apic.h"
> +#endif
> +
>  #ifdef TARGET_X86_64
>  static const int gpr_map[16] = {
>      R_EAX, R_EBX, R_ECX, R_EDX, R_ESI, R_EDI, R_EBP, R_ESP,
> diff --git a/target/i386/hax/hax-all.c b/target/i386/hax/hax-all.c
> index bf65ed6fa92..cd89e3233a9 100644
> --- a/target/i386/hax/hax-all.c
> +++ b/target/i386/hax/hax-all.c
> @@ -32,6 +32,7 @@
>  #include "sysemu/reset.h"
>  #include "sysemu/runstate.h"
>  #include "hw/boards.h"
> +#include "hw/i386/apic.h"
>  
>  #include "hax-accel-ops.h"
>  
> diff --git a/target/i386/helper.c b/target/i386/helper.c
> index 533b29cb91b..874beda98ae 100644
> --- a/target/i386/helper.c
> +++ b/target/i386/helper.c
> @@ -26,6 +26,7 @@
>  #ifndef CONFIG_USER_ONLY
>  #include "sysemu/hw_accel.h"
>  #include "monitor/monitor.h"
> +#include "hw/i386/apic.h"
>  #endif
>  
>  void cpu_sync_bndcs_hflags(CPUX86State *env)
> diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
> index 4ba6e82fab3..50058a24f2a 100644
> --- a/target/i386/hvf/hvf.c
> +++ b/target/i386/hvf/hvf.c
> @@ -70,6 +70,7 @@
>  #include <sys/sysctl.h>
>  
>  #include "hw/i386/apic_internal.h"
> +#include "hw/i386/apic.h"
>  #include "qemu/main-loop.h"
>  #include "qemu/accel.h"
>  #include "target/i386/cpu.h"
> diff --git a/target/i386/hvf/x86_emu.c b/target/i386/hvf/x86_emu.c
> index 7c8203b21fb..fb3e88959d4 100644
> --- a/target/i386/hvf/x86_emu.c
> +++ b/target/i386/hvf/x86_emu.c
> @@ -45,6 +45,7 @@
>  #include "x86_flags.h"
>  #include "vmcs.h"
>  #include "vmx.h"
> +#include "hw/i386/apic.h"
>  
>  void hvf_handle_io(struct CPUState *cpu, uint16_t port, void *data,
>                     int direction, int size, uint32_t count);
> diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
> index a488b00e909..944bdb49663 100644
> --- a/target/i386/nvmm/nvmm-all.c
> +++ b/target/i386/nvmm/nvmm-all.c
> @@ -22,6 +22,7 @@
>  #include "qemu/queue.h"
>  #include "migration/blocker.h"
>  #include "strings.h"
> +#include "hw/i386/apic.h"
>  
>  #include "nvmm-accel-ops.h"
>  
> diff --git a/target/i386/tcg/sysemu/misc_helper.c b/target/i386/tcg/sysemu/misc_helper.c
> index 9ccaa054c4c..b1d3096e9c9 100644
> --- a/target/i386/tcg/sysemu/misc_helper.c
> +++ b/target/i386/tcg/sysemu/misc_helper.c
> @@ -24,6 +24,7 @@
>  #include "exec/cpu_ldst.h"
>  #include "exec/address-spaces.h"
>  #include "tcg/helper-tcg.h"
> +#include "hw/i386/apic.h"
>  
>  void helper_outb(CPUX86State *env, uint32_t port, uint32_t data)
>  {
> diff --git a/target/i386/tcg/sysemu/seg_helper.c b/target/i386/tcg/sysemu/seg_helper.c
> index bf3444c26b0..34f2c65d47f 100644
> --- a/target/i386/tcg/sysemu/seg_helper.c
> +++ b/target/i386/tcg/sysemu/seg_helper.c
> @@ -24,6 +24,7 @@
>  #include "exec/cpu_ldst.h"
>  #include "tcg/helper-tcg.h"
>  #include "../seg_helper.h"
> +#include "hw/i386/apic.h"
>  
>  #ifdef TARGET_X86_64
>  void helper_syscall(CPUX86State *env, int next_eip_addend)
> diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
> index 3e925b9da70..9ab844fd05d 100644
> --- a/target/i386/whpx/whpx-all.c
> +++ b/target/i386/whpx/whpx-all.c
> @@ -20,6 +20,7 @@
>  #include "qemu/main-loop.h"
>  #include "hw/boards.h"
>  #include "hw/i386/ioapic.h"
> +#include "hw/i386/apic.h"
>  #include "hw/i386/apic_internal.h"
>  #include "qemu/error-report.h"
>  #include "qapi/error.h"
> -- 
> 2.31.1


