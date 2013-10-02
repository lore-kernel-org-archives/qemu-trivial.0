Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VRTR6-0000mz-N3
	for mharc-qemu-trivial@gnu.org; Wed, 02 Oct 2013 16:54:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42170)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VRTDr-0006F8-54
	for qemu-trivial@nongnu.org; Wed, 02 Oct 2013 16:40:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VRTDp-0000om-7A
	for qemu-trivial@nongnu.org; Wed, 02 Oct 2013 16:40:38 -0400
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:59721
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VRTDl-0000np-Uf; Wed, 02 Oct 2013 16:40:34 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 873EC18013F; Wed,  2 Oct 2013 22:40:30 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel <qemu-devel@nongnu.org>
Date: Wed,  2 Oct 2013 22:40:29 +0200
Message-Id: <1380746429-634-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] util/path: Fix type which is longer than 8
	bit for MinGW
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
X-List-Received-Date: Wed, 02 Oct 2013 20:40:40 -0000

While dirent->d_type is 8 bit for most systems, it is 32 bit for MinGW.
Reducing it to 8 bit results in a compiler warning because the macro
is_dir_maybe compares that 8 bit value with 32 bit constants.

Using 'unsigned' instead of 'unsigned char' matches the declaration for
MinGW and does not harm the other systems.

MinGW-w32 is not affected: it does not declare d_type.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
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


