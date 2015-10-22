Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZpEPF-0004Rq-ST
	for mharc-qemu-trivial@gnu.org; Thu, 22 Oct 2015 07:51:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44131)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ZpEPD-0004Pm-Hf
	for qemu-trivial@nongnu.org; Thu, 22 Oct 2015 07:51:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ZpEPC-0003Pe-K4
	for qemu-trivial@nongnu.org; Thu, 22 Oct 2015 07:51:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55478)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1ZpEP6-0003Om-SI; Thu, 22 Oct 2015 07:51:32 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 790BFC0BEA9F;
	Thu, 22 Oct 2015 11:51:32 +0000 (UTC)
Received: from donizetti.redhat.com (ovpn-112-60.ams2.redhat.com
	[10.36.112.60])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t9MBpUsr011608; Thu, 22 Oct 2015 07:51:31 -0400
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 22 Oct 2015 13:51:30 +0200
Message-Id: <1445514690-7883-1-git-send-email-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, cota@braap.org
Subject: [Qemu-trivial] [PATCH] exec: avoid unnecessary cacheline bounce on
	ram_list.mru_block
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
X-List-Received-Date: Thu, 22 Oct 2015 11:51:40 -0000

Whenever the MRU cache hits for the list of RAM blocks, qemu_get_ram_block
does an unnecessary write that causes a processor cache line to bounce
from one core to another.  This causes a performance hit.

Reported-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 exec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/exec.c b/exec.c
index 54cd70a..439b128 100644
--- a/exec.c
+++ b/exec.c
@@ -860,7 +860,7 @@ static RAMBlock *qemu_get_ram_block(ram_addr_t addr)
 
     block = atomic_rcu_read(&ram_list.mru_block);
     if (block && addr - block->offset < block->max_length) {
-        goto found;
+        return block;
     }
     QLIST_FOREACH_RCU(block, &ram_list.blocks, next) {
         if (addr - block->offset < block->max_length) {
-- 
2.5.0


