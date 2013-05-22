Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uf8zJ-0001WE-KT
	for mharc-qemu-trivial@gnu.org; Wed, 22 May 2013 09:21:53 -0400
Received: from eggs.gnu.org ([208.118.235.92]:49809)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1Uf8zD-0001S5-Dg
	for qemu-trivial@nongnu.org; Wed, 22 May 2013 09:21:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1Uf8z8-0000yD-OQ
	for qemu-trivial@nongnu.org; Wed, 22 May 2013 09:21:47 -0400
Received: from [216.171.111.232] (port=22743 helo=freebsd.org)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1Uf8z8-0000xs-IK
	for qemu-trivial@nongnu.org; Wed, 22 May 2013 09:21:42 -0400
Received: from emaste (uid 1001) (envelope-from emaste@freebsd.org) id 9ced0
	by freebsd.org (DragonFly Mail Agent 1);
	Wed, 22 May 2013 09:21:40 -0400
From: Ed Maste <emaste@freebsd.org>
To: qemu-devel@nongnu.org
Date: Wed, 22 May 2013 09:21:39 -0400
Message-Id: <1369228899-74124-1-git-send-email-emaste@freebsd.org>
X-Mailer: git-send-email 1.7.11.5
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 216.171.111.232
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] configure: remove confusing file manipulation
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
X-List-Received-Date: Wed, 22 May 2013 13:21:52 -0000

The configure script had some code to manipulate config-host.ld~ (i.e.,
a common backup filename), comparing it with the newly-generated file.
I believe the sense of the comparison was backwards.

Since it seemed to serve little purpose anyway, remove it to avoid any
confusion.

Signed-off-by: Ed Maste <emaste@freebsd.org>
---
 configure | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/configure b/configure
index 5ae7e4a..cfdb564 100755
--- a/configure
+++ b/configure
@@ -4104,17 +4104,8 @@ if test "$gcov" = "yes" ; then
 fi
 
 # generate list of library paths for linker script
-
 $ld --verbose -v 2> /dev/null | grep SEARCH_DIR > ${config_host_ld}
 
-if test -f ${config_host_ld}~ ; then
-  if cmp -s $config_host_ld ${config_host_ld}~ ; then
-    mv ${config_host_ld}~ $config_host_ld
-  else
-    rm ${config_host_ld}~
-  fi
-fi
-
 # use included Linux headers
 if test "$linux" = "yes" ; then
   mkdir -p linux-headers
-- 
1.7.11.5


