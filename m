Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xktwg-0005xB-Ic
	for mharc-qemu-trivial@gnu.org; Sun, 02 Nov 2014 07:07:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52832)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xktwa-0005l9-7r
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 07:07:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XktwV-0004gi-At
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 07:07:40 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:46017)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XktwK-0004e5-Vf; Sun, 02 Nov 2014 07:07:25 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id D72A84028A;
	Sun,  2 Nov 2014 15:07:23 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id D84D8710;
	Sun,  2 Nov 2014 14:58:48 +0300 (MSK)
Received: (nullmailer pid 14962 invoked by uid 1000);
	Sun, 02 Nov 2014 11:58:47 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sun,  2 Nov 2014 14:57:18 +0300
Message-Id: <2944d742f73d78120151fbc62b53f2ab79be89aa.1414929285.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
References: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
References: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [Qemu-trivial] [PULL 06/23] sparse: fix build
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
X-List-Received-Date: Sun, 02 Nov 2014 12:07:41 -0000

From: Gerd Hoffmann <kraxel@redhat.com>

c++ compiler isn't wrapped with cgcc, resulting in gcc complaining about
the sparse compiler flags which it doesn't know in case qemu is built
with --enable-sparse.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 configure |    1 +
 1 file changed, 1 insertion(+)

diff --git a/configure b/configure
index a9e4d49..2f17bf3 100755
--- a/configure
+++ b/configure
@@ -4908,6 +4908,7 @@ echo "QEMU_CFLAGS=$QEMU_CFLAGS" >> $config_host_mak
 echo "QEMU_INCLUDES=$QEMU_INCLUDES" >> $config_host_mak
 if test "$sparse" = "yes" ; then
   echo "CC           := REAL_CC=\"\$(CC)\" cgcc"       >> $config_host_mak
+  echo "CXX          := REAL_CC=\"\$(CXX)\" cgcc"      >> $config_host_mak
   echo "HOST_CC      := REAL_CC=\"\$(HOST_CC)\" cgcc"  >> $config_host_mak
   echo "QEMU_CFLAGS  += -Wbitwise -Wno-transparent-union -Wno-old-initializer -Wno-non-pointer-null" >> $config_host_mak
 fi
-- 
1.7.10.4


