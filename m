Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bWguc-0005bG-6P
	for mharc-qemu-trivial@gnu.org; Mon, 08 Aug 2016 05:31:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45163)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1bWguZ-0005ZY-UK
	for qemu-trivial@nongnu.org; Mon, 08 Aug 2016 05:31:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1bWguX-0004hu-W2
	for qemu-trivial@nongnu.org; Mon, 08 Aug 2016 05:31:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37178)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1bWguU-0004hB-7c; Mon, 08 Aug 2016 05:31:50 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D2DE1C04D298;
	Mon,  8 Aug 2016 09:31:49 +0000 (UTC)
Received: from t530wlan.home.berrange.com.com ([10.42.17.224])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u789VlYV008302; Mon, 8 Aug 2016 05:31:47 -0400
From: "Daniel P. Berrange" <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	"Daniel P. Berrange" <berrange@redhat.com>
Date: Mon,  8 Aug 2016 10:31:40 +0100
Message-Id: <1470648700-3474-1-git-send-email-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 08 Aug 2016 09:31:49 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH for-2.7] virtio-gpu: fix missing log.h
 include file
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
X-List-Received-Date: Mon, 08 Aug 2016 09:31:57 -0000

The virtio-gpu.h file defines a macro VIRTIO_GPU_FILL_CMD
which includes a call to qemu_log_mask, but does not
include qemu/log.h. In a default configure, it is lucky
and gets qemu/log.h indirectly due to the 'log' trace
backend being enabled. If that trace backend is disabled
though, eg

 ./configure --enable-trace-backends=3Dnop

Then the build will fail:

In file included from /home/berrange/src/virt/qemu/hw/display/virtio-gpu-=
3d.c:19:0:
/home/berrange/src/virt/qemu/hw/display/virtio-gpu-3d.c: In function =E2=80=
=98virgl_cmd_create_resource_2d=E2=80=99:
/home/berrange/src/virt/qemu/include/hw/virtio/virtio-gpu.h:138:13: error=
: implicit declaration of function =E2=80=98qemu_log_mask=E2=80=99 [-Werr=
or=3Dimplicit-function-declaration]
             qemu_log_mask(LOG_GUEST_ERROR,                              =
\
             ^
/home/berrange/src/virt/qemu/hw/display/virtio-gpu-3d.c:34:5: note: in ex=
pansion of macro =E2=80=98VIRTIO_GPU_FILL_CMD=E2=80=99
     VIRTIO_GPU_FILL_CMD(c2d);
     ^~~~~~~~~~~~~~~~~~~
/home/berrange/src/virt/qemu/hw/display/virtio-gpu-3d.c:34:5: error: nest=
ed extern declaration of =E2=80=98qemu_log_mask=E2=80=99 [-Werror=3Dneste=
d-externs]
In file included from /home/berrange/src/virt/qemu/hw/display/virtio-gpu-=
3d.c:19:0:
/home/berrange/src/virt/qemu/include/hw/virtio/virtio-gpu.h:138:27: error=
: =E2=80=98LOG_GUEST_ERROR=E2=80=99 undeclared (first use in this functio=
n)
             qemu_log_mask(LOG_GUEST_ERROR,                              =
\

[snip many more errors]

Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
---
 include/hw/virtio/virtio-gpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gp=
u.h
index e4f424a..20d1cd6 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -19,6 +19,7 @@
 #include "ui/console.h"
 #include "hw/virtio/virtio.h"
 #include "hw/pci/pci.h"
+#include "qemu/log.h"
=20
 #include "standard-headers/linux/virtio_gpu.h"
 #define TYPE_VIRTIO_GPU "virtio-gpu-device"
--=20
2.7.4


