Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UgAeG-0002As-4k
	for mharc-qemu-trivial@gnu.org; Sat, 25 May 2013 05:20:24 -0400
Received: from eggs.gnu.org ([208.118.235.92]:33610)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UgAe9-00021m-5g
	for qemu-trivial@nongnu.org; Sat, 25 May 2013 05:20:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UgAe3-0002bI-6s
	for qemu-trivial@nongnu.org; Sat, 25 May 2013 05:20:17 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52872)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UgAdt-0002KC-A0; Sat, 25 May 2013 05:20:01 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id B40504197B;
	Sat, 25 May 2013 13:20:00 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id CE47D47A; Sat, 25 May 2013 13:19:58 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-trivial@nongnu.org
Date: Sat, 25 May 2013 13:19:57 +0400
Message-Id: <1369473597-7322-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH (trivial)] don't run pkg-config for features
	explicitly disabled
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
X-List-Received-Date: Sat, 25 May 2013 09:20:23 -0000

We test pkg-config for curses and curl even if those are explicitly
disabled.  Move these tests inside `if "$feature" != "no"' sections.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 configure |   21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/configure b/configure
index 5ae7e4a..dff93f1 100755
--- a/configure
+++ b/configure
@@ -2154,13 +2154,12 @@ fi
 
 ##########################################
 # curses probe
-if test "$mingw32" = "yes" ; then
+if test "$curses" != "no" ; then
+  if test "$mingw32" = "yes" ; then
     curses_list="-lpdcurses"
-else
+  else
     curses_list="-lncurses:-lcurses:$($pkg_config --libs ncurses 2>/dev/null)"
-fi
-
-if test "$curses" != "no" ; then
+  fi
   curses_found=no
   cat > $TMPC << EOF
 #include <curses.h>
@@ -2192,14 +2191,12 @@ fi
 
 ##########################################
 # curl probe
-
-if $pkg_config libcurl --modversion >/dev/null 2>&1; then
-  curlconfig="$pkg_config libcurl"
-else
-  curlconfig=curl-config
-fi
-
 if test "$curl" != "no" ; then
+  if $pkg_config libcurl --modversion >/dev/null 2>&1; then
+    curlconfig="$pkg_config libcurl"
+  else
+    curlconfig=curl-config
+  fi
   cat > $TMPC << EOF
 #include <curl/curl.h>
 int main(void) { curl_easy_init(); curl_multi_setopt(0, 0, 0); return 0; }
-- 
1.7.10.4


