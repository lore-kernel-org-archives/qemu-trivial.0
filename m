Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cdvwN-0005F0-VE
	for mharc-qemu-trivial@gnu.org; Wed, 15 Feb 2017 04:32:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47665)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1cdvwK-0005Bj-HE
	for qemu-trivial@nongnu.org; Wed, 15 Feb 2017 04:31:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1cdvwJ-0001kw-GN
	for qemu-trivial@nongnu.org; Wed, 15 Feb 2017 04:31:56 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59478)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1cdvwF-0001ji-12; Wed, 15 Feb 2017 04:31:51 -0500
Received: from smtp.corp.redhat.com (int-mx16.intmail.prod.int.phx2.redhat.com
	[10.5.11.28])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EF60861D00;
	Wed, 15 Feb 2017 09:31:50 +0000 (UTC)
Received: from lemon.redhat.com (ovpn-8-23.pek2.redhat.com [10.72.8.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B9D4784CFB;
	Wed, 15 Feb 2017 09:31:49 +0000 (UTC)
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Wed, 15 Feb 2017 17:31:47 +0800
Message-Id: <20170215093147.29711-1-famz@redhat.com>
X-Scanned-By: MIMEDefang 2.74 on 10.5.11.28
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 15 Feb 2017 09:31:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] cadence_gem: Remove unused parameter debug
 message
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
X-List-Received-Date: Wed, 15 Feb 2017 09:31:58 -0000

Reported by cppcheck.

Signed-off-by: Fam Zheng <famz@redhat.com>
---
 hw/net/cadence_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index e99d454..d4de8ad 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -508,7 +508,7 @@ static void gem_update_int_status(CadenceGEMState *s)
 
     if ((s->num_priority_queues == 1) && s->regs[GEM_ISR]) {
         /* No priority queues, just trigger the interrupt */
-        DB_PRINT("asserting int.\n", i);
+        DB_PRINT("asserting int.\n");
         qemu_set_irq(s->irq[0], 1);
         return;
     }
-- 
2.9.3


