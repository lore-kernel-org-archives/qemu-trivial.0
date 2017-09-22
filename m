Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dvQ4j-0004hE-Kf
	for mharc-qemu-trivial@gnu.org; Fri, 22 Sep 2017 11:41:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41412)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ4e-0004bq-Lp
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 11:41:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ4d-0003CG-HA
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 11:41:04 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:34478)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ4a-0003AX-Qc; Fri, 22 Sep 2017 11:41:00 -0400
Received: by mail-qk0-x242.google.com with SMTP id d70so874763qkc.1;
	Fri, 22 Sep 2017 08:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=TuJsr879PFvaqLCRpQzl3bdsbcxyDztlW0TEEdoI4H0=;
	b=AIm04xK57u6q9U9G520sAX0bTAmLDmy+2BlT/hY8GHMkkhke/4gZaKZclsKfrjAQZS
	LihYNuitO3Q9uiH80wX3kfWOGa4Vo8jVdhCSJv9AO1cHJmJVPrFTtOKUVjgHFsSvWbSW
	wZTL1rrqTTjJnx8VSNV5Ki3TzLLaOFayTbgZlFgJGSSUVVvqEIvv172DFy6is+/IGeno
	cBMKAY/haUmM7iwSIdU7VS5ludKroO05d9I4PT35LHuJJykQSP5PrKQRgEHGTbQiPPcy
	zr3tCJWK5bZEvn+SqSRjPFRN6g4Bi3rcgSVXVPpeahOUYagHGAQJ6wB7jwpAGxlPV0VQ
	Ml/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=TuJsr879PFvaqLCRpQzl3bdsbcxyDztlW0TEEdoI4H0=;
	b=dtxWFTE86LZSBaDQEZ7hZALC2XZU88RqkKMt24Dc3SS2rCknPOk/lzUO/lrwTmYs6b
	2C+7xXPMhIMLxmSFBJVgimVHbb5OVO3G7Nx8oJSNiRI7jZvggwPFdEdmdjKKQzTB1eaw
	pY6OkICrx/szDa4f8CN1iRhfajLnUEmuM3F6QlVK0YLI2zq2n8Qq2Gs3TH+BjdrWX0oU
	hlCeON8IlFGPLBxqZAc4JReWx+/zeaO2FYJL7LxUPPPhnD+rR9ssDRubITcB/6iELOpC
	SMvyQ+n2Fq0OIEH3RRNHVPeLQUK3vlZlpfOKZ7ZD7MTT8uM7FKzoe/Hbs7azynAZXU9r
	RAMg==
X-Gm-Message-State: AHPjjUiGPSQyiwG0XTRojkbXJ6LrrBvyr9V2xx02CRkXfnoUEV2kLKxQ
	s27s8lYUtbXiEtTmNjxwqUg=
X-Google-Smtp-Source: AOwi7QDHLxHzTn68cJtK5ivUBJRGLmcYtTqrUHuKJLwqgwnJEtN+Q584BtHXEp9rKawgWeZwn4vAWA==
X-Received: by 10.55.212.220 with SMTP id s89mr8643685qks.300.1506094860247;
	Fri, 22 Sep 2017 08:41:00 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id z75sm71742qkb.71.2017.09.22.08.40.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Sep 2017 08:40:59 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 22 Sep 2017 12:39:48 -0300
Message-Id: <20170922154014.29350-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170922154014.29350-1-f4bug@amsat.org>
References: <20170922154014.29350-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH 08/34] nios2: remove duplicated includes
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
X-List-Received-Date: Fri, 22 Sep 2017 15:41:08 -0000

applied using ./scripts/clean-includes

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/nios2/cpu.h       | 1 -
 disas/nios2.c            | 3 ---
 hw/nios2/boot.c          | 1 -
 target/nios2/helper.c    | 7 ++-----
 target/nios2/op_helper.c | 1 +
 target/nios2/translate.c | 1 +
 6 files changed, 4 insertions(+), 10 deletions(-)

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
-
-#include "cpu.h"
 #include "qemu/osdep.h"
+
+#include "cpu.h"
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
2.14.1


