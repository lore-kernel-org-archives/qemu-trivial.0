Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ynk7f-0006oH-RD
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2015 04:47:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57458)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ynk7a-0006e3-Qg
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 04:47:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ynk7a-0004bZ-1C
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 04:47:02 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:35440)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Ynk7V-0004ZN-PJ; Thu, 30 Apr 2015 04:46:57 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B75EC42BC2;
	Thu, 30 Apr 2015 11:46:56 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 8FDFC970;
	Thu, 30 Apr 2015 08:09:01 +0300 (MSK)
Received: (nullmailer pid 4362 invoked by uid 1000);
	Thu, 30 Apr 2015 05:08:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 30 Apr 2015 08:08:47 +0300
Message-Id: <ddaecced26fbb2887034ab3fcaabc4b57e46a6b2.1430370396.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
References: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, "Emilio G. Cota" <cota@braap.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 34/42] coroutine: remove unnecessary
	parentheses in qemu_co_queue_empty
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
X-List-Received-Date: Thu, 30 Apr 2015 08:47:03 -0000

From: "Emilio G. Cota" <cota@braap.org>

Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-coroutine-lock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-coroutine-lock.c b/qemu-coroutine-lock.c
index e4860ae..6b49033 100644
--- a/qemu-coroutine-lock.c
+++ b/qemu-coroutine-lock.c
@@ -108,7 +108,7 @@ bool qemu_co_enter_next(CoQueue *queue)
 
 bool qemu_co_queue_empty(CoQueue *queue)
 {
-    return (QTAILQ_FIRST(&queue->entries) == NULL);
+    return QTAILQ_FIRST(&queue->entries) == NULL;
 }
 
 void qemu_co_mutex_init(CoMutex *mutex)
-- 
2.1.4


