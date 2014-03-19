Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WQJrc-0003b5-HS
	for mharc-qemu-trivial@gnu.org; Wed, 19 Mar 2014 13:01:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56179)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sdb@zubnet.me.uk>) id 1WQH9o-0005z6-CQ
	for qemu-trivial@nongnu.org; Wed, 19 Mar 2014 10:07:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sdb@zubnet.me.uk>) id 1WQH9a-0007h4-NQ
	for qemu-trivial@nongnu.org; Wed, 19 Mar 2014 10:07:48 -0400
Received: from b.painless.aa.net.uk ([81.187.30.52]:47860)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sdb@zubnet.me.uk>)
	id 1WQH9a-0007gz-Hc; Wed, 19 Mar 2014 10:07:34 -0400
Received: from
	d.1.8.4.b.4.1.c.e.3.a.e.1.c.0.8.9.0.3.d.f.7.a.c.0.b.8.0.1.0.0.2.ip6.arpa
	([2001:8b0:ca7f:d309:80c1:ea3e:c14b:481d] helo=athena.zubnet.me.uk)
	by b.painless.aa.net.uk with esmtps (TLSv1:AES128-SHA:128)
	(Exim 4.72) (envelope-from <sdb@zubnet.me.uk>)
	id 1WQH9T-0007PF-Ls; Wed, 19 Mar 2014 14:07:31 +0000
Received: from sdb by athena.zubnet.me.uk with local (Exim 4.82)
	(envelope-from <sdb@zubnet.me.uk>)
	id 1WQH9T-0002Xb-2J; Wed, 19 Mar 2014 14:07:27 +0000
Date: Wed, 19 Mar 2014 14:07:26 +0000
From: Stuart Brady <sdb@zubnet.me.uk>
To: qemu-trivial@nongnu.org
Message-ID: <20140319140726.GA9192@zubnet.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 81.187.30.52
X-Mailman-Approved-At: Wed, 19 Mar 2014 13:01:10 -0400
Cc: qemu-ppc@nongnu.org, Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] target-ppc: Fix overallocation of opcode
	tables
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
X-List-Received-Date: Wed, 19 Mar 2014 14:07:53 -0000

create_new_table() should allocate 0x20 opc_handler_t pointers, but
actually allocates 0x20 opc_handler_t structs.  Fix this.

Signed-off-by: Stuart Brady <sdb@zubnet.me.uk>
---
 translate_init.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target-ppc/translate_init.c b/target-ppc/translate_init.c
index 6084f40..75f34c1 100644
--- a/target-ppc/translate_init.c
+++ b/target-ppc/translate_init.c
@@ -7434,7 +7434,7 @@ static int create_new_table (opc_handler_t **table, unsigned char idx)
 {
     opc_handler_t **tmp;
 
-    tmp = g_malloc(0x20 * sizeof(opc_handler_t));
+    tmp = g_new(opc_handler_t *, 0x20);
     fill_new_table(tmp, 0x20);
     table[idx] = (opc_handler_t *)((uintptr_t)tmp | PPC_INDIRECT);
 

