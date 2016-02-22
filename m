Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aXqKe-00012Z-UB
	for mharc-qemu-trivial@gnu.org; Mon, 22 Feb 2016 08:15:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55512)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <borntraeger@de.ibm.com>) id 1aXqKc-0000zm-Fa
	for qemu-trivial@nongnu.org; Mon, 22 Feb 2016 08:15:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <borntraeger@de.ibm.com>) id 1aXqKX-0004kW-TJ
	for qemu-trivial@nongnu.org; Mon, 22 Feb 2016 08:15:18 -0500
Received: from e06smtp17.uk.ibm.com ([195.75.94.113]:60561)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <borntraeger@de.ibm.com>) id 1aXqKX-0004kC-J1
	for qemu-trivial@nongnu.org; Mon, 22 Feb 2016 08:15:13 -0500
Received: from localhost
	by e06smtp17.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <borntraeger@de.ibm.com>;
	Mon, 22 Feb 2016 13:15:10 -0000
Received: from d06dlp01.portsmouth.uk.ibm.com (9.149.20.13)
	by e06smtp17.uk.ibm.com (192.168.101.147) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 22 Feb 2016 13:15:08 -0000
X-IBM-Helo: d06dlp01.portsmouth.uk.ibm.com
X-IBM-MailFrom: borntraeger@de.ibm.com
X-IBM-RcptTo: qemu-devel@nongnu.org;qemu-trivial@nongnu.org
Received: from b06cxnps4075.portsmouth.uk.ibm.com
	(d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by d06dlp01.portsmouth.uk.ibm.com (Postfix) with ESMTP id A5ED017D8059; 
	Mon, 22 Feb 2016 13:15:28 +0000 (GMT)
Received: from d06av10.portsmouth.uk.ibm.com (d06av10.portsmouth.uk.ibm.com
	[9.149.37.251])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id u1MDF8is22413342; Mon, 22 Feb 2016 13:15:08 GMT
Received: from d06av10.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av10.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id u1MCF9Xc006667; Mon, 22 Feb 2016 05:15:09 -0700
Received: from oc1450873852.ibm.com (dyn-9-152-224-60.boeblingen.de.ibm.com
	[9.152.224.60])
	by d06av10.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id u1MCF8MA006638; Mon, 22 Feb 2016 05:15:09 -0700
To: Wei Yang <richard.weiyang@gmail.com>
References: <1455895091-7589-1-git-send-email-richard.weiyang@gmail.com>
	<1455895091-7589-3-git-send-email-richard.weiyang@gmail.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <56CB09DB.7070604@de.ibm.com>
Date: Mon, 22 Feb 2016 14:15:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <1455895091-7589-3-git-send-email-richard.weiyang@gmail.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16022213-0005-0000-0000-00000A7883FE
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.113
Cc: qemu-trivial@nongnu.org, Cornelia Huck <cornelia.huck@de.ibm.com>,
	Yi Min Zhao <zyimin@linux.vnet.ibm.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 2/2] s390x/pci: use PCI_MSIX_FLAGS on
 retrieving the MSIX entries
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
X-List-Received-Date: Mon, 22 Feb 2016 13:15:19 -0000

On 02/19/2016 04:18 PM, Wei Yang wrote:
> Even PCI_CAP_FLAGS has the same value as PCI_MSIX_FLAGS, the later one is
> the more proper on retrieving MSIX entries.
> 
> This patch uses PCI_MSIX_FLAGS to retrieve the MSIX entries.
> 
> Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
> CC: Cornelia Huck <cornelia.huck@de.ibm.com>
> CC: Christian Borntraeger <borntraeger@de.ibm.com>
> ---
>  hw/s390x/s390-pci-bus.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
> index 132588b..9d40039 100644
> --- a/hw/s390x/s390-pci-bus.c
> +++ b/hw/s390x/s390-pci-bus.c
> @@ -523,7 +523,7 @@ static int s390_pcihost_setup_msix(S390PCIBusDevice *pbdev)
>          return 0;
>      }
> 
> -    ctrl = pci_host_config_read_common(pbdev->pdev, pos + PCI_CAP_FLAGS,
> +    ctrl = pci_host_config_read_common(pbdev->pdev, pos + PCI_MSIX_FLAGS,
>               pci_config_size(pbdev->pdev), sizeof(ctrl));
>      table = pci_host_config_read_common(pbdev->pdev, pos + PCI_MSIX_TABLE,
>               pci_config_size(pbdev->pdev), sizeof(table));
> 

looks sane.
Yi Min, can you ack/nack?



