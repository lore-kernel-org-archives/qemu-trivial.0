Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j20YT-0002S9-Jz
	for mharc-qemu-trivial@gnu.org; Wed, 12 Feb 2020 17:32:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44833)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1j20YR-0002Ol-4J
 for qemu-trivial@nongnu.org; Wed, 12 Feb 2020 17:32:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1j20YQ-0002qc-8A
 for qemu-trivial@nongnu.org; Wed, 12 Feb 2020 17:32:22 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:31078)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
 id 1j20YN-0002lH-NF; Wed, 12 Feb 2020 17:32:19 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 73D3674638A;
 Wed, 12 Feb 2020 23:32:07 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 5A37574637F; Wed, 12 Feb 2020 23:32:07 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
Date: Wed, 12 Feb 2020 23:26:14 +0100
Subject: [PATCH] target/ppc/cpu.h: Remove duplicate includes
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20200212223207.5A37574637F@zero.eik.bme.hu>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:738:2001:2001::2001
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Feb 2020 22:32:24 -0000

Commit 74433bf083b added some includes but added them twice. Since
these are guarded against multiple inclusion including them once is
enough.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 target/ppc/cpu.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 3a1eb76004..07dd2b4da7 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -23,8 +23,6 @@
 #include "qemu/int128.h"
 #include "exec/cpu-defs.h"
 #include "cpu-qom.h"
-#include "exec/cpu-defs.h"
-#include "cpu-qom.h"
 
 /* #define PPC_EMULATE_32BITS_HYPV */
 
-- 
2.21.1


