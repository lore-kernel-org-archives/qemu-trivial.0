Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RpfqD-0006O0-An
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jan 2012 07:51:13 -0500
Received: from eggs.gnu.org ([140.186.70.92]:33310)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1Rpfq3-0006Ml-P3
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2012 07:51:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1Rpfpx-00075q-3J
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2012 07:51:03 -0500
Received: from david.siemens.de ([192.35.17.14]:30854)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>)
	id 1Rpfpc-00073f-Og; Tue, 24 Jan 2012 07:50:37 -0500
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by david.siemens.de (8.13.6/8.13.6) with ESMTP id q0OCoZw9000446;
	Tue, 24 Jan 2012 13:50:35 +0100
Received: from mchn199C.mchp.siemens.de ([139.25.109.49])
	by mail1.siemens.de (8.13.6/8.13.6) with ESMTP id q0OCoZLN023087;
	Tue, 24 Jan 2012 13:50:35 +0100
Message-ID: <4F1EA91B.6010709@siemens.com>
Date: Tue, 24 Jan 2012 13:50:35 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: qemu-devel <qemu-devel@nongnu.org>, Anthony Liguori <aliguori@us.ibm.com>
References: <4F1EA87C.7090708@siemens.com>
In-Reply-To: <4F1EA87C.7090708@siemens.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 192.35.17.14
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-stable@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] pcnet: Preserve link state across device
	reset
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
X-List-Received-Date: Tue, 24 Jan 2012 12:51:09 -0000

On 2012-01-24 13:47, Jan Kiszka wrote:
> A device reset does not affect the link state, only set_link does.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  hw/pcnet.c |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/hw/pcnet.c b/hw/pcnet.c
> index 306dc6e..6aa48e0 100644
> --- a/hw/pcnet.c
> +++ b/hw/pcnet.c
> @@ -688,7 +688,6 @@ static void pcnet_s_reset(PCNetState *s)
>      printf("pcnet_s_reset\n");
>  #endif
>  
> -    s->lnkst = 0x40;
>      s->rdra = 0;
>      s->tdra = 0;
>      s->rap = 0;
> @@ -1751,5 +1750,7 @@ int pcnet_common_init(DeviceState *dev, PCNetState *s, NetClientInfo *info)
>      }
>      *(uint16_t *)&s->prom[12] = cpu_to_le16(checksum);
>  
> +    s->lnkst = 0x40; /* initial link state: up */
> +
>      return 0;
>  }

Also rather trivial.

Jan

-- 
Siemens AG, Corporate Technology, CT T DE IT 1
Corporate Competence Center Embedded Linux

