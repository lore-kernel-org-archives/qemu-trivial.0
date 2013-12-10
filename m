Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VqLYp-0006wy-SE
	for mharc-qemu-trivial@gnu.org; Tue, 10 Dec 2013 06:33:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37582)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1VqLYh-0006lU-Kp
	for qemu-trivial@nongnu.org; Tue, 10 Dec 2013 06:33:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1VqLYb-0003ov-Lz
	for qemu-trivial@nongnu.org; Tue, 10 Dec 2013 06:32:59 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38506)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1VqLYL-0003nk-D8; Tue, 10 Dec 2013 06:32:37 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id rBABWaKb006990
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 10 Dec 2013 06:32:36 -0500
Received: from thinkpad.redhat.com (vpn-228-199.phx2.redhat.com [10.3.228.199])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id rBABWX22009721; Tue, 10 Dec 2013 06:32:34 -0500
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 10 Dec 2013 12:32:33 +0100
Message-Id: <1386675153-1147-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	rBABWaKb006990
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, sw@weilnetz.de, mjt@tls.msk.ru, kraxel@redhat.com
Subject: [Qemu-trivial] [PATCH] fix build regression in qxl-render.c caused
	by ac86048
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
X-List-Received-Date: Tue, 10 Dec 2013 11:33:05 -0000

fixes regression caused by commit
  ac86048 trace: Remove trace.h from console.h (less dependencies)
which makes build fail with:

hw/display/qxl-render.c: In function =E2=80=98qxl_blit=E2=80=99:
hw/display/qxl-render.c:34:5: error: implicit declaration of function =E2=
=80=98trace_qxl_render_blit=E2=80=99 [-Werror=3Dimplicit-function-declara=
tion]
     trace_qxl_render_blit(qxl->guest_primary.qxl_stride,

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/display/qxl-render.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/display/qxl-render.c b/hw/display/qxl-render.c
index d34b0c4..84f1367 100644
--- a/hw/display/qxl-render.c
+++ b/hw/display/qxl-render.c
@@ -20,6 +20,7 @@
  */
=20
 #include "qxl.h"
+#include "trace.h"
=20
 static void qxl_blit(PCIQXLDevice *qxl, QXLRect *rect)
 {
--=20
1.8.3.1


