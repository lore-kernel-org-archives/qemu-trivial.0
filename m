Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TYozE-00027m-He
	for mharc-qemu-trivial@gnu.org; Wed, 14 Nov 2012 21:15:24 -0500
Received: from eggs.gnu.org ([208.118.235.92]:55555)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1TYozA-0001vN-4S
	for qemu-trivial@nongnu.org; Wed, 14 Nov 2012 21:15:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1TYoz7-0008Dq-1n
	for qemu-trivial@nongnu.org; Wed, 14 Nov 2012 21:15:20 -0500
Received: from csmailer.cs.nctu.edu.tw ([140.113.235.130]:21616)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>)
	id 1TYoz0-0008BC-32; Wed, 14 Nov 2012 21:15:10 -0500
Received: from csmailer.cs.nctu.edu.tw (localhost [127.0.0.1])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 07E9D4ED;
	Thu, 15 Nov 2012 10:15:06 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=cs.nctu.edu.tw; h=date
	:from:to:cc:subject:message-id:mime-version:content-type; s=
	rsa1024; bh=CtcIgYL6o6unJ77mGiTtfifi6WE=; b=Z5F7T1duC3ef92K6u/k+
	1F66MMWRNO1eNtZbuo3YSumlhVMwAclJCiBcI0RfuJBCXNbhiX0Mb1DQP1fMzLQV
	JN+gCEosesrh8FWm8QzVr22TqSicweKnnncw0GfHTnX1JRlXuENRRBM4dGdSEzzw
	qpwRzzicj6Iaz4mlupg9wjU=
Received: from alumni.cs.nctu.edu.tw (alumni.cs.nctu.edu.tw [140.113.235.116])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id E45E94EC;
	Thu, 15 Nov 2012 10:15:05 +0800 (CST)
Received: (from chenwj@localhost)
	by alumni.cs.nctu.edu.tw (8.14.5/8.14.5/Submit) id qAF2F51X015875;
	Thu, 15 Nov 2012 10:15:05 +0800 (CST) (envelope-from chenwj)
Date: Thu, 15 Nov 2012 10:15:05 +0800
From: =?utf-8?B?6Zmz6Z+L5Lu7IChXZWktUmVuIENoZW4p?= <chenwj@iis.sinica.edu.tw>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20121115021501.GA15630@cs.nctu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: FreeBSD 8.x
X-Received-From: 140.113.235.130
Cc: chenwj@cs.nctu.edu.tw, Jia Liu <proljc@gmail.com>
Subject: [Qemu-trivial] [PATCH] target-mips: Clean up microMIPS32 major
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
X-List-Received-Date: Thu, 15 Nov 2012 02:15:23 -0000

Hi all,

  I check MIPS microMIPS manual [1], and found the major opcode might be
wrong. I add a comment to explicitly indicate what manual I am refering
to, and according that manual I remove some microMIPS32 major opcodes.
Major opcode 0x1f is reserved, so I just remove it. As for others, like
0x16, 0x17, 0x36 and 0x37, they are for higher-order MIPS ISA level or
new revision of this microMIPS architecture. Since they are not appear
in the manual I refer to, I just remove them as well.

  Please review, thanks.   
  
[1] http://www.mips.com/products/architectures/micromips/#specifications

    MIPS Architecture for Programmers Volume II-B:
      The microMIPS32 Instruction Set (Revision 3.05)
    
    MD00582-2B-microMIPS-AFP-03.05.pdf

Signed-off-by: Chen Wei-Ren <chenwj@iis.sinica.edu.tw>
---
 target-mips/translate.c |   16 ++++++++++------
 1 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/target-mips/translate.c b/target-mips/translate.c
index f6fc0c2..b57da24 100644
--- a/target-mips/translate.c
+++ b/target-mips/translate.c
@@ -10241,7 +10241,15 @@ static int decode_mips16_opc (CPUMIPSState *env, DisasContext *ctx,
 
 /* microMIPS extension to MIPS32 */
 
-/* microMIPS32 major opcodes */
+/*
+ * microMIPS32 major opcodes
+ *
+ * MIPS Architecture for Programmers Volume II-B:
+ *   The microMIPS32 Instruction Set (Revision 3.05)
+ *
+ * Table 6.2 microMIPS32 Encoding of Major Opcode Field
+ *
+ */
 
 enum {
     POOL32A = 0x00,
@@ -10268,9 +10276,8 @@ enum {
     POOL16D = 0x13,
     ORI32 = 0x14,
     POOL32F = 0x15,
-    POOL32S = 0x16,
-    DADDIU32 = 0x17,
 
+    /* 0x1f is reserved */
     POOL32C = 0x18,
     LWGP16 = 0x19,
     LW16 = 0x1a,
@@ -10278,7 +10285,6 @@ enum {
     XORI32 = 0x1c,
     JALS32 = 0x1d,
     ADDIUPC = 0x1e,
-    POOL48A = 0x1f,
 
     /* 0x20 is reserved */
     RES_20 = 0x20,
@@ -10307,8 +10313,6 @@ enum {
     B16 = 0x33,
     ANDI32 = 0x34,
     J32 = 0x35,
-    SD32 = 0x36,
-    LD32 = 0x37,
 
     /* 0x38 and 0x39 are reserved */
     RES_38 = 0x38,
-- 
1.7.3.4

