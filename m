Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QgG2n-0003nQ-9j
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jul 2011 08:57:01 -0400
Received: from eggs.gnu.org ([140.186.70.92]:34841)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wolfgang.mauerer@siemens.com>) id 1QgG2j-0003ma-Rm
	for qemu-trivial@nongnu.org; Mon, 11 Jul 2011 08:56:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wolfgang.mauerer@siemens.com>) id 1QgG2i-0005tG-L8
	for qemu-trivial@nongnu.org; Mon, 11 Jul 2011 08:56:57 -0400
Received: from gecko.sbs.de ([194.138.37.40]:17332)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wolfgang.mauerer@siemens.com>)
	id 1QgG2d-0005sU-Tv; Mon, 11 Jul 2011 08:56:52 -0400
Received: from mail2.sbs.de (localhost [127.0.0.1])
	by gecko.sbs.de (8.13.6/8.13.6) with ESMTP id p6BCumg6002562;
	Mon, 11 Jul 2011 14:56:48 +0200
Received: from localhost.localdomain ([146.254.15.72])
	by mail2.sbs.de (8.13.6/8.13.6) with ESMTP id p6BCulsX029065;
	Mon, 11 Jul 2011 14:56:48 +0200
From: Wolfgang Mauerer <wolfgang.mauerer@siemens.com>
To: qemu-devel@nongnu.org
Date: Mon, 11 Jul 2011 14:57:43 +0200
Message-Id: <1310389063-16382-1-git-send-email-wolfgang.mauerer@siemens.com>
X-Mailer: git-send-email 1.6.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 194.138.37.40
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] vhost build fix for i386
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
X-List-Received-Date: Mon, 11 Jul 2011 12:56:59 -0000

vhost.c uses __sync_fetch_and_and(), which is only
available for -march=i486 and above (see
https://bugzilla.redhat.com/show_bug.cgi?id=624279).

Signed-off-by: Wolfgang Mauerer <wolfgang.mauerer@siemens.com>
---
 configure |   23 +++++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/configure b/configure
index 88159ac..3b6facb 100755
--- a/configure
+++ b/configure
@@ -2464,6 +2464,29 @@ if test "$trace_backend" = "dtrace"; then
 fi
 
 ##########################################
+# __sync_fetch_and_and requires at least -march=i486. Many toolchains
+# use i686 as default anyway, but for those that don't, an explicit
+# specification is necessary
+if test $vhost_net = "yes" && test $cpu = "i386"; then
+  cat > $TMPC << EOF
+int sfaa(unsigned *ptr)
+{
+  return __sync_fetch_and_and(ptr, 0);
+}
+
+int main(int argc, char **argv)
+{
+  int val = 42;
+  sfaa(&val);
+  return val;
+}
+EOF
+  if ! compile_prog "" "" ; then
+    CFLAGS+="-march=i486"
+  fi
+fi
+
+##########################################
 # End of CC checks
 # After here, no more $cc or $ld runs
 
-- 
1.6.4


