Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ekQHc-0007Se-Id
	for mharc-qemu-trivial@gnu.org; Sat, 10 Feb 2018 03:13:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60491)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ekQHY-0007Np-HX
	for qemu-trivial@nongnu.org; Sat, 10 Feb 2018 03:13:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ekQHV-0003Nh-Or
	for qemu-trivial@nongnu.org; Sat, 10 Feb 2018 03:13:12 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:44469)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ekQHP-0003Fo-T0; Sat, 10 Feb 2018 03:13:04 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A8EE540C55;
	Sat, 10 Feb 2018 11:13:02 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id CE55F7B8;
	Sat, 10 Feb 2018 10:55:16 +0300 (MSK)
Received: (nullmailer pid 22803 invoked by uid 1000);
	Sat, 10 Feb 2018 07:55:14 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sat, 10 Feb 2018 10:55:03 +0300
Message-Id: <123ac0bba97597ae79915c4691b95515b60f00e7.1518249254.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1518249254.git.mjt@msgid.tls.msk.ru>
References: <cover.1518249254.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1518249254.git.mjt@msgid.tls.msk.ru>
References: <cover.1518249254.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 08/17] configure: Allow capstone=git only if
 git update is not disabled
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
X-List-Received-Date: Sat, 10 Feb 2018 08:13:14 -0000

From: Alexey Kardashevskiy <aik@ozlabs.ru>

Even with --disable-git-update, ./configure tries updating the capstone
submodule instead of marking it "no"; this disables capstone submodule
if git update is disabled.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 62562f08cf..c1bbf17559 100755
--- a/configure
+++ b/configure
@@ -4568,7 +4568,7 @@ case "$capstone" in
   "" | yes)
     if $pkg_config capstone; then
       capstone=system
-    elif test -e "${source_path}/.git" ; then
+    elif test -e "${source_path}/.git" -a $git_update = 'yes' ; then
       capstone=git
     elif test -e "${source_path}/capstone/Makefile" ; then
       capstone=internal
-- 
2.11.0


