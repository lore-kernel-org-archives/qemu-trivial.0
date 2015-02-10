Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL7mu-0005ZW-KU
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 05:11:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47431)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL7mr-0005Te-9K
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 05:11:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL7mq-0003wc-8u
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 05:11:21 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:53315)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YL7ma-0003ps-M8; Tue, 10 Feb 2015 05:11:04 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 588B9418BD;
	Tue, 10 Feb 2015 13:11:03 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 85914944;
	Tue, 10 Feb 2015 09:34:45 +0300 (MSK)
Received: (nullmailer pid 9373 invoked by uid 1000);
	Tue, 10 Feb 2015 06:34:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Feb 2015 09:34:09 +0300
Message-Id: <aa5e03d2aa4ed19bfb7f4ce80092758018c6a71c.1423549659.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
References: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Maxim Ostapenko <m.ostapenko@partner.samsung.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 20/46] linux-user: wrong TARGET_SI_PAD_SIZE
	value for some targets.
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
X-List-Received-Date: Tue, 10 Feb 2015 10:11:22 -0000

From: Maxim Ostapenko <m.ostapenko@partner.samsung.com>

Fix TARGET_SI_PAD_SIZE calculation to match the way the kernel does it.
Use different TARGET_SI_PREAMBLE_SIZE for 32-bit and 64-bit targets.

Signed-off-by: Maxim Ostapenko <m.ostapenko@partner.samsung.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 linux-user/syscall_defs.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index ebb3be1..9ed6de8 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -655,7 +655,14 @@ typedef struct {
 #endif
 
 #define TARGET_SI_MAX_SIZE	128
-#define TARGET_SI_PAD_SIZE	((TARGET_SI_MAX_SIZE/sizeof(int)) - 3)
+
+#if TARGET_ABI_BITS == 32
+#define TARGET_SI_PREAMBLE_SIZE (3 * sizeof(int))
+#else
+#define TARGET_SI_PREAMBLE_SIZE (4 * sizeof(int))
+#endif
+
+#define TARGET_SI_PAD_SIZE ((TARGET_SI_MAX_SIZE - TARGET_SI_PREAMBLE_SIZE) / sizeof(int))
 
 typedef struct target_siginfo {
 #ifdef TARGET_MIPS
-- 
2.1.4


