Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TZBh7-0002KK-Vr
	for mharc-qemu-trivial@gnu.org; Thu, 15 Nov 2012 21:30:13 -0500
Received: from eggs.gnu.org ([208.118.235.92]:38555)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1TZBh3-00025W-Bw
	for qemu-trivial@nongnu.org; Thu, 15 Nov 2012 21:30:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1TZBh0-0006bf-32
	for qemu-trivial@nongnu.org; Thu, 15 Nov 2012 21:30:09 -0500
Received: from csmailer.cs.nctu.edu.tw ([140.113.235.130]:40772)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>)
	id 1TZBgt-0006KR-3e; Thu, 15 Nov 2012 21:29:59 -0500
Received: from csmailer.cs.nctu.edu.tw (localhost [127.0.0.1])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 1904D7CE;
	Fri, 16 Nov 2012 10:29:53 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=cs.nctu.edu.tw; h=date
	:from:to:cc:subject:message-id:mime-version:content-type; s=
	rsa1024; bh=jfFxqsVVESiyaR3mpuYcPYrMxLo=; b=EAT6Bqt9Cl5MwINsW/QP
	0ruBHZmUc9mp2fYXLhHZF+Um5y0M54WtvbGCkGdDU3q+8jPVSschGbItMgSr66UA
	LmhkMxcQanSgFJXT0il3MZahLCULKPW/W9j0MsAFhfbPvY26ma5XQXFFmDj8SwUg
	QitlGk3lRv0BCFpsKji6avE=
Received: from alumni.cs.nctu.edu.tw (alumni.cs.nctu.edu.tw [140.113.235.116])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 01C317CD;
	Fri, 16 Nov 2012 10:29:53 +0800 (CST)
Received: (from chenwj@localhost)
	by alumni.cs.nctu.edu.tw (8.14.5/8.14.5/Submit) id qAG2TlUN050466;
	Fri, 16 Nov 2012 10:29:47 +0800 (CST) (envelope-from chenwj)
Date: Fri, 16 Nov 2012 10:29:47 +0800
From: =?utf-8?B?6Zmz6Z+L5Lu7IChXZWktUmVuIENoZW4p?= <chenwj@iis.sinica.edu.tw>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20121116022947.GA50435@cs.nctu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: FreeBSD 8.x
X-Received-From: 140.113.235.130
Cc: "Johnson, Eric" <ericj@mips.com>, Jia Liu <proljc@gmail.com>
Subject: [Qemu-trivial] [PATCH] target-mips: Add comments on POOL32Axf
	encoding
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
X-List-Received-Date: Fri, 16 Nov 2012 02:30:12 -0000

Hi all,

  Current QEMU MIPS POOL32AXF encoding comes from microMIPS32
and microMIPS32 DSP. Add comment here to help reading.

  Please review, thanks.

Regards,
chenwj

Signed-off-by: Chen Wei-Ren <chenwj@iis.sinica.edu.tw>
---
 target-mips/translate.c |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/target-mips/translate.c b/target-mips/translate.c
index 01b48fa..9d4b2c3 100644
--- a/target-mips/translate.c
+++ b/target-mips/translate.c
@@ -10359,6 +10359,19 @@ enum {
 
 /* POOL32AXF encoding of minor opcode field extension */
 
+/*
+ *  1. MIPS Architecture for Programmers Volume II-B:
+ *       The microMIPS32 Instruction Set (Revision 3.05)
+ *
+ *     Table 6.5 POOL32Axf Encoding of Minor Opcode Extension Field  
+ *
+ *  2. MIPS Architecture for Programmers VolumeIV-e:
+ *       The MIPS DSP Application-Specific Extension
+ *         to the microMIPS32 Architecture (Revision 2.34)
+ *
+ *     Table 5.5 POOL32Axf Encoding of Minor Opcode Extension Field
+ */
+
 enum {
     /* bits 11..6 */
     TEQ = 0x00,
@@ -10371,6 +10384,8 @@ enum {
     MFC0 = 0x03,
     MTC0 = 0x0b,
 
+    /* begin of microMIPS32 DSP */
+
     /* bits 13..12 for 0x01 */
     MFHI_ACC = 0x0,
     MFLO_ACC = 0x1,
@@ -10387,6 +10402,8 @@ enum {
     MULT_ACC = 0x0,
     MULTU_ACC = 0x1,
 
+    /* end of microMIPS32 DSP */
+
     /* bits 15..12 for 0x2c */
     SEB = 0x2,
     SEH = 0x3,
-- 
1.7.3.4

