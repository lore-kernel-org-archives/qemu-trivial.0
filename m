Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4V0N-0001yU-Tz
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 12:46:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46831)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0L-0001w1-Eo
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:46:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0K-0003N3-Ga
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:46:09 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:55310)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0I-0003Lo-0k; Tue, 17 Oct 2017 12:46:06 -0400
Received: by mail-qk0-x244.google.com with SMTP id x82so2829308qkb.12;
	Tue, 17 Oct 2017 09:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=UD+wPNmnPoJcrvJdXbB4RS7dbTv3kCXlD/a5MqwZFAI=;
	b=HjGn+QVBHpVFwW9UtK/byKupdOCNj3SGy4MdWw4vcZHtPGCnQn2FoRHkBE7UrzXy6s
	9SYxIlSkJZBNKDBsMXfIdtSZTIkMnvs/JvBp1pX15cxAkeUl19UXgzqWKqjjlMXoISOh
	WYE8nIVOPlSpjcavXJuRBcjdaQl3asesyIMwja6qwQUTkCs0t8waHBo5besqjKAlyuXF
	WmTuAa9GzfZvLef7tR0Ybz0I7bxsXwS6I7Sn80yY/bbS/P4aLz0mmAVk0fhR/7eIOFEt
	Q6/u4lchd5zp5LSHNw4CImSDVewvPGZn4fTqnuPdCN5WaExquXtBiskwUAc/vetJKpmf
	GY0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=UD+wPNmnPoJcrvJdXbB4RS7dbTv3kCXlD/a5MqwZFAI=;
	b=JWhogEIAZPiPlBuyrPQElvexMeHYbgsEb7MfNgyvRUO5HCJcRz79phKhbbjmEa+ERc
	SubE6NGbngBUdZcbJfoxYfusvfxncDnEHHCla+ZSRa7Gh6Wz9Cl02YerR5IrJQbe+NSb
	s0q+SKHdIy8NxQ5NgngnHq/tYSmJkbkuQcZKHDMG2J3pqyXVPFaT1WrLlPp8NTQrOxNE
	h1mlzuMQ89FX/yocAlhpOrhkUlyH0spGLSI9ClPuItTsNkD/7gqxgVk+BeDadYYslfao
	rNutb1jLDsCDqhZMjvggNHnnszlS4R12amRcTZas6fRHFHLTNt4JdGm+K0TzDfSPqejA
	59CA==
X-Gm-Message-State: AMCzsaXCUVJ8FG8lByOrbL1lmghgX57KEv59owS4WgJT01JmsHMYfA5X
	8WzKX6xXNt98uC8E0NdD3y5zkdMI
X-Google-Smtp-Source: AOwi7QCc/O56OGHe2Ez6/OBckheBf71SNVNjAl/UF5id00VOaBqfD9iao85VhoVI3I4buecc8oXoLA==
X-Received: by 10.55.17.211 with SMTP id 80mr19080750qkr.270.1508258765461;
	Tue, 17 Oct 2017 09:46:05 -0700 (PDT)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	q49sm6687653qtq.80.2017.10.17.09.46.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 09:46:04 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 17 Oct 2017 13:44:01 -0300
Message-Id: <20171017164426.25277-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017164426.25277-1-f4bug@amsat.org>
References: <20171017164426.25277-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH v3 17/42] nios2: remove duplicated includes
 (in code commented out)
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
X-List-Received-Date: Tue, 17 Oct 2017 16:46:10 -0000

applied using ./scripts/clean-includes

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/nios2/cpu.h       | 1 -
 disas/nios2.c            | 3 ---
 hw/nios2/boot.c          | 1 -
 target/nios2/helper.c    | 5 +----
 target/nios2/op_helper.c | 1 +
 target/nios2/translate.c | 1 +
 6 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 50d803a217..fda02c39b9 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -20,7 +20,6 @@
 #ifndef CPU_NIOS2_H
 #define CPU_NIOS2_H
 
-#include "qemu/osdep.h"
 #include "qemu-common.h"
 
 #define TARGET_LONG_BITS 32
diff --git a/disas/nios2.c b/disas/nios2.c
index b342936d21..de11f04cc4 100644
--- a/disas/nios2.c
+++ b/disas/nios2.c
@@ -1756,7 +1756,6 @@ extern const int nios2_num_r2_reg_range_mappings;
 #endif /* _NIOS2_H */
 
 /*#include "sysdep.h"
-#include <stdio.h>
 #include "opcode/nios2.h"
 */
 /* Register string table */
@@ -2521,8 +2520,6 @@ const int nios2_num_r2_reg_range_mappings = 8;
 #include "dis-asm.h"
 #include "opcode/nios2.h"
 #include "libiberty.h"
-#include <string.h>
-#include <assert.h>
 */
 /* No symbol table is available when this code runs out in an embedded
    system as when it is used for disassembler support in a monitor.  */
diff --git a/hw/nios2/boot.c b/hw/nios2/boot.c
index 2b31f5b844..94f436e7fb 100644
--- a/hw/nios2/boot.c
+++ b/hw/nios2/boot.c
@@ -34,7 +34,6 @@
 #include "qemu/option.h"
 #include "qemu/config-file.h"
 #include "qemu/error-report.h"
-#include "qemu-common.h"
 #include "sysemu/device_tree.h"
 #include "sysemu/sysemu.h"
 #include "hw/loader.h"
diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index ef9ee05798..9f741a8f19 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -18,12 +18,9 @@
  * <http://www.gnu.org/licenses/lgpl-2.1.html>
  */
 
-#include <stdio.h>
-#include <string.h>
-#include <assert.h>
+#include "qemu/osdep.h"
 
 #include "cpu.h"
-#include "qemu/osdep.h"
 #include "qemu/host-utils.h"
 #include "qapi/error.h"
 #include "exec/exec-all.h"
diff --git a/target/nios2/op_helper.c b/target/nios2/op_helper.c
index efb1c489c9..c853aeae02 100644
--- a/target/nios2/op_helper.c
+++ b/target/nios2/op_helper.c
@@ -18,6 +18,7 @@
  * <http://www.gnu.org/licenses/lgpl-2.1.html>
  */
 
+#include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "exec/cpu_ldst.h"
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 6b0961837d..796d399bd1 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -21,6 +21,7 @@
  * <http://www.gnu.org/licenses/lgpl-2.1.html>
  */
 
+#include "qemu/osdep.h"
 #include "cpu.h"
 #include "tcg-op.h"
 #include "exec/exec-all.h"
-- 
2.15.0.rc0


