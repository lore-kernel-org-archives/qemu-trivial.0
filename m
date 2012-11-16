Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TZBJv-0006Ed-BY
	for mharc-qemu-trivial@gnu.org; Thu, 15 Nov 2012 21:06:15 -0500
Received: from eggs.gnu.org ([208.118.235.92]:36134)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1TZBJp-0005ww-Vy
	for qemu-trivial@nongnu.org; Thu, 15 Nov 2012 21:06:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1TZBJm-0000g6-TU
	for qemu-trivial@nongnu.org; Thu, 15 Nov 2012 21:06:09 -0500
Received: from csmailer.cs.nctu.edu.tw ([140.113.235.130]:62486)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>)
	id 1TZBJf-0000es-IT; Thu, 15 Nov 2012 21:06:00 -0500
Received: from csmailer.cs.nctu.edu.tw (localhost [127.0.0.1])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id B4DE476F;
	Fri, 16 Nov 2012 10:05:53 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=cs.nctu.edu.tw; h=date
	:from:to:cc:subject:message-id:mime-version:content-type; s=
	rsa1024; bh=j/MGvtzi3JvQCRX1E/HixTMcIvU=; b=fX/Kz5mHDvOZIRQ1zlfL
	EbMNGz16H0y1JwlSU5KJ2dYLx04fuYFir7bc9ZdzuOakEPlRW5so8/SyCoVGQ3VP
	nVLDb1tvCHCsS2CybSMnt+kh6vHLBfztNjJiYoBY0U12AmaWJXFNKvw7anCfppUD
	/AiytnqesZMg/PqJ+QpraSk=
Received: from alumni.cs.nctu.edu.tw (alumni.cs.nctu.edu.tw [140.113.235.116])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 8313076E;
	Fri, 16 Nov 2012 10:05:53 +0800 (CST)
Received: (from chenwj@localhost)
	by alumni.cs.nctu.edu.tw (8.14.5/8.14.5/Submit) id qAG25qtc049068;
	Fri, 16 Nov 2012 10:05:52 +0800 (CST) (envelope-from chenwj)
Date: Fri, 16 Nov 2012 10:05:52 +0800
From: =?utf-8?B?6Zmz6Z+L5Lu7IChXZWktUmVuIENoZW4p?= <chenwj@iis.sinica.edu.tw>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20121116020552.GA48755@cs.nctu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: FreeBSD 8.x
X-Received-From: 140.113.235.130
Cc: "Johnson, Eric" <ericj@mips.com>, Jia Liu <proljc@gmail.com>
Subject: [Qemu-trivial] [PATCH v2] target-mips: Clean up microMIPS32 major
	opcode
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
X-List-Received-Date: Fri, 16 Nov 2012 02:06:13 -0000

Hi all,

  I check MIPS microMIPS manual [1], and found the major opcode might be
wrong. I add a comment to explicitly indicate what manual I am refering
to, and according that manual I remove microMIPS32 major opcodes 0x1f.
As for others, like 0x16, 0x17, 0x36 and 0x37, they are for higher-order
MIPS ISA level or new revision of this microMIPS architecture. Quote
from Johnson, they are belong MIPS64 [2].

  Please review, thanks.

[1] http://www.mips.com/products/architectures/micromips/#specifications

    MIPS Architecture for Programmers Volume II-B:
      The microMIPS32 Instruction Set (Revision 3.05)

    MD00582-2B-microMIPS-AFP-03.05.pdf

[2] http://www.mips.com/products/architectures/mips64/

    MIPS Architecture For Programmers
      Volume II-A: The MIPS64 Instruction Set

    MD00087-2B-MIPS64BIS-AFP-03.51.pdf

Signed-off-by: Chen Wei-Ren <chenwj@iis.sinica.edu.tw>
---
 target-mips/translate.c |   24 +++++++++++++++++-------
 1 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/target-mips/translate.c b/target-mips/translate.c
index 01b48fa..1c0ff65 100644
--- a/target-mips/translate.c
+++ b/target-mips/translate.c
@@ -10239,9 +10239,19 @@ static int decode_mips16_opc (CPUMIPSState *env, DisasContext *ctx,
     return n_bytes;
 }
 
-/* microMIPS extension to MIPS32 */
+/* microMIPS extension to MIPS32/MIPS64 */
 
-/* microMIPS32 major opcodes */
+/*
+ * microMIPS32/microMIPS64 major opcodes
+ *
+ *  1. MIPS Architecture for Programmers Volume II-B:
+ *       The microMIPS32 Instruction Set (Revision 3.05)
+ *
+ *     Table 6.2 microMIPS32 Encoding of Major Opcode Field
+ *
+ *  2. MIPS Architecture For Programmers Volume II-A:
+ *       The MIPS64 Instruction Set (Revision 3.51)
+ */
 
 enum {
     POOL32A = 0x00,
@@ -10268,9 +10278,10 @@ enum {
     POOL16D = 0x13,
     ORI32 = 0x14,
     POOL32F = 0x15,
-    POOL32S = 0x16,
-    DADDIU32 = 0x17,
+    POOL32S = 0x16,  /* MIPS64 */
+    DADDIU32 = 0x17, /* MIPS64 */
 
+    /* 0x1f is reserved */
     POOL32C = 0x18,
     LWGP16 = 0x19,
     LW16 = 0x1a,
@@ -10278,7 +10289,6 @@ enum {
     XORI32 = 0x1c,
     JALS32 = 0x1d,
     ADDIUPC = 0x1e,
-    POOL48A = 0x1f,
 
     /* 0x20 is reserved */
     RES_20 = 0x20,
@@ -10307,8 +10317,8 @@ enum {
     B16 = 0x33,
     ANDI32 = 0x34,
     J32 = 0x35,
-    SD32 = 0x36,
-    LD32 = 0x37,
+    SD32 = 0x36, /* MIPS64 */
+    LD32 = 0x37, /* MPIS64 */
 
     /* 0x38 and 0x39 are reserved */
     RES_38 = 0x38,
-- 
1.7.3.4

