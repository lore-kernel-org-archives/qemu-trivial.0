Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XXZRm-0005id-Ia
	for mharc-qemu-trivial@gnu.org; Fri, 26 Sep 2014 13:36:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35153)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XXZRg-0005Xq-K4
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 13:36:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XXZRc-0003mJ-CH
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 13:36:40 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56537)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XXZRQ-0003hJ-GY; Fri, 26 Sep 2014 13:36:24 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id CAF5746F65;
	Fri, 26 Sep 2014 21:36:18 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id B402770F;
	Fri, 26 Sep 2014 21:36:18 +0400 (MSK)
Received: (nullmailer pid 29110 invoked by uid 1000);
	Fri, 26 Sep 2014 17:36:18 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 26 Sep 2014 21:36:07 +0400
Message-Id: <1411752976-29051-4-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1411752976-29051-1-git-send-email-mjt@tls.msk.ru>
References: <1411752976-29051-1-git-send-email-mjt@tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [Qemu-trivial] [PULL 03/12] .travis.yml: make the make slightly
	more parallel
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
X-List-Received-Date: Fri, 26 Sep 2014 17:36:44 -0000

From: Alex Benn=C3=A9e <alex.bennee@linaro.org>

The Travis VMs have 1.5 cores so we might as well make some use of the
paralellism.

Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Reviewed-by: Alexander Graf <agraf@suse.de>
Reviewed-by: Brian Jackson <iggy@theiggy.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 .travis.yml |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/.travis.yml b/.travis.yml
index 72cfc9f..f113339 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -41,7 +41,10 @@ before_install:
   - git submodule update --init --recursive
   - sudo apt-get update -qq
   - sudo apt-get install -qq ${CORE_PKGS} ${NET_PKGS} ${GUI_PKGS} ${EXTR=
A_PKGS}
-script: "./configure --target-list=3D${TARGETS} ${EXTRA_CONFIG} && make =
&& ${TEST_CMD}"
+before_script:
+  - ./configure --target-list=3D${TARGETS} --enable-debug-tcg ${EXTRA_CO=
NFIG}
+script:
+  - make -j2 && {TEST_CMD}
 matrix:
   # We manually include a number of additional build for non-standard bi=
ts
   include:
--=20
1.7.10.4


