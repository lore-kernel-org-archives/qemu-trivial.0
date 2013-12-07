Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VpIFk-0000fr-3D
	for mharc-qemu-trivial@gnu.org; Sat, 07 Dec 2013 08:49:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32958)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VpIFe-0000MX-0u
	for qemu-trivial@nongnu.org; Sat, 07 Dec 2013 08:49:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VpIFZ-0001UF-SE
	for qemu-trivial@nongnu.org; Sat, 07 Dec 2013 08:48:57 -0500
Received: from qemu.weilnetz.de ([37.221.198.45]:59176
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VpIFR-0001SM-3M; Sat, 07 Dec 2013 08:48:45 -0500
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id BE939180287; Sat,  7 Dec 2013 14:48:42 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel <qemu-devel@nongnu.org>
Date: Sat,  7 Dec 2013 14:48:07 +0100
Message-Id: <1386424088-23196-5-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1386424088-23196-1-git-send-email-sw@weilnetz.de>
References: <1386424088-23196-1-git-send-email-sw@weilnetz.de>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH v2 4/5] target-mips: Use macro ARRAY_SIZE
	where possible
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
X-List-Received-Date: Sat, 07 Dec 2013 13:49:02 -0000

This improves readability and simplifies the code.

Cc: Aurelien Jarno <aurelien@aurel32.net>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 target-mips/dsp_helper.c |   30 ++++++++++++------------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/target-mips/dsp_helper.c b/target-mips/dsp_helper.c
index b088a25..a2f46d9 100644
--- a/target-mips/dsp_helper.c
+++ b/target-mips/dsp_helper.c
@@ -1088,12 +1088,11 @@ static inline int32_t mipsdsp_cmpu_lt(uint32_t a, uint32_t b)
 target_ulong helper_##name(target_ulong rt, CPUMIPSState *env)             \
 {                                                                          \
     DSP32Value dt;                                                         \
-    unsigned int i, n;                                                     \
+    unsigned int i;                                                     \
                                                                            \
-    n = sizeof(DSP32Value) / sizeof(dt.element[0]);                        \
     dt.sw[0] = rt;                                                         \
                                                                            \
-    for (i = 0; i < n; i++) {                                              \
+    for (i = 0; i < ARRAY_SIZE(dt.element); i++) {                         \
         dt.element[i] = mipsdsp_##func(dt.element[i], env);                \
     }                                                                      \
                                                                            \
@@ -1109,12 +1108,11 @@ MIPSDSP32_UNOP_ENV(absq_s_w, sat_abs32, sw)
 target_ulong helper_##name(target_ulong rt, CPUMIPSState *env)             \
 {                                                                          \
     DSP64Value dt;                                                         \
-    unsigned int i, n;                                                     \
+    unsigned int i;                                                        \
                                                                            \
-    n = sizeof(DSP64Value) / sizeof(dt.element[0]);                        \
     dt.sl[0] = rt;                                                         \
                                                                            \
-    for (i = 0; i < n; i++) {                                              \
+    for (i = 0; i < ARRAY_SIZE(dt.element); i++) {                         \
         dt.element[i] = mipsdsp_##func(dt.element[i], env);                \
     }                                                                      \
                                                                            \
@@ -1130,13 +1128,12 @@ MIPSDSP64_UNOP_ENV(absq_s_pw, sat_abs32, sw)
 target_ulong helper_##name(target_ulong rs, target_ulong rt)               \
 {                                                                          \
     DSP32Value ds, dt;                                                     \
-    unsigned int i, n;                                                     \
+    unsigned int i;                                                        \
                                                                            \
-    n = sizeof(DSP32Value) / sizeof(ds.element[0]);                        \
     ds.sw[0] = rs;                                                         \
     dt.sw[0] = rt;                                                         \
                                                                            \
-    for (i = 0; i < n; i++) {                                              \
+    for (i = 0; i < ARRAY_SIZE(ds.element); i++) {                         \
         ds.element[i] = mipsdsp_##func(ds.element[i], dt.element[i]);      \
     }                                                                      \
                                                                            \
@@ -1159,13 +1156,12 @@ target_ulong helper_##name(target_ulong rs, target_ulong rt,               \
                            CPUMIPSState *env)                              \
 {                                                                          \
     DSP32Value ds, dt;                                                     \
-    unsigned int i, n;                                                     \
+    unsigned int i;                                                        \
                                                                            \
-    n = sizeof(DSP32Value) / sizeof(ds.element[0]);                        \
     ds.sw[0] = rs;                                                         \
     dt.sw[0] = rt;                                                         \
                                                                            \
-    for (i = 0 ; i < n ; i++) {                                            \
+    for (i = 0 ; i < ARRAY_SIZE(ds.element); i++) {                        \
         ds.element[i] = mipsdsp_##func(ds.element[i], dt.element[i], env); \
     }                                                                      \
                                                                            \
@@ -1192,13 +1188,12 @@ MIPSDSP32_BINOP_ENV(subu_s_qb, satu8_sub, ub);
 target_ulong helper_##name(target_ulong rs, target_ulong rt)               \
 {                                                                          \
     DSP64Value ds, dt;                                                     \
-    unsigned int i, n;                                                     \
+    unsigned int i;                                                        \
                                                                            \
-    n = sizeof(DSP64Value) / sizeof(ds.element[0]);                        \
     ds.sl[0] = rs;                                                         \
     dt.sl[0] = rt;                                                         \
                                                                            \
-    for (i = 0 ; i < n ; i++) {                                            \
+    for (i = 0 ; i < ARRAY_SIZE(ds.element); i++) {                        \
         ds.element[i] = mipsdsp_##func(ds.element[i], dt.element[i]);      \
     }                                                                      \
                                                                            \
@@ -1215,13 +1210,12 @@ target_ulong helper_##name(target_ulong rs, target_ulong rt,               \
                            CPUMIPSState *env)                              \
 {                                                                          \
     DSP64Value ds, dt;                                                     \
-    unsigned int i, n;                                                     \
+    unsigned int i;                                                        \
                                                                            \
-    n = sizeof(DSP64Value) / sizeof(ds.element[0]);                        \
     ds.sl[0] = rs;                                                         \
     dt.sl[0] = rt;                                                         \
                                                                            \
-    for (i = 0 ; i < n ; i++) {                                            \
+    for (i = 0 ; i < ARRAY_SIZE(ds.element); i++) {                        \
         ds.element[i] = mipsdsp_##func(ds.element[i], dt.element[i], env); \
     }                                                                      \
                                                                            \
-- 
1.7.10.4


