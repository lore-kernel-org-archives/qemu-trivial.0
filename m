Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1akqip-0006ox-6F
	for mharc-qemu-trivial@gnu.org; Tue, 29 Mar 2016 06:18:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60326)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1akqim-0006lV-SB
	for qemu-trivial@nongnu.org; Tue, 29 Mar 2016 06:18:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1akqih-0005c2-Pi
	for qemu-trivial@nongnu.org; Tue, 29 Mar 2016 06:18:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48069)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1akqiW-0005ZB-3n; Tue, 29 Mar 2016 06:17:44 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id DBD087F0B3;
	Tue, 29 Mar 2016 10:17:42 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2TAHcHY004943; Tue, 29 Mar 2016 06:17:39 -0400
Date: Tue, 29 Mar 2016 12:17:38 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Marcel Apfelbaum <marcel@redhat.com>
Message-ID: <20160329121738.4dd0772e@nial.brq.redhat.com>
In-Reply-To: <1459150365-26233-1-git-send-email-marcel@redhat.com>
References: <1459150365-26233-1-git-send-email-marcel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel]  [PATCH] pci: fix identation
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
X-List-Received-Date: Tue, 29 Mar 2016 10:18:01 -0000

On Mon, 28 Mar 2016 10:32:45 +0300
Marcel Apfelbaum <marcel@redhat.com> wrote:

> Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/pci/pci.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index a1d41aa..da8b0b6 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -165,15 +165,15 @@ static inline int pci_irq_state(PCIDevice *d, int irq_num)
>  {
>      assert(irq_num >= 0);
>  
> -	return (d->irq_state >> irq_num) & 0x1;
> +    return (d->irq_state >> irq_num) & 0x1;
>  }
>  
>  static inline void pci_set_irq_state(PCIDevice *d, int irq_num, int level)
>  {
>      assert(irq_num >= 0);
>  
> -	d->irq_state &= ~(0x1 << irq_num);
> -	d->irq_state |= level << irq_num;
> +    d->irq_state &= ~(0x1 << irq_num);
> +    d->irq_state |= level << irq_num;
>  }
>  
>  static void pci_change_irq_level(PCIDevice *pci_dev, int irq_num, int change)


