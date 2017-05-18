Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dBInd-00022p-M5
	for mharc-qemu-trivial@gnu.org; Thu, 18 May 2017 06:36:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47290)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1dBInb-000219-AW
	for qemu-trivial@nongnu.org; Thu, 18 May 2017 06:36:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1dBIna-0005Z9-LZ
	for qemu-trivial@nongnu.org; Thu, 18 May 2017 06:36:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55990)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <quintela@redhat.com>)
	id 1dBInW-0005YJ-CA; Thu, 18 May 2017 06:36:46 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 220314DD62;
	Thu, 18 May 2017 10:36:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 220314DD62
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=quintela@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 220314DD62
Received: from secure.mitica (ovpn-117-10.ams2.redhat.com [10.36.117.10])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 846B119EE6;
	Thu, 18 May 2017 10:36:43 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, lvivier@redhat.com, peterx@redhat.com,
	qemu-trivial@nongnu.org
Date: Thu, 18 May 2017 12:36:42 +0200
Message-Id: <20170518103642.27796-1-quintela@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 18 May 2017 10:36:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] trivial: Remove unneeded ifndef in memory.h
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
X-List-Received-Date: Thu, 18 May 2017 10:36:52 -0000

All the file is surounded already by #ifndef CONFIG_USER_ONLY.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 include/exec/memory.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 99e0f54..6b5b953 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -17,9 +17,7 @@
 #ifndef CONFIG_USER_ONLY
 
 #include "exec/cpu-common.h"
-#ifndef CONFIG_USER_ONLY
 #include "exec/hwaddr.h"
-#endif
 #include "exec/memattrs.h"
 #include "exec/ramlist.h"
 #include "qemu/queue.h"
-- 
2.9.3


