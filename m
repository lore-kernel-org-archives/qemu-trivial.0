Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QjNgT-0005xM-Ch
	for mharc-qemu-trivial@gnu.org; Tue, 19 Jul 2011 23:42:53 -0400
Received: from eggs.gnu.org ([140.186.70.92]:36577)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cerbere@gmail.com>) id 1QjNgP-0005wR-Ht
	for qemu-trivial@nongnu.org; Tue, 19 Jul 2011 23:42:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cerbere@gmail.com>) id 1QjNgN-00075F-Vv
	for qemu-trivial@nongnu.org; Tue, 19 Jul 2011 23:42:49 -0400
Received: from mail-vx0-f173.google.com ([209.85.220.173]:60635)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cerbere@gmail.com>)
	id 1QjNgI-00072s-Ns; Tue, 19 Jul 2011 23:42:42 -0400
Received: by vxi29 with SMTP id 29so3273370vxi.4
	for <multiple recipients>; Tue, 19 Jul 2011 20:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=XGBVa7WqBuxa8d5YfTD4npO9FzEJ/ZWblpahY1hbwvs=;
	b=HrLjIqmJthznlMUjCRrGZkjtIeHAYmuz0kKTPCMBLQn4Pct0G4WBuD9HxNfPyGpZG3
	3czzXvhAxkU6bMlfKZBpgliVVkYZdV/5KMMmkqCN89jS4DgagsrzlaOI9bL8ZmjJ0y9p
	bZdsE0Uf1hkmQQGanMFpTqtey+ZRiK3/pYnuY=
Received: by 10.52.116.242 with SMTP id jz18mr1530315vdb.379.1311133360964;
	Tue, 19 Jul 2011 20:42:40 -0700 (PDT)
Received: from localhost.localdomain (modemcable055.201-23-96.mc.videotron.ca
	[96.23.201.55])
	by mx.google.com with ESMTPS id y4sm2688219vdv.13.2011.07.19.20.42.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 19 Jul 2011 20:42:40 -0700 (PDT)
From: Alexandre Raymond <cerbere@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue, 19 Jul 2011 23:41:55 -0400
Message-Id: <1311133315-978-1-git-send-email-cerbere@gmail.com>
X-Mailer: git-send-email 1.7.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.220.173
Cc: qemu-trivial@nongnu.org, Alexandre Raymond <cerbere@gmail.com>
Subject: [Qemu-trivial] [PATCH] Makefile: Minor cscope fixups
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
X-List-Received-Date: Wed, 20 Jul 2011 03:42:51 -0000

-Create cscope symbols for assembly files in addition to .c/.h files.
-Create cscope database with full path instead of relative path so cscope
 can be used with CSCOPE_DB in any directory.

Signed-off-by: Alexandre Raymond <cerbere@gmail.com>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index b3ffbe2..4273b6f 100644
--- a/Makefile
+++ b/Makefile
@@ -254,7 +254,7 @@ TAGS:
 
 cscope:
 	rm -f ./cscope.*
-	find . -name "*.[ch]" -print | sed 's,^\./,,' > ./cscope.files
+	find $$PWD -name "*.[chsS]" -print | sed 's,^\./,,' > ./cscope.files
 	cscope -b
 
 # documentation
-- 
1.7.5


