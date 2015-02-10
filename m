Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL7mw-0005de-T3
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 05:11:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47410)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL7mo-0005Oo-56
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 05:11:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL7mk-0003un-2U
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 05:11:18 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:45995)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YL7mb-0003qj-Ce; Tue, 10 Feb 2015 05:11:05 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 78FC4418C1;
	Tue, 10 Feb 2015 13:11:03 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id E4260954;
	Tue, 10 Feb 2015 09:34:46 +0300 (MSK)
Received: (nullmailer pid 9400 invoked by uid 1000);
	Tue, 10 Feb 2015 06:34:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Feb 2015 09:34:22 +0300
Message-Id: <9834fe02b00552648d498ca561b51f8ff1d7df31.1423549659.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
References: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PULL 33/46] kvm: g_malloc() can't fail,
	bury dead error handling
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
X-List-Received-Date: Tue, 10 Feb 2015 10:11:25 -0000

From: Markus Armbruster <armbru@redhat.com>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Gonglei <arei.gonglei@huawei.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 kvm-all.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/kvm-all.c b/kvm-all.c
index 2f21a4e..05a79c2 100644
--- a/kvm-all.c
+++ b/kvm-all.c
@@ -2070,10 +2070,6 @@ int kvm_insert_breakpoint(CPUState *cpu, target_ulong addr,
         }
 
         bp = g_malloc(sizeof(struct kvm_sw_breakpoint));
-        if (!bp) {
-            return -ENOMEM;
-        }
-
         bp->pc = addr;
         bp->use_count = 1;
         err = kvm_arch_insert_sw_breakpoint(cpu, bp);
-- 
2.1.4


