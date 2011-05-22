Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QODz5-0006Zy-RN
	for mharc-qemu-trivial@gnu.org; Sun, 22 May 2011 15:06:39 -0400
Received: from eggs.gnu.org ([140.186.70.92]:48180)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1QODz3-0006Zi-1r
	for qemu-trivial@nongnu.org; Sun, 22 May 2011 15:06:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1QODz2-00063z-1z
	for qemu-trivial@nongnu.org; Sun, 22 May 2011 15:06:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:31544)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1QODz1-00063v-PD; Sun, 22 May 2011 15:06:36 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p4MJ6Wmp020099
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Sun, 22 May 2011 15:06:32 -0400
Received: from redhat.com (vpn-201-166.tlv.redhat.com [10.35.201.166])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with SMTP
	id p4MJ6TjL024049; Sun, 22 May 2011 15:06:30 -0400
Date: Sun, 22 May 2011 22:06:42 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: TeLeMan <geleman@gmail.com>
Message-ID: <20110522190642.GA15285@redhat.com>
References: <BANLkTimVJAJL=2Jxe+qDMKPtS8CLagYhBA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BANLkTimVJAJL=2Jxe+qDMKPtS8CLagYhBA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Isaku Yamahata <yamahata@valinux.co.jp>,
	qemu-devel <qemu-devel@nongnu.org>
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
X-List-Received-Date: Sun, 22 May 2011 19:06:37 -0000

On Mon, May 16, 2011 at 07:50:55PM +0800, TeLeMan wrote:
> If pic_irq is greater than 7, the irq level is always 0 on 32bits.
> 
> Signed-off-by: TeLeMan <geleman@gmail.com>


Good catch

Acked-by: Michael S. Tsirkin <mst@redhat.com>

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

