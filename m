Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtZea-0003Qb-8Q
	for mharc-qemu-trivial@gnu.org; Tue, 12 Feb 2019 10:07:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41108)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gtZeY-00031o-6n
	for qemu-trivial@nongnu.org; Tue, 12 Feb 2019 10:07:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gtZRV-0002tm-Sb
	for qemu-trivial@nongnu.org; Tue, 12 Feb 2019 09:53:52 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50978)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gtZRG-0002T5-0M; Tue, 12 Feb 2019 09:53:34 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 40449C05FF87;
	Tue, 12 Feb 2019 14:53:29 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-63.brq.redhat.com [10.40.204.63])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 75A715C240;
	Tue, 12 Feb 2019 14:53:25 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
	"Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Tue, 12 Feb 2019 15:53:22 +0100
Message-Id: <20190212145322.30974-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 12 Feb 2019 14:53:29 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] hw/dma/i8257: Use qemu_log_mask(UNIMP)
 instead of fprintf
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
X-List-Received-Date: Tue, 12 Feb 2019 15:07:19 -0000

Avoid to clutter stdout until explicitly requested (with -d unimp):

  $ qemu-system-mips64el -M fulong2e -bios pmon_2e.bin
  dma: command df not supported
  dma: command df not supported
  dma: command df not supported
  dma: command df not supported

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/dma/i8257.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/dma/i8257.c b/hw/dma/i8257.c
index 52675e97c9..3e1f13a4aa 100644
--- a/hw/dma/i8257.c
+++ b/hw/dma/i8257.c
@@ -26,6 +26,7 @@
 #include "hw/isa/isa.h"
 #include "hw/dma/i8257.h"
 #include "qemu/main-loop.h"
+#include "qemu/log.h"
 #include "trace.h"
=20
 #define I8257(obj) \
@@ -185,7 +186,8 @@ static void i8257_write_cont(void *opaque, hwaddr npo=
rt, uint64_t data,
     switch (iport) {
     case 0x00:                  /* command */
         if ((data !=3D 0) && (data & CMD_NOT_SUPPORTED)) {
-            dolog("command %"PRIx64" not supported\n", data);
+            qemu_log_mask(LOG_UNIMP, "%s: cmd 0x%02"PRIx64" not supporte=
d\n",
+                          __func__, data);
             return;
         }
         d->command =3D data;
--=20
2.20.1


