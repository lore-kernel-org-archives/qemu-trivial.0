Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dN0ol-0000bI-F4
	for mharc-qemu-trivial@gnu.org; Mon, 19 Jun 2017 13:50:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52522)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dN0oj-0000a4-GL
	for qemu-trivial@nongnu.org; Mon, 19 Jun 2017 13:50:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dN0oi-0001n5-PF
	for qemu-trivial@nongnu.org; Mon, 19 Jun 2017 13:50:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37280)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dN0of-0001kk-0r; Mon, 19 Jun 2017 13:50:21 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B95C4C0587FB;
	Mon, 19 Jun 2017 17:50:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com B95C4C0587FB
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=thuth@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com B95C4C0587FB
Received: from thh440s.redhat.com (ovpn-116-149.ams2.redhat.com
	[10.36.116.149])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4500518989;
	Mon, 19 Jun 2017 17:50:18 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-trivial@nongnu.org
Date: Mon, 19 Jun 2017 19:50:17 +0200
Message-Id: <1497894617-12143-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 19 Jun 2017 17:50:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] ui: Remove inclusion of "hw/qdev.h"
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
X-List-Received-Date: Mon, 19 Jun 2017 17:50:26 -0000

Looks like #include "hw/qdev.h" is not needed here, so remove it.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 ui/input.c | 1 -
 ui/vnc.c   | 1 -
 2 files changed, 2 deletions(-)

diff --git a/ui/input.c b/ui/input.c
index 290ca9f..2abd46d 100644
--- a/ui/input.c
+++ b/ui/input.c
@@ -1,5 +1,4 @@
 #include "qemu/osdep.h"
-#include "hw/qdev.h"
 #include "sysemu/sysemu.h"
 #include "qapi-types.h"
 #include "qemu/error-report.h"
diff --git a/ui/vnc.c b/ui/vnc.c
index 47b49c7..26136f5 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -28,7 +28,6 @@
 #include "vnc.h"
 #include "vnc-jobs.h"
 #include "trace.h"
-#include "hw/qdev.h"
 #include "sysemu/sysemu.h"
 #include "qemu/error-report.h"
 #include "qemu/sockets.h"
-- 
1.8.3.1


