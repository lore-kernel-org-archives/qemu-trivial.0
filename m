Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c50su-0000mJ-EF
	for mharc-qemu-trivial@gnu.org; Thu, 10 Nov 2016 20:44:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54555)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1c50ss-0000l3-9M
	for qemu-trivial@nongnu.org; Thu, 10 Nov 2016 20:44:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1c50sr-00064o-BB
	for qemu-trivial@nongnu.org; Thu, 10 Nov 2016 20:44:02 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36474)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
	id 1c50sm-00061e-2M; Thu, 10 Nov 2016 20:43:56 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0F2B161BA2;
	Fri, 11 Nov 2016 01:43:55 +0000 (UTC)
Received: from t450s.home (ovpn03.gateway.prod.ext.phx2.redhat.com [10.5.9.3])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id uAB1hsSu001548; Thu, 10 Nov 2016 20:43:54 -0500
Date: Thu, 10 Nov 2016 18:43:54 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Cao jin <caoj.fnst@cn.fujitsu.com>
Cc: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>, <mst@redhat.com>,
	<marcel@redhat.com>
Message-ID: <20161110184354.70840c6c@t450s.home>
In-Reply-To: <1478828278-22455-1-git-send-email-caoj.fnst@cn.fujitsu.com>
References: <1478828278-22455-1-git-send-email-caoj.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 11 Nov 2016 01:43:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] pci: fix some typos
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Nov 2016 01:44:03 -0000

On Fri, 11 Nov 2016 09:37:58 +0800
Cao jin <caoj.fnst@cn.fujitsu.com> wrote:

> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> ---
>  hw/pci/pcie.c | 2 +-
>  hw/vfio/pci.c | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Send separate patches.  Thanks,

Alex

> 
> diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> index 99cfb45..39b10b8 100644
> --- a/hw/pci/pcie.c
> +++ b/hw/pci/pcie.c
> @@ -656,7 +656,7 @@ static void pcie_ext_cap_set_next(PCIDevice *dev, uint16_t pos, uint16_t next)
>  }
>  
>  /*
> - * caller must supply valid (offset, size) * such that the range shouldn't
> + * Caller must supply valid (offset, size) such that the range wouldn't
>   * overlap with other capability or other registers.
>   * This function doesn't check it.
>   */
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 31aaecb..c94987c 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -1881,8 +1881,8 @@ static void vfio_add_ext_cap(VFIOPCIDevice *vdev)
>       * 0 is reserved for this since absence of capabilities is indicated by
>       * 0 for the ID, version, AND next pointer.  However, pcie_add_capability()
>       * uses ID 0 as reserved for list management and will incorrectly match and
> -     * assert if we attempt to pre-load the head of the chain with with this
> -     * ID.  Use ID 0xFFFF temporarily since it is also seems to be reserved in
> +     * assert if we attempt to pre-load the head of the chain with this ID.
> +     * Use ID 0xFFFF temporarily since it is also seems to be reserved in
>       * part for identifying absence of capabilities in a root complex register
>       * block.  If the ID still exists after adding capabilities, switch back to
>       * zero.  We'll mark this entire first dword as emulated for this purpose.


