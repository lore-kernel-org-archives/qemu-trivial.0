Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dHXzJ-00077M-5f
	for mharc-qemu-trivial@gnu.org; Sun, 04 Jun 2017 12:02:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35210)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dHXzF-000741-Gh
	for qemu-trivial@nongnu.org; Sun, 04 Jun 2017 12:02:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dHXzE-0003zL-FR
	for qemu-trivial@nongnu.org; Sun, 04 Jun 2017 12:02:41 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:34043)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dHXz9-0003uH-EL; Sun, 04 Jun 2017 12:02:35 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E3359404D1;
	Sun,  4 Jun 2017 19:02:33 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 7787B5EE;
	Sun,  4 Jun 2017 18:45:29 +0300 (MSK)
Received: (nullmailer pid 16385 invoked by uid 1000);
	Sun, 04 Jun 2017 15:45:27 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  4 Jun 2017 18:45:19 +0300
Message-Id: <244d04db580da5972b27a4dbf8f38b949c7d916c.1496591095.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
References: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
References: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 15/22] qapi: Fix some QMP documentation
 regressions
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
X-List-Received-Date: Sun, 04 Jun 2017 16:02:43 -0000

From: Eric Blake <eblake@redhat.com>

In the process of getting rid of docs/qmp-commands.txt, we managed
to regress on some of the text that changed after the point where
the move was first branched and when the move actually occurred.
For example, commit 3282eca for blockdev-snapshot re-added the
extra "options" layer which had been cleaned up in commit 0153d2f.

This clears up all regressions identified over the range
02b351d..bd6092e:
https://lists.gnu.org/archive/html/qemu-devel/2017-05/msg05127.html
as well as a cleanup to x-blockdev-remove-medium to prefer
'id' over 'device' (matching the cleanup for 'eject').

Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qapi/block-core.json | 28 ++++++++++++++--------------
 qapi/block.json      |  2 +-
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 309b1df214..88a7471a23 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1206,11 +1206,11 @@
 # Example:
 #
 # -> { "execute": "blockdev-add",
-#      "arguments": { "options": { "driver": "qcow2",
-#                                  "node-name": "node1534",
-#                                  "file": { "driver": "file",
-#                                            "filename": "hd1.qcow2" },
-#                                  "backing": "" } } }
+#      "arguments": { "driver": "qcow2",
+#                     "node-name": "node1534",
+#                     "file": { "driver": "file",
+#                               "filename": "hd1.qcow2" },
+#                     "backing": "" } }
 #
 # <- { "return": {} }
 #
@@ -3214,7 +3214,7 @@
 # <- { "return": {} }
 #
 # -> { "execute": "x-blockdev-remove-medium",
-#      "arguments": { "device": "ide0-1-0" } }
+#      "arguments": { "id": "ide0-1-0" } }
 #
 # <- { "return": {} }
 #
@@ -3245,10 +3245,10 @@
 #
 # -> { "execute": "blockdev-add",
 #      "arguments": {
-#          "options": { "node-name": "node0",
-#                       "driver": "raw",
-#                       "file": { "driver": "file",
-#                                 "filename": "fedora.iso" } } } }
+#          "node-name": "node0",
+#          "driver": "raw",
+#          "file": { "driver": "file",
+#                    "filename": "fedora.iso" } } }
 # <- { "return": {} }
 #
 # -> { "execute": "x-blockdev-insert-medium",
@@ -3701,10 +3701,10 @@
 # 1. Add a new node to a quorum
 # -> { "execute": "blockdev-add",
 #      "arguments": {
-#          "options": { "driver": "raw",
-#                       "node-name": "new_node",
-#                        "file": { "driver": "file",
-#                                  "filename": "test.raw" } } } }
+#          "driver": "raw",
+#          "node-name": "new_node",
+#          "file": { "driver": "file",
+#                    "filename": "test.raw" } } }
 # <- { "return": {} }
 # -> { "execute": "x-blockdev-change",
 #      "arguments": { "parent": "disk1",
diff --git a/qapi/block.json b/qapi/block.json
index 6a2fdc73f7..414b61bde7 100644
--- a/qapi/block.json
+++ b/qapi/block.json
@@ -180,7 +180,7 @@
 #
 # Example:
 #
-# -> { "execute": "eject", "arguments": { "device": "ide1-0-1" } }
+# -> { "execute": "eject", "arguments": { "id": "ide1-0-1" } }
 # <- { "return": {} }
 ##
 { 'command': 'eject',
-- 
2.11.0


