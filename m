Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RbpdS-0003kW-1k
	for mharc-qemu-trivial@gnu.org; Sat, 17 Dec 2011 03:28:50 -0500
Received: from eggs.gnu.org ([140.186.70.92]:51523)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RbpdP-0003a7-8a
	for qemu-trivial@nongnu.org; Sat, 17 Dec 2011 03:28:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RbpdO-0006Ib-Bi
	for qemu-trivial@nongnu.org; Sat, 17 Dec 2011 03:28:47 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:58852)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1RbpdJ-0006BQ-SP; Sat, 17 Dec 2011 03:28:41 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	53FCB728188B; Sat, 17 Dec 2011 09:28:19 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id NMdASAnoSu6f; Sat, 17 Dec 2011 09:27:50 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id A09D27282E52; Sat, 17 Dec 2011 09:27:50 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Sat, 17 Dec 2011 09:27:29 +0100
Message-Id: <1324110459-3932-2-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1324110459-3932-1-git-send-email-sw@weilnetz.de>
References: <1324110459-3932-1-git-send-email-sw@weilnetz.de>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH 01/11] configure: Fix compiler warnings in
	config.log (always return a value from main)
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
X-List-Received-Date: Sat, 17 Dec 2011 08:28:48 -0000

Fix several "warning: control reaches end of non-void function".

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 configure |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index 6fd580e..03b8f35 100755
--- a/configure
+++ b/configure
@@ -1082,7 +1082,7 @@ fi
 
 # check that the C compiler works.
 cat > $TMPC <<EOF
-int main(void) {}
+int main(void) { return 0; }
 EOF
 
 if compile_object ; then
@@ -2651,7 +2651,7 @@ ucontext_coroutine=no
 if test "$darwin" != "yes"; then
   cat > $TMPC << EOF
 #include <ucontext.h>
-int main(void) { makecontext(0, 0, 0); }
+int main(void) { makecontext(0, 0, 0); return 0; }
 EOF
   if compile_prog "" "" ; then
       ucontext_coroutine=yes
@@ -2664,7 +2664,7 @@ fi
 open_by_hande_at=no
 cat > $TMPC << EOF
 #include <fcntl.h>
-int main(void) { struct file_handle fh; open_by_handle_at(0, &fh, 0); }
+int main(void) { struct file_handle fh; return open_by_handle_at(0, &fh, 0); }
 EOF
 if compile_prog "" "" ; then
     open_by_handle_at=yes
@@ -2677,6 +2677,7 @@ linux_magic_h=no
 cat > $TMPC << EOF
 #include <linux/magic.h>
 int main(void) {
+  return 0;
 }
 EOF
 if compile_prog "" "" ; then
-- 
1.7.2.5


