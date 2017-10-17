Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4FVh-0006Sa-2s
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 20:13:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33577)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVb-0006Nj-7p
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:13:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVZ-0004Cq-Vl
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:13:23 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:56815)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVX-00048S-CO; Mon, 16 Oct 2017 20:13:19 -0400
Received: by mail-qt0-x242.google.com with SMTP id z28so30966qtz.13;
	Mon, 16 Oct 2017 17:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=UD+wPNmnPoJcrvJdXbB4RS7dbTv3kCXlD/a5MqwZFAI=;
	b=Gwtd6nbUIJOlZDI1hdN40lIxMLc/CdFtXH8O8iZMeSPR8gXDVtY84AXdnCkYO+/AFl
	yVY8sYYoQFG4VwJ4l7wWWsVHtneyN0p9hO+fYs8rB8p3XnNz/vO/1gf/Wfv92tPjLZRX
	S9BoosuE46mTol30y+6ZH2TwohMn7FUaKvRyL2nKG9E6uDUbJJu4pkgkcJYaWmsuGlDF
	1KtySa2QpZNtzncHZeHclpW+qq3LYHwd2/6o+Wo0ahkaAuqILjkkEcb4khjvAG2t0ao/
	8CWQ1G3Kubl5ZlKdw5D+2/+T1fKU5YQloNIeIN3rnKaygaW0Otcp5/NG+lJPXpyMPr34
	rCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=UD+wPNmnPoJcrvJdXbB4RS7dbTv3kCXlD/a5MqwZFAI=;
	b=CZ0NvePJmywfRMbCq7SPH2YR1B6l0qsG0BKacVS34oWrvQ10XIwpPHdVNXMeDy3gZp
	xxhCQ7lkf5/fy61dyxeFdKKP13EAXHb1yzxWBFF1LB/NPsdo9uvBlFuwvQpwuqzNpAbf
	n6O39sJ5QudDN6tjg8X8mpRqHAXnmfv6jgwDWsfa3oc7pNzbNDKtUAXrrW5pMJemHTa4
	bqD47+i5O/ziDJo7JmKW1uViV8wXk2WG0aubyjR8S086Lc+dnrrCuh4mQvZl20KS4l4P
	BXdvAjwJRHpeau/Cob1ex6zh2sP9aJlN44Gi4zRvEK9np0s/i+L9c3iAqaA13WNBWbr+
	wIZA==
X-Gm-Message-State: AMCzsaVfgPyCTFiLZ2sJEuAILVXah5A7Kn+oEjPVdFRb/AY/TCCyMlGy
	511Ds4+7e2GjjVCGZ4d7+Gg=
X-Google-Smtp-Source: AOwi7QC1OK3lQEGd/i8SQ0V8bDqt5r76KQ1CW0xyWKG9O3qbXFsBw5ugNltivJl+WzUHkQQ4yAbnAw==
X-Received: by 10.200.53.89 with SMTP id z25mr17644124qtb.58.1508199198998;
	Mon, 16 Oct 2017 17:13:18 -0700 (PDT)
Received: from x1.local ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id r6sm5409043qkh.22.2017.10.16.17.13.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Oct 2017 17:13:18 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 16 Oct 2017 21:11:46 -0300
Message-Id: <20171017001209.32276-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017001209.32276-1-f4bug@amsat.org>
References: <20171017001209.32276-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH v2 16/39] nios2: remove duplicated includes
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
X-List-Received-Date: Tue, 17 Oct 2017 00:13:26 -0000

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


