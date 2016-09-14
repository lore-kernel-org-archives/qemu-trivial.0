Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bk5eW-0008Ot-Dp
	for mharc-qemu-trivial@gnu.org; Wed, 14 Sep 2016 04:34:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40410)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk5eU-0008MU-1M
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 04:34:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk5eT-0006tz-6r
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 04:34:41 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45523)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bk5eO-0006rW-Kk; Wed, 14 Sep 2016 04:34:36 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6D08B4183E;
	Wed, 14 Sep 2016 11:34:32 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 694C3B11;
	Wed, 14 Sep 2016 10:59:00 +0300 (MSK)
Received: (nullmailer pid 17364 invoked by uid 1000);
	Wed, 14 Sep 2016 07:58:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Md Haris Iqbal <haris.phnx@gmail.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 14 Sep 2016 10:58:52 +0300
Message-Id: <e15f229e173603a2a9f0eb74048fcc1770451b9e.1473839869.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
References: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
References: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 26/27] linux-user/qemu.h: change malloc to
 g_malloc, free to g_free
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Sep 2016 08:34:43 -0000

From: Md Haris Iqbal <haris.phnx@gmail.com>

Signed-off-by: Md Haris Iqbal <haris.phnx@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 linux-user/qemu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index bef465d..815447f 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -548,7 +548,7 @@ static inline void *lock_user(int type, abi_ulong guest_addr, long len, int copy
 #ifdef DEBUG_REMAP
     {
         void *addr;
-        addr = malloc(len);
+        addr = g_malloc(len);
         if (copy)
             memcpy(addr, g2h(guest_addr), len);
         else
@@ -574,7 +574,7 @@ static inline void unlock_user(void *host_ptr, abi_ulong guest_addr,
         return;
     if (len > 0)
         memcpy(g2h(guest_addr), host_ptr, len);
-    free(host_ptr);
+    g_free(host_ptr);
 #endif
 }
 
-- 
2.1.4


