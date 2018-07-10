Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fcrQA-0004BJ-Bj
	for mharc-qemu-trivial@gnu.org; Tue, 10 Jul 2018 08:07:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55817)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1fcrQ8-0004AG-Bq
	for qemu-trivial@nongnu.org; Tue, 10 Jul 2018 08:07:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1fcrQ7-0005q0-G0
	for qemu-trivial@nongnu.org; Tue, 10 Jul 2018 08:07:04 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:58792 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1fcrQ1-0005mr-HU; Tue, 10 Jul 2018 08:06:57 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C816ADFC8;
	Tue, 10 Jul 2018 12:06:56 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 158672026D6B;
	Tue, 10 Jul 2018 12:06:55 +0000 (UTC)
Date: Tue, 10 Jul 2018 14:06:55 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Dou Liyang <douly.fnst@cn.fujitsu.com>
Cc: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>, <ehabkost@redhat.com>
Message-ID: <20180710140655.00742582@redhat.com>
In-Reply-To: <20180710105129.23296-1-douly.fnst@cn.fujitsu.com>
References: <20180710105129.23296-1-douly.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Tue, 10 Jul 2018 12:06:56 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Tue, 10 Jul 2018 12:06:56 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH] hw/machine: Remove the Zero check of
 nb_numa_nodes for numa_complete_configuration() follow-up
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
X-List-Received-Date: Tue, 10 Jul 2018 12:07:05 -0000

On Tue, 10 Jul 2018 18:51:29 +0800
Dou Liyang <douly.fnst@cn.fujitsu.com> wrote:

> This Commit 7747abf11487 misses the curly brackets. Follow Igor's and Eduardo's suggestion,
> 
> Add a follow-up patch for it.
> 
> Signed-off-by: Dou Liyang <douly.fnst@cn.fujitsu.com>
> ---
>  hw/core/machine.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index a9aeb22f03..6b68e1218f 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -793,8 +793,9 @@ void machine_run_board_init(MachineState *machine)
>      MachineClass *machine_class = MACHINE_GET_CLASS(machine);
>  
>      numa_complete_configuration(machine);
> -    if (nb_numa_nodes)
> +    if (nb_numa_nodes) {
>          machine_numa_finish_cpu_init(machine);
> +    }
>  
>      /* If the machine supports the valid_cpu_types check and the user
>       * specified a CPU with -cpu check here that the user CPU is supported.

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

