Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YKT2o-0004jk-6A
	for mharc-qemu-trivial@gnu.org; Sun, 08 Feb 2015 09:41:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53386)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1YKT2l-0004fG-Av
	for qemu-trivial@nongnu.org; Sun, 08 Feb 2015 09:41:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1YKT2k-0003qv-IB
	for qemu-trivial@nongnu.org; Sun, 08 Feb 2015 09:41:03 -0500
Received: from qemu.weilnetz.de ([37.221.198.45]:32907)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1YKT2e-0003pm-Gt; Sun, 08 Feb 2015 09:40:56 -0500
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 1B3B2180166; Sun,  8 Feb 2015 15:40:52 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Trivial <qemu-trivial@nongnu.org>
Date: Sun,  8 Feb 2015 15:40:48 +0100
Message-Id: <1423406448-31918-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: Stefan Weil <sw@weilnetz.de>, QEMU Developer <qemu-devel@nongnu.org>,
	Luiz Capitulino <lcapitulino@redhat.com>
Subject: [Qemu-trivial] [PATCH] hmp: Fix warning from smatch (wrong argument
	in function call)
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
X-List-Received-Date: Sun, 08 Feb 2015 14:41:04 -0000

Fix this warning:
hmp.c:414:38: warning: Using plain integer as NULL pointer

qmp_query_block expects a pointer argument, so passing false is wrong.

Cc: Luiz Capitulino <lcapitulino@redhat.com>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hmp.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hmp.c b/hmp.c
index a42c5c0..6926960 100644
--- a/hmp.c
+++ b/hmp.c
@@ -411,7 +411,7 @@ void hmp_info_block(Monitor *mon, const QDict *qdict)
 
     /* Print BlockBackend information */
     if (!nodes) {
-        block_list = qmp_query_block(false);
+        block_list = qmp_query_block(NULL);
     } else {
         block_list = NULL;
     }
-- 
1.7.10.4


