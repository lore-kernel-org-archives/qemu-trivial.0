Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVHqS-000088-UN
	for mharc-qemu-trivial@gnu.org; Wed, 12 Jul 2017 09:38:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59423)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dVHqQ-00005U-At
	for qemu-trivial@nongnu.org; Wed, 12 Jul 2017 09:38:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dVHqO-0005PS-QF
	for qemu-trivial@nongnu.org; Wed, 12 Jul 2017 09:38:22 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56061)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dVHqJ-0005Jh-4J; Wed, 12 Jul 2017 09:38:15 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 626AC40F64;
	Wed, 12 Jul 2017 16:38:13 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id CB282ACD;
	Wed, 12 Jul 2017 16:38:12 +0300 (MSK)
Received: (nullmailer pid 29036 invoked by uid 1000);
	Wed, 12 Jul 2017 13:38:12 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 12 Jul 2017 16:37:59 +0300
Message-Id: <5f37e6d4a7b22ccf1bb8fa4eb35784d90ff78fbc.1499866676.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1499866676.git.mjt@msgid.tls.msk.ru>
References: <cover.1499866676.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1499866676.git.mjt@msgid.tls.msk.ru>
References: <cover.1499866676.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 03/13] configure: Fix build with pkg-config
 and --static --enable-sdl
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
X-List-Received-Date: Wed, 12 Jul 2017 13:38:23 -0000

From: Thomas Huth <thuth@redhat.com>

The configure script prefers pkg-config over sdl-config, but
the "--static-libs" parameter only exists for the latter. With
pkg-config, "--static --libs" have to be used instead.

Buglink: https://bugs.launchpad.net/qemu/+bug/984516
Signed-off-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 configure | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 806658c98b..ce7e8aa842 100755
--- a/configure
+++ b/configure
@@ -2733,7 +2733,11 @@ int main( void ) { return SDL_Init (SDL_INIT_VIDEO); }
 EOF
   sdl_cflags=$($sdlconfig --cflags 2>/dev/null)
   if test "$static" = "yes" ; then
-    sdl_libs=$($sdlconfig --static-libs 2>/dev/null)
+    if $pkg_config $sdlname --exists; then
+      sdl_libs=$($pkg_config $sdlname --static --libs 2>/dev/null)
+    else
+      sdl_libs=$($sdlconfig --static-libs 2>/dev/null)
+    fi
   else
     sdl_libs=$($sdlconfig --libs 2>/dev/null)
   fi
-- 
2.11.0


