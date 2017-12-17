Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eQgk4-0004r9-9A
	for mharc-qemu-trivial@gnu.org; Sun, 17 Dec 2017 16:45:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44369)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1eQgk1-0004n1-5d
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 16:45:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1eQgk0-0006G8-Du
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 16:45:01 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:45985)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1eQgjv-0006Cj-U0; Sun, 17 Dec 2017 16:44:56 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 3571841171;
	Mon, 18 Dec 2017 00:44:55 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id AA29BD38;
	Mon, 18 Dec 2017 00:25:48 +0300 (MSK)
Received: (nullmailer pid 30965 invoked by uid 1000);
	Sun, 17 Dec 2017 21:28:08 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org
Date: Mon, 18 Dec 2017 00:27:45 +0300
Message-Id: <ffeb2de783834e3eb01a979f942d093240255f99.1513545944.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
References: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
References: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 40/61] hw/misc/pvpanic: remove unused #include
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
X-List-Received-Date: Sun, 17 Dec 2017 21:45:02 -0000

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 hw/misc/pvpanic.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/misc/pvpanic.c b/hw/misc/pvpanic.c
index 2b1e9a6450..3a0e4ba828 100644
--- a/hw/misc/pvpanic.c
+++ b/hw/misc/pvpanic.c
@@ -13,14 +13,11 @@
  */
=20
 #include "qemu/osdep.h"
-#include "qapi/qmp/qobject.h"
-#include "qapi/qmp/qjson.h"
 #include "sysemu/sysemu.h"
 #include "qemu/log.h"
=20
 #include "hw/nvram/fw_cfg.h"
 #include "hw/i386/pc.h"
-#include "qapi-event.h"
=20
 /* The bit of supported pv event */
 #define PVPANIC_F_PANICKED      0
--=20
2.11.0


