Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TrRlH-0006c1-NL
	for mharc-qemu-trivial@gnu.org; Sat, 05 Jan 2013 06:17:59 -0500
Received: from eggs.gnu.org ([208.118.235.92]:36253)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TrRlC-0006MX-8N
	for qemu-trivial@nongnu.org; Sat, 05 Jan 2013 06:17:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TrRl9-0006Sk-Gd
	for qemu-trivial@nongnu.org; Sat, 05 Jan 2013 06:17:54 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:35253)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1TrRl3-0006Qu-PA; Sat, 05 Jan 2013 06:17:45 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	12E04728003D; Sat,  5 Jan 2013 12:17:44 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id qbMZvCSluGnM; Sat,  5 Jan 2013 12:17:40 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 02622728004D; Sat,  5 Jan 2013 12:17:40 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Sat,  5 Jan 2013 12:17:38 +0100
Message-Id: <1357384658-4160-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] configure: Fix comment (copy+paste bug)
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
X-List-Received-Date: Sat, 05 Jan 2013 11:17:58 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 configure |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 837a84a..4bd9e92 100755
--- a/configure
+++ b/configure
@@ -2697,7 +2697,7 @@ if compile_prog "" "" ; then
   byteswap_h=yes
 fi
 
-# Search for bswap_32 function
+# Search for bswap32 function
 bswap_h=no
 cat > $TMPC << EOF
 #include <sys/endian.h>
-- 
1.7.10.4


