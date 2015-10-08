Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZkEjd-00037i-Lh
	for mharc-qemu-trivial@gnu.org; Thu, 08 Oct 2015 13:12:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44972)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZkEjZ-0002zf-Jr
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 13:12:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZkEjY-0004Bk-Ih
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 13:12:01 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59074)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZkEjR-0003yf-65; Thu, 08 Oct 2015 13:11:53 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 86FA140A63;
	Thu,  8 Oct 2015 20:11:49 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id E9429A8B;
	Thu,  8 Oct 2015 19:52:31 +0300 (MSK)
Received: (nullmailer pid 11994 invoked by uid 1000);
	Thu, 08 Oct 2015 16:52:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu,  8 Oct 2015 19:52:18 +0300
Message-Id: <738c8b01ba4d020ee42c72e83a6aa3d9408a2530.1444323071.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1444323071.git.mjt@msgid.tls.msk.ru>
References: <cover.1444323071.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Shraddha Barke <shraddha.6596@gmail.com>
Subject: [Qemu-trivial] [PULL 09/19] target-microblaze: Remove unnecessary
	variable
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
X-List-Received-Date: Thu, 08 Oct 2015 17:12:03 -0000

From: Shraddha Barke <shraddha.6596@gmail.com>

Compress lines and remove the variable.

Signed-off-by: Shraddha Barke <shraddha.6596@gmail.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target-microblaze/op_helper.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/target-microblaze/op_helper.c b/target-microblaze/op_helper.c
index 092c4b5..d324347 100644
--- a/target-microblaze/op_helper.c
+++ b/target-microblaze/op_helper.c
@@ -150,9 +150,7 @@ uint32_t helper_clz(uint32_t t0)
 
 uint32_t helper_carry(uint32_t a, uint32_t b, uint32_t cf)
 {
-    uint32_t ncf;
-    ncf = compute_carry(a, b, cf);
-    return ncf;
+    return compute_carry(a, b, cf);
 }
 
 static inline int div_prepare(CPUMBState *env, uint32_t a, uint32_t b)
-- 
2.1.4


