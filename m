Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dBIkb-0000tB-VI
	for mharc-qemu-trivial@gnu.org; Thu, 18 May 2017 06:33:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46482)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dBIka-0000s7-9o
	for qemu-trivial@nongnu.org; Thu, 18 May 2017 06:33:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dBIkZ-0004p7-Lf
	for qemu-trivial@nongnu.org; Thu, 18 May 2017 06:33:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45494)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1dBIkV-0004nb-FN; Thu, 18 May 2017 06:33:39 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 70EDF5F742;
	Thu, 18 May 2017 10:33:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 70EDF5F742
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=pbonzini@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 70EDF5F742
Received: from donizetti.redhat.com (ovpn-117-178.ams2.redhat.com
	[10.36.117.178])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v4IAXZDW007465; Thu, 18 May 2017 06:33:36 -0400
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Thu, 18 May 2017 12:33:34 +0200
Message-Id: <20170518103334.8808-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 18 May 2017 10:33:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] altera_timer: fix incorrect memset
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
X-List-Received-Date: Thu, 18 May 2017 10:33:45 -0000

Use sizeof instead of ARRAY_SIZE, fixing -Wmemset-elt-size with recent
GCC versions.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/timer/altera_timer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/timer/altera_timer.c b/hw/timer/altera_timer.c
index 6d4862661d..c9a0fc5dca 100644
--- a/hw/timer/altera_timer.c
+++ b/hw/timer/altera_timer.c
@@ -204,7 +204,7 @@ static void altera_timer_reset(DeviceState *dev)
 
     ptimer_stop(t->ptimer);
     ptimer_set_limit(t->ptimer, 0xffffffff, 1);
-    memset(t->regs, 0, ARRAY_SIZE(t->regs));
+    memset(t->regs, 0, sizeof(t->regs));
 }
 
 static Property altera_timer_properties[] = {
-- 
2.13.0


