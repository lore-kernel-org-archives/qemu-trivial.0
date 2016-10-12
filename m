Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1buS7g-0002dO-Lb
	for mharc-qemu-trivial@gnu.org; Wed, 12 Oct 2016 18:35:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56845)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <michael@walle.cc>) id 1buS7e-0002cF-7r
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 18:35:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <michael@walle.cc>) id 1buS7b-0002at-IM
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 18:35:36 -0400
Received: from ssl.serverraum.org ([213.133.101.245]:48155)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <michael@walle.cc>) id 1buS7b-0002ah-C2
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 18:35:35 -0400
Received: from apollo.fritz.box (ip5f585ef2.dynamic.kabel-deutschland.de
	[95.88.94.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 9E22A22279;
	Thu, 13 Oct 2016 00:35:32 +0200 (CEST)
Authentication-Results: ssl.serverraum.org; dmarc=none header.from=walle.cc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
	s=mail2016061301; t=1476311732;
	bh=0AHXUpy6NX0Znum98+Q9VxGMAMuem+HHQz1N6UzeTos=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uAl7L/wwQYIx7OAH/EXCZ3fmB9MzzofjZR14kW6VXiiZIwXEwP6DzdNd1G5cT5c3S
	c5wVB4Cuekmwev5dJ2kvugOu4+ImZqOMphVre0qNaS7vnC2rVxFlArPJc5IvkQ6ORq
	rP4S10lDhaAX0RWA/QPBJSQxFg4Nyu+VoQ1PTXdg=
From: Michael Walle <michael@walle.cc>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Walle <michael@walle.cc>
Date: Thu, 13 Oct 2016 00:35:06 +0200
Message-Id: <1476311708-14792-2-git-send-email-michael@walle.cc>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1476311708-14792-1-git-send-email-michael@walle.cc>
References: <1476311708-14792-1-git-send-email-michael@walle.cc>
X-Virus-Scanned: clamav-milter 0.99.2 at web
X-Virus-Status: Clean
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 213.133.101.245
Subject: [Qemu-trivial] [PATCH 2/4] target-lm32: disable asm logging via
 LOG_DIS()
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
X-List-Received-Date: Wed, 12 Oct 2016 22:35:39 -0000

The lm32 target already has a disassembler which logs the assembly
instructions with "-d in_asm". Therefore, turn of the LOG_DIS() macro to
prevent logging the assembly instructions twice. Also turn the macro in a
one which is always compiled to catch any errors while the macro is turned
off.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 target-lm32/translate.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/target-lm32/translate.c b/target-lm32/translate.c
index fa8416a..792637f 100644
--- a/target-lm32/translate.c
+++ b/target-lm32/translate.c
@@ -33,12 +33,14 @@
 #include "exec/log.h"
 
 
-#define DISAS_LM32 1
-#if DISAS_LM32
-#  define LOG_DIS(...) qemu_log_mask(CPU_LOG_TB_IN_ASM, ## __VA_ARGS__)
-#else
-#  define LOG_DIS(...) do { } while (0)
-#endif
+#define DISAS_LM32 0
+
+#define LOG_DIS(...) \
+    do { \
+        if (DISAS_LM32) { \
+            qemu_log_mask(CPU_LOG_TB_IN_ASM, ## __VA_ARGS__); \
+        } \
+    } while (0)
 
 #define EXTRACT_FIELD(src, start, end) \
             (((src) >> start) & ((1 << (end - start + 1)) - 1))
-- 
2.1.4


