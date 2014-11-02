Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xktna-0004f3-Sh
	for mharc-qemu-trivial@gnu.org; Sun, 02 Nov 2014 06:58:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51212)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XktnT-0004SK-Rz
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 06:58:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XktnO-0002Kt-RH
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 06:58:15 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:60096)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XktnE-0002JH-OG; Sun, 02 Nov 2014 06:58:00 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E752B4028A;
	Sun,  2 Nov 2014 14:57:59 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id D89766FC;
	Sun,  2 Nov 2014 14:57:59 +0300 (MSK)
Received: (nullmailer pid 14948 invoked by uid 1000);
	Sun, 02 Nov 2014 11:57:59 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sun,  2 Nov 2014 14:57:13 +0300
Message-Id: <a5ebc0ebae1d2283cfec4170b1a04317f2faee74.1414929284.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
References: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
References: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [Qemu-trivial] [PULL 01/23] tests: Add missing include to
	test-bitops.c
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
X-List-Received-Date: Sun, 02 Nov 2014 11:58:21 -0000

From: Eduardo Habkost <ehabkost@redhat.com>

The test code needs osdep.h for the ARRAY_SIZE macro.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 tests/test-bitops.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/test-bitops.c b/tests/test-bitops.c
index 8238eb5..47b5d3e 100644
--- a/tests/test-bitops.c
+++ b/tests/test-bitops.c
@@ -8,6 +8,7 @@
 
 #include <glib.h>
 #include <stdint.h>
+#include "qemu/osdep.h"
 #include "qemu/bitops.h"
 
 typedef struct {
-- 
1.7.10.4


