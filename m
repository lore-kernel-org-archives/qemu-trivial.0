Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rpfpx-0006BI-At
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jan 2012 07:50:57 -0500
Received: from eggs.gnu.org ([140.186.70.92]:33275)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1Rpfpm-0005gf-B3
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2012 07:50:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1Rpfpg-00074L-1S
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2012 07:50:46 -0500
Received: from goliath.siemens.de ([192.35.17.28]:26774)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>)
	id 1RpfpH-00071n-Fa; Tue, 24 Jan 2012 07:50:15 -0500
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by goliath.siemens.de (8.13.6/8.13.6) with ESMTP id q0OCoDtV003835;
	Tue, 24 Jan 2012 13:50:13 +0100
Received: from mchn199C.mchp.siemens.de ([139.25.109.49])
	by mail1.siemens.de (8.13.6/8.13.6) with ESMTP id q0OCoCMr022479;
	Tue, 24 Jan 2012 13:50:13 +0100
Message-ID: <4F1EA904.4000105@siemens.com>
Date: Tue, 24 Jan 2012 13:50:12 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: qemu-devel <qemu-devel@nongnu.org>, Anthony Liguori <aliguori@us.ibm.com>
References: <4F1EA872.4030905@siemens.com>
In-Reply-To: <4F1EA872.4030905@siemens.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 192.35.17.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-stable@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] e1000: Preserve link state across device
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
X-List-Received-Date: Tue, 24 Jan 2012 12:50:55 -0000

On 2012-01-24 13:47, Jan Kiszka wrote:
> A device reset does not affect the link state, only set_link does.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  hw/e1000.c |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)
> 
> diff --git a/hw/e1000.c b/hw/e1000.c
> index 86c5416..76e736f 100644
> --- a/hw/e1000.c
> +++ b/hw/e1000.c
> @@ -1133,6 +1133,11 @@ static void e1000_reset(void *opaque)
>      memmove(d->mac_reg, mac_reg_init, sizeof mac_reg_init);
>      d->rxbuf_min_shift = 1;
>      memset(&d->tx, 0, sizeof d->tx);
> +
> +    if (d->nic->nc.link_down) {
> +        d->mac_reg[STATUS] &= ~E1000_STATUS_LU;
> +        d->phy_reg[PHY_STATUS] &= ~MII_SR_LINK_STATUS;
> +    }
>  }
>  
>  static NetClientInfo net_e1000_info = {

May rather go via trivial, sorry.

Jan

-- 
Siemens AG, Corporate Technology, CT T DE IT 1
Corporate Competence Center Embedded Linux

