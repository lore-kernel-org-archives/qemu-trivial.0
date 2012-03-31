Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SE36D-0003vz-SH
	for mharc-qemu-trivial@gnu.org; Sat, 31 Mar 2012 14:32:29 -0400
Received: from eggs.gnu.org ([208.118.235.92]:53388)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <freddy77@gmail.com>) id 1SE36A-0003mU-L0
	for qemu-trivial@nongnu.org; Sat, 31 Mar 2012 14:32:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <freddy77@gmail.com>) id 1SE369-0001mc-5Y
	for qemu-trivial@nongnu.org; Sat, 31 Mar 2012 14:32:26 -0400
Received: from mail-we0-f173.google.com ([74.125.82.173]:53795)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <freddy77@gmail.com>)
	id 1SE366-0001lz-2L; Sat, 31 Mar 2012 14:32:22 -0400
Received: by werp12 with SMTP id p12so1084333wer.4
	for <multiple recipients>; Sat, 31 Mar 2012 11:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=oYAWaZFCsNyDFLmThYDpZvCUDvOjzssiyp4EQn2fUuQ=;
	b=A5EXYeR6G7oHImsIRg0BYKRVzD+TNv08IesRkyDwzOBcqeesQyJqcxx7qg4oah7oEJ
	lrH63fkdBZ+FbHVFYYW7ml/8M9SAO6I4xXMhosZBwSD1GuOhOluy69ppB1ygHd5ldRJY
	ypklpBCWqGlnBWhrk1CTnBIelh/IK5qUFFutXMiPMoLNHOGFLBCzKz9b+onbZbtsyi+2
	JkoKz8rizsbXaH7PMsLCJ78BdUY1kJlGD6gCW94zUhdKhm+LPSfNaLJABnnGxh+1qrcA
	NRhYoDkSyuZR6LGBogZewLTaJRafkKvwFdb/BTBQplaaBSbbQ9RCvbPo4ajnGthxIiPw
	vipg==
Received: by 10.180.82.136 with SMTP id i8mr8293578wiy.19.1333218738577;
	Sat, 31 Mar 2012 11:32:18 -0700 (PDT)
Received: from localhost.localdomain
	(cpc11-cmbg15-2-0-cust58.5-4.cable.virginmedia.com. [86.30.245.59])
	by mx.google.com with ESMTPS id
	bx13sm18243448wib.10.2012.03.31.11.32.16
	(version=SSLv3 cipher=OTHER); Sat, 31 Mar 2012 11:32:17 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
To: stefanha@gmail.com
Date: Sat, 31 Mar 2012 19:32:14 +0100
Message-Id: <1333218734-23920-1-git-send-email-freddy77@gmail.com>
X-Mailer: git-send-email 1.7.4.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Frediano Ziglio <freddy77@gmail.com>
Subject: [Qemu-trivial] [PATCH] make qemu_event_handle static
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
X-List-Received-Date: Sat, 31 Mar 2012 18:32:28 -0000


Signed-off-by: Frediano Ziglio <freddy77@gmail.com>
---
 main-loop.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/main-loop.c b/main-loop.c
index db23de0..fc738d1 100644
--- a/main-loop.c
+++ b/main-loop.c
@@ -164,7 +164,7 @@ static int qemu_signal_init(void)
 
 #else /* _WIN32 */
 
-HANDLE qemu_event_handle = NULL;
+static HANDLE qemu_event_handle = NULL;
 
 static void dummy_event_handler(void *opaque)
 {
-- 
1.7.4.1


