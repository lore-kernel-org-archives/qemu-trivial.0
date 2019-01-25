Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gn129-0001Ck-FE
	for mharc-qemu-trivial@gnu.org; Fri, 25 Jan 2019 07:56:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41034)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gn127-0001As-68
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2019 07:56:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gn11u-0003Tu-4y
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2019 07:56:20 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33038)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gn11k-0003Mf-3B; Fri, 25 Jan 2019 07:56:09 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8E765C0C4265;
	Fri, 25 Jan 2019 12:56:05 +0000 (UTC)
Received: from thuth.com (ovpn-116-56.ams2.redhat.com [10.36.116.56])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0130317B19;
	Fri, 25 Jan 2019 12:56:03 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-s390x@nongnu.org,
	Miroslav Rezanina <mrezanin@redhat.com>
Date: Fri, 25 Jan 2019 13:56:00 +0100
Message-Id: <1548420960-5555-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 25 Jan 2019 12:56:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] hw/virtio: Use CONFIG_VIRTIO_PCI switch
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
X-List-Received-Date: Fri, 25 Jan 2019 12:56:32 -0000

For downstream s390x builds, we'd like to be able to build QEMU with
CONFIG_VIRTIO_PCI disabled (since virtio-ccw is used here instead),
but still with CONFIG_PCI enabled. This currently fails since the
virtio-*-pci.o files are still included in the build, but virtio-pci.o
is missing. Use the right config switch CONFIG_VIRTIO_PCI to exclude
the virtio-*-pci.o files from the build.

Reported-by: Miroslav Rezanina <mrezanin@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/virtio/Makefile.objs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/Makefile.objs b/hw/virtio/Makefile.objs
index ea7913d..d335dd0 100644
--- a/hw/virtio/Makefile.objs
+++ b/hw/virtio/Makefile.objs
@@ -11,7 +11,7 @@ obj-$(call land,$(CONFIG_VIRTIO_CRYPTO),$(CONFIG_VIRTIO_PCI)) += virtio-crypto-p
 
 obj-$(CONFIG_LINUX) += vhost.o vhost-backend.o vhost-user.o
 obj-$(CONFIG_VHOST_VSOCK) += vhost-vsock.o
-ifeq ($(CONFIG_PCI),y)
+ifeq ($(CONFIG_VIRTIO_PCI),y)
 obj-$(CONFIG_VHOST_VSOCK) += vhost-vsock-pci.o
 obj-$(CONFIG_VHOST_USER_BLK) += vhost-user-blk-pci.o
 obj-$(CONFIG_VHOST_USER_SCSI) += vhost-user-scsi-pci.o
-- 
1.8.3.1


