Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XP4H1-000890-VZ
	for mharc-qemu-trivial@gnu.org; Wed, 03 Sep 2014 02:42:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44963)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XP4Gv-0007vV-Hm
	for qemu-trivial@nongnu.org; Wed, 03 Sep 2014 02:42:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XP4Gq-0007F7-Js
	for qemu-trivial@nongnu.org; Wed, 03 Sep 2014 02:42:25 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:42708)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XP4Gd-0007Bn-Ir; Wed, 03 Sep 2014 02:42:07 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id F195040767;
	Wed,  3 Sep 2014 10:42:05 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id F12396E0;
	Wed,  3 Sep 2014 10:35:36 +0400 (MSK)
Received: (nullmailer pid 1604 invoked by uid 1000);
	Wed, 03 Sep 2014 06:35:35 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  3 Sep 2014 10:35:26 +0400
Message-Id: <1409726135-1547-2-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1409726135-1547-1-git-send-email-mjt@tls.msk.ru>
References: <1409726135-1547-1-git-send-email-mjt@tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	"Richard W.M. Jones" <rjones@redhat.com>
Subject: [Qemu-trivial] [PULL 01/10] curl: The macro that you have to
	uncomment to get debugging is DEBUG_CURL.
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
X-List-Received-Date: Wed, 03 Sep 2014 06:42:30 -0000

From: "Richard W.M. Jones" <rjones@redhat.com>

Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 block/curl.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/curl.c b/block/curl.c
index 0258339..938f9d9 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -26,7 +26,7 @@
 #include "qapi/qmp/qbool.h"
 #include <curl/curl.h>
 
-// #define DEBUG
+// #define DEBUG_CURL
 // #define DEBUG_VERBOSE
 
 #ifdef DEBUG_CURL
-- 
1.7.10.4


