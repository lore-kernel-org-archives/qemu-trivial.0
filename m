Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Qjjh8-0005Qq-CL
	for mharc-qemu-trivial@gnu.org; Wed, 20 Jul 2011 23:13:02 -0400
Received: from eggs.gnu.org ([140.186.70.92]:39421)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cerbere@gmail.com>) id 1Qjjh6-0005QN-37
	for qemu-trivial@nongnu.org; Wed, 20 Jul 2011 23:13:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cerbere@gmail.com>) id 1Qjjh5-00044m-BF
	for qemu-trivial@nongnu.org; Wed, 20 Jul 2011 23:13:00 -0400
Received: from mail-vx0-f173.google.com ([209.85.220.173]:65399)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cerbere@gmail.com>)
	id 1Qjjh3-00044X-8N; Wed, 20 Jul 2011 23:12:57 -0400
Received: by vxi29 with SMTP id 29so739210vxi.4
	for <multiple recipients>; Wed, 20 Jul 2011 20:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=9sYp+XYNCAAmpQZdWihQghfA5EXohebfaCg7nqq59r8=;
	b=wOeEg7SluBRFjf1trJTzR0RgO+4y4AXqlLZJ2vuJKAgNhlC+vG6j5tH7eaYdI2yClf
	QDe+LNfWHCOlCAVlsVUtDV/cbDzEqfsdkopKg+uvCZ7GWJOiCaP8x+PW7nLHhr2EHVau
	Kv0ypobGadRFHBfjhqRPwUuU6sterJIbYWLNI=
Received: by 10.52.89.147 with SMTP id bo19mr9987836vdb.523.1311217976659;
	Wed, 20 Jul 2011 20:12:56 -0700 (PDT)
Received: from localhost.localdomain (modemcable055.201-23-96.mc.videotron.ca
	[96.23.201.55])
	by mx.google.com with ESMTPS id cp8sm466956vdc.30.2011.07.20.20.12.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jul 2011 20:12:55 -0700 (PDT)
From: Alexandre Raymond <cerbere@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 20 Jul 2011 23:12:15 -0400
Message-Id: <1311217935-5283-1-git-send-email-cerbere@gmail.com>
X-Mailer: git-send-email 1.7.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.220.173
Cc: qemu-trivial@nongnu.org, blauwirbel@gmail.com,
	Alexandre Raymond <cerbere@gmail.com>
Subject: [Qemu-trivial] [PATCH v2] Makefile: Minor cscope fixups
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
X-List-Received-Date: Thu, 21 Jul 2011 03:13:00 -0000

Changes since v1:
-Use SRC_PATH instead of PWD

-Create cscope symbols for assembly files in addition to .c/.h files.
-Create cscope database with full path instead of relative path so cscope
 can be used with CSCOPE_DB in any directory.

Signed-off-by: Alexandre Raymond <cerbere@gmail.com>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index b3ffbe2..fbdaecc 100644
--- a/Makefile
+++ b/Makefile
@@ -254,7 +254,7 @@ TAGS:
 
 cscope:
 	rm -f ./cscope.*
-	find . -name "*.[ch]" -print | sed 's,^\./,,' > ./cscope.files
+	find "$(SRC_PATH)" -name "*.[chsS]" -print | sed 's,^\./,,' > ./cscope.files
 	cscope -b
 
 # documentation
-- 
1.7.5


