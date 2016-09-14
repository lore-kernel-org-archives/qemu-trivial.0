Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bk567-0005tk-HQ
	for mharc-qemu-trivial@gnu.org; Wed, 14 Sep 2016 03:59:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32872)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk564-0005oF-88
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 03:59:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk562-0004bZ-IT
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 03:59:07 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54862)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bk55y-0004WS-2t; Wed, 14 Sep 2016 03:59:02 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 3713541844;
	Wed, 14 Sep 2016 10:58:58 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id A9161AEA;
	Wed, 14 Sep 2016 10:58:57 +0300 (MSK)
Received: (nullmailer pid 17315 invoked by uid 1000);
	Wed, 14 Sep 2016 07:58:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 14 Sep 2016 10:58:28 +0300
Message-Id: <eebc2a4901ef0551d500169eb18b914a5a602efe.1473839869.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
References: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
References: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 02/27] tcg: Remove duplicate header includes
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
X-List-Received-Date: Wed, 14 Sep 2016 07:59:09 -0000

From: Thomas Huth <thuth@redhat.com>

host-utils.h and timer.h are included twice in tcg.c.
One time should be enough.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 tcg/tcg.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 42417bd..c450c62 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -40,8 +40,6 @@
 #define NO_CPU_IO_DEFS
 #include "cpu.h"
 
-#include "qemu/host-utils.h"
-#include "qemu/timer.h"
 #include "exec/cpu-common.h"
 #include "exec/exec-all.h"
 
-- 
2.1.4


