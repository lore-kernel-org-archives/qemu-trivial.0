Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ezbVO-00054q-3E
	for mharc-qemu-trivial@gnu.org; Sat, 24 Mar 2018 01:14:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45228)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>) id 1ezbVL-000530-Jq
	for qemu-trivial@nongnu.org; Sat, 24 Mar 2018 01:14:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>) id 1ezbVK-0005a6-Le
	for qemu-trivial@nongnu.org; Sat, 24 Mar 2018 01:14:11 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:37644 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mprivozn@redhat.com>)
	id 1ezbVG-0005Rn-6c; Sat, 24 Mar 2018 01:14:06 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E3E44406E96B;
	Sat, 24 Mar 2018 05:13:54 +0000 (UTC)
Received: from localhost.localdomain (ovpn-204-18.brq.redhat.com
	[10.40.204.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1D88F215CDA7;
	Sat, 24 Mar 2018 05:13:47 +0000 (UTC)
From: Michal Privoznik <mprivozn@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	kraxel@redhat.com
Date: Sat, 24 Mar 2018 06:13:41 +0100
Message-Id: <4e8dcc24123a09587ecc427f2e80727ba41a7866.1521868380.git.mprivozn@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Sat, 24 Mar 2018 05:13:54 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Sat, 24 Mar 2018 05:13:54 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'mprivozn@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PATCH] ccid-card: include libcacard.h only
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
X-List-Received-Date: Sat, 24 Mar 2018 05:14:12 -0000

When trying to build with latest libcacard-2.5.1, I hit the
following error:

In file included from hw/usb/ccid-card-passthru.c:12:0:
/usr/include/cacard/vscard_common.h:26:2: error: #warning "Only <libcacard.h> can be included directly" [-Werror=cpp]
 #warning "Only <libcacard.h> can be included directly"

Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
---
 hw/usb/ccid-card-emulated.c | 5 +----
 hw/usb/ccid-card-passthru.c | 2 +-
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/usb/ccid-card-emulated.c b/hw/usb/ccid-card-emulated.c
index ea42e4681d..7b538ae6da 100644
--- a/hw/usb/ccid-card-emulated.c
+++ b/hw/usb/ccid-card-emulated.c
@@ -27,10 +27,7 @@
  */
 
 #include "qemu/osdep.h"
-#include <eventt.h>
-#include <vevent.h>
-#include <vreader.h>
-#include <vcard_emul.h>
+#include <cacard/libcacard.h>
 
 #include "qemu/thread.h"
 #include "qemu/main-loop.h"
diff --git a/hw/usb/ccid-card-passthru.c b/hw/usb/ccid-card-passthru.c
index b7dd3602dc..982d575edd 100644
--- a/hw/usb/ccid-card-passthru.c
+++ b/hw/usb/ccid-card-passthru.c
@@ -9,7 +9,7 @@
  */
 
 #include "qemu/osdep.h"
-#include <cacard/vscard_common.h>
+#include <cacard/libcacard.h>
 #include "chardev/char-fe.h"
 #include "qemu/error-report.h"
 #include "qemu/sockets.h"
-- 
2.16.1


