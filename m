Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QOL0m-0007Tu-AL
	for mharc-qemu-trivial@gnu.org; Sun, 22 May 2011 22:36:52 -0400
Received: from eggs.gnu.org ([140.186.70.92]:37244)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yamahata@valinux.co.jp>) id 1QOL0k-0007Q0-70
	for qemu-trivial@nongnu.org; Sun, 22 May 2011 22:36:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <yamahata@valinux.co.jp>) id 1QOL0j-0003wi-B7
	for qemu-trivial@nongnu.org; Sun, 22 May 2011 22:36:50 -0400
Received: from mail.valinux.co.jp ([210.128.90.3]:42907)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yamahata@valinux.co.jp>)
	id 1QOL0h-0003wH-11; Sun, 22 May 2011 22:36:47 -0400
Received: from ps.local.valinux.co.jp (vagw.valinux.co.jp [210.128.90.14])
	by mail.valinux.co.jp (Postfix) with SMTP id 65A15280C0;
	Mon, 23 May 2011 11:36:43 +0900 (JST)
Received: (nullmailer pid 13196 invoked by uid 1000);
	Mon, 23 May 2011 02:36:43 -0000
Date: Mon, 23 May 2011 11:36:43 +0900
From: Isaku Yamahata <yamahata@valinux.co.jp>
To: TeLeMan <geleman@gmail.com>
Message-ID: <20110523023642.GA8517@valinux.co.jp>
References: <BANLkTimVJAJL=2Jxe+qDMKPtS8CLagYhBA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BANLkTimVJAJL=2Jxe+qDMKPtS8CLagYhBA@mail.gmail.com>
User-Agent: Mutt/1.5.19 (2009-01-05)
X-Virus-Scanned: clamav-milter 0.95.2 at va-mail.local.valinux.co.jp
X-Virus-Status: Clean
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 210.128.90.3
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] piix_pci: fix piix3_set_irq_pic()
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
X-List-Received-Date: Mon, 23 May 2011 02:36:51 -0000

Thank you.
Acked-by: Isaku Yamahata <yamahata@valinux.co.jp>

On Mon, May 16, 2011 at 07:50:55PM +0800, TeLeMan wrote:
> If pic_irq is greater than 7, the irq level is always 0 on 32bits.
> 
> Signed-off-by: TeLeMan <geleman@gmail.com>
> ---
>  hw/piix_pci.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/hw/piix_pci.c b/hw/piix_pci.c
> index 7f1c4cc..85a320e 100644
> --- a/hw/piix_pci.c
> +++ b/hw/piix_pci.c
> @@ -312,7 +312,7 @@ static void piix3_set_irq_pic(PIIX3State *piix3,
> int pic_irq)
>  {
>      qemu_set_irq(piix3->pic[pic_irq],
>                   !!(piix3->pic_levels &
> -                    (((1UL << PIIX_NUM_PIRQS) - 1) <<
> +                    (((1ULL << PIIX_NUM_PIRQS) - 1) <<
>                       (pic_irq * PIIX_NUM_PIRQS))));
>  }
> 
> -- 
> 1.7.3.1.msysgit.0
> --
> SUN OF A BEACH
> 

-- 
yamahata

