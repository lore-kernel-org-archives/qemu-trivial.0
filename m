Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bjqVm-0006cY-EK
	for mharc-qemu-trivial@gnu.org; Tue, 13 Sep 2016 12:24:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44986)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bjqVk-0006YQ-4c
	for qemu-trivial@nongnu.org; Tue, 13 Sep 2016 12:24:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bjqVi-0001m2-5t
	for qemu-trivial@nongnu.org; Tue, 13 Sep 2016 12:24:39 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:60327)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bjqVa-0001QF-Ny; Tue, 13 Sep 2016 12:24:30 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 3F58B416E6;
	Tue, 13 Sep 2016 19:24:27 +0300 (MSK)
Received: from gandalf (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 1B93EAFF;
	Tue, 13 Sep 2016 19:07:41 +0300 (MSK)
Received: (nullmailer pid 31914 invoked by uid 1000);
	Tue, 13 Sep 2016 16:07:39 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Tue, 13 Sep 2016 19:04:54 +0300
Message-Id: <5ce747cfac697f61668ab4fa4a71c1dba15cc272.1473782118.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1473782118.git.mjt@tls.msk.ru>
References: <cover.1473782118.git.mjt@tls.msk.ru>
In-Reply-To: <cover.1473782118.git.mjt@tls.msk.ru>
References: <cover.1473782118.git.mjt@tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 15/16] target-m68k: fix get_mac_extf helper
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
X-List-Received-Date: Tue, 13 Sep 2016 16:24:41 -0000

From: Paolo Bonzini <pbonzini@redhat.com>

val is assigned twice; the second one should be combined with "|".
Reported by Coverity.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target-m68k/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target-m68k/helper.c b/target-m68k/helper.c
index f52d0e3..89bbe6d 100644
--- a/target-m68k/helper.c
+++ b/target-m68k/helper.c
@@ -812,7 +812,7 @@ uint32_t HELPER(get_mac_extf)(CPUM68KState *env, uint32_t acc)
 {
     uint32_t val;
     val = env->macc[acc] & 0x00ff;
-    val = (env->macc[acc] >> 32) & 0xff00;
+    val |= (env->macc[acc] >> 32) & 0xff00;
     val |= (env->macc[acc + 1] << 16) & 0x00ff0000;
     val |= (env->macc[acc + 1] >> 16) & 0xff000000;
     return val;
-- 
2.1.4


