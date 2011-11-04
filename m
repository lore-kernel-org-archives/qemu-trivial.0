Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RMEKQ-0005Wo-12
	for mharc-qemu-trivial@gnu.org; Fri, 04 Nov 2011 03:36:42 -0400
Received: from eggs.gnu.org ([140.186.70.92]:58497)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yamahata@valinux.co.jp>) id 1RMEKM-0005JV-Nu
	for qemu-trivial@nongnu.org; Fri, 04 Nov 2011 03:36:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <yamahata@valinux.co.jp>) id 1RMEKL-0003TH-St
	for qemu-trivial@nongnu.org; Fri, 04 Nov 2011 03:36:38 -0400
Received: from mail.valinux.co.jp ([210.128.90.3]:52833)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yamahata@valinux.co.jp>)
	id 1RMEKJ-0003Sx-Gx; Fri, 04 Nov 2011 03:36:35 -0400
Received: from ps.local.valinux.co.jp (vagw.valinux.co.jp [210.128.90.14])
	by mail.valinux.co.jp (Postfix) with SMTP id 594A78758E;
	Fri,  4 Nov 2011 16:36:31 +0900 (JST)
Received: (nullmailer pid 30124 invoked by uid 1000);
	Fri, 04 Nov 2011 07:36:31 -0000
Date: Fri, 4 Nov 2011 16:36:31 +0900
From: Isaku Yamahata <yamahata@valinux.co.jp>
To: Anthony PERARD <anthony.perard@citrix.com>,
	Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>,
	"Michael S\. Tsirkin" <mst@redhat.com>
Message-ID: <20111104073631.GH499@valinux.co.jp>
References: <1319814456-8158-1-git-send-email-anthony.perard@citrix.com>
	<1319814456-8158-6-git-send-email-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1319814456-8158-6-git-send-email-anthony.perard@citrix.com>
User-Agent: Mutt/1.5.19 (2009-01-05)
X-Virus-Scanned: clamav-milter 0.95.2 at va-mail.local.valinux.co.jp
X-Virus-Status: Clean
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 210.128.90.3
Cc: qemu-trivial@nongnu.org, Xen Devel <xen-devel@lists.xensource.com>,
	QEMU-devel <qemu-devel@nongnu.org>,
	Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH V3 05/10] pci_regs: Fix
	value of	PCI_EXP_TYPE_RC_EC.
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
X-List-Received-Date: Fri, 04 Nov 2011 07:36:40 -0000

Good catch.
This patch (and the next one 6/10) can be picked up independently
through qemu-trivial or pci-tree.

On Fri, Oct 28, 2011 at 04:07:31PM +0100, Anthony PERARD wrote:
> Value check in PCI Express Base Specification rev 1.1
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
>  hw/pci_regs.h |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/hw/pci_regs.h b/hw/pci_regs.h
> index e8357c3..6b42515 100644
> --- a/hw/pci_regs.h
> +++ b/hw/pci_regs.h
> @@ -393,7 +393,7 @@
>  #define  PCI_EXP_TYPE_DOWNSTREAM 0x6	/* Downstream Port */
>  #define  PCI_EXP_TYPE_PCI_BRIDGE 0x7	/* PCI/PCI-X Bridge */
>  #define  PCI_EXP_TYPE_RC_END	0x9	/* Root Complex Integrated Endpoint */
> -#define  PCI_EXP_TYPE_RC_EC	0x10	/* Root Complex Event Collector */
> +#define  PCI_EXP_TYPE_RC_EC     0xa     /* Root Complex Event Collector */
>  #define PCI_EXP_FLAGS_SLOT	0x0100	/* Slot implemented */
>  #define PCI_EXP_FLAGS_IRQ	0x3e00	/* Interrupt message number */
>  #define PCI_EXP_DEVCAP		4	/* Device capabilities */
> -- 
> Anthony PERARD
> 
> 

-- 
yamahata

