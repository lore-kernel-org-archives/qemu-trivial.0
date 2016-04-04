Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1an8e2-0005om-U2
	for mharc-qemu-trivial@gnu.org; Mon, 04 Apr 2016 13:50:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46067)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1an8e0-0005je-01
	for qemu-trivial@nongnu.org; Mon, 04 Apr 2016 13:50:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1an8dy-00047B-NR
	for qemu-trivial@nongnu.org; Mon, 04 Apr 2016 13:50:31 -0400
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:60547)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1an8dv-00045E-O4; Mon, 04 Apr 2016 13:50:28 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 99C5D17F53F; Mon,  4 Apr 2016 19:50:24 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Developer <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Date: Mon,  4 Apr 2016 19:50:09 +0200
Message-Id: <1459792209-25270-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a03:4000:2:362::1
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
	Sergey Fedorov <serge.fdrv@gmail.com>
Subject: [Qemu-trivial] [PATCH] tci: Fix build regression
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
X-List-Received-Date: Mon, 04 Apr 2016 17:50:33 -0000

Commit d38ea87ac54af64ef611de434d07c12dc0399216 cleaned the include
statements which resulted in a wrong order of assert.h and the definition
of NDEBUG in tci.c. Normally NDEBUG modifies the definition of the assert
macro, but here this definition comes too late which results in a failing
build.

To fix this, a new macro tci_assert which depends on CONFIG_DEBUG_TCG
is introduced. Only builds with CONFIG_DEBUG_TCG will use assertions.
Even in this case, it is still possible to disable assertions by
defining NDEBUG via compiler settings.

Reported-by: Sergey Fedorov <serge.fdrv@gmail.com>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 tci.c | 41 ++++++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/tci.c b/tci.c
index 7cbb39e..f4a04c2 100644
--- a/tci.c
+++ b/tci.c
@@ -1,7 +1,7 @@
 /*
  * Tiny Code Interpreter for QEMU
  *
- * Copyright (c) 2009, 2011 Stefan Weil
+ * Copyright (c) 2009, 2011, 2016 Stefan Weil
  *
  * This program is free software: you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
@@ -19,9 +19,12 @@
 
 #include "qemu/osdep.h"
 
-/* Defining NDEBUG disables assertions (which makes the code faster). */
-#if !defined(CONFIG_DEBUG_TCG) && !defined(NDEBUG)
-# define NDEBUG
+/* Enable TCI assertions only when debugging TCG (and without NDEBUG defined).
+ * Without assertions, the interpreter runs much faster. */
+#if defined(CONFIG_DEBUG_TCG)
+# define tci_assert(cond) assert(cond)
+#else
+# define tci_assert(cond) (void)0
 #endif
 
 #include "qemu-common.h"
@@ -56,7 +59,7 @@ static tcg_target_ulong tci_reg[TCG_TARGET_NB_REGS];
 
 static tcg_target_ulong tci_read_reg(TCGReg index)
 {
-    assert(index < ARRAY_SIZE(tci_reg));
+    tci_assert(index < ARRAY_SIZE(tci_reg));
     return tci_reg[index];
 }
 
@@ -105,9 +108,9 @@ static uint64_t tci_read_reg64(TCGReg index)
 
 static void tci_write_reg(TCGReg index, tcg_target_ulong value)
 {
-    assert(index < ARRAY_SIZE(tci_reg));
-    assert(index != TCG_AREG0);
-    assert(index != TCG_REG_CALL_STACK);
+    tci_assert(index < ARRAY_SIZE(tci_reg));
+    tci_assert(index != TCG_AREG0);
+    tci_assert(index != TCG_REG_CALL_STACK);
     tci_reg[index] = value;
 }
 
