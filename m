Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WTCNt-0000UZ-88
	for mharc-qemu-trivial@gnu.org; Thu, 27 Mar 2014 11:38:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38485)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WTCNm-0000Ib-UR
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 11:38:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WTCNi-0006Iy-HL
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 11:38:18 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46772)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WTCNX-0006G7-F6; Thu, 27 Mar 2014 11:38:03 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 2D92843721;
	Thu, 27 Mar 2014 19:38:02 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id DB48B681;
	Thu, 27 Mar 2014 19:28:34 +0400 (MSK)
Received: (nullmailer pid 1822 invoked by uid 1000);
	Thu, 27 Mar 2014 15:28:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 27 Mar 2014 19:28:28 +0400
Message-Id: <1395934108-1694-24-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1395934108-1694-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1395934108-1694-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Prasad Joshi <prasadjoshi.linux@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 23/23] linux-user: remove duplicate statement
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
X-List-Received-Date: Thu, 27 Mar 2014 15:38:23 -0000

From: Prasad Joshi <prasadjoshi.linux@gmail.com>

Signed-off-by: Prasad Joshi <prasadjoshi.linux@gmail.com>
Acked-by: Riku Voipio <riku.voipio@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 linux-user/signal.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/linux-user/signal.c b/linux-user/signal.c
index e5fb933..7d6246f 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -4043,8 +4043,6 @@ static void setup_rt_frame(int sig, struct target_sigaction *ka,
     struct target_rt_sigframe *frame;
     abi_ulong info_addr, uc_addr;
 
-    frame_addr = get_sigframe(ka, env, sizeof *frame);
-
     frame_addr = get_sigframe(ka, env, sizeof(*frame));
     if (!lock_user_struct(VERIFY_WRITE, frame, frame_addr, 0)) {
         goto give_sigsegv;
-- 
1.7.10.4


