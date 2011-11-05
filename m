Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RMbSY-0002q9-45
	for mharc-qemu-trivial@gnu.org; Sat, 05 Nov 2011 04:18:38 -0400
Received: from eggs.gnu.org ([140.186.70.92]:42483)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1RMbSW-0002q2-Jh
	for qemu-trivial@nongnu.org; Sat, 05 Nov 2011 04:18:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1RMbRt-0001OY-78
	for qemu-trivial@nongnu.org; Sat, 05 Nov 2011 04:18:36 -0400
Received: from csmailer.cs.nctu.edu.tw ([140.113.235.130]:23971)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1RMbRs-0001OU-SH
	for qemu-trivial@nongnu.org; Sat, 05 Nov 2011 04:17:57 -0400
Received: from csmailer.cs.nctu.edu.tw (localhost [127.0.0.1])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 5FE86837
	for <qemu-trivial@nongnu.org>; Sat,  5 Nov 2011 16:16:09 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=cs.nctu.edu.tw; h=from:to
	:subject:date:message-id; s=rsa1024; bh=PNM07UdUDfdV7c8DsFY6Nwll
	Sxk=; b=nMttZ9gUqkUG+T86ZP2dYZn9LPHrZnAfD3pYLhVNdHaIrPs5eIMsW2RF
	5wGV1pYqJus/3to4pF/9eZXfwKUyJahgV9ZExY+UdWKAci0xcUisVTuCwbrZECdM
	JUSQnU7tMxvkHm+dSmaMaSvZJGIDlciNcSZDSK8gQAjmVDr9KoM=
Received: from alumni.cs.nctu.edu.tw (alumni.cs.nctu.edu.tw [140.113.235.116])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 414C1836
	for <qemu-trivial@nongnu.org>; Sat,  5 Nov 2011 16:16:09 +0800 (CST)
Received: (from chenwj@localhost)
	by alumni.cs.nctu.edu.tw (8.14.4/8.14.4/Submit) id pA58Htqi039193
	for qemu-trivial@nongnu.org; Sat, 5 Nov 2011 16:17:55 +0800 (CST)
	(envelope-from chenwj)
From: Chen Wen-Ren <chenwj@iis.sinica.edu.tw>
To: qemu-trivial@nongnu.org
Date: Sat,  5 Nov 2011 16:17:55 +0800
Message-Id: <1320481075-38893-1-git-send-email-chenwj@iis.sinica.edu.tw>
X-Mailer: git-send-email 1.7.3.5
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 140.113.235.130
Subject: [Qemu-trivial] [PATCH 1/2] exec.c: Make variable logfilename
	accessible from linux-user/main.c
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
X-List-Received-Date: Sat, 05 Nov 2011 08:18:37 -0000

  Make logfilename non-static so that linux-user/main.c has a chance
to modify the logfilename if user provide one.

Signed-off-by: Chen Wen-Ren <chenwj@iis.sinica.edu.tw>
---
 exec.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/exec.c b/exec.c
index 6b92198..3cbf7d3 100644
--- a/exec.c
+++ b/exec.c
@@ -213,7 +213,7 @@ static int io_mem_watch;
 #ifdef WIN32
 static const char *logfilename = "qemu.log";
 #else
-static const char *logfilename = "/tmp/qemu.log";
+const char *logfilename = "/tmp/qemu.log";
 #endif
 FILE *logfile;
 int loglevel;
-- 
1.7.3.5


