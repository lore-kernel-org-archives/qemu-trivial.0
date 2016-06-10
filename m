Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bBNzV-0004gI-Kq
	for mharc-qemu-trivial@gnu.org; Fri, 10 Jun 2016 11:04:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58795)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bBNzT-0004dI-2m
	for qemu-trivial@nongnu.org; Fri, 10 Jun 2016 11:04:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bBNzR-0007XZ-08
	for qemu-trivial@nongnu.org; Fri, 10 Jun 2016 11:04:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37149)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1bBNzL-0007U6-9r; Fri, 10 Jun 2016 11:04:47 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 50A201055F;
	Fri, 10 Jun 2016 15:04:46 +0000 (UTC)
Received: from thh440s.fritz.box (vpn1-6-25.ams2.redhat.com [10.36.6.25])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5AF4ii9025969; Fri, 10 Jun 2016 11:04:45 -0400
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org
Date: Fri, 10 Jun 2016 17:04:44 +0200
Message-Id: <1465571084-19885-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 10 Jun 2016 15:04:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] configure: Remove unused
 CONFIG_SIGEV_THREAD_ID switch
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Jun 2016 15:04:56 -0000

The CONFIG_SIGEV_THREAD_ID switch is unused since the related code
has been removed by commit 6d327171551a12b937c5718073b9848d0274c74d
("aio / timers: Remove alarm timers"), so it can safely be removed
nowadays.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/configure b/configure
index 8c2f90b..469aa45 100755
--- a/configure
+++ b/configure
@@ -4178,24 +4178,6 @@ if compile_prog "" "" ; then
 fi
 
 ##########################################
-# check if we have usable SIGEV_THREAD_ID
-
-sigev_thread_id=no
-cat > $TMPC << EOF
-#include <signal.h>
-int main(void) {
-  struct sigevent ev;
-  ev.sigev_notify = SIGEV_THREAD_ID;
-  ev._sigev_un._tid = 0;
-  asm volatile("" : : "g"(&ev));
-  return 0;
-}
-EOF
-if compile_prog "" "" ; then
-    sigev_thread_id=yes
-fi
-
-##########################################
 # check if trace backend exists
 
 $python "$source_path/scripts/tracetool.py" "--backends=$trace_backends" --check-backends  > /dev/null 2> /dev/null
@@ -4862,7 +4844,6 @@ echo "preadv support    $preadv"
 echo "fdatasync         $fdatasync"
 echo "madvise           $madvise"
 echo "posix_madvise     $posix_madvise"
-echo "sigev_thread_id   $sigev_thread_id"
 echo "uuid support      $uuid"
 echo "libcap-ng support $cap_ng"
 echo "vhost-net support $vhost_net"
@@ -5277,9 +5258,6 @@ fi
 if test "$posix_madvise" = "yes" ; then
   echo "CONFIG_POSIX_MADVISE=y" >> $config_host_mak
 fi
-if test "$sigev_thread_id" = "yes" ; then
-  echo "CONFIG_SIGEV_THREAD_ID=y" >> $config_host_mak
-fi
 
 if test "$spice" = "yes" ; then
   echo "CONFIG_SPICE=y" >> $config_host_mak
-- 
1.8.3.1


