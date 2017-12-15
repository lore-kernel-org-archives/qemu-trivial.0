Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePgin-0002TV-Mx
	for mharc-qemu-trivial@gnu.org; Thu, 14 Dec 2017 22:31:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34410)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgik-0002QT-Hh
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:31:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgij-0004sz-FA
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:31:34 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:42356)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgig-0004oX-RU; Thu, 14 Dec 2017 22:31:30 -0500
Received: by mail-qt0-x242.google.com with SMTP id g9so10606989qth.9;
	Thu, 14 Dec 2017 19:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=MAcs899hE5yZ0a3uYUIEIVX0r3n3iMCuo3eZrqJWJpI=;
	b=Vch/4rgeP/y2Dwe2EgsGw0GCngjrKoItFiCcNa2C7qPH40ws4bQGPb8/tsK2xbQRdQ
	/aZpGwr0rIIYzGL+luraViPYz8HBu8ZxMuF7fF9PBCIWmce1aexAXW2cSQP3M3DdBo7D
	iRuwdRX+Y592BnU/76l512PAgc76yXzlDB0a4SZW7e8Gl90qRUDiiyqsGcXd6Q8rL8Ao
	Vj9gQKT3AqVbUqa/42lKmSMo+Dlw3J68AwcJUNDKqtCDI7sbkr21cU3+0yqVfX8FtLAn
	aXMZg7t0lYjb9+iulPF9XJEBqxcAhHliIziBLQgpdA2b5YLGC/PpjS11HWZNnm5ew1Bg
	RNGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=MAcs899hE5yZ0a3uYUIEIVX0r3n3iMCuo3eZrqJWJpI=;
	b=IqpuhjSgKZr4d0O7XH/GhBuxGgue+XEZpEMPn6cvC/WkOa1XTnZih+0E55V+462kYh
	yCcrIEtVUhzipoEoviF+Ayw/rx5Mbk8aFqlWm8AJKAz5LmH18vURkU2WT8x3KC/pWVsf
	qSYRBQ9O8L4xbTWYnXZXeOafnoKt0PazK+HbVKYohffyQNv+hopCuF1DAMkHGnj6oF6I
	tX0Ncq9WtbNZbSzTSjEIYIMGkhtoqcD7e6rpA9PDwCG4VcLhXcHgB4I9SA/9RHuWqBVo
	g+FtkgmeGtdy17nmZv3y/0p48RzFRPvpxHn2HpZ7ton1JPQXynzvZlIJsnL6q1pQa+F3
	ogjA==
X-Gm-Message-State: AKGB3mKGEDyhXNTPTSZMTUoXbmCzV4QAiUlhmv05pkqvqA680o4hHY1v
	36NKbmDFR/hLiZOf3p/2TY8=
X-Google-Smtp-Source: ACJfBouQGJgsjQyFv+LFhaUBdqbuZQOt9upfW7pewjWgFLlPlJCbbsVs5RA2nFMz0c+KkmRWyYISWg==
X-Received: by 10.200.4.7 with SMTP id v7mr20425063qtg.129.1513308690362;
	Thu, 14 Dec 2017 19:31:30 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	q24sm3794605qkq.63.2017.12.14.19.31.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:31:29 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
	Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>
Date: Fri, 15 Dec 2017 00:29:49 -0300
Message-Id: <20171215033015.738-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215033015.738-1-f4bug@amsat.org>
References: <20171215033015.738-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH v4 17/43] nios2: remove duplicated includes
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
X-List-Received-Date: Fri, 15 Dec 2017 03:31:35 -0000

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
index 9119eee587..88823a6d4d 100644
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
index 72329002ac..51a54ff760 100644
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
2.15.1


