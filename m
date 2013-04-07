Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UOiYB-0002oq-Nd
	for mharc-qemu-trivial@gnu.org; Sun, 07 Apr 2013 01:53:59 -0400
Received: from eggs.gnu.org ([208.118.235.92]:41084)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UOiY7-0002mm-6s
	for qemu-trivial@nongnu.org; Sun, 07 Apr 2013 01:53:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UOiY1-0000gd-Tu
	for qemu-trivial@nongnu.org; Sun, 07 Apr 2013 01:53:55 -0400
Received: from mail-pa0-f46.google.com ([209.85.220.46]:64833)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UOiY1-0000gX-Ns
	for qemu-trivial@nongnu.org; Sun, 07 Apr 2013 01:53:49 -0400
Received: by mail-pa0-f46.google.com with SMTP id lb1so2678650pab.33
	for <qemu-trivial@nongnu.org>; Sat, 06 Apr 2013 22:53:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=XrFovwY2IWt11Ch5HHTcirk+B7AAvLmV0fDwcrvDtJc=;
	b=b2Ofzl255TOiUpA8kNXZPnNjKWqgEGquKmbhmSeRBnaCJjlnIybVQlGC9VagK82c5w
	lhMrkLYecAoqsGOkbwtlZU3xgJirg33ML6NLXq9iKDqfMZ2L/4XmtjG4vm9x4JFJNiKG
	Iz0F9W4C4dAbpBDQdDiIlzgqRLKdWhUIPws0OwPl3HUaduhRlCXsNLPjlcU+/+nHgb6R
	rB7obX3QUYedCEO+e6oz6vM151AvavX+qBMSyBATV26JDzSnDstHtpp63v1MagA3QBxe
	yHVBaXSJByF5BAoZIa+812GPh3yBc4wbSeL90z0v9L4WZDlLuik2YQFv+Uxij9Xy5YCC
	JsrA==
X-Received: by 10.66.192.195 with SMTP id hi3mr21494016pac.61.1365314028709;
	Sat, 06 Apr 2013 22:53:48 -0700 (PDT)
Received: from localhost ([149.199.62.254])
	by mx.google.com with ESMTPS id g8sm23806207pae.7.2013.04.06.22.53.46
	(version=TLSv1.1 cipher=RC4-SHA bits=128/128);
	Sat, 06 Apr 2013 22:53:47 -0700 (PDT)
Sender: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Sun,  7 Apr 2013 15:53:29 +1000
Message-Id: <cover.1365313801.git.peter.crosthwaite@xilinx.com>
X-Mailer: git-send-email 1.7.0.4
X-Gm-Message-State: ALoCoQlrz8hFIdI9QEDuQY+TflFFIcp0As5/5JWhzp4/+6fKugiSA9mupoEuNpRVQRm4TNn12wTC
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.220.46
Cc: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Subject: [Qemu-trivial] [PATCH v2 0/4]  m25p80: Fix debug printfery
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
X-List-Received-Date: Sun, 07 Apr 2013 05:53:58 -0000

Fix up the debug printfery m25p80 in various ways. 0 functional diff.


Peter Crosthwaite (4):
  m25p80: Fix debug messages.
  m25p80: Convert guest errors to LOG_GUEST_ERROR
  m25p80.c: Multiple debug verbosity levels
  m25p80: Add debug message for no bdrv

 hw/m25p80.c |   52 +++++++++++++++++++++++++++++-----------------------
 1 files changed, 29 insertions(+), 23 deletions(-)


