Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zugvn-0002vS-4r
	for mharc-qemu-trivial@gnu.org; Fri, 06 Nov 2015 08:19:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38549)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Zugvk-0002qr-CC
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 08:19:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Zugvj-0002I4-KW
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 08:19:48 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:56919)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Zugve-0002Cq-D7; Fri, 06 Nov 2015 08:19:42 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id C716540DDA;
	Fri,  6 Nov 2015 16:19:39 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 2BAA5AC7;
	Fri,  6 Nov 2015 15:44:05 +0300 (MSK)
Received: (nullmailer pid 31715 invoked by uid 1000);
	Fri, 06 Nov 2015 12:44:03 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri,  6 Nov 2015 15:43:58 +0300
Message-Id: <68851b98e5bf6d397498b74f1776801274ab8d48.1446813769.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1446813768.git.mjt@msgid.tls.msk.ru>
References: <cover.1446813768.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 21/24] exec: avoid unnecessary cacheline
	bounce on ram_list.mru_block
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
X-List-Received-Date: Fri, 06 Nov 2015 13:19:49 -0000

From: Paolo Bonzini <pbonzini@redhat.com>

Whenever the MRU cache hits for the list of RAM blocks, qemu_get_ram_block
does an unnecessary write that causes a processor cache line to bounce
from one core to another.  This causes a performance hit.

Reported-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 exec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/exec.c b/exec.c
index ed88e72..a028961 100644
--- a/exec.c
+++ b/exec.c
@@ -903,7 +903,7 @@ static RAMBlock *qemu_get_ram_block(ram_addr_t addr)
 
     block = atomic_rcu_read(&ram_list.mru_block);
     if (block && addr - block->offset < block->max_length) {
-        goto found;
+        return block;
     }
     QLIST_FOREACH_RCU(block, &ram_list.blocks, next) {
         if (addr - block->offset < block->max_length) {
-- 
2.1.4


