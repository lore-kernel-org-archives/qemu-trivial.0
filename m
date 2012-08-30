Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T7CQk-0002zh-Se
	for mharc-qemu-trivial@gnu.org; Thu, 30 Aug 2012 17:37:38 -0400
Received: from eggs.gnu.org ([208.118.235.92]:45321)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1T7CQj-0002ws-2o
	for qemu-trivial@nongnu.org; Thu, 30 Aug 2012 17:37:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1T7CQh-0001iH-6q
	for qemu-trivial@nongnu.org; Thu, 30 Aug 2012 17:37:37 -0400
Received: from e39.co.us.ibm.com ([32.97.110.160]:45895)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1T7CQh-0001iA-0g
	for qemu-trivial@nongnu.org; Thu, 30 Aug 2012 17:37:35 -0400
Received: from /spool/local
	by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <aliguori@us.ibm.com>;
	Thu, 30 Aug 2012 15:37:33 -0600
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
	by e39.co.us.ibm.com (192.168.1.139) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 30 Aug 2012 15:37:31 -0600
Received: from d03relay05.boulder.ibm.com (d03relay05.boulder.ibm.com
	[9.17.195.107])
	by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 9068E19D8043;
	Thu, 30 Aug 2012 15:37:29 -0600 (MDT)
Received: from d03av06.boulder.ibm.com (d03av06.boulder.ibm.com [9.17.195.245])
	by d03relay05.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	q7ULbKMH137528; Thu, 30 Aug 2012 15:37:21 -0600
Received: from d03av06.boulder.ibm.com (loopback [127.0.0.1])
	by d03av06.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP
	id q7ULcjnc032234; Thu, 30 Aug 2012 15:38:45 -0600
Received: from titi.na.relay.ibm.com (sig-9-65-230-208.mts.ibm.com
	[9.65.230.208])
	by d03av06.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	q7ULcfG0032088; Thu, 30 Aug 2012 15:38:43 -0600
From: Anthony Liguori <aliguori@us.ibm.com>
To: Stefan Weil <sw@weilnetz.de>
In-Reply-To: <1346358511-27720-1-git-send-email-sw@weilnetz.de>
References: <1346358511-27720-1-git-send-email-sw@weilnetz.de>
User-Agent: Notmuch/0.13.2+93~ged93d79 (http://notmuchmail.org) Emacs/23.3.1
	(x86_64-pc-linux-gnu)
Date: Thu, 30 Aug 2012 16:37:16 -0500
Message-ID: <87a9xc6oz7.fsf@codemonkey.ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 12083021-4242-0000-0000-000002BA048C
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 32.97.110.160
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for 1.2] w32: Fix broken
	build
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
X-List-Received-Date: Thu, 30 Aug 2012 21:37:38 -0000

Stefan Weil <sw@weilnetz.de> writes:

> Commit ef8621b1a3b199c348606c0a11a77d8e8bf135f1 added an include
> file which is not available for MinGW compilations.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Applied.  Thanks.

Regards,

Anthony Liguori

> ---
>  target-i386/cpu.c |    2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/target-i386/cpu.c b/target-i386/cpu.c
> index f3cac49..423e009 100644
> --- a/target-i386/cpu.c
> +++ b/target-i386/cpu.c
> @@ -33,7 +33,9 @@
>  #include "hyperv.h"
>  
>  #include "hw/hw.h"
> +#if defined(CONFIG_KVM)
>  #include <linux/kvm_para.h>
> +#endif
>  
>  /* feature flags taken from "Intel Processor Identification and the CPUID
>   * Instruction" and AMD's "CPUID Specification".  In cases of disagreement
> -- 
> 1.7.10


