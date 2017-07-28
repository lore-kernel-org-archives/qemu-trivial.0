Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dayV8-0007Zm-PH
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 02:11:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38428)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dayV6-0007XI-8C
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 02:11:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dayV5-0004sN-EQ
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 02:11:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34194)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dayUz-0004gK-Su; Fri, 28 Jul 2017 02:11:46 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 75DC4148E06;
	Fri, 28 Jul 2017 06:11:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 75DC4148E06
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.36.116.117] (ovpn-116-117.ams2.redhat.com [10.36.116.117])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 71F995DD6B;
	Fri, 28 Jul 2017 06:11:40 +0000 (UTC)
To: Eduardo Otubo <otubo@redhat.com>, qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, kbastian@mail.uni-paderborn.de
References: <20170727143040.7236-1-otubo@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <e7c14185-57ac-36be-9f64-251258145678@redhat.com>
Date: Fri, 28 Jul 2017 08:11:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20170727143040.7236-1-otubo@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 28 Jul 2017 06:11:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] qemu-system-tricore: segfault when
 entering "x 0" on the monitor
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Jul 2017 06:11:53 -0000

On 27.07.2017 16:30, Eduardo Otubo wrote:
> Starting Qemu with "qemu-system-tricore -nographic -M tricore_testboard -S"
> and entering "x 0" at the monitor prompt leads to Segmentation fault. This happens
> because tricore_cpu_get_phys_page_debug() is not implemented yet, this
> is a temporary workaround to avoid the crash.
> 
> Signed-off-by: Eduardo Otubo <otubo@redhat.com>
> ---
>  target/tricore/cpu.c | 10 ++++++++++
>  target/tricore/cpu.h |  1 +
>  2 files changed, 11 insertions(+)
> 
> diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
> index 08f50e2ba7..5ab5b56454 100644
> --- a/target/tricore/cpu.c
> +++ b/target/tricore/cpu.c
> @@ -22,6 +22,15 @@
>  #include "cpu.h"
>  #include "qemu-common.h"
>  #include "exec/exec-all.h"
> +#include "qemu/error-report.h"
> +
> +static hwaddr tricore_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
> +                                         MemTxAttrs *attrs)
> +{
> +    error_report("function cpu_get_phys_page_attrs_debug not "
> +                    "implemented, aborting");
> +    return -1;
> +}
>  
>  static inline void set_feature(CPUTriCoreState *env, int feature)
>  {
> @@ -176,6 +185,7 @@ static void tricore_cpu_class_init(ObjectClass *c, void *data)
>      cc->dump_state = tricore_cpu_dump_state;
>      cc->set_pc = tricore_cpu_set_pc;
>      cc->synchronize_from_tb = tricore_cpu_synchronize_from_tb;
> +    cc->get_phys_page_attrs_debug = tricore_cpu_get_phys_page_attrs_debug;
>  }
>  
>  static void cpu_register(const TriCoreCPUInfo *info)
> diff --git a/target/tricore/cpu.h b/target/tricore/cpu.h
> index a3493a123c..2663723955 100644
> --- a/target/tricore/cpu.h
> +++ b/target/tricore/cpu.h
> @@ -224,6 +224,7 @@ static inline TriCoreCPU *tricore_env_get_cpu(CPUTriCoreState *env)
>  #define ENV_OFFSET offsetof(TriCoreCPU, env)
>  
>  hwaddr tricore_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
> +

Unnecessary white-space change ... rather remove the
tricore_cpu_get_phys_page_debug() line instead?

>  void tricore_cpu_dump_state(CPUState *cpu, FILE *f,
>                              fprintf_function cpu_fprintf, int flags);

Apart from the nit above, looks like this fixes the crash indeed:

Tested-by: Thomas Huth <thuth@redhat.com>



