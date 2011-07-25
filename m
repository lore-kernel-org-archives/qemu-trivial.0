Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QlGIR-000848-Nc
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jul 2011 04:13:51 -0400
Received: from eggs.gnu.org ([140.186.70.92]:59270)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <geleman@gmail.com>) id 1QlGIP-0007w0-Lu
	for qemu-trivial@nongnu.org; Mon, 25 Jul 2011 04:13:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <geleman@gmail.com>) id 1QlGIO-0004eb-AS
	for qemu-trivial@nongnu.org; Mon, 25 Jul 2011 04:13:49 -0400
Received: from mail-pz0-f43.google.com ([209.85.210.43]:33213)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <geleman@gmail.com>)
	id 1QlGIL-0004eD-Lo; Mon, 25 Jul 2011 04:13:46 -0400
Received: by pzk1 with SMTP id 1so8371342pzk.30
	for <multiple recipients>; Mon, 25 Jul 2011 01:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=A8kBs2EqP3X6v/5X5ZZ1FBQV2wAlZDe3snePg4xLlyA=;
	b=TIpXYeHy/gW5pF7CUKkqK7RXmV+2tK2LTlfJOxnNPAogMOCOeXYPV0zCJLTjFB4aTV
	Vbkecty/ec0hQnU4nWksJcFtr05qj/AcLfkThf1yULPHQrBKUDeuDEf4JBJHeIN3VDcz
	iEmBi2aBvtVw4gry+8K1eAQv0k72Jt5bkJUdc=
Received: by 10.68.56.135 with SMTP id a7mr42058pbq.228.1311581624172;
	Mon, 25 Jul 2011 01:13:44 -0700 (PDT)
Received: from localhost.localdomain ([211.101.48.70])
	by mx.google.com with ESMTPS id g4sm4353668pbj.9.2011.07.25.01.13.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Jul 2011 01:13:43 -0700 (PDT)
From: TeLeMan <geleman@gmail.com>
To: Kevin Wolf <kwolf@redhat.com>
Date: Mon, 25 Jul 2011 16:16:31 +0800
Message-Id: <1311581791-923-1-git-send-email-geleman@gmail.com>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.210.43
Cc: qemu-trivial@nongnu.org, TeLeMan <geleman@gmail.com>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] qemu-char: fix the commit "qemu-char: Print
	strerror message on failure"
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
X-List-Received-Date: Mon, 25 Jul 2011 08:13:50 -0000

The commit 6e1db57b2ac9025c2443c665a0d9e78748637b26 missed patching qemu_chr_open_win_file().

Signed-off-by: TeLeMan <geleman@gmail.com>
---
 qemu-char.c |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/qemu-char.c b/qemu-char.c
index dcf7065..ea7abfe 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -1782,7 +1782,7 @@ static int qemu_chr_open_win_pipe(QemuOpts *opts, CharDriverState **_chr)
     return 0;
 }
 
-static CharDriverState *qemu_chr_open_win_file(HANDLE fd_out)
+static int qemu_chr_open_win_file(HANDLE fd_out, CharDriverState **_chr)
 {
     CharDriverState *chr;
     WinCharState *s;
@@ -1793,12 +1793,14 @@ static CharDriverState *qemu_chr_open_win_file(HANDLE fd_out)
     chr->opaque = s;
     chr->chr_write = win_chr_write;
     qemu_chr_generic_open(chr);
-    return chr;
+
+    *_chr = chr;
+    return 0;
 }
 
 static int qemu_chr_open_win_con(QemuOpts *opts, CharDriverState **_chr)
 {
-    return qemu_chr_open_win_file(GetStdHandle(STD_OUTPUT_HANDLE), chr);
+    return qemu_chr_open_win_file(GetStdHandle(STD_OUTPUT_HANDLE), _chr);
 }
 
 static int qemu_chr_open_win_file_out(QemuOpts *opts, CharDriverState **_chr)
-- 
1.7.3.1.msysgit.0


