Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL4VZ-0006um-SF
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 01:41:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50592)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Stefano.Stabellini@citrix.com>) id 1YL4VU-0006kz-IL
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 01:41:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Stefano.Stabellini@citrix.com>) id 1YL4VT-0003qi-FK
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 01:41:12 -0500
Received: from smtp.citrix.com ([66.165.176.89]:17466)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Stefano.Stabellini@citrix.com>)
	id 1YL4VP-0003o3-21; Tue, 10 Feb 2015 01:41:07 -0500
X-IronPort-AV: E=Sophos;i="5.09,548,1418083200"; d="scan'208";a="224287220"
Received: from ukmail1.uk.xensource.com (10.80.16.128) by smtprelay.citrix.com
	(10.13.107.78) with Microsoft SMTP Server id 14.3.210.2;
	Tue, 10 Feb 2015 01:41:06 -0500
Received: from kaball.uk.xensource.com ([10.80.2.59])	by
	ukmail1.uk.xensource.com with esmtp (Exim 4.69)	(envelope-from
	<stefano.stabellini@eu.citrix.com>)	id 1YL4VN-0001Kg-SU;
	Tue, 10 Feb 2015 06:41:05 +0000
Date: Tue, 10 Feb 2015 06:40:34 +0000
From: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
X-X-Sender: sstabellini@kaball.uk.xensource.com
To: Gonglei <arei.gonglei@huawei.com>
In-Reply-To: <1422689277-16032-2-git-send-email-arei.gonglei@huawei.com>
Message-ID: <alpine.DEB.2.02.1502100640140.29696@kaball.uk.xensource.com>
References: <1422689277-16032-1-git-send-email-arei.gonglei@huawei.com>
	<1422689277-16032-2-git-send-email-arei.gonglei@huawei.com>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-DLP: MIA2
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 66.165.176.89
Cc: qemu-trivial@nongnu.org, stefano.stabellini@eu.citrix.com,
	qemu-devel@nongnu.org, peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [PATCH 1/2] xen-pt: fix Negative array index read
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
X-List-Received-Date: Tue, 10 Feb 2015 06:41:13 -0000

On Sat, 31 Jan 2015, arei.gonglei@huawei.com wrote:
> From: Gonglei <arei.gonglei@huawei.com>
> 
> Coverity spot:
> Function xen_pt_bar_offset_to_index() may returns a negative
> number (-1) value index, which as an index to array d->io_regions.
> 
> Let's directly and simply pass index as an argument to
> xen_pt_bar_reg_parse().
> 
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>

Acked-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>


>  hw/xen/xen_pt_config_init.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
> index de9a20f..710fe50 100644
> --- a/hw/xen/xen_pt_config_init.c
> +++ b/hw/xen/xen_pt_config_init.c
> @@ -360,15 +360,13 @@ static uint64_t xen_pt_get_bar_size(PCIIORegion *r)
>  }
>  
>  static XenPTBarFlag xen_pt_bar_reg_parse(XenPCIPassthroughState *s,
> -                                         XenPTRegInfo *reg)
> +                                         int index)
>  {
>      PCIDevice *d = &s->dev;
>      XenPTRegion *region = NULL;
>      PCIIORegion *r;
> -    int index = 0;
>  
>      /* check 64bit BAR */
> -    index = xen_pt_bar_offset_to_index(reg->offset);
>      if ((0 < index) && (index < PCI_ROM_SLOT)) {
>          int type = s->real_device.io_regions[index - 1].type;
>  
> @@ -422,7 +420,7 @@ static int xen_pt_bar_reg_init(XenPCIPassthroughState *s, XenPTRegInfo *reg,
>      }
>  
>      /* set BAR flag */
> -    s->bases[index].bar_flag = xen_pt_bar_reg_parse(s, reg);
> +    s->bases[index].bar_flag = xen_pt_bar_reg_parse(s, index);
>      if (s->bases[index].bar_flag == XEN_PT_BAR_FLAG_UNUSED) {
>          reg_field = XEN_PT_INVALID_REG;
>      }
> -- 
> 1.7.12.4
> 
> 

