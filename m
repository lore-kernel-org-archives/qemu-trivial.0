Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RbpeY-0006Mc-0B
	for mharc-qemu-trivial@gnu.org; Sat, 17 Dec 2011 03:29:58 -0500
Received: from eggs.gnu.org ([140.186.70.92]:52172)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RbpeU-0006AT-VA
	for qemu-trivial@nongnu.org; Sat, 17 Dec 2011 03:29:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RbpeU-0006Oi-2O
	for qemu-trivial@nongnu.org; Sat, 17 Dec 2011 03:29:54 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:47791)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1RbpeQ-0006O4-Ml; Sat, 17 Dec 2011 03:29:50 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	31ACD7282E5C; Sat, 17 Dec 2011 09:29:40 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id TDeIOlfnVSmy; Sat, 17 Dec 2011 09:29:19 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 90316728328A; Sat, 17 Dec 2011 09:27:53 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Sat, 17 Dec 2011 09:27:36 +0100
Message-Id: <1324110459-3932-9-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1324110459-3932-1-git-send-email-sw@weilnetz.de>
References: <1324110459-3932-1-git-send-email-sw@weilnetz.de>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH 08/11] configure: Fix compiler warning in
	config.log (undefined NULL)
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
X-List-Received-Date: Sat, 17 Dec 2011 08:29:56 -0000

Avoid the warning when probing for xfs.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 configure |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/configure b/configure
index b755ad1..31ea3ff 100755
--- a/configure
+++ b/configure
@@ -1670,6 +1670,7 @@ fi
 # xfsctl() probe, used for raw-posix
 if test "$xfs" != "no" ; then
   cat > $TMPC << EOF
+#include <stddef.h>  /* NULL */
 #include <xfs/xfs.h>
 int main(void)
 {
-- 
1.7.2.5


