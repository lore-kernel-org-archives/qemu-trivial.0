Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xkto9-0005ZU-FS
	for mharc-qemu-trivial@gnu.org; Sun, 02 Nov 2014 06:58:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51360)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xkto3-0005Pq-6V
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 06:58:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xktny-0002Qu-8q
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 06:58:51 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:50378)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xktnl-0002OE-Nb; Sun, 02 Nov 2014 06:58:33 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 07A7D4028A;
	Sun,  2 Nov 2014 14:58:33 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id EE6576FC;
	Sun,  2 Nov 2014 14:58:32 +0300 (MSK)
Received: (nullmailer pid 14951 invoked by uid 1000);
	Sun, 02 Nov 2014 11:58:32 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sun,  2 Nov 2014 14:57:14 +0300
Message-Id: <afeeead1bcd1080a621500240ea74ec433b21885.1414929284.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
References: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
References: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [Qemu-trivial] [PULL 02/23] bitops.h: Don't include qemu-common.h
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
X-List-Received-Date: Sun, 02 Nov 2014 11:58:56 -0000

From: Eduardo Habkost <ehabkost@redhat.com>

This removes the following circular dependency:

bitops.h -> qemu-common.h -> target-i386/cpu.h -> target-i386/cpu-qom.h ->
qom/cpu.h -> qdev-core.h -> bitmap.h -> bitops.h.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/qemu/bitops.h |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/qemu/bitops.h b/include/qemu/bitops.h
index 7e2d5c9..181bd46 100644
--- a/include/qemu/bitops.h
+++ b/include/qemu/bitops.h
@@ -12,7 +12,9 @@
 #ifndef BITOPS_H
 #define BITOPS_H
 
-#include "qemu-common.h"
+#include <stdint.h>
+#include <assert.h>
+
 #include "host-utils.h"
 
 #define BITS_PER_BYTE           CHAR_BIT
-- 
1.7.10.4


