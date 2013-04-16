Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1URtr2-0000Ko-Vy
	for mharc-qemu-trivial@gnu.org; Mon, 15 Apr 2013 20:34:37 -0400
Received: from eggs.gnu.org ([208.118.235.92]:36057)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1URtqz-0000IR-Mi
	for qemu-trivial@nongnu.org; Mon, 15 Apr 2013 20:34:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1URtqw-0002Ij-WB
	for qemu-trivial@nongnu.org; Mon, 15 Apr 2013 20:34:33 -0400
Received: from mail-pa0-f45.google.com ([209.85.220.45]:44450)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1URtqw-0002IY-Ql
	for qemu-trivial@nongnu.org; Mon, 15 Apr 2013 20:34:30 -0400
Received: by mail-pa0-f45.google.com with SMTP id kl13so17934pab.32
	for <qemu-trivial@nongnu.org>; Mon, 15 Apr 2013 17:34:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=8tYVXH0QxMBNIRv1SZs8LjWgvfdQh3evIaZtf6BgSFU=;
	b=OEeiozEdUlLIo8gBWZLZ2ANYb9pL49D7HYCbnGOPC7fhSMANvWnCX2QhqHOtPBRd5y
	4xAmH8fx2b0v+OQ/e6RSTfjaeVYJEQ4FBnZNOZLfjj0LYL/K3cW7m0au7X/FwKOFLiJ8
	ue/comi2EGO0Vv0a7/B4eIXF/zfBZrSuBTUv/Nu+4iFUmL3OdJBSH79CZT8NsUUObZI9
	B1jpiwAIOKuUW0SztqZMsipbVWFjCTB8jEz91I8z8eINUllkr7NVZ9hapP5hv8IWhalv
	y2LrZrzk6mBikMpuhgENNeDsgc2QZaksN6IM9qK0VNyxO7FS28OjyAT7Qi8+GEWiUzpF
	FlWg==
X-Received: by 10.66.81.2 with SMTP id v2mr525621pax.204.1366072469828;
	Mon, 15 Apr 2013 17:34:29 -0700 (PDT)
Received: from localhost ([149.199.62.254])
	by mx.google.com with ESMTPS id ak5sm143995pac.4.2013.04.15.17.34.27
	(version=TLSv1.1 cipher=RC4-SHA bits=128/128);
	Mon, 15 Apr 2013 17:34:28 -0700 (PDT)
Sender: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
From: peter.crosthwaite@xilinx.com
To: qemu-devel@nongnu.org
Date: Tue, 16 Apr 2013 10:32:14 +1000
Message-Id: <cover.1366071713.git.peter.crosthwaite@xilinx.com>
X-Mailer: git-send-email 1.7.0.4
X-Gm-Message-State: ALoCoQk7Hko3yXKaHdHF9/Beo1cNfFYTQSAEbmAMIwQQ1IcIJbBzd2SZk9qIFI5pyzolp1amODFN
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.220.45
Cc: qemu-trivial@nongnu.org, edgar.iglesias@gmail.com
Subject: [Qemu-trivial] [PATCH v3 0/4]  m25p80: Fix debug printfery
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
X-List-Received-Date: Tue, 16 Apr 2013 00:34:35 -0000

From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

Fix up the debug printfery m25p80 in various ways. 0 functional diff.

changed from v2:
Rebased against hw reorg


Peter Crosthwaite (4):
  m25p80: Fix debug messages.
  m25p80: Convert guest errors to LOG_GUEST_ERROR
  m25p80.c: Multiple debug verbosity levels
  m25p80: Add debug message for no bdrv

 hw/block/m25p80.c |   52 +++++++++++++++++++++++++++++-----------------------
 1 files changed, 29 insertions(+), 23 deletions(-)


