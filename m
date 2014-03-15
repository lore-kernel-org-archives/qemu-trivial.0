Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WOlSI-0004OK-NH
	for mharc-qemu-trivial@gnu.org; Sat, 15 Mar 2014 06:04:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53653)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WOlSC-0004C6-5Y
	for qemu-trivial@nongnu.org; Sat, 15 Mar 2014 06:04:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WOlS7-0007C9-MP
	for qemu-trivial@nongnu.org; Sat, 15 Mar 2014 06:04:32 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:37999)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WOlRu-00076K-ED; Sat, 15 Mar 2014 06:04:14 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E2F9741D73;
	Sat, 15 Mar 2014 14:04:12 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id B12C5662;
	Sat, 15 Mar 2014 13:57:04 +0400 (MSK)
Received: (nullmailer pid 20019 invoked by uid 1000);
	Sat, 15 Mar 2014 09:57:04 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sat, 15 Mar 2014 13:56:53 +0400
Message-Id: <1394877419-19949-8-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1394877419-19949-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1394877419-19949-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, "Gabriel L. Somlo" <gsomlo@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Gabriel Somlo <somlo@cmu.edu>
Subject: [Qemu-trivial] [PULL 07/13] Add qga/qapi-generated to .gitignore
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
X-List-Received-Date: Sat, 15 Mar 2014 10:04:36 -0000

From: "Gabriel L. Somlo" <gsomlo@gmail.com>

The folder "qga/qapi-generated" shows up after building QEMU, and
gets in the way during e.g. "git add ."; Add it to .gitignore to
keep it from accidentally ending up in the wrong place.

Signed-off-by: Gabriel Somlo <somlo@cmu.edu>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 .gitignore |    1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index ef7019f..de90463 100644
--- a/.gitignore
+++ b/.gitignore
@@ -21,6 +21,7 @@
 libdis*
 libuser
 /linux-headers/asm
+/qga/qapi-generated
 /qapi-generated
 /qapi-types.[ch]
 /qapi-visit.[ch]
-- 
1.7.10.4


