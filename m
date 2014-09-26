Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XXZRo-0005lH-H7
	for mharc-qemu-trivial@gnu.org; Fri, 26 Sep 2014 13:36:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35178)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XXZRi-0005bK-GN
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 13:36:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XXZRe-0003n5-HA
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 13:36:42 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:57926)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XXZRW-0003jF-0Q; Fri, 26 Sep 2014 13:36:30 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id F1D0246F66;
	Fri, 26 Sep 2014 21:36:18 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id CE2E66C6;
	Fri, 26 Sep 2014 21:36:18 +0400 (MSK)
Received: (nullmailer pid 29112 invoked by uid 1000);
	Fri, 26 Sep 2014 17:36:18 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 26 Sep 2014 21:36:08 +0400
Message-Id: <1411752976-29051-5-git-send-email-mjt@msgid.tls.msk.ru>
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
Subject: [Qemu-trivial] [PULL 04/12] .travis.yml: pre-seed sub-modules for
	speed
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
X-List-Received-Date: Fri, 26 Sep 2014 17:36:46 -0000

From: Alex Benn=C3=A9e <alex.bennee@linaro.org>

A significant portion of the build time is spent initialising all the
sub-modules we use in the source tree. Often this is almost as long as
the build itself. By pre-seeding the .git/modules tree this will
hopefully improve things.

Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Reviewed-by: Alexander Graf <agraf@suse.de>
Reviewed-by: Brian Jackson <iggy@theiggy.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 .travis.yml |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/.travis.yml b/.travis.yml
index f113339..b9025be 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -37,7 +37,11 @@ env:
     - TARGETS=3Dunicore32-softmmu,unicore32-linux-user
     # Group remaining softmmu only targets into one build
     - TARGETS=3Dlm32-softmmu,moxie-softmmu,tricore-softmmu,xtensa-softmm=
u,xtensaeb-softmmu
+git:
+  # we want to do this ourselves
+  submodules: false
 before_install:
+  - wget -O - http://people.linaro.org/~alex.bennee/qemu-submodule-git-s=
eed.tar.xz | tar -xvJ
   - git submodule update --init --recursive
   - sudo apt-get update -qq
   - sudo apt-get install -qq ${CORE_PKGS} ${NET_PKGS} ${GUI_PKGS} ${EXTR=
A_PKGS}
--=20
1.7.10.4


