Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rbpds-000547-K9
	for mharc-qemu-trivial@gnu.org; Sat, 17 Dec 2011 03:29:16 -0500
Received: from eggs.gnu.org ([140.186.70.92]:51648)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Rbpdp-0004vW-RA
	for qemu-trivial@nongnu.org; Sat, 17 Dec 2011 03:29:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Rbpdo-0006LR-RT
	for qemu-trivial@nongnu.org; Sat, 17 Dec 2011 03:29:13 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:47671)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1Rbpdm-0006L1-3h; Sat, 17 Dec 2011 03:29:10 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	9C2CD728188B; Sat, 17 Dec 2011 09:28:59 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 66Fj67ZdT99U; Sat, 17 Dec 2011 09:28:39 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 318A87283280; Sat, 17 Dec 2011 09:27:52 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Sat, 17 Dec 2011 09:27:32 +0100
Message-Id: <1324110459-3932-5-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1324110459-3932-1-git-send-email-sw@weilnetz.de>
References: <1324110459-3932-1-git-send-email-sw@weilnetz.de>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH 04/11] configure: Fix compiler warnings in
	config.log (null arguments)
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
X-List-Received-Date: Sat, 17 Dec 2011 08:29:15 -0000

warning: null argument where non-null required (argument 1)
warning: null argument where non-null required (argument 3)

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 configure |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/configure b/configure
index 8dee237..5d860a7 100755
--- a/configure
+++ b/configure
@@ -1951,7 +1951,12 @@ PTHREADLIBS_LIST="-pthread -lpthread -lpthreadGC2"
 pthread=no
 cat > $TMPC << EOF
 #include <pthread.h>
-int main(void) { pthread_create(0,0,0,0); return 0; }
+static void *f(void *p) { return NULL; }
+int main(void) {
+  pthread_t thread;
+  pthread_create(&thread, 0, f, 0);
+  return 0;
+}
 EOF
 if compile_prog "" "" ; then
   pthread=yes
-- 
1.7.2.5


