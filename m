Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QTycn-00078S-Ga
	for mharc-qemu-trivial@gnu.org; Tue, 07 Jun 2011 11:55:25 -0400
Received: from eggs.gnu.org ([140.186.70.92]:33263)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1QTyck-00077K-Qd
	for qemu-trivial@nongnu.org; Tue, 07 Jun 2011 11:55:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1QTycj-0002RL-Gg
	for qemu-trivial@nongnu.org; Tue, 07 Jun 2011 11:55:22 -0400
Received: from david.siemens.de ([192.35.17.14]:20639)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>)
	id 1QTycd-0002P8-3d; Tue, 07 Jun 2011 11:55:15 -0400
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by david.siemens.de (8.13.6/8.13.6) with ESMTP id p57FtAun009267;
	Tue, 7 Jun 2011 17:55:10 +0200
Received: from mchn199C.mchp.siemens.de ([139.25.109.49])
	by mail1.siemens.de (8.13.6/8.13.6) with ESMTP id p57FtAI7020972;
	Tue, 7 Jun 2011 17:55:10 +0200
Message-ID: <4DEE49DE.2050302@siemens.com>
Date: Tue, 07 Jun 2011 17:55:10 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: qemu-devel <qemu-devel@nongnu.org>
References: <4DCFB3EF.3060801@web.de>
In-Reply-To: <4DCFB3EF.3060801@web.de>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 192.35.17.14
Cc: qemu-trivial <qemu-trivial@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH 2/2] ioapic: Implement polarity
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
X-List-Received-Date: Tue, 07 Jun 2011 15:55:24 -0000

On 2011-05-15 13:07, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> If the polarity bit is set in a redirection table entry, the input level
> simply has to inverted as it is low active in this case.

Ping for this and
http://thread.gmane.org/gmane.comp.emulators.qemu/102459. Maybe even
trivial, so CC'ing.

Jan

> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  hw/ioapic.c |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/hw/ioapic.c b/hw/ioapic.c
> index 5916387..61991d7 100644
> --- a/hw/ioapic.c
> +++ b/hw/ioapic.c
> @@ -148,6 +148,9 @@ static void ioapic_set_irq(void *opaque, int vector, int level)
>          uint32_t mask = 1 << vector;
>          uint64_t entry = s->ioredtbl[vector];
>  
> +        if (entry & (1 << IOAPIC_LVT_POLARITY_SHIFT)) {
> +            level = !level;
> +        }
>          if (((entry >> IOAPIC_LVT_TRIGGER_MODE_SHIFT) & 1) ==
>              IOAPIC_TRIGGER_LEVEL) {
>              /* level triggered */
> 
> 

-- 
Siemens AG, Corporate Technology, CT T DE IT 1
Corporate Competence Center Embedded Linux

