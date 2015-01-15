Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YBg6x-0001KU-LY
	for mharc-qemu-trivial@gnu.org; Thu, 15 Jan 2015 03:49:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36341)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YBg6v-0001Ig-SZ
	for qemu-trivial@nongnu.org; Thu, 15 Jan 2015 03:49:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YBg6u-0005p8-NW
	for qemu-trivial@nongnu.org; Thu, 15 Jan 2015 03:49:01 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:57661)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YBg6o-0005mm-5x; Thu, 15 Jan 2015 03:48:54 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 2DAD840DC4;
	Thu, 15 Jan 2015 11:48:53 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 1081B8C8;
	Thu, 15 Jan 2015 11:30:54 +0300 (MSK)
Received: (nullmailer pid 31361 invoked by uid 1000);
	Thu, 15 Jan 2015 08:30:51 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 15 Jan 2015 11:30:49 +0300
Message-Id: <31fc97c3145d428751f8bc4d5666a525d5c3dc2f.1421310394.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1421310394.git.mjt@msgid.tls.msk.ru>
References: <cover.1421310394.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 11/12] blizzard: do not depend on VGA internals
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
X-List-Received-Date: Thu, 15 Jan 2015 08:49:02 -0000

From: Paolo Bonzini <pbonzini@redhat.com>

There is nothing that is used by this ARM-specific device.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/display/blizzard.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/display/blizzard.c b/hw/display/blizzard.c
index 92b1fac..5019bbb 100644
--- a/hw/display/blizzard.c
+++ b/hw/display/blizzard.c
@@ -21,7 +21,6 @@
 #include "qemu-common.h"
 #include "ui/console.h"
 #include "hw/devices.h"
-#include "vga_int.h"
 #include "ui/pixel_ops.h"
 
 typedef void (*blizzard_fn_t)(uint8_t *, const uint8_t *, unsigned int);
-- 
2.1.4


