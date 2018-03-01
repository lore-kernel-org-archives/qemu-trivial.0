Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1erRLL-0006IZ-Ul
	for mharc-qemu-trivial@gnu.org; Thu, 01 Mar 2018 11:46:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49204)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1erRLJ-0006GS-SS
	for qemu-trivial@nongnu.org; Thu, 01 Mar 2018 11:46:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1erRLG-0000wO-68
	for qemu-trivial@nongnu.org; Thu, 01 Mar 2018 11:46:05 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:54592 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1erRLA-0000jf-5z; Thu, 01 Mar 2018 11:45:56 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A5A568185351;
	Thu,  1 Mar 2018 16:45:55 +0000 (UTC)
Received: from redhat.com (ovpn-123-220.rdu2.redhat.com [10.10.123.220])
	by smtp.corp.redhat.com (Postfix) with SMTP id 5D2D89C06D;
	Thu,  1 Mar 2018 16:45:54 +0000 (UTC)
Date: Thu, 1 Mar 2018 18:45:54 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Greg Kurz <groug@kaod.org>,
	Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org
Message-ID: <1519922735-29054-3-git-send-email-mst@redhat.com>
References: <1519922735-29054-1-git-send-email-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1519922735-29054-1-git-send-email-mst@redhat.com>
X-Mutt-Fcc: =sent
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Thu, 01 Mar 2018 16:45:55 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Thu, 01 Mar 2018 16:45:55 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'mst@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PULL 02/13] virtio-pci: trivial fixes in error
 message
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
X-List-Received-Date: Thu, 01 Mar 2018 16:46:07 -0000

From: Greg Kurz <groug@kaod.org>

Signed-off-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio-pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index b55dfcf..1e8ab7b 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1585,7 +1585,7 @@ static void virtio_pci_device_plugged(DeviceState *d, Error **errp)
     if (legacy) {
         if (virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {
             error_setg(errp, "VIRTIO_F_IOMMU_PLATFORM was supported by"
-                       "neither legacy nor transitional device.");
+                       " neither legacy nor transitional device");
             return ;
         }
         /*
-- 
MST


