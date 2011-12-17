Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RbxPR-0004Pi-9f
	for mharc-qemu-trivial@gnu.org; Sat, 17 Dec 2011 11:46:53 -0500
Received: from eggs.gnu.org ([140.186.70.92]:53082)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RbxPO-0004Ko-SS
	for qemu-trivial@nongnu.org; Sat, 17 Dec 2011 11:46:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RbxPN-0000AS-W6
	for qemu-trivial@nongnu.org; Sat, 17 Dec 2011 11:46:50 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:40015)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1RbxPL-00009p-Qz; Sat, 17 Dec 2011 11:46:48 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	4022F728188B; Sat, 17 Dec 2011 17:46:36 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id AqSLSNKgrrJi; Sat, 17 Dec 2011 17:46:07 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id A015C728CD6E; Sat, 17 Dec 2011 17:46:07 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Sat, 17 Dec 2011 17:46:02 +0100
Message-Id: <1324140362-12636-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1324110459-3932-4-git-send-email-sw@weilnetz.de>
References: <1324110459-3932-4-git-send-email-sw@weilnetz.de>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH v2 03/11] configure: Fix compiler warning in
	config.log (integer from pointer)
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
X-List-Received-Date: Sat, 17 Dec 2011 16:46:51 -0000

warning: return makes integer from pointer without a cast

v2: Removed type cast.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 configure |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/configure b/configure
index 93c6cbe..773df6a 100755
--- a/configure
+++ b/configure
@@ -1841,7 +1841,11 @@ if test "$curses" != "no" ; then
 #ifdef __OpenBSD__
 #define resize_term resizeterm
 #endif
-int main(void) { resize_term(0, 0); return curses_version(); }
+int main(void) {
+  const char *s = curses_version();
+  resize_term(0, 0);
+  return s != 0;
+}
 EOF
   for curses_lib in $curses_list; do
     if compile_prog "" "$curses_lib" ; then
-- 
1.7.2.5


