Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aG6Jt-0006je-FD
	for mharc-qemu-trivial@gnu.org; Mon, 04 Jan 2016 09:41:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36329)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=80452ccb6=Stefano.Stabellini@citrix.com>)
	id 1aG6Jq-0006fN-NU
	for qemu-trivial@nongnu.org; Mon, 04 Jan 2016 09:41:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=80452ccb6=Stefano.Stabellini@citrix.com>)
	id 1aG6Jp-00079I-Da
	for qemu-trivial@nongnu.org; Mon, 04 Jan 2016 09:41:10 -0500
Received: from smtp.citrix.com ([66.165.176.89]:40666)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=80452ccb6=Stefano.Stabellini@citrix.com>)
	id 1aG6Jk-00078I-Vc; Mon, 04 Jan 2016 09:41:05 -0500
X-IronPort-AV: E=Sophos;i="5.20,520,1444694400"; d="scan'208";a="322730706"
Date: Mon, 4 Jan 2016 14:40:40 +0000
From: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
X-X-Sender: sstabellini@kaball.uk.xensource.com
To: Stefan Weil <sw@weilnetz.de>
In-Reply-To: <5682800F.8000001@weilnetz.de>
Message-ID: <alpine.DEB.2.02.1601041439310.19710@kaball.uk.xensource.com>
References: <1451392796-30956-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<5682800F.8000001@weilnetz.de>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-DLP: MIA1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 66.165.176.89
Cc: xen-devel@lists.xensource.com, stefano.stabellini@eu.citrix.com,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Cao jin <caoj.fnst@cn.fujitsu.com>, pbonzini@redhat.com
Subject: Re: [Qemu-trivial] [PATCH trivial v2] xen/Makefile.objs: simplify
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
X-List-Received-Date: Mon, 04 Jan 2016 14:41:11 -0000

On Tue, 29 Dec 2015, Stefan Weil wrote:
> Am 29.12.2015 um 13:39 schrieb Cao jin:
> > merge last two lines, keep alphabetic order.
> > 
> > Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> > ---
> >  hw/xen/Makefile.objs | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/hw/xen/Makefile.objs b/hw/xen/Makefile.objs
> > index a9ad7e7..d367094 100644
> > --- a/hw/xen/Makefile.objs
> > +++ b/hw/xen/Makefile.objs
> > @@ -2,5 +2,4 @@
> >  common-obj-$(CONFIG_XEN_BACKEND) += xen_backend.o xen_devconfig.o
> >  
> >  obj-$(CONFIG_XEN_PCI_PASSTHROUGH) += xen-host-pci-device.o
> > -obj-$(CONFIG_XEN_PCI_PASSTHROUGH) += xen_pt.o xen_pt_config_init.o xen_pt_msi.o
> > -obj-$(CONFIG_XEN_PCI_PASSTHROUGH) += xen_pt.o xen_pt_config_init.o xen_pt_msi.o xen_pt_graphics.o
> > +obj-$(CONFIG_XEN_PCI_PASSTHROUGH) += xen_pt.o xen_pt_config_init.o xen_pt_graphics.o xen_pt_msi.o
> > 
> 
> Thanks.
> 
> Reviewed-by: Stefan Weil <sw@weilnetz.de>

Reviewed-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>

Stefan, do you want me to pick this up or are you going to apply it to
trivial?

