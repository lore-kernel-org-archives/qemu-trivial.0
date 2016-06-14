Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bCqWi-0000y7-UQ
	for mharc-qemu-trivial@gnu.org; Tue, 14 Jun 2016 11:45:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46898)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1bCqWe-0000pd-G5
	for qemu-trivial@nongnu.org; Tue, 14 Jun 2016 11:45:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1bCqWc-0000Ch-En
	for qemu-trivial@nongnu.org; Tue, 14 Jun 2016 11:45:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51738)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1bCqWT-00007P-R9; Tue, 14 Jun 2016 11:45:01 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 563F97F0B3;
	Tue, 14 Jun 2016 15:45:01 +0000 (UTC)
Received: from t530wlan.home.berrange.com.com (vpn1-5-35.ams2.redhat.com
	[10.36.5.35])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5EFixDf008009; Tue, 14 Jun 2016 11:45:00 -0400
From: "Daniel P. Berrange" <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
	"Daniel P. Berrange" <berrange@redhat.com>
Date: Tue, 14 Jun 2016 16:44:57 +0100
Message-Id: <1465919097-21453-1-git-send-email-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 14 Jun 2016 15:45:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] win32: don't run subprocess tests on Mingw32
 platform
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
X-List-Received-Date: Tue, 14 Jun 2016 15:45:15 -0000

The g_test_trap_subprocess() method does not work on the
Mingw32 platform, causing the test-qdev-global-props
test case to abort

(test-logging.exe:230): GLib-ERROR **: g_test_trap_subprocess()
failed: Failed to execute helper program (No such file or directory)

This failure was introduced a while ago in

  commit 2177801a4899bf29108b3d471417a5b4d701ec29
  Author: Eduardo Habkost <ehabkost@redhat.com>
  Date:   Fri Aug 8 16:03:27 2014 -0300

    test-qdev-global-props: Run tests on subprocess

Modify the configure time check to avoid enabling this feature
on Mingw, rather than trying to rewrite the test to avoid this
feature.

Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 8c2f90b..aa291e8 100755
--- a/configure
+++ b/configure
@@ -5167,7 +5167,7 @@ if test "$bluez" = "yes" ; then
   echo "CONFIG_BLUEZ=y" >> $config_host_mak
   echo "BLUEZ_CFLAGS=$bluez_cflags" >> $config_host_mak
 fi
-if test "$glib_subprocess" = "yes" ; then
+if test "$glib_subprocess" = "yes" && test "$mingw32" != "yes" ; then
   echo "CONFIG_HAS_GLIB_SUBPROCESS_TESTS=y" >> $config_host_mak
 fi
 echo "GLIB_CFLAGS=$glib_cflags" >> $config_host_mak
-- 
2.5.5


