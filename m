Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z306t-0003lY-VG
	for mharc-qemu-trivial@gnu.org; Thu, 11 Jun 2015 06:53:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48806)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1Z306s-0003kp-8K
	for qemu-trivial@nongnu.org; Thu, 11 Jun 2015 06:53:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1Z306n-0001hc-En
	for qemu-trivial@nongnu.org; Thu, 11 Jun 2015 06:53:22 -0400
Received: from static.88-198-71-155.clients.your-server.de
	([88.198.71.155]:52222 helo=socrates.bennee.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>)
	id 1Z306n-0001gt-81; Thu, 11 Jun 2015 06:53:17 -0400
Received: from localhost ([127.0.0.1] helo=zen.linaroharston)
	by socrates.bennee.com with esmtp (Exim 4.80)
	(envelope-from <alex.bennee@linaro.org>)
	id 1Z31UC-0008V1-75; Thu, 11 Jun 2015 14:21:32 +0200
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-trivial@nongnu.org
Date: Thu, 11 Jun 2015 11:53:35 +0100
Message-Id: <1434020015-8868-1-git-send-email-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.4.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: alex.bennee@linaro.org
X-SA-Exim-Scanned: No (on socrates.bennee.com); SAEximRunCond expanded to false
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 88.198.71.155
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] target-arm/cpu.h: remove pending_exception
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
X-List-Received-Date: Thu, 11 Jun 2015 10:53:23 -0000

This isn't used by any of the code. In fact it looks like it was never
used as it came in with ARMv7 support.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target-arm/cpu.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 21b5b8e..7c1d95c 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -384,7 +384,6 @@ typedef struct CPUARMState {
         uint32_t control;
         int current_sp;
         int exception;
-        int pending_exception;
     } v7m;
 
     /* Information associated with an exception about to be taken:
-- 
2.4.2


