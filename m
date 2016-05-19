Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b3MoY-00036a-MY
	for mharc-qemu-trivial@gnu.org; Thu, 19 May 2016 08:12:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49729)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Talha_Imran@mentor.com>) id 1b3MoU-000324-T6
	for qemu-trivial@nongnu.org; Thu, 19 May 2016 08:12:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Talha_Imran@mentor.com>) id 1b3MoS-0001JG-Jj
	for qemu-trivial@nongnu.org; Thu, 19 May 2016 08:12:25 -0400
Received: from relay1.mentorg.com ([192.94.38.131]:39541)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Talha_Imran@mentor.com>)
	id 1b3MoN-0001Ey-0C; Thu, 19 May 2016 08:12:19 -0400
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1b3Mo9-0006aC-Vy from Talha_Imran@mentor.com ;
	Thu, 19 May 2016 05:12:06 -0700
Received: from PKL-TIMRAN-UBUNTU.pkl.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.3.224.2; Thu, 19 May 2016 13:11:49 +0100
From: Talha Imran <talha_imran@mentor.com>
To: <agraf@suse.de>
CC: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>, 
	Talha Imran <talha_imran@mentor.com>
Date: Thu, 19 May 2016 17:11:35 +0500
Message-ID: <1463659895-16281-1-git-send-email-talha_imran@mentor.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: Windows NT kernel [generic]
	[fuzzy]
X-Received-From: 192.94.38.131
Subject: [Qemu-trivial] [PATCH] target-ppc/fpu_helper: Fix efscmp*
 instructions handling
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
X-List-Received-Date: Thu, 19 May 2016 12:12:28 -0000

With specification at hand from the reference manual from Freescale
http://cache.nxp.com/files/32bit/doc/ref_manual/SPEPEM.pdf , I have found a fix
to efscmp* instructions handling in QEMU.

efscmp* instructions in QEMU set crD (Condition Register nibble) values as 
(0b0100 << 2) = 0b10000 (consider the HELPER_SINGLE_SPE_CMP macro which left 
shifts the value returned by efscmp* handler by 2 bits). A value of 0b10000 is
not correct according the to the reference manual.

The reference manual expects efscmp* instructions to return a value of 0bx1xx.
Please find attached a patch which disables left shifting in
HELPER_SINGLE_SPE_CMP macro. This macro is used by efscmp* and efstst*
instructions only. efstst* instruction handlers, in turn, call efscmp* handlers
too.

*Explanation:*
Traditionally, each crD (condition register nibble) consist of 4 bits, which is
set by comparisons as follows:
crD = W X Y Z
where
W = Less than
X = Greater than
Y = Equal to

However, efscmp* instructions being a special case return a binary result.
(efscmpeq will set the crD = 0bx1xx iff when op1 == op2 and 0bx0xx otherwise;
i.e. there is no notion of different crD values based on Less than, Greater
than and Equal to).

This effectively means that crD will store a "Greater than" comparison result
iff efscmp* instruction comparison is TRUE. Compiler exploits this feature by
checking for "Branch if Less than or Equal to" (ble instruction) OR "Branch if
Greater than" (bgt instruction) for Branch if FALSE OR Branch if TRUE
respectively after an efscmp* instruction. This can be seen in a assembly code
snippet below:

27          if (__real__ x != 3.0f || __imag__ x != 4.0f)
10000498:   lwz r10,8(r31)
1000049c:   lis r9,16448
100004a0:   efscmpeq cr7,r10,r9
100004a4:   ble- cr7,0x100004b8 <bar+60>  //jump to abort() call
100004a8:   lwz r10,12(r31)
100004ac:   lis r9,16512
100004b0:   efscmpeq cr7,r10,r9
100004b4:   bgt- cr7,0x100004bc <bar+64>  //skip abort() call
28            abort ();
100004b8:   bl 0x10000808 <abort>

Signed-off-by: Talha Imran <talha_imran@mentor.com>
---
 target-ppc/fpu_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target-ppc/fpu_helper.c b/target-ppc/fpu_helper.c
index b67ebca..6fd56a8 100644
--- a/target-ppc/fpu_helper.c
+++ b/target-ppc/fpu_helper.c
@@ -1442,7 +1442,7 @@ static inline uint32_t efststeq(CPUPPCState *env, uint32_t op1, uint32_t op2)
 #define HELPER_SINGLE_SPE_CMP(name)                                     \
     uint32_t helper_e##name(CPUPPCState *env, uint32_t op1, uint32_t op2) \
     {                                                                   \
-        return e##name(env, op1, op2) << 2;                             \
+        return e##name(env, op1, op2);                                  \
     }
 /* efststlt */
 HELPER_SINGLE_SPE_CMP(fststlt);
-- 
1.9.1


