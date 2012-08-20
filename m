Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T3Zgo-00066b-EX
	for mharc-qemu-trivial@gnu.org; Mon, 20 Aug 2012 17:39:14 -0400
Received: from eggs.gnu.org ([208.118.235.92]:41644)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yann.morin.1998@free.fr>) id 1T3Zgm-00066L-Vj
	for qemu-trivial@nongnu.org; Mon, 20 Aug 2012 17:39:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <yann.morin.1998@free.fr>) id 1T3Zgl-0000Ny-G0
	for qemu-trivial@nongnu.org; Mon, 20 Aug 2012 17:39:12 -0400
Received: from smtp01.smtpout.orange.fr ([80.12.242.123]:56691
	helo=smtp.smtpout.orange.fr) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yann.morin.1998@free.fr>) id 1T3Zgl-0000NU-9Y
	for qemu-trivial@nongnu.org; Mon, 20 Aug 2012 17:39:11 -0400
Received: from treguer.bzh.lan ([90.32.34.169]) by mwinf5d54 with ME
	id p9f91j00M3ewyLA039f9Rh; Mon, 20 Aug 2012 23:39:09 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: qemu-trivial@nongnu.org
Date: Mon, 20 Aug 2012 23:39:07 +0200
Message-Id: <1345498749-16769-1-git-send-email-yann.morin.1998@free.fr>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 80.12.242.123
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: [Qemu-trivial] [PATCH 1/3] configure: fix detection for cURL libs
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

Currently, configure uses the same code-path to check for cURL libraries,
whether we are doing a static or dynamic build.

Fix that by pasing the proper arguments: '--static-libs' for curl-config
and '--static --libs' for pkg-config when a static build is attempted.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 configure |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/configure b/configure
index 60d266f..8f8ae8a 100755
--- a/configure
+++ b/configure
@@ -2077,8 +2077,10 @@ fi
 
 if $pkg_config libcurl --modversion >/dev/null 2>&1; then
   curlconfig="$pkg_config libcurl"
+  curlconfig_staticlibs="--static --libs"
 else
   curlconfig=curl-config
+  curlconfig_staticlibs="--static-libs"
 fi
 
 if test "$curl" != "no" ; then
@@ -2087,7 +2089,11 @@ if test "$curl" != "no" ; then
 int main(void) { curl_easy_init(); curl_multi_setopt(0, 0, 0); return 0; }
 EOF
   curl_cflags=`$curlconfig --cflags 2>/dev/null`
-  curl_libs=`$curlconfig --libs 2>/dev/null`
+  if test "$static" = "yes" ; then
+    curl_libs=`$curlconfig $curlconfig_staticlibs 2>/dev/null`
+  else
+    curl_libs=`$curlconfig --libs 2>/dev/null`
+  fi
   if compile_prog "$curl_cflags" "$curl_libs" ; then
     curl=yes
     libs_tools="$curl_libs $libs_tools"
-- 
1.7.2.5


