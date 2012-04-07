Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SGQ08-0001sL-QR
	for mharc-qemu-trivial@gnu.org; Sat, 07 Apr 2012 03:24:00 -0400
Received: from eggs.gnu.org ([208.118.235.92]:56358)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SGQ01-0001Vl-DS
	for qemu-trivial@nongnu.org; Sat, 07 Apr 2012 03:23:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SGPzz-0008J6-SO
	for qemu-trivial@nongnu.org; Sat, 07 Apr 2012 03:23:52 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:38705)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1SGPzv-0008Hd-KN; Sat, 07 Apr 2012 03:23:47 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	35EB072800B5; Sat,  7 Apr 2012 09:23:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id G4AYpIqp3Wjl; Sat,  7 Apr 2012 09:23:45 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 62D1D72800B6; Sat,  7 Apr 2012 09:23:45 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Sat,  7 Apr 2012 09:23:38 +0200
Message-Id: <1333783419-7982-4-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.9
In-Reply-To: <1333783419-7982-1-git-send-email-sw@weilnetz.de>
References: <1333783419-7982-1-git-send-email-sw@weilnetz.de>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: Anthony Liguori <aliguori@us.ibm.com>, qemu-trivial@nongnu.org,
	Stefan Weil <sw@weilnetz.de>, Alexander Graf <agraf@suse.de>,
	Blue Swirl <blauwirbel@gmail.com>, Richard Henderson <rth@twiddle.net>
Subject: [Qemu-trivial] [PATCH 3/4] Replace Qemu by QEMU in w32 installation
	path (prefix)
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
X-List-Received-Date: Sat, 07 Apr 2012 07:23:56 -0000

The official spelling is QEMU.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 configure     |    2 +-
 qemu-doc.texi |    6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/configure b/configure
index 5d5b854..2374b71 100755
--- a/configure
+++ b/configure
@@ -519,7 +519,7 @@ EOF
   if compile_prog "" "-liberty" ; then
     LIBS="-liberty $LIBS"
   fi
-  prefix="c:/Program Files/Qemu"
+  prefix="c:/Program Files/QEMU"
   mandir="\${prefix}"
   datadir="\${prefix}"
   docdir="\${prefix}"
diff --git a/qemu-doc.texi b/qemu-doc.texi
index d18dff0..9e07ba6 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -2709,9 +2709,9 @@ MinGW's default header and linker search paths.
 @file{make}.  If you have problems using SDL, verify that
 @file{sdl-config} can be launched from the MSYS command line.
 
-@item You can install QEMU in @file{Program Files/Qemu} by typing
+@item You can install QEMU in @file{Program Files/QEMU} by typing
 @file{make install}. Don't forget to copy @file{SDL.dll} in
-@file{Program Files/Qemu}.
+@file{Program Files/QEMU}.
 
 @end itemize
 
@@ -2745,7 +2745,7 @@ The example assumes @file{sdl-config} is installed under @file{/usr/i686-pc-ming
 MinGW cross compilation tools have names like @file{i686-pc-mingw32-gcc} and @file{i686-pc-mingw32-strip}.
 We set the @code{PATH} environment variable to ensure the MinGW version of @file{sdl-config} is used and
 use --cross-prefix to specify the name of the cross compiler.
-You can also use --prefix to set the Win32 install path which defaults to @file{c:/Program Files/Qemu}.
+You can also use --prefix to set the Win32 install path which defaults to @file{c:/Program Files/QEMU}.
 
 Under Fedora Linux, you can run:
 @example
-- 
1.7.9


