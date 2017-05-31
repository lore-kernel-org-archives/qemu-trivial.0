Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dG1I1-0002LC-3A
	for mharc-qemu-trivial@gnu.org; Wed, 31 May 2017 06:55:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58556)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1dG1Hz-0002Je-9L
	for qemu-trivial@nongnu.org; Wed, 31 May 2017 06:55:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1dG1Hy-00088B-DZ
	for qemu-trivial@nongnu.org; Wed, 31 May 2017 06:55:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36622)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1dG1Hs-00086K-Vq; Wed, 31 May 2017 06:55:37 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BD21A80C0D;
	Wed, 31 May 2017 10:55:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com BD21A80C0D
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=armbru@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com BD21A80C0D
Received: from blackfin.pond.sub.org (ovpn-116-98.ams2.redhat.com
	[10.36.116.98])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 85C8B183F0;
	Wed, 31 May 2017 10:55:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id EC16F1138647; Wed, 31 May 2017 12:55:33 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20170531061150.15755-1-sjitindarsingh@gmail.com>
Date: Wed, 31 May 2017 12:55:33 +0200
In-Reply-To: <20170531061150.15755-1-sjitindarsingh@gmail.com> (Suraj Jitindar
	Singh's message of "Wed, 31 May 2017 16:11:50 +1000")
Message-ID: <87vaohcn2y.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 31 May 2017 10:55:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] help: Add newline to end of
 thread option help text
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
X-List-Received-Date: Wed, 31 May 2017 10:55:44 -0000

Cc: qemu-trivial

Suraj Jitindar Singh <sjitindarsingh@gmail.com> writes:

> The help text for the thread sub option of the accel option is missing
> a newline at the end. This is annoying as it makes it hard to see the
> help text for the next option.
>
> Add the new line so that the following option help text (-smp) is
> displayed on a new line rather on the same line and directly after
> the thread help.
>
> Before patch:
>
> -accel [accel=]accelerator[,thread=single|multi]
>                 select accelerator (kvm, xen, hax or tcg; use 'help' for a list)
>                 thread=single|multi (enable multi-threaded TCG)-smp [cpus=]n[,maxcpus=cpus][,cores=cores][,threads=threads][,sockets=sockets]
>                 set the number of CPUs to 'n' [default=1]
>                 maxcpus= maximum number of total cpus, including
>                 offline CPUs for hotplug, etc
>                 cores= number of CPU cores on one socket
>                 threads= number of threads on one CPU core
>                 sockets= number of discrete sockets in the system
>
> After patch:
>
> -accel [accel=]accelerator[,thread=single|multi]
>                 select accelerator (kvm, xen, hax or tcg; use 'help' for a list)
>                 thread=single|multi (enable multi-threaded TCG)
> -smp [cpus=]n[,maxcpus=cpus][,cores=cores][,threads=threads][,sockets=sockets]
>                 set the number of CPUs to 'n' [default=1]
>                 maxcpus= maximum number of total cpus, including
>                 offline CPUs for hotplug, etc
>                 cores= number of CPU cores on one socket
>                 threads= number of threads on one CPU core
>                 sockets= number of discrete sockets in the system
>
> Signed-off-by: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
> ---
>  qemu-options.hx | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index a6c9b9e..8515db8 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -102,7 +102,7 @@ ETEXI
>  DEF("accel", HAS_ARG, QEMU_OPTION_accel,
>      "-accel [accel=]accelerator[,thread=single|multi]\n"
>      "                select accelerator (kvm, xen, hax or tcg; use 'help' for a list)\n"
> -    "                thread=single|multi (enable multi-threaded TCG)", QEMU_ARCH_ALL)
> +    "                thread=single|multi (enable multi-threaded TCG)\n", QEMU_ARCH_ALL)
>  STEXI
>  @item -accel @var{name}[,prop=@var{value}[,...]]
>  @findex -accel

