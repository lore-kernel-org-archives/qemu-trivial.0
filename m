Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gfQzn-0006HG-H8
	for mharc-qemu-trivial@gnu.org; Fri, 04 Jan 2019 10:02:47 -0500
Received: from eggs.gnu.org ([208.118.235.92]:49965)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gfQzk-0006Bx-RJ
	for qemu-trivial@nongnu.org; Fri, 04 Jan 2019 10:02:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gfQzk-0001Bw-5n
	for qemu-trivial@nongnu.org; Fri, 04 Jan 2019 10:02:44 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51518)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gfQzc-0000nP-SE; Fri, 04 Jan 2019 10:02:36 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 22E6C7AEB6;
	Fri,  4 Jan 2019 15:02:36 +0000 (UTC)
Received: from thuth.com (dhcp-200-199.str.redhat.com [10.33.200.199])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 09C9D194A8;
	Fri,  4 Jan 2019 15:02:31 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
	qemu-arm@nongnu.org
Date: Fri,  4 Jan 2019 16:02:26 +0100
Message-Id: <1546614146-10525-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 04 Jan 2019 15:02:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] hw/audio/marvell: Don't include unnecessary
 i2c.h header file
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
X-List-Received-Date: Fri, 04 Jan 2019 15:02:45 -0000

This device does not use I2C, so no need to include the header file here.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/audio/marvell_88w8618.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/audio/marvell_88w8618.c b/hw/audio/marvell_88w8618.c
index 6600ab4..035dd76 100644
--- a/hw/audio/marvell_88w8618.c
+++ b/hw/audio/marvell_88w8618.c
@@ -12,7 +12,6 @@
 #include "qemu/osdep.h"
 #include "hw/sysbus.h"
 #include "hw/hw.h"
-#include "hw/i2c/i2c.h"
 #include "hw/audio/wm8750.h"
 #include "audio/audio.h"
 #include "qapi/error.h"
-- 
1.8.3.1


