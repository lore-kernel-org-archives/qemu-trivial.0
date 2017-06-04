Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dHXiv-0002Ns-Fz
	for mharc-qemu-trivial@gnu.org; Sun, 04 Jun 2017 11:45:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59765)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dHXit-0002Mw-6i
	for qemu-trivial@nongnu.org; Sun, 04 Jun 2017 11:45:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dHXis-0005xu-FH
	for qemu-trivial@nongnu.org; Sun, 04 Jun 2017 11:45:47 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39151)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dHXin-0005jy-99; Sun, 04 Jun 2017 11:45:41 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E25A0404E4;
	Sun,  4 Jun 2017 18:45:27 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id BDD165E6;
	Sun,  4 Jun 2017 18:45:27 +0300 (MSK)
Received: (nullmailer pid 16370 invoked by uid 1000);
	Sun, 04 Jun 2017 15:45:27 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  4 Jun 2017 18:45:12 +0300
Message-Id: <e8758b62290c45b5b2f3c7925e250b9f16293f27.1496591095.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
References: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
References: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 08/22] trivial: Remove unneeded ifndef in
 memory.h
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
X-List-Received-Date: Sun, 04 Jun 2017 15:45:48 -0000

From: Juan Quintela <quintela@redhat.com>

All the file is surounded already by #ifndef CONFIG_USER_ONLY.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/exec/memory.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index bfdc685f24..80e605a96a 100644
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
2.11.0