@@ -325,7 +328,7 @@ static uint64_t tci_read_ri64(uint8_t **tb_ptr)
 static tcg_target_ulong tci_read_label(uint8_t **tb_ptr)
 {
     tcg_target_ulong label = tci_read_i(tb_ptr);
-    assert(label != 0);
+    tci_assert(label != 0);
     return label;
 }
 
@@ -468,11 +471,11 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t *tb_ptr)
 
     tci_reg[TCG_AREG0] = (tcg_target_ulong)env;
     tci_reg[TCG_REG_CALL_STACK] = sp_value;
-    assert(tb_ptr);
+    tci_assert(tb_ptr);
 
     for (;;) {
         TCGOpcode opc = tb_ptr[0];
-#if !defined(NDEBUG)
+#if defined(CONFIG_DEBUG_TCG) && !defined(NDEBUG)
         uint8_t op_size = tb_ptr[1];
         uint8_t *old_code_ptr = tb_ptr;
 #endif
@@ -525,7 +528,7 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t *tb_ptr)
             break;
         case INDEX_op_br:
             label = tci_read_label(&tb_ptr);
-            assert(tb_ptr == old_code_ptr + op_size);
+            tci_assert(tb_ptr == old_code_ptr + op_size);
             tb_ptr = (uint8_t *)label;
             continue;
         case INDEX_op_setcond_i32:
@@ -600,7 +603,7 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t *tb_ptr)
             t0 = tci_read_r32(&tb_ptr);
             t1 = tci_read_r(&tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
-            assert(t1 != sp_value || (int32_t)t2 < 0);
+            tci_assert(t1 != sp_value || (int32_t)t2 < 0);
             *(uint32_t *)(t1 + t2) = t0;
             break;
 
@@ -725,7 +728,7 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t *tb_ptr)
             condition = *tb_ptr++;
             label = tci_read_label(&tb_ptr);
             if (tci_compare32(t0, t1, condition)) {
-                assert(tb_ptr == old_code_ptr + op_size);
+                tci_assert(tb_ptr == old_code_ptr + op_size);
                 tb_ptr = (uint8_t *)label;
                 continue;
             }
@@ -751,7 +754,7 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t *tb_ptr)
             condition = *tb_ptr++;
             label = tci_read_label(&tb_ptr);
             if (tci_compare64(tmp64, v64, condition)) {
-                assert(tb_ptr == old_code_ptr + op_size);
+                tci_assert(tb_ptr == old_code_ptr + op_size);
                 tb_ptr = (uint8_t *)label;
                 continue;
             }
@@ -885,7 +888,7 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t *tb_ptr)
             t0 = tci_read_r64(&tb_ptr);
             t1 = tci_read_r(&tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
-            assert(t1 != sp_value || (int32_t)t2 < 0);
+            tci_assert(t1 != sp_value || (int32_t)t2 < 0);
             *(uint64_t *)(t1 + t2) = t0;
             break;
 
@@ -992,7 +995,7 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t *tb_ptr)
             condition = *tb_ptr++;
             label = tci_read_label(&tb_ptr);
             if (tci_compare64(t0, t1, condition)) {
-                assert(tb_ptr == old_code_ptr + op_size);
+                tci_assert(tb_ptr == old_code_ptr + op_size);
                 tb_ptr = (uint8_t *)label;
                 continue;
             }
@@ -1087,7 +1090,7 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t *tb_ptr)
             break;
         case INDEX_op_goto_tb:
             t0 = tci_read_i32(&tb_ptr);
-            assert(tb_ptr == old_code_ptr + op_size);
+            tci_assert(tb_ptr == old_code_ptr + op_size);
             tb_ptr += (int32_t)t0;
             continue;
         case INDEX_op_qemu_ld_i32:
@@ -1234,7 +1237,7 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t *tb_ptr)
             TODO();
             break;
         }
-        assert(tb_ptr == old_code_ptr + op_size);
+        tci_assert(tb_ptr == old_code_ptr + op_size);
     }
 exit:
     return next_tb;
-- 
2.1.4


