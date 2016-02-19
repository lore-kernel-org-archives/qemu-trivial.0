Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aWoBZ-00022K-V6
	for mharc-qemu-trivial@gnu.org; Fri, 19 Feb 2016 11:45:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55328)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1aWoBX-0001xz-C8
	for qemu-trivial@nongnu.org; Fri, 19 Feb 2016 11:45:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1aWoBW-0007ml-Ck
	for qemu-trivial@nongnu.org; Fri, 19 Feb 2016 11:45:39 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55277)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>)
	id 1aWoBR-0007kK-EO; Fri, 19 Feb 2016 11:45:33 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id D6A4BC0006F6;
	Fri, 19 Feb 2016 16:45:32 +0000 (UTC)
Received: from t450s.home (ovpn-113-36.phx2.redhat.com [10.3.113.36])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1JGjWYP018438; Fri, 19 Feb 2016 11:45:32 -0500
Date: Fri, 19 Feb 2016 09:45:32 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Wei Yang <richard.weiyang@gmail.com>
Message-ID: <20160219094532.47e2f131@t450s.home>
In-Reply-To: <1455895091-7589-2-git-send-email-richard.weiyang@gmail.com>
References: <1455895091-7589-1-git-send-email-richard.weiyang@gmail.com>
	<1455895091-7589-2-git-send-email-richard.weiyang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] vfio/pci: use
 PCI_MSIX_FLAGS on retrieving the MSIX entries
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
X-List-Received-Date: Fri, 19 Feb 2016 16:45:40 -0000

On Fri, 19 Feb 2016 15:18:10 +0000
Wei Yang <richard.weiyang@gmail.com> wrote:

> Even PCI_CAP_FLAGS has the same value as PCI_MSIX_FLAGS, the later one is
> the more proper on retrieving MSIX entries.
> 
> This patch uses PCI_MSIX_FLAGS to retrieve the MSIX entries.
> 
> Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
> ---
>  hw/vfio/pci.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index e66c47f..321423b 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -1210,7 +1210,7 @@ static int vfio_msix_early_setup(VFIOPCIDevice *vdev)
>      }
>  
>      if (pread(fd, &ctrl, sizeof(ctrl),
> -              vdev->config_offset + pos + PCI_CAP_FLAGS) != sizeof(ctrl)) {
> +              vdev->config_offset + pos + PCI_MSIX_FLAGS) != sizeof(ctrl)) {
>          return -errno;
>      }
>  

This is certainly trivial, I'll grab it for the respin of yesterday's
pull request.  Thanks,

Alex

