Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VSkxx-0006yo-Ce
	for mharc-qemu-trivial@gnu.org; Sun, 06 Oct 2013 05:49:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49745)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VSkxp-0006iL-Vh
	for qemu-trivial@nongnu.org; Sun, 06 Oct 2013 05:49:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VSkxl-0006TR-KC
	for qemu-trivial@nongnu.org; Sun, 06 Oct 2013 05:49:25 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46700)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VSkxa-0006PW-6f; Sun, 06 Oct 2013 05:49:10 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 64D2840D05;
	Sun,  6 Oct 2013 13:49:09 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 1C271528;
	Sun,  6 Oct 2013 13:33:04 +0400 (MSK)
Received: (nullmailer pid 25828 invoked by uid 1000);
	Sun, 06 Oct 2013 09:33:02 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Sun,  6 Oct 2013 13:32:58 +0400
Message-Id: <1381051979-25742-14-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1381051979-25742-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1381051979-25742-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 13/14] util/path: Fix type which is longer
	than 8 bit for MinGW
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
X-List-Received-Date: Sun, 06 Oct 2013 09:49:30 -0000

From: Stefan Weil <sw@weilnetz.de>

While dirent->d_type is 8 bit for most systems, it is 32 bit for MinGW.
Reducing it to 8 bit results in a compiler warning because the macro
is_dir_maybe compares that 8 bit value with 32 bit constants.

Using 'unsigned' instead of 'unsigned char' matches the declaration for
MinGW and does not harm the other systems.

MinGW-w64 is not affected: it does not declare d_type.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 util/path.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/util/path.c b/util/path.c
index f0c6962..623219e 100644
--- a/util/path.c
+++ b/util/path.c
@@ -39,7 +39,7 @@ static int strneq(const char *s1, unsigned int n, const char *s2)
 }
 
 static struct pathelem *add_entry(struct pathelem *root, const char *name,
-                                  unsigned char type);
+                                  unsigned type);
 
 static struct pathelem *new_entry(const char *root,
                                   struct pathelem *parent,
@@ -82,7 +82,7 @@ static struct pathelem *add_dir_maybe(struct pathelem *path)
 }
 
 static struct pathelem *add_entry(struct pathelem *root, const char *name,
-                                  unsigned char type)
+                                  unsigned type)
 {
     struct pathelem **e;
 
-- 
1.7.10.4


