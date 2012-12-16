Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TkBU7-0000mI-GW
	for mharc-qemu-trivial@gnu.org; Sun, 16 Dec 2012 05:30:15 -0500
Received: from eggs.gnu.org ([208.118.235.92]:45607)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TkBU1-0000VB-JB
	for qemu-trivial@nongnu.org; Sun, 16 Dec 2012 05:30:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TkBTw-0004dr-Mw
	for qemu-trivial@nongnu.org; Sun, 16 Dec 2012 05:30:09 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:53604)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1TkBTo-0004V9-TS; Sun, 16 Dec 2012 05:29:57 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	949C97280040; Sun, 16 Dec 2012 11:29:55 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id bM1j9VZXUemj; Sun, 16 Dec 2012 11:29:55 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 2CB267280049; Sun, 16 Dec 2012 11:29:55 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Sun, 16 Dec 2012 11:29:45 +0100
Message-Id: <1355653785-2668-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] configure: Earlier pkg-config probe
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
X-List-Received-Date: Sun, 16 Dec 2012 10:30:13 -0000

Probe pkg-config before it is used for the first time (libseccomp check).

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 configure |   16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/configure b/configure
index ecdb33a..728caca 100755
--- a/configure
+++ b/configure
@@ -1360,6 +1360,14 @@ esac
 fi
 
 ##########################################
+# pkg-config probe
+
+if ! has "$pkg_config_exe"; then
+  echo "Error: pkg-config binary '$pkg_config_exe' not found"
+  exit 1
+fi
+
+##########################################
 # NPTL probe
 
 if test "$nptl" != "no" ; then
@@ -1590,14 +1598,6 @@ if test "$xen_pci_passthrough" != "no"; then
 fi
 
 ##########################################
-# pkg-config probe
-
-if ! has "$pkg_config_exe"; then
-  echo "Error: pkg-config binary '$pkg_config_exe' not found"
-  exit 1
-fi
-
-##########################################
 # libtool probe
 
 if ! has $libtool; then
-- 
1.7.10.4


