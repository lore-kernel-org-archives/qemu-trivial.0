Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tflcy-0005lo-Oa
	for mharc-qemu-trivial@gnu.org; Tue, 04 Dec 2012 01:05:08 -0500
Received: from eggs.gnu.org ([208.118.235.92]:39886)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Tflcs-0005fg-3x
	for qemu-trivial@nongnu.org; Tue, 04 Dec 2012 01:05:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Tflcp-0001wB-Mf
	for qemu-trivial@nongnu.org; Tue, 04 Dec 2012 01:05:01 -0500
Received: from mail-ia0-f173.google.com ([209.85.210.173]:55559)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Tflcp-0001w0-IG
	for qemu-trivial@nongnu.org; Tue, 04 Dec 2012 01:04:59 -0500
Received: by mail-ia0-f173.google.com with SMTP id w21so2752334iac.4
	for <qemu-trivial@nongnu.org>; Mon, 03 Dec 2012 22:04:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=w+HrF4NvfElwkB5ZgGo93LFy5QEQ0qnHjNzrqfdLwiI=;
	b=F/lnhXJkIPHNzbw9z2/DqqqKk1buh2SjjxDQ+6OQtO1pLGsmOS2VYLzh59mjYpTuQv
	p45nG5wqc3lw1nOGsSqAmJoy1lpxyIhIvcJX14/TiuwCZbfmcXUhrloNbY+15VjQCk2d
	DxSet9nMS4+JsRkYje3gLSUugDjo8cDQ0mZWvSuwv8iuaGgXbMxLDPB9wEqDrdROyaxh
	a27MxVCNd5mKeRUoz/XXKK4UT0g/uxLAVOf17c+l6UhdFKFt9SOLNhCIB/mcBF/aAcIy
	pa4WKFRY1bCYXp7yGcnwyX2hPDq/oHH2Fr/OQiUGFCFI5yJBR1/WDcqa4VB/TkLknY2X
	n+KA==
Received: by 10.50.157.162 with SMTP id wn2mr1643224igb.27.1354601098621;
	Mon, 03 Dec 2012 22:04:58 -0800 (PST)
Received: from localhost ([124.148.20.9])
	by mx.google.com with ESMTPS id ez8sm228870igb.17.2012.12.03.22.04.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 22:04:57 -0800 (PST)
Sender: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Tue,  4 Dec 2012 16:04:32 +1000
Message-Id: <cover.1354600680.git.peter.crosthwaite@xilinx.com>
X-Mailer: git-send-email 1.7.0.4
X-Gm-Message-State: ALoCoQkmgrYjsTk7KhBpygJyxCVN012McZAr2TLVffH4eReNmP1R/Wq2Qn8z9r7tZ8wafmmTQihQ
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.210.173
Cc: peter.maydell@linaro.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Subject: [Qemu-trivial] [PATCH v1 0/4] Trivial patches
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
X-List-Received-Date: Tue, 04 Dec 2012 06:05:07 -0000

My trivial patches from during the freeze.

Peter Crosthwaite (4):
  pflash_cfi01: qemu_log_mask "unimplemented" msg
  pflash_cfi0x: Send debug messages to stderr
  zynq_slcr: Compile time warning fixes.
  arm_gic: Add cpu nr to Raised IRQ message

 hw/arm_gic.c      |    2 +-
 hw/pflash_cfi01.c |   14 +++++++-------
 hw/pflash_cfi02.c |    6 +++---
 hw/zynq_slcr.c    |    7 ++++---
 4 files changed, 15 insertions(+), 14 deletions(-)


