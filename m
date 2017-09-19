Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1duJHE-0005eq-UG
	for mharc-qemu-trivial@gnu.org; Tue, 19 Sep 2017 10:13:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44428)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1duJH6-0005Yj-SA
	for qemu-trivial@nongnu.org; Tue, 19 Sep 2017 10:13:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1duJH5-0004KZ-ON
	for qemu-trivial@nongnu.org; Tue, 19 Sep 2017 10:13:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37644)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1duJGy-0004BY-I4; Tue, 19 Sep 2017 10:13:12 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CC8737EA9A;
	Tue, 19 Sep 2017 14:13:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com CC8737EA9A
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eblake@redhat.com
Received: from red.redhat.com (ovpn-124-97.rdu2.redhat.com [10.10.124.97])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D77BC600C2;
	Tue, 19 Sep 2017 14:13:09 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
	Yongbok Kim <yongbok.kim@imgtec.com>
Date: Tue, 19 Sep 2017 09:13:07 -0500
Message-Id: <20170919141307.23113-1-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 19 Sep 2017 14:13:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] mips: Improve macro parenthesization
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
X-List-Received-Date: Tue, 19 Sep 2017 14:13:27 -0000

Although none of the existing macro call-sites were broken,
it's always better to write macros that properly parenthesize
arguments that can be complex expressions, so that the intended
order of operations is not broken.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 target/mips/dsp_helper.c | 56 ++++++++++++++++++++++++------------------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/target/mips/dsp_helper.c b/target/mips/dsp_helper.c
index dc707934ea..f152fea34a 100644
--- a/target/mips/dsp_helper.c
+++ b/target/mips/dsp_helper.c
@@ -45,9 +45,9 @@ typedef union {
 } DSP64Value;

 /*** MIPS DSP internal functions begin ***/
-#define MIPSDSP_ABS(x) (((x) >= 0) ? x : -x)
-#define MIPSDSP_OVERFLOW_ADD(a, b, c, d) (~(a ^ b) & (a ^ c) & d)
-#define MIPSDSP_OVERFLOW_SUB(a, b, c, d) ((a ^ b) & (a ^ c) & d)
+#define MIPSDSP_ABS(x) (((x) >= 0) ? (x) : -(x))
+#define MIPSDSP_OVERFLOW_ADD(a, b, c, d) (~((a) ^ (b)) & ((a) ^ (c)) & (d))
+#define MIPSDSP_OVERFLOW_SUB(a, b, c, d) (((a) ^ (b)) & ((a) ^ (c)) & (d))

 static inline void set_DSPControl_overflow_flag(uint32_t flag, int position,
                                                 CPUMIPSState *env)
@@ -1047,47 +1047,47 @@ static inline int32_t mipsdsp_cmpu_lt(uint32_t a, uint32_t b)

 #define MIPSDSP_SPLIT32_8(num, a, b, c, d)  \
     do {                                    \
-        a = (num >> 24) & MIPSDSP_Q0;       \
-        b = (num >> 16) & MIPSDSP_Q0;       \
-        c = (num >> 8) & MIPSDSP_Q0;        \
-        d = num & MIPSDSP_Q0;               \
+        a = ((num) >> 24) & MIPSDSP_Q0;     \
+        b = ((num) >> 16) & MIPSDSP_Q0;     \
+        c = ((num) >> 8) & MIPSDSP_Q0;      \
+        d = (num) & MIPSDSP_Q0;             \
     } while (0)

 #define MIPSDSP_SPLIT32_16(num, a, b)       \
     do {                                    \
-        a = (num >> 16) & MIPSDSP_LO;       \
-        b = num & MIPSDSP_LO;               \
+        a = ((num) >> 16) & MIPSDSP_LO;     \
+        b = (num) & MIPSDSP_LO;             \
     } while (0)

-#define MIPSDSP_RETURN32_8(a, b, c, d)  ((target_long)(int32_t) \
-                                         (((uint32_t)a << 24) | \
-                                         (((uint32_t)b << 16) | \
-                                         (((uint32_t)c << 8) |  \
-                                          ((uint32_t)d & 0xFF)))))
-#define MIPSDSP_RETURN32_16(a, b)       ((target_long)(int32_t) \
-                                         (((uint32_t)a << 16) | \
-                                          ((uint32_t)b & 0xFFFF)))
+#define MIPSDSP_RETURN32_8(a, b, c, d)  ((target_long)(int32_t)         \
+                                         (((uint32_t)(a) << 24) |       \
+                                          ((uint32_t)(b) << 16) |       \
+                                          ((uint32_t)(c) << 8) |        \
+                                          ((uint32_t)(d) & 0xFF)))
+#define MIPSDSP_RETURN32_16(a, b)       ((target_long)(int32_t)         \
+                                         (((uint32_t)(a) << 16) |       \
+                                          ((uint32_t)(b) & 0xFFFF)))

 #ifdef TARGET_MIPS64
 #define MIPSDSP_SPLIT64_16(num, a, b, c, d)  \
     do {                                     \
-        a = (num >> 48) & MIPSDSP_LO;        \
-        b = (num >> 32) & MIPSDSP_LO;        \
-        c = (num >> 16) & MIPSDSP_LO;        \
-        d = num & MIPSDSP_LO;                \
+        a = ((num) >> 48) & MIPSDSP_LO;      \
+        b = ((num) >> 32) & MIPSDSP_LO;      \
+        c = ((num) >> 16) & MIPSDSP_LO;      \
+        d = (num) & MIPSDSP_LO;              \
     } while (0)

 #define MIPSDSP_SPLIT64_32(num, a, b)       \
     do {                                    \
-        a = (num >> 32) & MIPSDSP_LLO;      \
-        b = num & MIPSDSP_LLO;              \
+        a = ((num) >> 32) & MIPSDSP_LLO;    \
+        b = (num) & MIPSDSP_LLO;            \
     } while (0)

-#define MIPSDSP_RETURN64_16(a, b, c, d) (((uint64_t)a << 48) | \
-                                         ((uint64_t)b << 32) | \
-                                         ((uint64_t)c << 16) | \
-                                         (uint64_t)d)
-#define MIPSDSP_RETURN64_32(a, b)       (((uint64_t)a << 32) | (uint64_t)b)
+#define MIPSDSP_RETURN64_16(a, b, c, d) (((uint64_t)(a) << 48) |        \
+                                         ((uint64_t)(b) << 32) |        \
+                                         ((uint64_t)(c) << 16) |        \
+                                         (uint64_t)(d))
+#define MIPSDSP_RETURN64_32(a, b)       (((uint64_t)(a) << 32) | (uint64_t)(b))
 #endif

 /** DSP Arithmetic Sub-class insns **/
-- 
2.13.5


