Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W8cNc-0006XO-RP
	for mharc-qemu-trivial@gnu.org; Wed, 29 Jan 2014 16:09:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46865)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1W8cNV-0006Op-Go
	for qemu-trivial@nongnu.org; Wed, 29 Jan 2014 16:09:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1W8cNP-0004a3-M1
	for qemu-trivial@nongnu.org; Wed, 29 Jan 2014 16:08:57 -0500
Received: from mail-qa0-x231.google.com ([2607:f8b0:400d:c00::231]:37441)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1W8cND-0004XV-N6; Wed, 29 Jan 2014 16:08:39 -0500
Received: by mail-qa0-f49.google.com with SMTP id w8so3164935qac.8
	for <multiple recipients>; Wed, 29 Jan 2014 13:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=TMHtwp2iERYNJtYFxJ0cVGf1w3I2m1s3mkUOOopHYG0=;
	b=K8Ylch4VjO8WLTMA9uqALZ2Xp9g28c+HQYXmU1ZsDa/8vGIXQDCgSeABGgWjXVPzOs
	0E5a57Y8asJU+/Z8vd9wxlJhaag5A2MDu5UTt+veRN7HMud/BbFh85RAUmsjUsKv5fE+
	lx8fzxE9wKtOIYLwSfD4cA1zSF/AmOzQ+YMgViDjUAIRYPvLtHmHYj2+EfrbbDXqgA6K
	cx+a4xf2iI8eiT3TU+LjA5Uq3GOoSGL9MX0+oqfZcZnfARTtxPbLS7+7kSN2X77cczK5
	Uf1F2FItN8Za5xM70ufg4q/jd40l8/nNfvnzUm/4px4PsqqAohsCCvrz2vxTexiUqms7
	6xrA==
X-Received: by 10.224.88.3 with SMTP id y3mr16012129qal.80.1391029718413;
	Wed, 29 Jan 2014 13:08:38 -0800 (PST)
Received: from pike.twiddle.home.com
	(50-194-63-110-static.hfc.comcastbusiness.net. [50.194.63.110])
	by mx.google.com with ESMTPSA id m8sm10128964qac.22.2014.01.29.13.08.34
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Jan 2014 13:08:36 -0800 (PST)
Sender: Richard Henderson <rth7680@gmail.com>
From: Richard Henderson <rth@twiddle.net>
To: qemu-devel@nongnu.org
Date: Wed, 29 Jan 2014 13:08:30 -0800
Message-Id: <1391029710-11780-1-git-send-email-rth@twiddle.net>
X-Mailer: git-send-email 1.8.5.3
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c00::231
Cc: qemu-trivial@nongnu.org, borntraeger@de.ibm.com
Subject: [Qemu-trivial] [PATCH] tcg/s390: Remove sigill_handler
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
X-List-Received-Date: Wed, 29 Jan 2014 21:09:03 -0000

Commit c9baa30f42a87f61627391698f63fa4d1566d9d8 failed to
delete all of the relevant code, leading to Werrors about
unused symbols.

Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 tcg/s390/tcg-target.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/tcg/s390/tcg-target.c b/tcg/s390/tcg-target.c
index 248726e..907d9d1 100644
--- a/tcg/s390/tcg-target.c
+++ b/tcg/s390/tcg-target.c
@@ -2214,25 +2214,6 @@ static const TCGTargetOpDef s390_op_defs[] = {
     { -1 },
 };
 
-/* ??? Linux kernels provide an AUXV entry AT_HWCAP that provides most of
-   this information.  However, getting at that entry is not easy this far
-   away from main.  Our options are: start searching from environ, but
-   that fails as soon as someone does a setenv in between.  Read the data
-   from /proc/self/auxv.  Or do the probing ourselves.  The only thing
-   extra that AT_HWCAP gives us is HWCAP_S390_HIGH_GPRS, which indicates
-   that the kernel saves all 64-bits of the registers around traps while
-   in 31-bit mode.  But this is true of all "recent" kernels (ought to dig
-   back and see from when this might not be true).  */
-
-#include <signal.h>
-
-static volatile sig_atomic_t got_sigill;
-
-static void sigill_handler(int sig)
-{
-    got_sigill = 1;
-}
-
 static void query_facilities(void)
 {
     unsigned long hwcap = qemu_getauxval(AT_HWCAP);
-- 
1.8.5.3


