Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WAyOO-0000KY-CY
	for mharc-qemu-trivial@gnu.org; Wed, 05 Feb 2014 04:03:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44864)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1WAyOH-0000Bp-Ea
	for qemu-trivial@nongnu.org; Wed, 05 Feb 2014 04:03:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1WAyOC-0003sX-Cd
	for qemu-trivial@nongnu.org; Wed, 05 Feb 2014 04:03:29 -0500
Received: from mel.act-europe.fr ([194.98.77.210]:55085
	helo=smtp.eu.adacore.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>)
	id 1WAyO1-0003mu-PB; Wed, 05 Feb 2014 04:03:13 -0500
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id 7A89526E0681;
	Wed,  5 Feb 2014 10:03:11 +0100 (CET)
Received: from smtp.eu.adacore.com ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 67OKJOjOoBWN; Wed,  5 Feb 2014 10:03:11 +0100 (CET)
Received: from [192.168.0.17] (mon75-15-88-166-12-160.fbx.proxad.net
	[88.166.12.160])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.eu.adacore.com (Postfix) with ESMTPSA id 32D3D26E067F;
	Wed,  5 Feb 2014 10:03:11 +0100 (CET)
Message-ID: <52F1FE42.3000000@adacore.com>
Date: Wed, 05 Feb 2014 10:02:58 +0100
From: Fabien Chouteau <chouteau@adacore.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Sebastian Huber <sebastian.huber@embedded-brains.de>, 
	qemu-devel@nongnu.org
References: <1391419091-3020-1-git-send-email-sebastian.huber@embedded-brains.de>
In-Reply-To: <1391419091-3020-1-git-send-email-sebastian.huber@embedded-brains.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 194.98.77.210
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] sparc/leon3: Initialize
	stack pointer
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
X-List-Received-Date: Wed, 05 Feb 2014 09:03:34 -0000

On 02/03/2014 10:18 AM, Sebastian Huber wrote:
> A lot of real world LEON3 systems are shipped with the GRMON boot
> loader.  This boot loader initializes the stack pointer with the end of
> RAM address.  The application can use this to detect the RAM size of a
> particular board variant.
>

Looks good, thank you Sebastian.

Reviewed-by: Fabien Chouteau <chouteau@adacore.com>

 
> Signed-off-by: Sebastian Huber <sebastian.huber@embedded-brains.de>
> ---
>  hw/sparc/leon3.c |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/hw/sparc/leon3.c b/hw/sparc/leon3.c
> index c583c3d..c16e9e4 100644
> --- a/hw/sparc/leon3.c
> +++ b/hw/sparc/leon3.c
> @@ -45,6 +45,7 @@
>  typedef struct ResetData {
>      SPARCCPU *cpu;
>      uint32_t  entry;            /* save kernel entry in case of reset */
> +    target_ulong sp;            /* initial stack pointer */
>  } ResetData;
>  
>  static void main_cpu_reset(void *opaque)
> @@ -58,6 +59,7 @@ static void main_cpu_reset(void *opaque)
>      cpu->halted = 0;
>      env->pc     = s->entry;
>      env->npc    = s->entry + 4;
> +    env->regbase[6] = s->sp;
>  }
>  
>  void leon3_irq_ack(void *irq_manager, int intno)
> @@ -133,6 +135,7 @@ static void leon3_generic_hw_init(QEMUMachineInitArgs *args)
>      /* Reset data */
>      reset_info        = g_malloc0(sizeof(ResetData));
>      reset_info->cpu   = cpu;
> +    reset_info->sp    = 0x40000000 + ram_size;
>      qemu_register_reset(main_cpu_reset, reset_info);
>  
>      /* Allocate IRQ manager */
> 


