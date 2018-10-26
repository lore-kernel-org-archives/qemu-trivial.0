Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gG4JD-0004pM-0X
	for mharc-qemu-trivial@gnu.org; Fri, 26 Oct 2018 11:45:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49905)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gG4J7-0003tV-AW
	for qemu-trivial@nongnu.org; Fri, 26 Oct 2018 11:45:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gG47G-0005Z6-2i
	for qemu-trivial@nongnu.org; Fri, 26 Oct 2018 11:33:38 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:46289)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gG46n-0005Ha-J6; Fri, 26 Oct 2018 11:33:11 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1N2SXX-1faiyG0v0B-013yG4; Fri, 26 Oct 2018 17:32:07 +0200
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1N2SXX-1faiyG0v0B-013yG4; Fri, 26 Oct 2018 17:32:07 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
	Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
	Michael Walle <michael@walle.cc>, Laurent Vivier <lvivier@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Cleber Rosa <crosa@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, xen-devel@lists.xenproject.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
	Fam Zheng <famz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Aurelien Jarno <aurelien@aurel32.net>, Kevin Wolf <kwolf@redhat.com>,
	qemu-block@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
	Eduardo Habkost <ehabkost@redhat.com>, Stefan Weil <sw@weilnetz.de>
Date: Fri, 26 Oct 2018 17:31:18 +0200
Message-Id: <20181026153125.24738-14-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181026153125.24738-1-laurent@vivier.eu>
References: <20181026153125.24738-1-laurent@vivier.eu>
X-Provags-ID: V03:K1:nHwqIfD7U1p4B2yoxOg3RbD7c0Q74lJnwOwV3+memYJKXd3VPHe
	ukJt7WzZgTFF8QfTFWEH8S+Kf/pXvB56SNq79YrtKkct5Bc1bE62Zqold5ehue7Ngj6gXZh
	ic4RlJ9ug1N1xqIQLYFSHfDHmWQrNQNJII4YgJ9s/ruhmlhI0LVhrIjrNYsS161Z4ZQTuKq
	dKIkAR8/79m8hupRwCipQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:u0w10T44iq4=:9aPSRBKTLB6nG1raNJUVAo
	IYRblKzQ+KTyDtQ5cT/QxcnxjdO49BCoiVJHMAEjzye5s+4S9kjyXuoCI8Tkkt21yBPP0OWdv
	Dr3qGNEEGXw9IUyGQm5/aMVxIsq5CG83Y5pyS+ovvttzW0MYl/ELBNfDUSxt44VEDbVSo4ned
	MsvIrXR3OOy+uNW+p3BzEOnaVRUCGJMzqShk8XdgN3G1ERVd6pjFmBwTP9/8C6CcGyrAodSof
	uqd6KajrBc9i1pyszFjLIC9pgSXPsLsrcw6jYMGnQ/Gzm2kXzrmLR8D/1Vyq7dKkJSCbaLH1T
	gBvSfUd0l+7fhqn+bOcRYtMVFL3Kwj7YMDHNMwbZL9h2hF9U3I3M/EK0MyZq5YV8cds8xYDzf
	GDGrKjUpEZglB82W3MmQLxOhh/t2gSfUW0PHmM1ngibCUXy9AdubtpOIU548idKOEOTjvxpVT
	/NDq2RzWYsW7/iUHPZFC7ocJR++HqEV8ITNdJoispY6ycRT/yH10zJZoefv9yTb9/t1lvEau6
	FyvbdlPtubEFjF/OexQiSoq+t24OgmoPIz7VxoNiNcLpyfRCHUUf3Vpq6GRpPk9B6q00P/k1V
	E4EcwT9Wy7fM3v/5XallPkxURFRxwoEPCJgAAdX2UGeRjsyml4M5iPua4zPeCAfOyYU9trVH3
	Ul9Ee0TcZx1paAZ66Su+q25L2H952IEeRu1bLXrcs5HoVDGyMnznCjR1P6FGpMk+MGrE=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.133
Subject: [Qemu-trivial] [PULL 13/20] configure: Support pkg-config for zlib
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
X-List-Received-Date: Fri, 26 Oct 2018 15:45:56 -0000

From: Stefan Weil <sw@weilnetz.de>

This is needed for builds with the mingw64-* packages from Cygwin,
but also works for Linux.

Move the zlib test also more to the end because users should
get information on the really important missing packages
(which also require zlib) first.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20180712192603.11599-1-sw@weilnetz.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 configure | 40 +++++++++++++++++++++++-----------------
 1 file changed, 23 insertions(+), 17 deletions(-)

diff --git a/configure b/configure
index 1ee09bd112..a02df30dde 100755
--- a/configure
+++ b/configure
@@ -2151,23 +2151,6 @@ EOF
   fi
 fi
 
-#########################################
-# zlib check
-
-if test "$zlib" != "no" ; then
-    cat > $TMPC << EOF
-#include <zlib.h>
-int main(void) { zlibVersion(); return 0; }
-EOF
-    if compile_prog "" "-lz" ; then
-        :
-    else
-        error_exit "zlib check failed" \
-            "Make sure to have the zlib libs and headers installed."
-    fi
-fi
-LIBS="$LIBS -lz"
-
 ##########################################
 # lzo check
 
@@ -3479,6 +3462,29 @@ if ! compile_prog "$glib_cflags -Werror" "$glib_libs" ; then
     fi
 fi
 
+#########################################
+# zlib check
+
+if test "$zlib" != "no" ; then
+    if $pkg_config --exists zlib; then
+        zlib_cflags=$($pkg_config --cflags zlib)
+        zlib_libs=$($pkg_config --libs zlib)
+        QEMU_CFLAGS="$zlib_cflags $QEMU_CFLAGS"
+        LIBS="$zlib_libs $LIBS"
+    else
+        cat > $TMPC << EOF
+#include <zlib.h>
+int main(void) { zlibVersion(); return 0; }
+EOF
+        if compile_prog "" "-lz" ; then
+            LIBS="$LIBS -lz"
+        else
+            error_exit "zlib check failed" \
+                "Make sure to have the zlib libs and headers installed."
+        fi
+    fi
+fi
+
 ##########################################
 # SHA command probe for modules
 if test "$modules" = yes; then
-- 
2.17.2


