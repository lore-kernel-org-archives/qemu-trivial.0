Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TGxqo-0005Sj-9T
	for mharc-qemu-trivial@gnu.org; Wed, 26 Sep 2012 16:04:54 -0400
Received: from eggs.gnu.org ([208.118.235.92]:56425)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TGxql-0005Js-Ca
	for qemu-trivial@nongnu.org; Wed, 26 Sep 2012 16:04:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TGxqd-0007Dl-WC
	for qemu-trivial@nongnu.org; Wed, 26 Sep 2012 16:04:51 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:55973)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1TGxqb-0007Bb-F1; Wed, 26 Sep 2012 16:04:41 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	95FA77280039; Wed, 26 Sep 2012 22:04:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id zD9EIJn1CxrT; Wed, 26 Sep 2012 22:04:39 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 050C2728003A; Wed, 26 Sep 2012 22:04:39 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Wed, 26 Sep 2012 22:04:38 +0200
Message-Id: <1348689878-11544-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Anthony Liguori <aliguori@us.ibm.com>
Subject: [Qemu-trivial] [PATCH] configure: Support empty target list
	(--target-list=)
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
X-List-Received-Date: Wed, 26 Sep 2012 20:04:52 -0000

Specifying an empty target list with --target-list= is shorter
than specifying --disable-user --disable-system.

Both variants should give the same result: no targets at all.

This modification implements that feature.

It uses a trick which works with POSIX compliant shells to test whether
target_list is undefined (=> default targets) or empty (=> no targets).

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 configure |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 8f99b7b..769ec1a 100755
--- a/configure
+++ b/configure
@@ -125,7 +125,8 @@ cc_i386=i386-pc-linux-gnu-gcc
 libs_qga=""
 debug_info="yes"
 
-target_list=""
+# Don't accept a target_list environment variable.
+unset target_list
 
 # Default value for a variable defining feature "foo".
 #  * foo="no"  feature will only be used if --enable-foo arg is given
@@ -1281,7 +1282,7 @@ if ! "$python" -c 'import sys; sys.exit(sys.version_info < (2,4) or sys.version_
   exit 1
 fi
 
-if test -z "$target_list" ; then
+if test -z "${target_list+xxx}" ; then
     target_list="$default_target_list"
 else
     target_list=`echo "$target_list" | sed -e 's/,/ /g'`
-- 
1.7.10


