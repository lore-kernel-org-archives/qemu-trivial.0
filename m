Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7hFq-0004FP-U8
	for mharc-qemu-trivial@gnu.org; Wed, 24 Jun 2015 05:46:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39445)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1Z7hFo-0004DS-GH
	for qemu-trivial@nongnu.org; Wed, 24 Jun 2015 05:46:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1Z7hFn-0007Wx-Et
	for qemu-trivial@nongnu.org; Wed, 24 Jun 2015 05:46:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59200)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>)
	id 1Z7hFZ-0007OH-C7; Wed, 24 Jun 2015 05:45:45 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 0B79936B4F0;
	Wed, 24 Jun 2015 09:45:44 +0000 (UTC)
Received: from dgilbert-t530.redhat.com (ovpn-116-87.ams2.redhat.com
	[10.36.116.87])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5O9jgQU012142; Wed, 24 Jun 2015 05:45:42 -0400
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 24 Jun 2015 10:45:42 +0100
Message-Id: <1435139142-21227-1-git-send-email-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, mst@redhat.com
Subject: [Qemu-trivial] [PATCH 1/1] Fix glib_subprocess test
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
X-List-Received-Date: Wed, 24 Jun 2015 09:46:01 -0000

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

A typo means that the tests dependent on glib with subprocess
support are never run.

Fixes: 9d41401b90fa10b335d2e739149d36437cfbf622

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index f02510b..3063739 100755
--- a/configure
+++ b/configure
@@ -4773,7 +4773,7 @@ if test "$bluez" = "yes" ; then
   echo "CONFIG_BLUEZ=y" >> $config_host_mak
   echo "BLUEZ_CFLAGS=$bluez_cflags" >> $config_host_mak
 fi
-if test "glib_subprocess" = "yes" ; then
+if test "$glib_subprocess" = "yes" ; then
   echo "CONFIG_HAS_GLIB_SUBPROCESS_TESTS=y" >> $config_host_mak
 fi
 echo "GLIB_CFLAGS=$glib_cflags" >> $config_host_mak
-- 
2.4.3


