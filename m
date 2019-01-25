Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gn7iy-000470-Bd
	for mharc-qemu-trivial@gnu.org; Fri, 25 Jan 2019 15:05:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44948)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gn7iw-00044v-87
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2019 15:05:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gn7iv-0007Xe-Jo
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2019 15:05:10 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34724)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1gn7is-0007V8-HB; Fri, 25 Jan 2019 15:05:06 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9914A7FDEA;
	Fri, 25 Jan 2019 20:05:05 +0000 (UTC)
Received: from redhat.com (ovpn-122-46.rdu2.redhat.com [10.10.122.46])
	by smtp.corp.redhat.com (Postfix) with SMTP id D5B6E1048125;
	Fri, 25 Jan 2019 20:05:04 +0000 (UTC)
Date: Fri, 25 Jan 2019 15:05:04 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-s390x@nongnu.org,
	Miroslav Rezanina <mrezanin@redhat.com>
Message-ID: <20190125150455-mutt-send-email-mst@kernel.org>
References: <1548420960-5555-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1548420960-5555-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 25 Jan 2019 20:05:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] hw/virtio: Use CONFIG_VIRTIO_PCI switch
 instead of CONFIG_PCI
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
X-List-Received-Date: Fri, 25 Jan 2019 20:05:11 -0000

On Fri, Jan 25, 2019 at 01:56:00PM +0100, Thomas Huth wrote:
> For downstream s390x builds, we'd like to be able to build QEMU with
> CONFIG_VIRTIO_PCI disabled (since virtio-ccw is used here instead),
> but still with CONFIG_PCI enabled. This currently fails since the
> virtio-*-pci.o files are still included in the build, but virtio-pci.o
> is missing. Use the right config switch CONFIG_VIRTIO_PCI to exclude
> the virtio-*-pci.o files from the build.
> 
> Reported-by: Miroslav Rezanina <mrezanin@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/virtio/Makefile.objs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/virtio/Makefile.objs b/hw/virtio/Makefile.objs
> index ea7913d..d335dd0 100644
> --- a/hw/virtio/Makefile.objs
> +++ b/hw/virtio/Makefile.objs
> @@ -11,7 +11,7 @@ obj-$(call land,$(CONFIG_VIRTIO_CRYPTO),$(CONFIG_VIRTIO_PCI)) += virtio-crypto-p
>  
>  obj-$(CONFIG_LINUX) += vhost.o vhost-backend.o vhost-user.o
>  obj-$(CONFIG_VHOST_VSOCK) += vhost-vsock.o
> -ifeq ($(CONFIG_PCI),y)
> +ifeq ($(CONFIG_VIRTIO_PCI),y)
>  obj-$(CONFIG_VHOST_VSOCK) += vhost-vsock-pci.o
>  obj-$(CONFIG_VHOST_USER_BLK) += vhost-user-blk-pci.o
>  obj-$(CONFIG_VHOST_USER_SCSI) += vhost-user-scsi-pci.o

Makes sense will queue.

> -- 
> 1.8.3.1

