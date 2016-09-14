Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bk567-0005ua-Te
	for mharc-qemu-trivial@gnu.org; Wed, 14 Sep 2016 03:59:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32879)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk564-0005oj-P9
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 03:59:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk562-0004c3-Ok
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 03:59:07 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:37558)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bk55y-0004Wa-FA; Wed, 14 Sep 2016 03:59:02 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A1B4D41847;
	Wed, 14 Sep 2016 10:58:58 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 1D1CDAAB;
	Wed, 14 Sep 2016 10:58:58 +0300 (MSK)
Received: (nullmailer pid 17339 invoked by uid 1000);
	Wed, 14 Sep 2016 07:58:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 14 Sep 2016 10:58:40 +0300
Message-Id: <afc7bc5658a360834fd6df76693b1c948bc084f2.1473839869.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
References: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
References: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 14/27] timer: update comments
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
X-List-Received-Date: Wed, 14 Sep 2016 07:59:10 -0000

From: Cao jin <caoj.fnst@cn.fujitsu.com>

The comments is outdated. The patch has following changes:
1. tense correction.
2. all clock time value is returned in nanoseconds, so, they are same in
precision.
3. virtual clock doesn't use cpu cycles.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/qemu/timer.h | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/include/qemu/timer.h b/include/qemu/timer.h
index 4bfcd35..bdfae00 100644
--- a/include/qemu/timer.h
+++ b/include/qemu/timer.h
@@ -22,23 +22,20 @@
  * @QEMU_CLOCK_REALTIME: Real time clock
  *
  * The real time clock should be used only for stuff which does not
- * change the virtual machine state, as it is run even if the virtual
- * machine is stopped. The real time clock has a frequency of 1000
- * Hz.
+ * change the virtual machine state, as it runs even if the virtual
+ * machine is stopped.
  *
  * @QEMU_CLOCK_VIRTUAL: virtual clock
  *
- * The virtual clock is only run during the emulation. It is stopped
- * when the virtual machine is stopped. Virtual timers use a high
- * precision clock, usually cpu cycles (use ticks_per_sec).
+ * The virtual clock only runs during the emulation. It stops
+ * when the virtual machine is stopped.
  *
  * @QEMU_CLOCK_HOST: host clock
  *
- * The host clock should be use for device models that emulate accurate
+ * The host clock should be used for device models that emulate accurate
  * real time sources. It will continue to run when the virtual machine
  * is suspended, and it will reflect system time changes the host may
- * undergo (e.g. due to NTP). The host clock has the same precision as
- * the virtual clock.
+ * undergo (e.g. due to NTP).
  *
  * @QEMU_CLOCK_VIRTUAL_RT: realtime clock used for icount warp
  *
@@ -77,10 +74,6 @@ struct QEMUTimer {
 extern QEMUTimerListGroup main_loop_tlg;
 
 /*
- * QEMUClockType
- */
-
-/*
  * qemu_clock_get_ns;
  * @type: the clock type
  *
-- 
2.1.4


