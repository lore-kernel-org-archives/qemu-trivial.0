Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1buklB-0008Uj-S3
	for mharc-qemu-trivial@gnu.org; Thu, 13 Oct 2016 14:29:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46120)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1bukl9-0008Sw-84
	for qemu-trivial@nongnu.org; Thu, 13 Oct 2016 14:29:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1bukl5-0001HZ-Ea
	for qemu-trivial@nongnu.org; Thu, 13 Oct 2016 14:29:38 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:58667)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1bukl5-0001HA-8Y
	for qemu-trivial@nongnu.org; Thu, 13 Oct 2016 14:29:35 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 5A93717F6F2; Thu, 13 Oct 2016 20:29:31 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Developer <qemu-devel@nongnu.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>, Stefan Weil <sw@weilnetz.de>
Date: Thu, 13 Oct 2016 20:29:30 +0200
Message-Id: <1476383370-30650-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 37.221.198.45
Subject: [Qemu-trivial] [PATCH] Fix build for less common build directories
 names
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
X-List-Received-Date: Thu, 13 Oct 2016 18:29:40 -0000

scripts/tracetool generates a C preprocessor macro from the name of the
build directory. Any characters which are possible in a directory name
but not allowed in a macro name must be substituted, otherwise builds
will fail.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

I had problems with a build directory of the form "host,variant".
Is this fix needed for stable, too?

Regards
Stefan W.

 scripts/tracetool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/tracetool.py b/scripts/tracetool.py
index 629b259..fe9c9e9 100755
--- a/scripts/tracetool.py
+++ b/scripts/tracetool.py
@@ -70,7 +70,7 @@ def make_group_name(filename):
 
     if dirname == "":
         return "common"
-    return re.sub(r"/|-", "_", dirname)
+    return re.sub(r"[^A-Za-z0-9]", "_", dirname)
 
 def main(args):
     global _SCRIPT
-- 
2.1.4


