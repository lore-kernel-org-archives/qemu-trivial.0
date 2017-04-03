Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cv0ME-00080c-Et
	for mharc-qemu-trivial@gnu.org; Mon, 03 Apr 2017 07:41:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38028)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1cv0MC-0007zf-FD
	for qemu-trivial@nongnu.org; Mon, 03 Apr 2017 07:41:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1cv0MB-0003l6-Fm
	for qemu-trivial@nongnu.org; Mon, 03 Apr 2017 07:41:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56404)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1cv0M6-0003gS-P0; Mon, 03 Apr 2017 07:41:06 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F29DE4DAF8;
	Mon,  3 Apr 2017 11:40:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com F29DE4DAF8
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=lvivier@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com F29DE4DAF8
Received: from thinkpad.redhat.com (ovpn-116-178.ams2.redhat.com
	[10.36.116.178])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C5ACD17AEC;
	Mon,  3 Apr 2017 11:40:46 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>
Date: Mon,  3 Apr 2017 13:40:44 +0200
Message-Id: <20170403114044.15762-1-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 03 Apr 2017 11:40:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] virtio-gpu: replace PIXMAN_* by PIXMAN_BE_*
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
X-List-Received-Date: Mon, 03 Apr 2017 11:41:13 -0000

This avoids a "#ifdef HOST_WORDS_BIGENDIAN" and this is the purpose
of PIXMAN_BE_* macros.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 hw/display/virtio-gpu.c | 35 ++++++++---------------------------
 1 file changed, 8 insertions(+), 27 deletions(-)

diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 9b530ab..7befcef 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -258,41 +258,22 @@ void virtio_gpu_get_display_info(VirtIOGPU *g,
 static pixman_format_code_t get_pixman_format(uint32_t virtio_gpu_format)
 {
     switch (virtio_gpu_format) {
-#ifdef HOST_WORDS_BIGENDIAN
     case VIRTIO_GPU_FORMAT_B8G8R8X8_UNORM:
-        return PIXMAN_b8g8r8x8;
+        return PIXMAN_BE_b8g8r8x8;
     case VIRTIO_GPU_FORMAT_B8G8R8A8_UNORM:
-        return PIXMAN_b8g8r8a8;
+        return PIXMAN_BE_b8g8r8a8;
     case VIRTIO_GPU_FORMAT_X8R8G8B8_UNORM:
-        return PIXMAN_x8r8g8b8;
+        return PIXMAN_BE_x8r8g8b8;
     case VIRTIO_GPU_FORMAT_A8R8G8B8_UNORM:
-        return PIXMAN_a8r8g8b8;
+        return PIXMAN_BE_a8r8g8b8;
     case VIRTIO_GPU_FORMAT_R8G8B8X8_UNORM:
-        return PIXMAN_r8g8b8x8;
+        return PIXMAN_BE_r8g8b8x8;
     case VIRTIO_GPU_FORMAT_R8G8B8A8_UNORM:
-        return PIXMAN_r8g8b8a8;
+        return PIXMAN_BE_r8g8b8a8;
     case VIRTIO_GPU_FORMAT_X8B8G8R8_UNORM:
-        return PIXMAN_x8b8g8r8;
+        return PIXMAN_BE_x8b8g8r8;
     case VIRTIO_GPU_FORMAT_A8B8G8R8_UNORM:
-        return PIXMAN_a8b8g8r8;
-#else
-    case VIRTIO_GPU_FORMAT_B8G8R8X8_UNORM:
-        return PIXMAN_x8r8g8b8;
-    case VIRTIO_GPU_FORMAT_B8G8R8A8_UNORM:
-        return PIXMAN_a8r8g8b8;
-    case VIRTIO_GPU_FORMAT_X8R8G8B8_UNORM:
-        return PIXMAN_b8g8r8x8;
-    case VIRTIO_GPU_FORMAT_A8R8G8B8_UNORM:
-        return PIXMAN_b8g8r8a8;
-    case VIRTIO_GPU_FORMAT_R8G8B8X8_UNORM:
-        return PIXMAN_x8b8g8r8;
-    case VIRTIO_GPU_FORMAT_R8G8B8A8_UNORM:
-        return PIXMAN_a8b8g8r8;
-    case VIRTIO_GPU_FORMAT_X8B8G8R8_UNORM:
-        return PIXMAN_r8g8b8x8;
-    case VIRTIO_GPU_FORMAT_A8B8G8R8_UNORM:
-        return PIXMAN_r8g8b8a8;
-#endif
+        return PIXMAN_BE_a8b8g8r8;
     default:
         return 0;
     }
-- 
2.9.3


