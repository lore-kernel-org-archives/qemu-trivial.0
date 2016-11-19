Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c8BEJ-0001J4-9l
	for mharc-qemu-trivial@gnu.org; Sat, 19 Nov 2016 14:23:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47731)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1c8BEG-0001HB-Ar
	for qemu-trivial@nongnu.org; Sat, 19 Nov 2016 14:23:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1c8BEF-0004Vj-Iw
	for qemu-trivial@nongnu.org; Sat, 19 Nov 2016 14:23:12 -0500
Received: from [2a03:4000:1::4e2f:c7ac:d] (port=51553 helo=mail.weilnetz.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1c8BEB-0004V3-8Q; Sat, 19 Nov 2016 14:23:07 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by mail.weilnetz.de (Postfix) with ESMTP id 8BDCE11810A9;
	Sat, 19 Nov 2016 20:23:06 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from mail.weilnetz.de ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id bIhJ3DX9WGir; Sat, 19 Nov 2016 20:23:04 +0100 (CET)
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
	by mail.weilnetz.de (Postfix) with ESMTP id 7887011810A8;
	Sat, 19 Nov 2016 20:23:04 +0100 (CET)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 7319C4677CA; Sat, 19 Nov 2016 20:23:04 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Developer <qemu-devel@nongnu.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	David Gibson <david@gibson.dropbear.id.au>, Alexander Graf <agraf@suse.de>,
	qemu-ppc@nongnu.org, Stefan Weil <sw@weilnetz.de>
Date: Sat, 19 Nov 2016 20:23:03 +0100
Message-Id: <20161119192303.18784-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.10.2
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2a03:4000:1::4e2f:c7ac:d
Subject: [Qemu-trivial] [PATCH for-2.8] disas/ppc: Fix indefinite articles
 in comments
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
X-List-Received-Date: Sat, 19 Nov 2016 19:23:13 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 disas/ppc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/disas/ppc.c b/disas/ppc.c
index bd05623..9b5a0e7 100644
--- a/disas/ppc.c
+++ b/disas/ppc.c
@@ -1653,11 +1653,11 @@ extract_tbr (unsigned long insn,
 #define BBOYBI_MASK (BBOYCB_MASK | BI_MASK)
 #define BBOATBI_MASK (BBOAT2CB_MASK | BI_MASK)
 
-/* An Context form instruction.  */
+/* A Context form instruction.  */
 #define CTX(op, xop)   (OP (op) | (((unsigned long)(xop)) & 0x7))
 #define CTX_MASK CTX(0x3f, 0x7)
 
-/* An User Context form instruction.  */
+/* A User Context form instruction.  */
 #define UCTX(op, xop)  (OP (op) | (((unsigned long)(xop)) & 0x1f))
 #define UCTX_MASK UCTX(0x3f, 0x1f)
 
@@ -1710,19 +1710,19 @@ extract_tbr (unsigned long insn,
 #define SC(op, sa, lk) (OP (op) | ((((unsigned long)(sa)) & 1) << 1) | ((lk) & 1))
 #define SC_MASK (OP_MASK | (((unsigned long)0x3ff) << 16) | (((unsigned long)1) << 1) | 1)
 
-/* An VX form instruction.  */
+/* A VX form instruction.  */
 #define VX(op, xop) (OP (op) | (((unsigned long)(xop)) & 0x7ff))
 
 /* The mask for an VX form instruction.  */
 #define VX_MASK	VX(0x3f, 0x7ff)
 
-/* An VA form instruction.  */
+/* A VA form instruction.  */
 #define VXA(op, xop) (OP (op) | (((unsigned long)(xop)) & 0x03f))
 
-/* The mask for an VA form instruction.  */
+/* The mask for a VA form instruction.  */
 #define VXA_MASK VXA(0x3f, 0x3f)
 
-/* An VXR form instruction.  */
+/* A VXR form instruction.  */
 #define VXR(op, xop, rc) (OP (op) | (((rc) & 1) << 10) | (((unsigned long)(xop)) & 0x3ff))
 
 /* The mask for a VXR form instruction.  */
-- 
2.10.2


