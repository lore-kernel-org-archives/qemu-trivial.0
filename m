Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dzJxL-0001dV-Tp
	for mharc-qemu-trivial@gnu.org; Tue, 03 Oct 2017 05:57:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59225)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dzJxJ-0001as-GF
	for qemu-trivial@nongnu.org; Tue, 03 Oct 2017 05:57:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dzJxI-0002zu-PV
	for qemu-trivial@nongnu.org; Tue, 03 Oct 2017 05:57:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38989)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dzJxB-0002vN-9f; Tue, 03 Oct 2017 05:57:29 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 74A39C04AC69;
	Tue,  3 Oct 2017 09:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 74A39C04AC69
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from thh440s.redhat.com (ovpn-116-53.ams2.redhat.com [10.36.116.53])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 029E46046F;
	Tue,  3 Oct 2017 09:57:25 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-trivial@nongnu.org,
	Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>
Date: Tue,  3 Oct 2017 11:57:24 +0200
Message-Id: <1507024644-14853-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 03 Oct 2017 09:57:27 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] hw/block/onenand: Remove dead code block
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
X-List-Received-Date: Tue, 03 Oct 2017 09:57:38 -0000

The condition of the for-loop makes sure that b is always smaller
than s->blocks, so the "if (b >= s->blocks)" statement is completely
superfluous here.

Buglink: https://bugs.launchpad.net/qemu/+bug/1715007
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/block/onenand.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/block/onenand.c b/hw/block/onenand.c
index 30e40f3..de65c9e 100644
--- a/hw/block/onenand.c
+++ b/hw/block/onenand.c
@@ -520,10 +520,6 @@ static void onenand_command(OneNANDState *s)
         s->intstatus |= ONEN_INT;
 
         for (b = 0; b < s->blocks; b ++) {
-            if (b >= s->blocks) {
-                s->status |= ONEN_ERR_CMD;
-                break;
-            }
             if (s->blockwp[b] == ONEN_LOCK_LOCKTIGHTEN)
                 break;
 
-- 
1.8.3.1


