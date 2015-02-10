Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL4Vc-0006zf-Uy
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 01:41:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50627)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL4VV-0006mi-PN
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 01:41:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL4VU-0003rU-Ts
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 01:41:13 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:50445)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YL4VL-0003ln-S1; Tue, 10 Feb 2015 01:41:04 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 1EA8941827;
	Tue, 10 Feb 2015 09:41:03 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 539D4958;
	Tue, 10 Feb 2015 09:34:47 +0300 (MSK)
Received: (nullmailer pid 9417 invoked by uid 1000);
	Tue, 10 Feb 2015 06:34:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Feb 2015 09:34:30 +0300
Message-Id: <73997bb32ceacd177d3e731440ad5c70f4f657f5.1423549659.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
References: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Anthony Green <green@moxielogic.com>, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 41/46] moxie: Fix warning caused by missing
	include statement
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
X-List-Received-Date: Tue, 10 Feb 2015 06:41:18 -0000

From: Stefan Weil <sw@weilnetz.de>

Warning from the Sparse static analysis tool:

target-moxie/machine.c:4:26:
 warning: symbol 'vmstate_moxie_cpu' was not declared. Should it be static?

machine.h includes the missing declaration.

Cc: Anthony Green <green@moxielogic.com>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target-moxie/machine.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target-moxie/machine.c b/target-moxie/machine.c
index da1a857..b9316f0 100644
--- a/target-moxie/machine.c
+++ b/target-moxie/machine.c
@@ -1,5 +1,6 @@
 #include "hw/hw.h"
 #include "hw/boards.h"
+#include "machine.h"
 
 const VMStateDescription vmstate_moxie_cpu = {
     .name = "cpu",
-- 
2.1.4


