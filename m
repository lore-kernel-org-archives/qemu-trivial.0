Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eQh3V-0002zt-1J
	for mharc-qemu-trivial@gnu.org; Sun, 17 Dec 2017 17:05:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47791)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1eQh3T-0002yX-CT
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 17:05:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1eQh3S-00068v-Kh
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 17:05:07 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:44257)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1eQh3N-00065l-Uh; Sun, 17 Dec 2017 17:05:02 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 31CC841175;
	Mon, 18 Dec 2017 01:04:56 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 39D39D31;
	Mon, 18 Dec 2017 00:25:48 +0300 (MSK)
Received: (nullmailer pid 30967 invoked by uid 1000);
	Sun, 17 Dec 2017 21:28:08 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org
Date: Mon, 18 Dec 2017 00:27:46 +0300
Message-Id: <f6c9fb98d70816cf4775b1e97e090c6ad00b6d35.1513545944.git.mjt@msgid.tls.msk.ru>
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
Subject: [Qemu-trivial] [PULL 41/61] hw/ssi/aspeed_smc: remove unused
 #include
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
X-List-Received-Date: Sun, 17 Dec 2017 22:05:08 -0000

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/ssi/aspeed_smc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 992617fd3a..5059396bc6 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -27,7 +27,6 @@
 #include "sysemu/sysemu.h"
 #include "qemu/log.h"
 #include "qemu/error-report.h"
-#include "exec/address-spaces.h"
=20
 #include "hw/ssi/aspeed_smc.h"
=20
--=20
2.11.0


