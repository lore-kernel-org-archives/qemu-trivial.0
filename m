Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WOlLP-0002b2-64
	for mharc-qemu-trivial@gnu.org; Sat, 15 Mar 2014 05:57:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52139)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WOlLI-0002HK-2D
	for qemu-trivial@nongnu.org; Sat, 15 Mar 2014 05:57:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WOlLD-0004Sx-Mv
	for qemu-trivial@nongnu.org; Sat, 15 Mar 2014 05:57:23 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41970)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WOlKz-0004Q8-7I; Sat, 15 Mar 2014 05:57:05 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 1486441D94;
	Sat, 15 Mar 2014 13:57:04 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 005E8662;
	Sat, 15 Mar 2014 13:57:03 +0400 (MSK)
Received: (nullmailer pid 20007 invoked by uid 1000);
	Sat, 15 Mar 2014 09:57:03 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sat, 15 Mar 2014 13:56:48 +0400
Message-Id: <1394877419-19949-3-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1394877419-19949-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1394877419-19949-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [Qemu-trivial] [PULL 02/13] .travis.yml: add a new build target
	with non-core devlibs
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
X-List-Received-Date: Sat, 15 Mar 2014 09:57:28 -0000

From: Alex Benn=C3=A9e <alex.bennee@linaro.org>

The current builds don't include all the features which are
auto-detected and then disabled when the appropriate test packages don't
exist. I've added another target that enables all known additional
packages for increased coverage. I didn't add it to the core package
list to reduce build time.

Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 .travis.yml |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/.travis.yml b/.travis.yml
index c7ff4da..286cf62 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -46,6 +46,10 @@ matrix:
     - env: TARGETS=3Di386-softmmu,x86_64-softmmu
            EXTRA_CONFIG=3D"--enable-debug --enable-tcg-interpreter"
       compiler: gcc
+    # All the extra -dev packages
+    - env: TARGETS=3Di386-softmmu,x86_64-softmmu
+           EXTRA_PKGS=3D"libaio-dev libcap-ng-dev libattr1-dev libbrlapi=
-dev uuid-dev libusb-1.0.0-dev"
+      compiler: gcc
     # Currently configure doesn't force --disable-pie
     - env: TARGETS=3Di386-softmmu,x86_64-softmmu
            EXTRA_CONFIG=3D"--enable-gprof --enable-gcov --disable-pie"
--=20
1.7.10.4


