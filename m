Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZaMiU-00017b-IV
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2015 07:42:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38651)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaMiO-0000uM-4N
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 07:42:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaMiK-0004vL-9a
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 07:42:00 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56698)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZaMiC-0004sD-7P; Fri, 11 Sep 2015 07:41:48 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id EB58D4143B;
	Fri, 11 Sep 2015 14:41:45 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 71617A83;
	Fri, 11 Sep 2015 14:03:54 +0300 (MSK)
Received: (nullmailer pid 22785 invoked by uid 1000);
	Fri, 11 Sep 2015 11:03:51 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 11 Sep 2015 14:03:40 +0300
Message-Id: <70cbae1dd85c9b4bb7c42bb282baacaaed0dd9bd.1441969369.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441969369.git.mjt@msgid.tls.msk.ru>
References: <cover.1441969369.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Michael Tokarev <mjt@tls.msk.ru>, Samuel Thibault <samuel.thibault@gnu.org>
Subject: [Qemu-trivial] [PULL 16/26] baum: Fix build with debugging enabled
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
X-List-Received-Date: Fri, 11 Sep 2015 11:42:05 -0000

From: Samuel Thibault <samuel.thibault@gnu.org>

cur and buf are pointers, so the difference is a ptrdiff_t

Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 backends/baum.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/backends/baum.c b/backends/baum.c
index a69aaff..a17f625 100644
--- a/backends/baum.c
+++ b/backends/baum.c
@@ -303,7 +303,7 @@ static int baum_eat_packet(BaumDriverState *baum, const uint8_t *buf, int len)
                 return 0;
             cur++;
         }
-        DPRINTF("Dropped %d bytes!\n", cur - buf);
+        DPRINTF("Dropped %td bytes!\n", cur - buf);
     }
 
 #define EAT(c) do {\
-- 
2.1.4


