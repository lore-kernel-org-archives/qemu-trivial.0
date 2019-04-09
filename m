Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hDjgx-0000qD-QM
	for mharc-qemu-trivial@gnu.org; Tue, 09 Apr 2019 01:53:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38532)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1hDjgw-0000pD-E3
	for qemu-trivial@nongnu.org; Tue, 09 Apr 2019 01:53:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1hDjgv-0007pz-JV
	for qemu-trivial@nongnu.org; Tue, 09 Apr 2019 01:53:06 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:43046
	helo=v2201612906741603.powersrv.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1hDjgs-0007nK-TT; Tue, 09 Apr 2019 01:53:03 -0400
Received: from localhost (localhost [127.0.0.1])
	by v2201612906741603.powersrv.de (Postfix) with ESMTP id EC62EDA062F;
	Tue,  9 Apr 2019 07:43:31 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
	by localhost (v2201612906741603.powersrv.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Osi-OF68DGjv; Tue,  9 Apr 2019 07:43:31 +0200 (CEST)
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
	by v2201612906741603.powersrv.de (Postfix) with ESMTP id 17CD3DA0606;
	Tue,  9 Apr 2019 07:43:31 +0200 (CEST)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id DBE5F46000F; Tue,  9 Apr 2019 07:43:30 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Stefan Weil <stweil@ub-cluster-01.bib.uni-mannheim.de>
Date: Tue,  9 Apr 2019 07:43:25 +0200
Message-Id: <20190409054325.22427-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.11.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 37.120.169.71
Subject: [Qemu-trivial] [PATCH] Fix type of cluster_index
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
X-List-Received-Date: Tue, 09 Apr 2019 05:53:07 -0000

From: Stefan Weil <stweil@ub-cluster-01.bib.uni-mannheim.de>

The type should be the same as the type of cluster_id.

This fixed a runtime error reported by sanitizers:

    /qemu/include/exec/tb-lookup.h:33:35: runtime error: left shift of negative value -1
    /qemu/accel/tcg/translate-all.c:1692:34: runtime error: left shift of negative value -1

Signed-off-by: Stefan Weil <stweil@ub-cluster-01.bib.uni-mannheim.de>
---
 include/qom/cpu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/qom/cpu.h b/include/qom/cpu.h
index 1d6099e5d4..6a753caed7 100644
--- a/include/qom/cpu.h
+++ b/include/qom/cpu.h
@@ -422,7 +422,7 @@ struct CPUState {
 
     /* TODO Move common fields from CPUArchState here. */
     int cpu_index;
-    int cluster_index;
+    uint32_t cluster_index;
     uint32_t halted;
     uint32_t can_do_io;
     int32_t exception_index;
@@ -1129,6 +1129,6 @@ extern const struct VMStateDescription vmstate_cpu_common;
 #endif /* NEED_CPU_H */
 
 #define UNASSIGNED_CPU_INDEX -1
-#define UNASSIGNED_CLUSTER_INDEX -1
+#define UNASSIGNED_CLUSTER_INDEX UINT32_MAX
 
 #endif
-- 
2.11.0


