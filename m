Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eHA9d-0007ql-G2
	for mharc-qemu-trivial@gnu.org; Tue, 21 Nov 2017 10:08:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36020)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eHA9Y-0007mq-I3
	for qemu-trivial@nongnu.org; Tue, 21 Nov 2017 10:08:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eHA9S-0003xU-Mw
	for qemu-trivial@nongnu.org; Tue, 21 Nov 2017 10:08:00 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:38488)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eHA9E-0003rw-Fq; Tue, 21 Nov 2017 10:07:40 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eHA96-0007v0-L5; Tue, 21 Nov 2017 15:07:32 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: patches@linaro.org
Date: Tue, 21 Nov 2017 15:07:31 +0000
Message-Id: <1511276851-17680-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-trivial] [PATCH] accel/tcg/cpu-exec-common.c: Remove
 unnecessary include of memory-internal.h
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
X-List-Received-Date: Tue, 21 Nov 2017 15:08:04 -0000

The cpu-exec-common.c file includes memory-internal.h, but it doesn't
actually use anything from that header. Remove the unnecessary include.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 accel/tcg/cpu-exec-common.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/accel/tcg/cpu-exec-common.c b/accel/tcg/cpu-exec-common.c
index 5b4ae54..dac5aac 100644
--- a/accel/tcg/cpu-exec-common.c
+++ b/accel/tcg/cpu-exec-common.c
@@ -21,7 +21,6 @@
 #include "cpu.h"
 #include "sysemu/cpus.h"
 #include "exec/exec-all.h"
-#include "exec/memory-internal.h"
 
 bool tcg_allowed;
 
-- 
2.7.4


