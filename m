Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL5w6-0001Gs-Sf
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 03:12:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44032)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Stefano.Stabellini@citrix.com>) id 1YL5w4-0001EC-I7
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 03:12:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Stefano.Stabellini@citrix.com>) id 1YL5w3-0002ks-Ji
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 03:12:44 -0500
Received: from smtp02.citrix.com ([66.165.176.63]:54045)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Stefano.Stabellini@citrix.com>)
	id 1YL5vs-0002ie-O3; Tue, 10 Feb 2015 03:12:32 -0500
X-IronPort-AV: E=Sophos;i="5.09,548,1418083200"; d="scan'208";a="225540197"
Received: from ukmail1.uk.xensource.com (10.80.16.128) by smtprelay.citrix.com
	(10.13.107.78) with Microsoft SMTP Server id 14.3.210.2;
	Tue, 10 Feb 2015 03:12:23 -0500
Received: from kaball.uk.xensource.com ([10.80.2.59])	by
	ukmail1.uk.xensource.com with esmtp (Exim 4.69)	(envelope-from
	<stefano.stabellini@eu.citrix.com>)	id 1YL5vj-0003e4-45;
	Tue, 10 Feb 2015 08:12:23 +0000
Date: Tue, 10 Feb 2015 08:11:52 +0000
From: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
X-X-Sender: sstabellini@kaball.uk.xensource.com
To: Gonglei <arei.gonglei@huawei.com>
In-Reply-To: <1423554683-2968-3-git-send-email-arei.gonglei@huawei.com>
Message-ID: <alpine.DEB.2.02.1502100811100.29696@kaball.uk.xensource.com>
References: <1423554683-2968-1-git-send-email-arei.gonglei@huawei.com>
	<1423554683-2968-3-git-send-email-arei.gonglei@huawei.com>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-DLP: MIA2
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 66.165.176.63
Cc: qemu-trivial@nongnu.org, stefano.stabellini@eu.citrix.com,
	qemu-devel@nongnu.org, peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [PATCH v2 2/2] xen-pt: fix Out-of-bounds read
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
X-List-Received-Date: Tue, 10 Feb 2015 08:12:45 -0000

On Tue, 10 Feb 2015, arei.gonglei@huawei.com wrote:
> From: Gonglei <arei.gonglei@huawei.com>
> 
> The array length of s->real_device.io_regions[] is
> "PCI_NUM_REGIONS - 1".
> 
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>

Acked-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>

I am happy for these patches to go in via the qemu-trivial tree.

>  hw/xen/xen_pt_config_init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
> index 710fe50..d99c22e 100644
> --- a/hw/xen/xen_pt_config_init.c
> +++ b/hw/xen/xen_pt_config_init.c
> @@ -438,7 +438,7 @@ static int xen_pt_bar_reg_read(XenPCIPassthroughState *s, XenPTReg *cfg_entry,
>  
>      /* get BAR index */
>      index = xen_pt_bar_offset_to_index(reg->offset);
> -    if (index < 0 || index >= PCI_NUM_REGIONS) {
> +    if (index < 0 || index >= PCI_NUM_REGIONS - 1) {
>          XEN_PT_ERR(&s->dev, "Internal error: Invalid BAR index [%d].\n", index);
>          return -1;
>      }
> -- 
> 1.7.12.4
> 
> 

