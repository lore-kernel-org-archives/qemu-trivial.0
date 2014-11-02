Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XktoM-0005wS-HS
	for mharc-qemu-trivial@gnu.org; Sun, 02 Nov 2014 06:59:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51446)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XktoF-0005jy-Pf
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 06:59:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XktoA-0002TH-SA
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 06:59:03 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:43130)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xkto0-0002RC-N5; Sun, 02 Nov 2014 06:58:48 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id D96204028A;
	Sun,  2 Nov 2014 14:58:47 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 7CB976FC;
	Sun,  2 Nov 2014 14:58:47 +0300 (MSK)
Received: (nullmailer pid 14955 invoked by uid 1000);
	Sun, 02 Nov 2014 11:58:47 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sun,  2 Nov 2014 14:57:15 +0300
Message-Id: <d6aaddfe977417e3df4fc8a0fc0b4cc015909b84.1414929284.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
References: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
References: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [Qemu-trivial] [PULL 03/23] bitmap.h: Don't include qemu-common.h
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
X-List-Received-Date: Sun, 02 Nov 2014 11:59:09 -0000

From: Eduardo Habkost <ehabkost@redhat.com>

This will avoid unexpected circular header dependencies in the future.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/qemu/bitmap.h |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/qemu/bitmap.h b/include/qemu/bitmap.h
index edf4f17..f0273c9 100644
--- a/include/qemu/bitmap.h
+++ b/include/qemu/bitmap.h
@@ -12,7 +12,11 @@
 #ifndef BITMAP_H
 #define BITMAP_H
 
-#include "qemu-common.h"
+#include <glib.h>
+#include <string.h>
+#include <stdlib.h>
+
+#include "qemu/osdep.h"
 #include "qemu/bitops.h"
 
 /*
-- 
1.7.10.4


