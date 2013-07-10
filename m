Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uwr4f-0008NC-6e
	for mharc-qemu-trivial@gnu.org; Wed, 10 Jul 2013 05:52:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60542)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1Uwr4Y-0008Er-7z
	for qemu-trivial@nongnu.org; Wed, 10 Jul 2013 05:52:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1Uwr4R-0007o7-TZ
	for qemu-trivial@nongnu.org; Wed, 10 Jul 2013 05:52:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:16204)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1UwqrQ-0003NN-3Z; Wed, 10 Jul 2013 05:38:56 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r6A9csYG015352
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 10 Jul 2013 05:38:55 -0400
Received: from redhat.com (vpn1-4-152.ams2.redhat.com [10.36.4.152])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with SMTP
	id r6A9cpMg031179; Wed, 10 Jul 2013 05:38:52 -0400
Date: Wed, 10 Jul 2013 12:40:08 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Don Koch <dkoch@verizon.com>
Message-ID: <20130710094008.GB2257@redhat.com>
References: <1373391365-7992-1-git-send-email-dkoch@terremark.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1373391365-7992-1-git-send-email-dkoch@terremark.com>
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Fix BRDIGE typo.
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
X-List-Received-Date: Wed, 10 Jul 2013 09:52:36 -0000

On Tue, Jul 09, 2013 at 01:36:05PM -0400, Don Koch wrote:
> From: Don Koch <dkoch@verizon.com>
> 
> Fix typo in PCI_CLASS_BRDIGE_PCI_INF_SUB.
> 
> Signed-off-by: Don Koch <dkoch@verizon.com>

Applied, thanks.

> ---
>  hw/pci-bridge/i82801b11.c | 2 +-
>  include/hw/pci/pci_ids.h  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/pci-bridge/i82801b11.c b/hw/pci-bridge/i82801b11.c
> index 5807a92..b98bfb0 100644
> --- a/hw/pci-bridge/i82801b11.c
> +++ b/hw/pci-bridge/i82801b11.c
> @@ -69,7 +69,7 @@ static int i82801b11_bridge_initfn(PCIDevice *d)
>      if (rc < 0) {
>          goto err_bridge;
>      }
> -    pci_config_set_prog_interface(d->config, PCI_CLASS_BRDIGE_PCI_INF_SUB);
> +    pci_config_set_prog_interface(d->config, PCI_CLASS_BRIDGE_PCI_INF_SUB);
>      return 0;
>  
>  err_bridge:
> diff --git a/include/hw/pci/pci_ids.h b/include/hw/pci/pci_ids.h
> index 08f8161..d7933bf 100644
> --- a/include/hw/pci/pci_ids.h
> +++ b/include/hw/pci/pci_ids.h
> @@ -39,7 +39,7 @@
>  #define PCI_CLASS_BRIDGE_HOST            0x0600
>  #define PCI_CLASS_BRIDGE_ISA             0x0601
>  #define PCI_CLASS_BRIDGE_PCI             0x0604
> -#define PCI_CLASS_BRDIGE_PCI_INF_SUB     0x01
> +#define PCI_CLASS_BRIDGE_PCI_INF_SUB     0x01
>  #define PCI_CLASS_BRIDGE_OTHER           0x0680
>  
>  #define PCI_CLASS_COMMUNICATION_SERIAL   0x0700
> -- 
> 1.7.11.7

