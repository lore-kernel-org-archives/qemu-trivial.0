Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bT5Ut-0003LI-Jq
	for mharc-qemu-trivial@gnu.org; Fri, 29 Jul 2016 06:58:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56605)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1bT5Uo-0003Ep-O5
	for qemu-trivial@nongnu.org; Fri, 29 Jul 2016 06:58:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1bT5Um-00080b-OO
	for qemu-trivial@nongnu.org; Fri, 29 Jul 2016 06:58:25 -0400
Received: from [59.151.112.132] (port=6110 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1bT5Ui-0007y4-Qz; Fri, 29 Jul 2016 06:58:21 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="9304771"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 Jul 2016 18:58:02 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id D84A342B548B;
	Fri, 29 Jul 2016 18:58:02 +0800 (CST)
Received: from G08FNSTD140223.g08.fujitsu.local (10.167.226.69) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Fri, 29 Jul 2016 18:58:02 +0800
From: Cao jin <caoj.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, Peter
	Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Jul 2016 19:05:36 +0800
Message-ID: <1469790338-28990-2-git-send-email-caoj.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1469790338-28990-1-git-send-email-caoj.fnst@cn.fujitsu.com>
References: <1469790338-28990-1-git-send-email-caoj.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: D84A342B548B.AD501
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: [Qemu-trivial] [PATCH 1/3] timer: update comments
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
X-List-Received-Date: Fri, 29 Jul 2016 10:58:30 -0000

The comments is outdated. The patch has following changes:
1. tense correction.
2. all clock time value is returned in nanoseconds, so, they are same in
precision.
3. virtual clock doesn't use cpu cycles.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
 include/qemu/timer.h | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/include/qemu/timer.h b/include/qemu/timer.h
index 930b5d3..9910d22 100644
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
2.1.0




