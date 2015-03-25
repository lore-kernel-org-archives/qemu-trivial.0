Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YarKG-0003tz-6i
	for mharc-qemu-trivial@gnu.org; Wed, 25 Mar 2015 15:50:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36061)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1YarKC-0003r3-IL
	for qemu-trivial@nongnu.org; Wed, 25 Mar 2015 15:50:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1YarK7-0000ff-9X
	for qemu-trivial@nongnu.org; Wed, 25 Mar 2015 15:50:48 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:35261)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1YarK6-0000fI-ST
	for qemu-trivial@nongnu.org; Wed, 25 Mar 2015 15:50:42 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id B402920843
	for <qemu-trivial@nongnu.org>; Wed, 25 Mar 2015 15:50:38 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute6.internal (MEProxy); Wed, 25 Mar 2015 15:50:41 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=braap.org; h=
	x-sasl-enc:from:to:cc:subject:date:message-id:in-reply-to
	:references; s=mesmtp; bh=62/NWwdJRAZegzRb64wZx/X37hA=; b=yJJ/0B
	XtAg+xIKgD4l1CbVrrYzbP8Ub5Em/Z+0vltJ4WEgcgu+SWWF9pIa8WcYhPTv+7EJ
	pR44sWL4FloJinEZU4TwP5N2Vv0/kYrVFJH6scQJqeU7Kf74Z1m/ryJfHWZwkzB6
	/5aJG0AkXl317T7VdU+UmAXwcpNIxE9JzAt20=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=x-sasl-enc:from:to:cc:subject:date
	:message-id:in-reply-to:references; s=smtpout; bh=62/NWwdJRAZegz
	Rb64wZx/X37hA=; b=Y12Jc9nw4Ji0nynmcEAk4a4QkTrHX6cajBZXVwm1s9Pt8Y
	ZlgWPpi/xjWr6HDSqrYCDtOWBJA9XZwpmEk4KZkuMenS4m9MAtA62TpzTXMyl1hS
	EOKy+aEe2dIg4e0B/OnTTNz2FJldJWjYOepgezMj731lxfVETvNWPGgAq9sFQ=
X-Sasl-enc: u5VxAX5PUR4Ms24fiDuV+Ze081ED1JafTUFV4WExAHon 1427313041
Received: from localhost (unknown [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 2A81EC00021;
	Wed, 25 Mar 2015 15:50:41 -0400 (EDT)
From: "Emilio G. Cota" <cota@braap.org>
To: Stefan Weil <sw@weilnetz.de>,
	Richard Henderson <rth@twiddle.net>
Date: Wed, 25 Mar 2015 15:50:48 -0400
Message-Id: <1427313048-26772-1-git-send-email-cota@braap.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <5510B8C4.1050302@twiddle.net>
References: <5510B8C4.1050302@twiddle.net>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 66.111.4.26
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] tcg: optimise memory layout of TCGTemp
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
X-List-Received-Date: Wed, 25 Mar 2015 19:50:49 -0000

This brings down the size of the struct from 56 to 32 bytes on 64-bit,
and to 16 bytes on 32-bit.

The appended adds macros to prevent us from mistakenly overflowing
the bitfields when more elements are added to the corresponding
enums/macros.

Note that reg/mem_reg need only 6 bits (for ia64) but for performance
is probably better to align them to a byte address.

Given that TCGTemp is used in large arrays this leads to a few KBs
of savings. However, unpacking the bits takes additional code, so
the net effect depends on the target (host is x86_64):

Before:
$ find . -name 'tcg.o' | xargs size
   text    data     bss     dec     hex filename
  41131   29800      88   71019   1156b ./aarch64-softmmu/tcg/tcg.o
  37969   29416      96   67481   10799 ./x86_64-linux-user/tcg/tcg.o
  39354   28816      96   68266   10aaa ./arm-linux-user/tcg/tcg.o
  40802   29096      88   69986   11162 ./arm-softmmu/tcg/tcg.o
  39417   29672      88   69177   10e39 ./x86_64-softmmu/tcg/tcg.o

After:
$ find . -name 'tcg.o' | xargs size
   text    data     bss     dec     hex filename
  41187   29800      88   71075   115a3 ./aarch64-softmmu/tcg/tcg.o
  37777   29416      96   67289   106d9 ./x86_64-linux-user/tcg/tcg.o
  39162   28816      96   68074   109ea ./arm-linux-user/tcg/tcg.o
  40858   29096      88   70042   1119a ./arm-softmmu/tcg/tcg.o
  39473   29672      88   69233   10e71 ./x86_64-softmmu/tcg/tcg.o

Suggested-by: Stefan Weil <sw@weilnetz.de>
Suggested-by: Richard Henderson <rth@twiddle.net>
Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 tcg/tcg.h | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/tcg/tcg.h b/tcg/tcg.h
index add7f75..71ae7b2 100644
--- a/tcg/tcg.h
+++ b/tcg/tcg.h
@@ -193,7 +193,7 @@ typedef struct TCGPool {
 typedef enum TCGType {
     TCG_TYPE_I32,
     TCG_TYPE_I64,
-    TCG_TYPE_COUNT, /* number of different types */
+    TCG_TYPE_COUNT, /* number of different types, see TCG_TYPE_NR_BITS */
 
     /* An alias for the size of the host register.  */
 #if TCG_TARGET_REG_BITS == 32
@@ -217,6 +217,9 @@ typedef enum TCGType {
 #endif
 } TCGType;
 
+/* used for bitfield packing to save space */
+#define TCG_TYPE_NR_BITS 1
+
 /* Constants for qemu_ld and qemu_st for the Memory Operation field.  */
 typedef enum TCGMemOp {
     MO_8     = 0,
@@ -421,16 +424,14 @@ static inline TCGCond tcg_high_cond(TCGCond c)
 #define TEMP_VAL_REG   1
 #define TEMP_VAL_MEM   2
 #define TEMP_VAL_CONST 3
+#define TEMP_VAL_NR_BITS 2
 
-/* XXX: optimize memory layout */
 typedef struct TCGTemp {
-    TCGType base_type;
-    TCGType type;
-    int val_type;
-    int reg;
-    tcg_target_long val;
-    int mem_reg;
-    intptr_t mem_offset;
+    unsigned int reg:8;
+    unsigned int mem_reg:8;
+    unsigned int val_type:TEMP_VAL_NR_BITS;
+    unsigned int base_type:TCG_TYPE_NR_BITS;
+    unsigned int type:TCG_TYPE_NR_BITS;
     unsigned int fixed_reg:1;
     unsigned int mem_coherent:1;
     unsigned int mem_allocated:1;
@@ -438,6 +439,9 @@ typedef struct TCGTemp {
                                   basic blocks. Otherwise, it is not
                                   preserved across basic blocks. */
     unsigned int temp_allocated:1; /* never used for code gen */
+
+    tcg_target_long val;
+    intptr_t mem_offset;
     const char *name;
 } TCGTemp;
 
-- 
1.9.1


