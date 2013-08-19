Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VBKnr-0003ut-Ky
	for mharc-qemu-trivial@gnu.org; Mon, 19 Aug 2013 04:27:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34584)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1VBKnk-0003jJ-Qo
	for qemu-trivial@nongnu.org; Mon, 19 Aug 2013 04:27:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1VBKnf-0005kB-Mr
	for qemu-trivial@nongnu.org; Mon, 19 Aug 2013 04:27:00 -0400
Received: from mel.act-europe.fr ([194.98.77.210]:37671
	helo=smtp.eu.adacore.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>)
	id 1VBKnU-0005hd-RC; Mon, 19 Aug 2013 04:26:44 -0400
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id 5A237265C179;
	Mon, 19 Aug 2013 10:26:43 +0200 (CEST)
Received: from smtp.eu.adacore.com ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1hI1_UYvYxL5; Mon, 19 Aug 2013 10:26:43 +0200 (CEST)
Received: from [10.10.1.88] (pompomgalli.act-europe.fr [10.10.1.88])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.eu.adacore.com (Postfix) with ESMTPSA id 41833265C133;
	Mon, 19 Aug 2013 10:26:43 +0200 (CEST)
Message-ID: <5211D6C3.2000609@adacore.com>
Date: Mon, 19 Aug 2013 10:26:43 +0200
From: Fabien Chouteau <chouteau@adacore.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: qemu-trivial@nongnu.org
References: <1375447708-14545-1-git-send-email-chouteau@adacore.com>
	<1375447708-14545-2-git-send-email-chouteau@adacore.com>
In-Reply-To: <1375447708-14545-2-git-send-email-chouteau@adacore.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 194.98.77.210
Cc: qemu-devel@nongnu.org, lcapitulino@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] Add ARM registers
 definitions in Monitor commands
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
X-List-Received-Date: Mon, 19 Aug 2013 08:27:06 -0000

Any comments?

Regards,

On 08/02/2013 02:48 PM, Fabien Chouteau wrote:
> Signed-off-by: Fabien Chouteau <chouteau@adacore.com>
> ---
>  monitor.c |   17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/monitor.c b/monitor.c
> index 5dc0aa9..78e93af 100644
> --- a/monitor.c
> +++ b/monitor.c
> @@ -3167,6 +3167,23 @@ static const MonitorDef monitor_defs[] = {
>      { "cleanwin", offsetof(CPUSPARCState, cleanwin) },
>      { "fprs", offsetof(CPUSPARCState, fprs) },
>  #endif
> +#elif defined(TARGET_ARM)
> +    { "r0",     offsetof(CPUARMState, regs[0])  },
> +    { "r1",     offsetof(CPUARMState, regs[1])  },
> +    { "r2",     offsetof(CPUARMState, regs[2])  },
> +    { "r3",     offsetof(CPUARMState, regs[3])  },
> +    { "r4",     offsetof(CPUARMState, regs[4])  },
> +    { "r5",     offsetof(CPUARMState, regs[5])  },
> +    { "r6",     offsetof(CPUARMState, regs[6])  },
> +    { "r7",     offsetof(CPUARMState, regs[7])  },
> +    { "r8",     offsetof(CPUARMState, regs[8])  },
> +    { "r9",     offsetof(CPUARMState, regs[9])  },
> +    { "r10",    offsetof(CPUARMState, regs[10]) },
> +    { "r11",    offsetof(CPUARMState, regs[11]) },
> +    { "r12",    offsetof(CPUARMState, regs[12]) },
> +    { "r13|sp", offsetof(CPUARMState, regs[13]) },
> +    { "r14|lr", offsetof(CPUARMState, regs[14]) },
> +    { "r15|pc", offsetof(CPUARMState, regs[15]) },
>  #endif
>      { NULL },
>  };
> 


-- 
Fabien Chouteau

