Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QTb7T-0000vz-7L
	for mharc-qemu-trivial@gnu.org; Mon, 06 Jun 2011 10:49:31 -0400
Received: from eggs.gnu.org ([140.186.70.92]:59314)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <martin@lispworks.com>) id 1QTb7P-0000vB-W6
	for qemu-trivial@nongnu.org; Mon, 06 Jun 2011 10:49:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <martin@lispworks.com>) id 1QTb7O-0007mm-DF
	for qemu-trivial@nongnu.org; Mon, 06 Jun 2011 10:49:27 -0400
Received: from mail.lispworks.com ([193.34.186.230]:47760
	helo=lwfs1-cam.cam.lispworks.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <martin@lispworks.com>)
	id 1QTb7N-0007lK-Uj; Mon, 06 Jun 2011 10:49:26 -0400
Received: from carson.cam.lispworks.com (carson [192.168.1.12])
	by lwfs1-cam.cam.lispworks.com (8.14.3/8.14.3) with ESMTP id
	p56EnH15088996; Mon, 6 Jun 2011 15:49:17 +0100 (BST)
	(envelope-from martin@lispworks.com)
Received: from carson.cam.lispworks.com (localhost [127.0.0.1]) by
	carson.cam.lispworks.com (8.13.8+Sun) id p56EnHTq021677;
	Mon, 6 Jun 2011 15:49:17 +0100 (BST)
Received: (from martin@localhost)
	by carson.cam.lispworks.com (8.13.8+Sun/8.13.8/Submit) id
	p56EnHo1021674; Mon, 6 Jun 2011 15:49:17 +0100 (BST)
Date: Mon, 6 Jun 2011 15:49:17 +0100 (BST)
Message-Id: <201106061449.p56EnHo1021674@carson.cam.lispworks.com>
From: Martin Simmons <martin@lispworks.com>
To: qemu-devel@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 193.34.186.230
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] Make x86 mfence and lfence illegal without
	SSE2
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
X-List-Received-Date: Mon, 06 Jun 2011 14:49:29 -0000

Hi,

While trying to use qemu -cpu pentium3 to test for incorrect uses of certain
SSE2 instructions, I found that QEMU allowed the mfence and lfence
instructions to be executed even though Pentium 3 doesn't support them.

According to the processor specs (and experience on a real Pentium 3), these
instructions are only available with SSE2, but QEMU is checking for SSE.  The
check for the related sfence instruction is correct (it works with SSE).

This trival patch fixes the test:

Signed-off-by: Martin Simmons <martin@lispworks.com>

--- a/target-i386/translate.c	2011-06-03 16:17:18.270208646 +0100
+++ b/target-i386/translate.c	2011-06-03 16:02:41.381556714 +0100
@@ -7560,7 +7560,7 @@
             break;
         case 5: /* lfence */
         case 6: /* mfence */
-            if ((modrm & 0xc7) != 0xc0 || !(s->cpuid_features & CPUID_SSE))
+            if ((modrm & 0xc7) != 0xc0 || !(s->cpuid_features & CPUID_SSE2))
                 goto illegal_op;
             break;
         case 7: /* sfence / clflush */

__Martin

