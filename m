Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZoVcP-0000Ro-Ov
	for mharc-qemu-trivial@gnu.org; Tue, 20 Oct 2015 08:02:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56011)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=7282ec65a=Stefano.Stabellini@citrix.com>)
	id 1ZoVcG-0000HF-Vp
	for qemu-trivial@nongnu.org; Tue, 20 Oct 2015 08:02:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=7282ec65a=Stefano.Stabellini@citrix.com>)
	id 1ZoVcC-0007yK-Tp
	for qemu-trivial@nongnu.org; Tue, 20 Oct 2015 08:02:08 -0400
Received: from smtp.citrix.com ([66.165.176.89]:3291)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=7282ec65a=Stefano.Stabellini@citrix.com>)
	id 1ZoVc3-0007vW-4n; Tue, 20 Oct 2015 08:01:55 -0400
X-IronPort-AV: E=Sophos;i="5.17,707,1437436800"; d="scan'208";a="307648382"
Date: Tue, 20 Oct 2015 13:01:21 +0100
From: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
X-X-Sender: sstabellini@kaball.uk.xensource.com
To: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <1445263720-6765-2-git-send-email-pbonzini@redhat.com>
Message-ID: <alpine.DEB.2.02.1510201301100.27957@kaball.uk.xensource.com>
References: <1445263720-6765-2-git-send-email-pbonzini@redhat.com>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-DLP: MIA2
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 66.165.176.89
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] xen: fix invalid assertion
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
X-List-Received-Date: Tue, 20 Oct 2015 12:02:15 -0000

On Mon, 19 Oct 2015, Paolo Bonzini wrote:
> Asserting "true" is not that useful.
> 
> Reported by Coverity.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Acked-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>


>  hw/xen/xen_pt_config_init.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
> index 4a5bc11..f6969ad 100644
> --- a/hw/xen/xen_pt_config_init.c
> +++ b/hw/xen/xen_pt_config_init.c
> @@ -1937,7 +1937,7 @@ static int xen_pt_config_reg_init(XenPCIPassthroughState *s,
>                  break;
>          case 4: rc = xen_host_pci_get_long(&s->real_device, offset, &val);
>                  break;
> -        default: assert(1);
> +        default: abort();
>          }
>          if (rc) {
>              /* Serious issues when we cannot read the host values! */
> @@ -1982,7 +1982,7 @@ static int xen_pt_config_reg_init(XenPCIPassthroughState *s,
>                  break;
>          case 4: pci_set_long(s->dev.config + offset, val);
>                  break;
> -        default: assert(1);
> +        default: abort();
>          }
>          /* set register value pointer to the data. */
>          reg_entry->ptr.byte = s->dev.config + offset;
> -- 
> 2.5.0
> 
> 

