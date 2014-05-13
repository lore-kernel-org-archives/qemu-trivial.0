Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wk6rq-0005Rt-VO
	for mharc-qemu-trivial@gnu.org; Tue, 13 May 2014 03:11:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54132)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhen-hual@hp.com>) id 1Wk6rf-00054Q-TE
	for qemu-trivial@nongnu.org; Tue, 13 May 2014 03:11:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhen-hual@hp.com>) id 1Wk6rX-0003NB-JX
	for qemu-trivial@nongnu.org; Tue, 13 May 2014 03:11:03 -0400
Received: from g2t2354.austin.hp.com ([15.217.128.53]:37296)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhen-hual@hp.com>)
	id 1Wk6qy-0002uZ-Ab; Tue, 13 May 2014 03:10:20 -0400
Received: from g2t2360.austin.hp.com (g2t2360.austin.hp.com [16.197.8.247])
	by g2t2354.austin.hp.com (Postfix) with ESMTP id 397F215B;
	Tue, 13 May 2014 07:10:14 +0000 (UTC)
Received: from piepie.asiapacific.hpqcorp.net (piepie.asiapacific.hpqcorp.net
	[16.187.245.80])
	by g2t2360.austin.hp.com (Postfix) with ESMTP id C735C4F;
	Tue, 13 May 2014 07:10:12 +0000 (UTC)
From: "Li, Zhen-Hua" <zhen-hual@hp.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>,
	<qemu-stable@nongnu.org>
Date: Tue, 13 May 2014 15:09:13 +0800
Message-Id: <1399964954-10842-4-git-send-email-zhen-hual@hp.com>
X-Mailer: git-send-email 2.0.0-rc0
In-Reply-To: <1399964954-10842-1-git-send-email-zhen-hual@hp.com>
References: <1399964954-10842-1-git-send-email-zhen-hual@hp.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 15.217.128.53
Cc: "Li, ZhenHua" <zhen-hual@hp.com>
Subject: [Qemu-trivial] [PATCH 3/4] Support more than 255 cpus: max cpumask
	bit to 4096
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
X-List-Received-Date: Tue, 13 May 2014 07:11:12 -0000

From: "Li, ZhenHua" <zhen-hual@hp.com>

Change MAX_CPUMASK_BITS from 255 to 4096.

Signed-off-by: Li, ZhenHua <zhen-hual@hp.com>
---
 include/sysemu/sysemu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index ba5c7f8..97961a6 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -139,7 +139,7 @@ extern QEMUClockType rtc_clock;
  *
  * Note that cpu->get_arch_id() may be larger than MAX_CPUMASK_BITS.
  */
-#define MAX_CPUMASK_BITS 255
+#define MAX_CPUMASK_BITS 4096
 
 extern int nb_numa_nodes;
 extern uint64_t node_mem[MAX_NODES];
-- 
2.0.0-rc0


