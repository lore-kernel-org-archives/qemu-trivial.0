Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL4Uf-0005pG-8g
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 01:40:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50213)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Stefano.Stabellini@citrix.com>) id 1YL4Uc-0005lO-QX
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 01:40:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Stefano.Stabellini@citrix.com>) id 1YL4Ub-0003c8-RK
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 01:40:18 -0500
Received: from smtp02.citrix.com ([66.165.176.63]:15750)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Stefano.Stabellini@citrix.com>)
	id 1YL4UX-0003bJ-Mr; Tue, 10 Feb 2015 01:40:13 -0500
X-IronPort-AV: E=Sophos;i="5.09,548,1418083200"; d="scan'208";a="225523724"
Received: from ukmail1.uk.xensource.com (10.80.16.128) by smtprelay.citrix.com
	(10.13.107.78) with Microsoft SMTP Server id 14.3.210.2;
	Tue, 10 Feb 2015 01:40:11 -0500
Received: from kaball.uk.xensource.com ([10.80.2.59])	by
	ukmail1.uk.xensource.com with esmtp (Exim 4.69)	(envelope-from
	<stefano.stabellini@eu.citrix.com>)	id 1YL4UV-0001Jn-KL;
	Tue, 10 Feb 2015 06:40:11 +0000
Date: Tue, 10 Feb 2015 06:39:40 +0000
From: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
X-X-Sender: sstabellini@kaball.uk.xensource.com
To: Gonglei <arei.gonglei@huawei.com>
In-Reply-To: <1422689277-16032-3-git-send-email-arei.gonglei@huawei.com>
Message-ID: <alpine.DEB.2.02.1502100638200.29696@kaball.uk.xensource.com>
References: <1422689277-16032-1-git-send-email-arei.gonglei@huawei.com>
	<1422689277-16032-3-git-send-email-arei.gonglei@huawei.com>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-DLP: MIA1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 66.165.176.63
Cc: qemu-trivial@nongnu.org, stefano.stabellini@eu.citrix.com,
	qemu-devel@nongnu.org, peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [PATCH 2/2] xen-pt: fix Out-of-bounds read
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
X-List-Received-Date: Tue, 10 Feb 2015 06:40:19 -0000

On Sat, 31 Jan 2015, arei.gonglei@huawei.com wrote:
> From: Gonglei <arei.gonglei@huawei.com>
> 
> The array length of s->real_device.io_regions[] is
> "PCI_NUM_REGIONS - 1". Add a check, just make Coverity happy.
> 
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
>  hw/xen/xen_pt_config_init.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
> index 710fe50..3c8b0f1 100644
> --- a/hw/xen/xen_pt_config_init.c
> +++ b/hw/xen/xen_pt_config_init.c
> @@ -443,6 +443,11 @@ static int xen_pt_bar_reg_read(XenPCIPassthroughState *s, XenPTReg *cfg_entry,
>          return -1;
>      }
>  
> +    if (index == PCI_ROM_SLOT) {
> +        XEN_PT_ERR(&s->dev, "Internal error: Access violation at ROM BAR.\n");
> +        return -1;
> +    }

Could you please fix the boundaries of the check just above?
Also please avoid using PCI_ROM_SLOT for the array index check, simply
use PCI_NUM_REGIONS.


>      /* use fixed-up value from kernel sysfs */
>      *value = base_address_with_flags(&s->real_device.io_regions[index]);
>  
> -- 
> 1.7.12.4
> 
> 

