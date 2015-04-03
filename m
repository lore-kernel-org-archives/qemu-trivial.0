Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ydp9M-0002kT-I2
	for mharc-qemu-trivial@gnu.org; Thu, 02 Apr 2015 20:07:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48435)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1Ydp9K-0002kA-2T
	for qemu-trivial@nongnu.org; Thu, 02 Apr 2015 20:07:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1Ydp9C-00009H-03
	for qemu-trivial@nongnu.org; Thu, 02 Apr 2015 20:07:50 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:57501)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1Ydp9B-000090-Sl
	for qemu-trivial@nongnu.org; Thu, 02 Apr 2015 20:07:41 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 885AE20AD3
	for <qemu-trivial@nongnu.org>; Thu,  2 Apr 2015 20:07:36 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute3.internal (MEProxy); Thu, 02 Apr 2015 20:07:39 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=2stWy7RI/AIwDeOzK30sMTinnz8
	=; b=O20gJtcNVXb2MP847usA2oOgiQUjKnjpxsBmK6CigwwkQbsN0ZUlMHeLfvY
	MVAkCmtXnBtt2meSnmFqd0M3lCE5ZeWt44toR6kVLIDPwyRrDhgV01b/h03Ybeix
	IpjcfUGPSZEf2US2YPJQYWtkSsWHpIk5okPh1kwj32Y+lleA=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-sasl-enc:x-sasl-enc; s=smtpout; bh=2stW
	y7RI/AIwDeOzK30sMTinnz8=; b=AFgwZQ65a/zmefN7QFd/nsxVXqYifb/gyQ/H
	2gDLdisfjoPV1PHrFxjWz6NuWmGi7hOEGsbbRjtKcyzioZOSqkGZyA/vG7ngano+
	ereY0bOR+Zt468vhWkRlQJfYy5AfWoHg5ywNIEk6B3nFXikvy/ObzLr/4m5N+gth
	bB2dP9w=
X-Sasl-enc: pmaBgFnwA6J5/OwqjwobnaH4DqYNEWbuBQ7ZR1PKoLDi 1428019659
Received: from localhost (unknown [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 95A28C0001D;
	Thu,  2 Apr 2015 20:07:39 -0400 (EDT)
From: "Emilio G. Cota" <cota@braap.org>
To: Stefan Weil <sw@weilnetz.de>
Date: Thu,  2 Apr 2015 20:07:53 -0400
Message-Id: <1428019673-920-1-git-send-email-cota@braap.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <5518E291.6020708@weilnetz.de>
References: <5518E291.6020708@weilnetz.de>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 66.111.4.26
Cc: qemu-trivial@nongnu.org, Laurent Desnogues <laurent.desnogues@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org, Richard Henderson <rth@twiddle.net>
Subject: [Qemu-trivial] [PATCH v2] tcg: optimise memory layout of TCGTemp
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
X-List-Received-Date: Fri, 03 Apr 2015 00:07:51 -0000

This brings down the size of the struct from 56 to 32 bytes on 64-bit,
and to 20 bytes on 32-bit. This leads to memory savings:

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
  40883   29800      88   70771   11473 ./aarch64-softmmu/tcg/tcg.o
  37473   29416      96   66985   105a9 ./x86_64-linux-user/tcg/tcg.o
  38858   28816      96   67770   108ba ./arm-linux-user/tcg/tcg.o
  40554   29096      88   69738   1106a ./arm-softmmu/tcg/tcg.o
  39169   29672      88   68929   10d41 ./x86_64-softmmu/tcg/tcg.o

Note that using an entire byte for some enums that need less than
that wastes a few bits (noticeable in 32 bits, where we use
20 bytes instead of 16) but avoids extraction code, which overall
is a win--I've tested several variations of the patch, and the appended
is the best performer for OpenSSL's bntest by a very small margin:

Before:
$ taskset -c 0 perf stat -r 15 -- x86_64-linux-user/qemu-x86_64 img/bntest-x86_64 >/dev/null
[...]
 Performance counter stats for 'x86_64-linux-user/qemu-x86_64 img/bntest-x86_64' (15 runs):

      10538.479833 task-clock (msec)         #    0.999 CPUs utilized            ( +-  0.38% )
               772 context-switches          #    0.073 K/sec                    ( +-  2.03% )
                 0 cpu-migrations            #    0.000 K/sec                    ( +-100.00% )
             2,207 page-faults               #    0.209 K/sec                    ( +-  0.08% )
      10.552871687 seconds time elapsed                                          ( +-  0.39% )

After:
$ taskset -c 0 perf stat -r 15 -- x86_64-linux-user/qemu-x86_64 img/bntest-x86_64 >/dev/null
 Performance counter stats for 'x86_64-linux-user/qemu-x86_64 img/bntest-x86_64' (15 runs):

      10459.968847 task-clock (msec)         #    0.999 CPUs utilized            ( +-  0.30% )
               739 context-switches          #    0.071 K/sec                    ( +-  1.71% )
                 0 cpu-migrations            #    0.000 K/sec                    ( +- 68.14% )
             2,204 page-faults               #    0.211 K/sec                    ( +-  0.10% )
      10.473900411 seconds time elapsed                                          ( +-  0.30% )

Suggested-by: Stefan Weil <sw@weilnetz.de>
Suggested-by: Richard Henderson <rth@twiddle.net>
Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 tcg/tcg.h | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/tcg/tcg.h b/tcg/tcg.h
index add7f75..7f95132 100644
--- a/tcg/tcg.h
+++ b/tcg/tcg.h
@@ -417,20 +417,19 @@ static inline TCGCond tcg_high_cond(TCGCond c)
     }
 }
 
-#define TEMP_VAL_DEAD  0
-#define TEMP_VAL_REG   1
-#define TEMP_VAL_MEM   2
-#define TEMP_VAL_CONST 3
+typedef enum TCGTempVal {
+    TEMP_VAL_DEAD,
+    TEMP_VAL_REG,
+    TEMP_VAL_MEM,
+    TEMP_VAL_CONST,
+} TCGTempVal;
 
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
+    TCGTempVal val_type:8;
+    TCGType base_type:8;
+    TCGType type:8;
     unsigned int fixed_reg:1;
     unsigned int mem_coherent:1;
     unsigned int mem_allocated:1;
@@ -438,6 +437,9 @@ typedef struct TCGTemp {
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


