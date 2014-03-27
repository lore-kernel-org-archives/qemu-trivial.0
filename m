Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WTCXc-00020e-5D
	for mharc-qemu-trivial@gnu.org; Thu, 27 Mar 2014 11:48:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40608)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WTCXU-0001nS-EO
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 11:48:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WTCXP-0001ZE-KE
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 11:48:20 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:50306)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WTCXD-0001UC-HO; Thu, 27 Mar 2014 11:48:03 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 4025143721;
	Thu, 27 Mar 2014 19:48:02 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id F3E8868F;
	Thu, 27 Mar 2014 19:28:35 +0400 (MSK)
Received: (nullmailer pid 1819 invoked by uid 1000);
	Thu, 27 Mar 2014 15:28:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 27 Mar 2014 19:28:27 +0400
Message-Id: <1395934108-1694-23-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1395934108-1694-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1395934108-1694-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Prasad Joshi <prasadjoshi.linux@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 22/23] hw/timer/grlib_gptimer: remove
	unnecessary assignment
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
X-List-Received-Date: Thu, 27 Mar 2014 15:48:25 -0000

From: Prasad Joshi <prasadjoshi.linux@gmail.com>

Signed-off-by: Prasad Joshi <prasadjoshi.linux@gmail.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/timer/grlib_gptimer.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/timer/grlib_gptimer.c b/hw/timer/grlib_gptimer.c
index 7672d3a..d655bb2 100644
--- a/hw/timer/grlib_gptimer.c
+++ b/hw/timer/grlib_gptimer.c
@@ -328,7 +328,6 @@ static void grlib_gptimer_reset(DeviceState *d)
 
     unit->scaler = 0;
     unit->reload = 0;
-    unit->config = 0;
 
     unit->config  = unit->nr_timers;
     unit->config |= unit->irq_line << 3;
-- 
1.7.10.4


