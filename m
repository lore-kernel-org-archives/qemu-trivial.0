Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bk5BX-0001dM-Qy
	for mharc-qemu-trivial@gnu.org; Wed, 14 Sep 2016 04:04:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33901)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk5BV-0001bG-6Q
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 04:04:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk5BT-00063x-3r
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 04:04:44 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48152)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bk5BL-0005zZ-Gr; Wed, 14 Sep 2016 04:04:35 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A442441845;
	Wed, 14 Sep 2016 11:04:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 55658B10;
	Wed, 14 Sep 2016 10:59:00 +0300 (MSK)
Received: (nullmailer pid 17362 invoked by uid 1000);
	Wed, 14 Sep 2016 07:58:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 14 Sep 2016 10:58:51 +0300
Message-Id: <b18932285e4889d5b902749d813ae24e39eea5a1.1473839869.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
References: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
References: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 25/27] win32: don't run subprocess tests on
 Mingw32 platform
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
X-List-Received-Date: Wed, 14 Sep 2016 08:04:47 -0000

From: Eduardo Habkost <ehabkost@redhat.com>

On Tue, Jun 14, 2016 at 04:44:57PM +0100, Daniel P. Berrange wrote:
> The g_test_trap_subprocess() method does not work on the
> Mingw32 platform, causing the test-qdev-global-props
> test case to abort
>
> (test-logging.exe:230): GLib-ERROR **: g_test_trap_subprocess()
> failed: Failed to execute helper program (No such file or directory)
>
> This failure was introduced a while ago in
>
>   commit 2177801a4899bf29108b3d471417a5b4d701ec29
>   Author: Eduardo Habkost <ehabkost@redhat.com>
>   Date:   Fri Aug 8 16:03:27 2014 -0300
>
>     test-qdev-global-props: Run tests on subprocess
>
> Modify the configure time check to avoid enabling this feature
> on Mingw, rather than trying to rewrite the test to avoid this
> feature.

I would do the following instead, just in case we have extra code
looking at $glib_subprocess one day.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index d4388a6..e6b2c45 100755
--- a/configure
+++ b/configure
@@ -3023,7 +3023,7 @@ fi
 
 # g_test_trap_subprocess added in 2.38. Used by some tests.
 glib_subprocess=yes
-if ! $pkg_config --atleast-version=2.38 glib-2.0; then
+if test "$mingw32" = "yes" || ! $pkg_config --atleast-version=2.38 glib-2.0; then
     glib_subprocess=no
 fi
 
-- 
2.1.4


