Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daiyE-0004Ne-TI
	for mharc-qemu-trivial@gnu.org; Thu, 27 Jul 2017 09:36:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44142)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1daiyC-0004M9-J7
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 09:36:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1daiyB-0007ud-ES
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 09:36:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34924)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1daiy5-0007oQ-He; Thu, 27 Jul 2017 09:36:45 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EA08CA1F52;
	Thu, 27 Jul 2017 13:36:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com EA08CA1F52
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.36.116.59] (ovpn-116-59.ams2.redhat.com [10.36.116.59])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 12E6F5D961;
	Thu, 27 Jul 2017 13:36:34 +0000 (UTC)
To: Eduardo Otubo <otubo@redhat.com>, qemu-trivial@nongnu.org
References: <20170727123710.29817-1-otubo@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	QEMU Developers <qemu-devel@nongnu.org>
Message-ID: <79d4cecf-3f84-2727-9f73-b3588ec6db9d@redhat.com>
Date: Thu, 27 Jul 2017 15:36:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20170727123710.29817-1-otubo@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 27 Jul 2017 13:36:42 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Thu, 27 Jul 2017 13:36:53 -0000

 Hi Eduardo,

Meta comment: Please always put the maintainer(s) and qemu-devel on CC:

On 27.07.2017 14:37, Eduardo Otubo wrote:
> Starting Qemu with "qemu-system-tricore -nographic -M tricore_testboard
> -S" and entering "x 0" at the monitor prompt leads to Segmentation
> fault. This happens because tricore_cpu_get_phys_page_debug() is not
> implemented yet, this is a temporary workaround to avoid the crash do
> just abort the execution with exit(1).
>=20
> Signed-off-by: Eduardo Otubo <otubo@redhat.com>
> ---
>  target/tricore/cpu.c | 10 ++++++++++
>  target/tricore/cpu.h |  3 +++
>  2 files changed, 13 insertions(+)
>=20
> diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
> index 08f50e2ba7..822c7f4092 100644
> --- a/target/tricore/cpu.c
> +++ b/target/tricore/cpu.c
> @@ -22,6 +22,15 @@
>  #include "cpu.h"
>  #include "qemu-common.h"
>  #include "exec/exec-all.h"
> +#include "qemu/error-report.h"
> +
> +hwaddr tricore_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr=
,
> +                                         MemTxAttrs *attrs)
> +{
> +    error_report("function cpu_get_phys_page_attrs_debug not"
> +                    "implemented, aborting");
> +    exit(1);

Looking at the description in include/qom/cpu.h and the callers in
exec.c, it seems like it is OK if these functions return -1 if the page
could not be found. I think you should do that here, too, instead of
exiting - it's always a little bit annoying for the users if QEMU exits
unexpectedly, so we should try to avoid that if possible.

> +}
> =20
>  static inline void set_feature(CPUTriCoreState *env, int feature)
>  {
> @@ -176,6 +185,7 @@ static void tricore_cpu_class_init(ObjectClass *c, =
void *data)
>      cc->dump_state =3D tricore_cpu_dump_state;
>      cc->set_pc =3D tricore_cpu_set_pc;
>      cc->synchronize_from_tb =3D tricore_cpu_synchronize_from_tb;
> +    cc->get_phys_page_attrs_debug =3D tricore_cpu_get_phys_page_attrs_=
debug;
>  }
> =20
>  static void cpu_register(const TriCoreCPUInfo *info)
> diff --git a/target/tricore/cpu.h b/target/tricore/cpu.h
> index a3493a123c..c374ed3213 100644
> --- a/target/tricore/cpu.h
> +++ b/target/tricore/cpu.h
> @@ -224,6 +224,9 @@ static inline TriCoreCPU *tricore_env_get_cpu(CPUTr=
iCoreState *env)
>  #define ENV_OFFSET offsetof(TriCoreCPU, env)
> =20
>  hwaddr tricore_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);

I think you could also remove that prototype above now - since there is
no implementation for this.

> +hwaddr tricore_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr=
,
> +                                         MemTxAttrs *attrs);
> +
>  void tricore_cpu_dump_state(CPUState *cpu, FILE *f,
>                              fprintf_function cpu_fprintf, int flags);
> =20
>=20

 Thomas

