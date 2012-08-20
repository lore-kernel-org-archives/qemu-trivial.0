Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T3Zgo-00066m-IQ
	for mharc-qemu-trivial@gnu.org; Mon, 20 Aug 2012 17:39:14 -0400
Received: from eggs.gnu.org ([208.118.235.92]:41636)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yann.morin.1998@free.fr>) id 1T3Zgm-00066K-Kf
	for qemu-trivial@nongnu.org; Mon, 20 Aug 2012 17:39:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <yann.morin.1998@free.fr>) id 1T3Zgl-0000Nt-Ff
	for qemu-trivial@nongnu.org; Mon, 20 Aug 2012 17:39:12 -0400
Received: from smtp01.smtpout.orange.fr ([80.12.242.123]:37925
	helo=smtp.smtpout.orange.fr) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yann.morin.1998@free.fr>) id 1T3Zgl-0000NW-9L
	for qemu-trivial@nongnu.org; Mon, 20 Aug 2012 17:39:11 -0400
Received: from treguer.bzh.lan ([90.32.34.169]) by mwinf5d54 with ME
	id p9f91j00M3ewyLA039f9Ry; Mon, 20 Aug 2012 23:39:10 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: qemu-trivial@nongnu.org
Date: Mon, 20 Aug 2012 23:39:08 +0200
Message-Id: <1345498749-16769-2-git-send-email-yann.morin.1998@free.fr>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1345498749-16769-1-git-send-email-yann.morin.1998@free.fr>
References: <1345498749-16769-1-git-send-email-yann.morin.1998@free.fr>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 80.12.242.123
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: [Qemu-trivial] [PATCH 2/3] configure: fix detection for SDL libs
	when static linking
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
X-List-Received-Date: Mon, 20 Aug 2012 21:39:13 -0000

If using pkg-config, we must use '--static --libs', not '--static-libs'
which is solely for sdl-config.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 configure |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/configure b/configure
index 8f8ae8a..5b52f9d 100755
--- a/configure
+++ b/configure
@@ -1645,9 +1645,11 @@ fi
 
 if $pkg_config sdl --modversion >/dev/null 2>&1; then
   sdlconfig="$pkg_config sdl"
+  sdlconfig_staticlibs="--static --libs"
   _sdlversion=`$sdlconfig --modversion 2>/dev/null | sed 's/[^0-9]//g'`
 elif has ${sdl_config}; then
   sdlconfig="$sdl_config"
+  sdlconfig_staticlibs="--static-libs"
   _sdlversion=`$sdlconfig --version | sed 's/[^0-9]//g'`
 else
   if test "$sdl" = "yes" ; then
@@ -1668,7 +1670,7 @@ int main( void ) { return SDL_Init (SDL_INIT_VIDEO); }
 EOF
   sdl_cflags=`$sdlconfig --cflags 2> /dev/null`
   if test "$static" = "yes" ; then
-    sdl_libs=`$sdlconfig --static-libs 2>/dev/null`
+    sdl_libs=`$sdlconfig $sdlconfig_staticlibs 2>/dev/null`
   else
     sdl_libs=`$sdlconfig --libs 2> /dev/null`
   fi
-- 
1.7.2.5


