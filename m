Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TNdUt-0002YS-0d
	for mharc-qemu-trivial@gnu.org; Mon, 15 Oct 2012 01:45:51 -0400
Received: from eggs.gnu.org ([208.118.235.92]:33623)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TNdUo-0002M8-Nx
	for qemu-trivial@nongnu.org; Mon, 15 Oct 2012 01:45:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TNdUn-0003Ky-TD
	for qemu-trivial@nongnu.org; Mon, 15 Oct 2012 01:45:46 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:35458)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1TNdUl-0003Ie-Hy; Mon, 15 Oct 2012 01:45:43 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	667C1728003B; Mon, 15 Oct 2012 07:45:41 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id a1TjybG87YZF; Mon, 15 Oct 2012 07:45:40 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id DD41E7280041; Mon, 15 Oct 2012 07:45:40 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Mon, 15 Oct 2012 07:45:40 +0200
Message-Id: <1350279940-24134-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] configure: Remove unused parameters from
	main function
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
X-List-Received-Date: Mon, 15 Oct 2012 05:45:48 -0000

This modification is required if compiler option -Wunused-parameter is activated.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 configure |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 353d788..499ad81 100755
--- a/configure
+++ b/configure
@@ -1323,7 +1323,7 @@ if test -z "$cross_prefix" ; then
 # big/little endian test
 cat > $TMPC << EOF
 #include <inttypes.h>
-int main(int argc, char ** argv){
+int main(void) {
         volatile uint32_t i=0x01234567;
         return (*((uint8_t*)(&i))) == 0x67;
 }
@@ -2896,7 +2896,7 @@ static int sfaa(int *ptr)
   return __sync_fetch_and_and(ptr, 0);
 }
 
-int main(int argc, char **argv)
+int main(void)
 {
   int val = 42;
   sfaa(&val);
-- 
1.7.10.4


