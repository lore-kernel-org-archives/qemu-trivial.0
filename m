Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YqqJi-0006iv-Gy
	for mharc-qemu-trivial@gnu.org; Fri, 08 May 2015 18:00:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45187)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YqqJb-0006Vu-Ut
	for qemu-trivial@nongnu.org; Fri, 08 May 2015 18:00:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YqqJb-0005m5-86
	for qemu-trivial@nongnu.org; Fri, 08 May 2015 18:00:15 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47067)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YqqJU-0005XU-Bs; Fri, 08 May 2015 18:00:08 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id D34AA4077E;
	Sat,  9 May 2015 01:00:06 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id B0AAD94D;
	Sat,  9 May 2015 01:00:06 +0300 (MSK)
Received: (nullmailer pid 10321 invoked by uid 1000);
	Fri, 08 May 2015 22:00:06 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sat,  9 May 2015 01:00:05 +0300
Message-Id: <0caef8f6df4a9426bd6333ab843ce51ce005d7d0.1431122325.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1431122325.git.mjt@msgid.tls.msk.ru>
References: <cover.1431122325.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Alberto Garcia <berto@igalia.com>
Subject: [Qemu-trivial] [PULL 5/5] docs: update BLOCK_IMAGE_CORRUPTED
	documentation
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
X-List-Received-Date: Fri, 08 May 2015 22:00:17 -0000

From: Alberto Garcia <berto@igalia.com>

Label the "size" and "offset" fields in BLOCK_IMAGE_CORRUPTED as
optional, and clarify that the latter refers to the host's offset into
the image.

Signed-off-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 docs/qmp/qmp-events.txt | 5 +++--
 qapi/block-core.json    | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/docs/qmp/qmp-events.txt b/docs/qmp/qmp-events.txt
index b19e490..64ba46c 100644
--- a/docs/qmp/qmp-events.txt
+++ b/docs/qmp/qmp-events.txt
@@ -43,9 +43,10 @@ Data:
 - "msg":       Informative message (e.g., reason for the corruption)
                (json-string)
 - "offset":    If the corruption resulted from an image access, this
-               is the access offset into the image (json-int)
+               is the host's access offset into the image
+               (json-int, optional)
 - "size":      If the corruption resulted from an image access, this
-               is the access size (json-int)
+               is the access size (json-int, optional)
 
 Example:
 
diff --git a/qapi/block-core.json b/qapi/block-core.json
index dcf7c04..863ffea 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1847,7 +1847,7 @@
 #       not guaranteed to be stable
 #
 # @offset: #optional, if the corruption resulted from an image access, this is
-#          the access offset into the image
+#          the host's access offset into the image
 #
 # @size: #optional, if the corruption resulted from an image access, this is
 #        the access size
-- 
2.1.4


