Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dsmGi-0004u2-0m
	for mharc-qemu-trivial@gnu.org; Fri, 15 Sep 2017 04:46:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40549)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dsmGg-0004s6-1V
	for qemu-trivial@nongnu.org; Fri, 15 Sep 2017 04:46:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dsmGf-0005iq-Dz
	for qemu-trivial@nongnu.org; Fri, 15 Sep 2017 04:46:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56170)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dsmGb-0005dM-4h; Fri, 15 Sep 2017 04:46:29 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 252DD80B29;
	Fri, 15 Sep 2017 08:46:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 252DD80B29
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from thh440s.redhat.com (ovpn-116-76.ams2.redhat.com [10.36.116.76])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F308E78C3A;
	Fri, 15 Sep 2017 08:46:22 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-trivial@nongnu.org
Date: Fri, 15 Sep 2017 10:46:21 +0200
Message-Id: <1505465181-4147-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 15 Sep 2017 08:46:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] hw/display/virtio-gpu: Put the
 virtio-gpu-device into the display category
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
X-List-Received-Date: Fri, 15 Sep 2017 08:46:35 -0000

The virtio-gpu-pci device is already in the display category, so the
virtio-gpu-device should be there, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/display/virtio-gpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index f0761cf..cc9385d 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -1279,6 +1279,7 @@ static void virtio_gpu_class_init(ObjectClass *klass, void *data)
 
     vdc->reset = virtio_gpu_reset;
 
+    set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
     dc->props = virtio_gpu_properties;
     dc->vmsd = &vmstate_virtio_gpu;
     dc->hotpluggable = false;
-- 
1.8.3.1


