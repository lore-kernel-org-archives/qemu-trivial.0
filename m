Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VN4em-00011O-SW
	for mharc-qemu-trivial@gnu.org; Fri, 20 Sep 2013 13:38:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59031)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VN4ee-0000jG-Q3
	for qemu-trivial@nongnu.org; Fri, 20 Sep 2013 13:38:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VN4ea-0003gE-DQ
	for qemu-trivial@nongnu.org; Fri, 20 Sep 2013 13:38:08 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38327)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VN4eM-0003dz-DL; Fri, 20 Sep 2013 13:37:50 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 74BDC419D9;
	Fri, 20 Sep 2013 21:37:47 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 1A593521;
	Fri, 20 Sep 2013 20:58:23 +0400 (MSK)
Received: (nullmailer pid 32195 invoked by uid 1000);
	Fri, 20 Sep 2013 16:58:21 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Fri, 20 Sep 2013 20:58:14 +0400
Message-Id: <1379696296-32105-16-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1379696296-32105-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1379696296-32105-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 15/17] kvm: Fix compiler warning (clang)
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
X-List-Received-Date: Fri, 20 Sep 2013 17:38:15 -0000

From: Stefan Weil <sw@weilnetz.de>

Report from clang analyzer:

clock.c:42:15: warning:
Value stored to 'cpu' during its initialization is never read

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/i386/kvm/clock.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/kvm/clock.c b/hw/i386/kvm/clock.c
index 92aabb8..383938d 100644
--- a/hw/i386/kvm/clock.c
+++ b/hw/i386/kvm/clock.c
@@ -39,7 +39,7 @@ static void kvmclock_vm_state_change(void *opaque, int running,
                                      RunState state)
 {
     KVMClockState *s = opaque;
-    CPUState *cpu = first_cpu;
+    CPUState *cpu;
     int cap_clock_ctrl = kvm_check_extension(kvm_state, KVM_CAP_KVMCLOCK_CTRL);
     int ret;
 
-- 
1.7.10.4


