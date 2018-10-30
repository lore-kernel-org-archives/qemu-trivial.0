Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHS9f-0002au-Av
	for mharc-qemu-trivial@gnu.org; Tue, 30 Oct 2018 07:25:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58803)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gHS9Z-0002WB-6Q
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 07:25:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gHS9Q-0004Df-G5
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 07:25:38 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:36277)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gHS95-0003N3-Os; Tue, 30 Oct 2018 07:25:16 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MfYc4-1fbleG2Ssa-00g3MY; Tue, 30 Oct 2018 12:24:12 +0100
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MfYc4-1fbleG2Ssa-00g3MY; Tue, 30 Oct 2018 12:24:12 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cleber Rosa <crosa@redhat.com>,
	Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Anthony Perard <anthony.perard@citrix.com>,
	Aurelien Jarno <aurelien@aurel32.net>, Max Reitz <mreitz@redhat.com>,
	Fam Zheng <famz@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Stefano Stabellini <sstabellini@kernel.org>, qemu-trivial@nongnu.org,
	qemu-block@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
	xen-devel@lists.xenproject.org, Gerd Hoffmann <kraxel@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <lvivier@redhat.com>,
	Michael Walle <michael@walle.cc>, Markus Armbruster <armbru@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Date: Tue, 30 Oct 2018 12:23:30 +0100
Message-Id: <20181030112337.17973-14-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181030112337.17973-1-laurent@vivier.eu>
References: <20181030112337.17973-1-laurent@vivier.eu>
X-Provags-ID: V03:K1:7fBwOV45VO0pIDxAfapM/ah0RhizImgZJxgvW5VAB+D0Q8q0Qjs
	5+96auVkeKmjT68irIXPp395Iu9qoJkYtJcIqmumqdxcac6arB5JvBmaivSFXhYdIQfAn/B
	IdQPh6kULgZSvyn4xLfmcD6xkvdzjQD7wTrzQaFnj8DDTiu6skX3OaX0HNkr/1el05Ioo1n
	PEghlp0GRDR8B+FtI9jyA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:JFjVUsmZIcY=:6A+G8CXaCFLZaUJAAJZS9e
	N12OXqNNFERafHKukwqPjmBIy+w7VvO5UdezU+TkRXrcuOkplzUubU5JKhppnD8S0M71w/ScS
	Ik36JRtLoGSvtrN6Zv+TxxHat6lUzMmH7NoD5NPmrSyB3ujIoEKAVEJenYmDcAOhj1jyEh7tb
	DEEaFCx1w1RztjgDVD0ppXivcAOjGuJV3221XIHh94bdNTRcthUiopiCTeTvN82Yb3pcVk8UA
	VbgzjyAPSrPg+U6Q1BL0+Q/43mZkEAqhy5swU9H9xnUQXymv3c8QfvxRVPgc2gCOb8R9CJ6Y3
	qaBBYAjLFkud8d1KU6Q1ghPu6FWTaqc0jOxcWxxUZUb5SKIiKD4Z8BCP1zqcRFnZXldBHBqLU
	0YM0oSzbymNIKo4kYd/mOU1gz85w3PWzJB9IF6FhDOfU9ZnIWdhLkmz5HtccGelBdPlWa20of
	BUMH7rX6A6MLspGtcM11yM0EMwtjCFy1mg3pcDeWU+UNoEuJ4wADhHtT+nrYqJb1uEi9btwR7
	EltaY9/WqqTfDaVGEBpeTH7tbKHaCKwiXcdD1pVi1s6jG60i0SPts0wpJzwHsomU3vFkviiFZ
	+oOwNxxAdzO14fUOJk/yPY1EEUFn8H/rsMi8NZWKbn1j8vPRV7VhwUjPP3P89kAIo2RoukKoc
	B4feq/mP7ox6KmjO5fnvpXWkL+y7FyfeVbJNZZGK7njxOB5+Pmi6i6OKnpQBcpo7Ovds=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.134
Subject: [Qemu-trivial] [PULL v2 13/20] configure: Support pkg-config for
 zlib
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
X-List-Received-Date: Tue, 30 Oct 2018 11:25:50 -0000

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


