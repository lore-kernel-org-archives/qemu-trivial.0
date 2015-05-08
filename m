Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YqqJh-0006g2-Fv
	for mharc-qemu-trivial@gnu.org; Fri, 08 May 2015 18:00:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45169)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YqqJb-0006VM-Bi
	for qemu-trivial@nongnu.org; Fri, 08 May 2015 18:00:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YqqJa-0005ko-Ik
	for qemu-trivial@nongnu.org; Fri, 08 May 2015 18:00:15 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41663)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YqqJU-0005XV-C6; Fri, 08 May 2015 18:00:08 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 00A494077F;
	Sat,  9 May 2015 01:00:07 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id D05C6953;
	Sat,  9 May 2015 01:00:06 +0300 (MSK)
Received: (nullmailer pid 10319 invoked by uid 1000);
	Fri, 08 May 2015 22:00:06 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sat,  9 May 2015 01:00:04 +0300
Message-Id: <f20f2a1f339b99f5b840367236ddce9d9736247c.1431122325.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1431122325.git.mjt@msgid.tls.msk.ru>
References: <cover.1431122325.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 4/5] glib-compat.h: change assert to g_assert
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
X-List-Received-Date: Fri, 08 May 2015 22:00:16 -0000

include/glib-compat.h defines a bunch of functions based on glib primitives,
and uses assert() without including assert.h.  Replace assert() with
g_assert() to make the file more self-contained, and to fix compilation
breakage after 28507a415a9b1e.

Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Tested-by: Laurent Desnogues <laurent.desnogues@gmail.com>
---
 include/glib-compat.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/glib-compat.h b/include/glib-compat.h
index 011352b..28d9f15 100644
--- a/include/glib-compat.h
+++ b/include/glib-compat.h
@@ -115,7 +115,7 @@ static inline void g_mutex_init(CompatGMutex *mutex)
 
 static inline void g_mutex_clear(CompatGMutex *mutex)
 {
-    assert(mutex->once.status != G_ONCE_STATUS_PROGRESS);
+    g_assert(mutex->once.status != G_ONCE_STATUS_PROGRESS);
     if (mutex->once.retval) {
         g_mutex_free((GMutex *) mutex->once.retval);
     }
@@ -155,7 +155,7 @@ static inline void g_cond_init(CompatGCond *cond)
 
 static inline void g_cond_clear(CompatGCond *cond)
 {
-    assert(cond->once.status != G_ONCE_STATUS_PROGRESS);
+    g_assert(cond->once.status != G_ONCE_STATUS_PROGRESS);
     if (cond->once.retval) {
         g_cond_free((GCond *) cond->once.retval);
     }
@@ -164,7 +164,7 @@ static inline void g_cond_clear(CompatGCond *cond)
 
 static inline void (g_cond_wait)(CompatGCond *cond, CompatGMutex *mutex)
 {
-    assert(mutex->once.status != G_ONCE_STATUS_PROGRESS);
+    g_assert(mutex->once.status != G_ONCE_STATUS_PROGRESS);
     g_once(&cond->once, do_g_cond_new, NULL);
     g_cond_wait((GCond *) cond->once.retval, (GMutex *) mutex->once.retval);
 }
-- 
2.1.4


