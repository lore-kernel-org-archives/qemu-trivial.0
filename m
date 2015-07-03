Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZB5br-0005c7-Vz
	for mharc-qemu-trivial@gnu.org; Fri, 03 Jul 2015 14:22:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43178)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1ZB5bq-0005bt-1Z
	for qemu-trivial@nongnu.org; Fri, 03 Jul 2015 14:22:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1ZB5bm-0000N9-RA
	for qemu-trivial@nongnu.org; Fri, 03 Jul 2015 14:22:45 -0400
Received: from mail-wg0-x22c.google.com ([2a00:1450:400c:c00::22c]:35946)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1ZB5bm-0000Mv-Gg; Fri, 03 Jul 2015 14:22:42 -0400
Received: by wguu7 with SMTP id u7so94143862wgu.3;
	Fri, 03 Jul 2015 11:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=gt4p53EuPZwKSQoA0B0WpTffaTvVJQg/MNVWdxkGTWg=;
	b=pJge4ZhSf0Z7ezEvqe9sgSz5zJsyi4vsx2KQf4liJ0eqMgLAhRUIwK9JzD6ULFVnyM
	ItpxunBNy6Ovidl8dxgwmidP9+sJSrI9kchZ/mM+ZEpoQre/34jCRo9xtvgHQIpIicFq
	mTUVOcnFNgaAAO35YW2UefggI64dyiL5GmhuTwia84OwV3L0F/NdeaF0OTmivYkHLyIr
	fJIJ2P4XHF5PTjCruekUpXrTc4we1EFbKkAC2o2Y6AUPVmCg8nHH61tRF+rXR8CBpI+v
	D+pCZXe8YdwiYbZoKdVM0Fd8Cii7KmLssG+uTyyGVCIwEyEeeRXIeHrmXrJYJL1DaO04
	HOdg==
X-Received: by 10.194.178.201 with SMTP id da9mr27192268wjc.139.1435947761878; 
	Fri, 03 Jul 2015 11:22:41 -0700 (PDT)
Received: from [192.168.10.165] (dynamic-adsl-94-39-132-37.clienti.tiscali.it.
	[94.39.132.37]) by mx.google.com with ESMTPSA id
	ei8sm14492692wjd.32.2015.07.03.11.22.40
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Jul 2015 11:22:40 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1435933104-15216-1-git-send-email-peter.maydell@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5596D2EF.2030902@redhat.com>
Date: Fri, 3 Jul 2015 20:22:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.0.1
MIME-Version: 1.0
In-Reply-To: <1435933104-15216-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::22c
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] Stop including qemu-common.h in memory.h
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Jul 2015 18:22:47 -0000

On 03/07/2015 16:18, Peter Maydell wrote:
> Including qemu-common.h from other header files is generally a bad
> idea, because it means it's very easy to end up with a circular
> dependency. For instance, if we wanted to include memory.h from
> qom/cpu.h we'd end up with this loop:
>  memory.h -> qemu-common.h -> cpu.h -> cpu-qom.h -> qom/cpu.h -> memory.h
> 
> Remove the include from memory.h. This requires us to fix up a few
> other files which were inadvertently getting declarations indirectly
> through memory.h.
> 
> The biggest change is splitting the fprintf_function typedef out
> into its own header so other headers can get at it without having
> to include qemu-common.h.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I originally wrote this because I thought I was going to need to
> include memory.h in qom/cpu.h. In fact I managed to avoid that in
> the end, but this still seems like useful cleanup.
> 
> 
>  include/exec/cpu-common.h |  2 ++
>  include/exec/memory.h     |  1 -
>  include/hw/arm/arm.h      |  1 +
>  include/qemu-common.h     |  4 +---
>  include/qemu/fprintf-fn.h | 16 ++++++++++++++++
>  target-s390x/mmu_helper.c |  2 +-
>  6 files changed, 21 insertions(+), 5 deletions(-)
>  create mode 100644 include/qemu/fprintf-fn.h
> 
> diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
> index de8a720..9fb1d54 100644
> --- a/include/exec/cpu-common.h
> +++ b/include/exec/cpu-common.h
> @@ -13,6 +13,8 @@
>  
>  #include "qemu/bswap.h"
>  #include "qemu/queue.h"
> +#include "qemu/fprintf-fn.h"
> +#include "qemu/typedefs.h"
>  
>  /**
>   * CPUListState:
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 8ae004e..1881320 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -23,7 +23,6 @@
>  
>  #include <stdint.h>
>  #include <stdbool.h>
> -#include "qemu-common.h"
>  #include "exec/cpu-common.h"
>  #ifndef CONFIG_USER_ONLY
>  #include "exec/hwaddr.h"
> diff --git a/include/hw/arm/arm.h b/include/hw/arm/arm.h
> index 760804c..4dcd4f9 100644
> --- a/include/hw/arm/arm.h
> +++ b/include/hw/arm/arm.h
> @@ -14,6 +14,7 @@
>  #include "exec/memory.h"
>  #include "hw/irq.h"
>  #include "qemu/notify.h"
> +#include "cpu.h"
>  
>  /* armv7m.c */
>  qemu_irq *armv7m_init(MemoryRegion *system_memory, int mem_size, int num_irq,
> diff --git a/include/qemu-common.h b/include/qemu-common.h
> index d52d09c..09b8c06 100644
> --- a/include/qemu-common.h
> +++ b/include/qemu-common.h
> @@ -15,6 +15,7 @@
>  #include "qemu/compiler.h"
>  #include "config-host.h"
>  #include "qemu/typedefs.h"
> +#include "qemu/fprintf-fn.h"
>  
>  #if defined(__arm__) || defined(__sparc__) || defined(__mips__) || defined(__hppa__) || defined(__ia64__)
>  #define WORDS_ALIGNED
> @@ -85,9 +86,6 @@
>  # error Unknown pointer size
>  #endif
>  
> -typedef int (*fprintf_function)(FILE *f, const char *fmt, ...)
> -    GCC_FMT_ATTR(2, 3);
> -
>  #ifdef _WIN32
>  #define fsync _commit
>  #if !defined(lseek)
> diff --git a/include/qemu/fprintf-fn.h b/include/qemu/fprintf-fn.h
> new file mode 100644
> index 0000000..4f66d45
> --- /dev/null
> +++ b/include/qemu/fprintf-fn.h
> @@ -0,0 +1,16 @@
> +/*
> + * Typedef for fprintf-alike function pointers.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef FPRINTF_FN_H
> +
> +#include "qemu/compiler.h"
> +#include <stdio.h>
> +
> +typedef int (*fprintf_function)(FILE *f, const char *fmt, ...)
> +    GCC_FMT_ATTR(2, 3);
> +
> +#endif
> diff --git a/target-s390x/mmu_helper.c b/target-s390x/mmu_helper.c
> index 815ff42..1ea6d81 100644
> --- a/target-s390x/mmu_helper.c
> +++ b/target-s390x/mmu_helper.c
> @@ -17,8 +17,8 @@
>  
>  #include "qemu/error-report.h"
>  #include "exec/address-spaces.h"
> -#include "sysemu/kvm.h"
>  #include "cpu.h"
> +#include "sysemu/kvm.h"
>  
>  /* #define DEBUG_S390 */
>  /* #define DEBUG_S390_PTE */
> 

Applied for 2.4, thanks.

Paolo

