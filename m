Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WLJHg-0002Hz-Hb
	for mharc-qemu-trivial@gnu.org; Wed, 05 Mar 2014 16:23:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35902)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WLJHa-0002Bz-TQ
	for qemu-trivial@nongnu.org; Wed, 05 Mar 2014 16:23:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WLJHV-0004bE-JM
	for qemu-trivial@nongnu.org; Wed, 05 Mar 2014 16:23:18 -0500
Received: from qemu.weilnetz.de ([37.221.198.45]:43567
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WLJHL-0004ZB-Hc; Wed, 05 Mar 2014 16:23:03 -0500
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 40B2F17F99C; Wed,  5 Mar 2014 22:23:01 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Wed,  5 Mar 2014 22:23:00 +0100
Message-Id: <1394054580-29120-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] qemu-io: Fix warnings from static code
	analysis
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
X-List-Received-Date: Wed, 05 Mar 2014 21:23:23 -0000

Smatch complains about several global symbols which should be local.

Add the missing 'static' attributes and move the 'extern' declaration
of variable qemuio_misalign to qemu-io.h. This variable also changes
the type from 'int' to 'bool' which better fits documents its use.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 include/qemu-io.h |    2 ++
 qemu-io-cmds.c    |    2 +-
 qemu-io.c         |    7 +++----
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/include/qemu-io.h b/include/qemu-io.h
index 7e7c07c..5d6006f 100644
--- a/include/qemu-io.h
+++ b/include/qemu-io.h
@@ -38,6 +38,8 @@ typedef struct cmdinfo {
     helpfunc_t  help;
 } cmdinfo_t;
 
+extern bool qemuio_misalign;
+
 bool qemuio_command(BlockDriverState *bs, const char *cmd);
 
 void qemuio_add_command(const cmdinfo_t *ci);
diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index f1de24c..fb1db53 100644
--- a/qemu-io-cmds.c
+++ b/qemu-io-cmds.c
@@ -16,7 +16,7 @@
 
 #define CMD_NOFILE_OK   0x01
 
-int qemuio_misalign;
+bool qemuio_misalign;
 
 static cmdinfo_t *cmdtab;
 static int ncmds;
diff --git a/qemu-io.c b/qemu-io.c
index fc38608..2d119c2 100644
--- a/qemu-io.c
+++ b/qemu-io.c
@@ -24,10 +24,9 @@
 
 #define CMD_NOFILE_OK   0x01
 
-char *progname;
+static char *progname;
 
-BlockDriverState *qemuio_bs;
-extern int qemuio_misalign;
+static BlockDriverState *qemuio_bs;
 
 /* qemu-io commands passed using -c */
 static int ncmdline;
@@ -408,7 +407,7 @@ int main(int argc, char **argv)
             readonly = 1;
             break;
         case 'm':
-            qemuio_misalign = 1;
+            qemuio_misalign = true;
             break;
         case 'g':
             growable = 1;
-- 
1.7.10.4


