Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ULDty-0004YA-1r
	for mharc-qemu-trivial@gnu.org; Thu, 28 Mar 2013 10:34:02 -0400
Received: from eggs.gnu.org ([208.118.235.92]:42237)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ULDtl-0004Iv-Mi
	for qemu-trivial@nongnu.org; Thu, 28 Mar 2013 10:34:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ULDti-0007x1-5A
	for qemu-trivial@nongnu.org; Thu, 28 Mar 2013 10:33:49 -0400
Received: from
	1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.d.1.0.0.b.8.0.1.0.0.2.ip6.arpa
	([2001:8b0:1d0::1]:33305 helo=mnementh.archaic.org.uk)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ULDtU-0007rX-Lm; Thu, 28 Mar 2013 10:33:32 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ULDtM-000350-Ax; Thu, 28 Mar 2013 14:33:24 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 28 Mar 2013 14:33:24 +0000
Message-Id: <1364481204-11815-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
	patches@linaro.org
Subject: [Qemu-trivial] [PATCH] linux-user: Don't omit comma for strace of
	rt_sigaction()
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
X-List-Received-Date: Thu, 28 Mar 2013 14:34:00 -0000

Pass the 'last' parameter of print_signal() through to
print_raw_param(); this fixes a problem where we weren't printing
the comma separator for strace of rt_sigaction() when the signal
was an unnamed (ie realtime) one:
  6856 rt_sigaction(230xf6fff870,0xf6fff8fc) = 0

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/strace.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 0fbae3c..ea6c1d2 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -143,7 +143,7 @@ print_signal(abi_ulong arg, int last)
     case TARGET_SIGTTOU: signal_name = "SIGTTOU"; break;
     }
     if (signal_name == NULL) {
-        print_raw_param("%ld", arg, 1);
+        print_raw_param("%ld", arg, last);
         return;
     }
     gemu_log("%s%s", signal_name, get_comma(last));
-- 
1.7.9.5


