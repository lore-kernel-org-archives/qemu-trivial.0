Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RbpdZ-0003to-Ae
	for mharc-qemu-trivial@gnu.org; Sat, 17 Dec 2011 03:28:57 -0500
Received: from eggs.gnu.org ([140.186.70.92]:51595)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RbpdX-0003rB-AM
	for qemu-trivial@nongnu.org; Sat, 17 Dec 2011 03:28:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RbpdV-0006Js-5n
	for qemu-trivial@nongnu.org; Sat, 17 Dec 2011 03:28:55 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:58917)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1RbpdS-0006J7-0v; Sat, 17 Dec 2011 03:28:50 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	8C5957282E5C; Sat, 17 Dec 2011 09:28:39 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id X6ZpxZNAnBin; Sat, 17 Dec 2011 09:28:19 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id A6A37728327C; Sat, 17 Dec 2011 09:27:51 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Sat, 17 Dec 2011 09:27:31 +0100
Message-Id: <1324110459-3932-4-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1324110459-3932-1-git-send-email-sw@weilnetz.de>
References: <1324110459-3932-1-git-send-email-sw@weilnetz.de>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH 03/11] configure: Fix compiler warning in
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
X-List-Received-Date: Sat, 17 Dec 2011 08:28:56 -0000

warning: return makes integer from pointer without a cast

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 configure |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/configure b/configure
index 93c6cbe..8dee237 100755
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
+  return s != (const char *)0;
+}
 EOF
   for curses_lib in $curses_list; do
     if compile_prog "" "$curses_lib" ; then
-- 
1.7.2.5


