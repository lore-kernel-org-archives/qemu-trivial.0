Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bjqFd-0000b3-CI
	for mharc-qemu-trivial@gnu.org; Tue, 13 Sep 2016 12:08:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40039)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bjqFY-0000Ut-Bt
	for qemu-trivial@nongnu.org; Tue, 13 Sep 2016 12:07:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bjqFU-0004M7-Mz
	for qemu-trivial@nongnu.org; Tue, 13 Sep 2016 12:07:56 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38946)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bjqFM-0003xF-1b; Tue, 13 Sep 2016 12:07:44 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 222F2416DC;
	Tue, 13 Sep 2016 19:07:41 +0300 (MSK)
Received: from gandalf (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 9227FAFE;
	Tue, 13 Sep 2016 19:07:39 +0300 (MSK)
Received: (nullmailer pid 31916 invoked by uid 1000);
	Tue, 13 Sep 2016 16:07:39 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Changlong Xie <xiecl.fnst@cn.fujitsu.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Tue, 13 Sep 2016 19:04:55 +0300
Message-Id: <eb83c2030aa037b4c6037bfa3cbe181343dc6a8b.1473782118.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1473782118.git.mjt@tls.msk.ru>
References: <cover.1473782118.git.mjt@tls.msk.ru>
In-Reply-To: <cover.1473782118.git.mjt@tls.msk.ru>
References: <cover.1473782118.git.mjt@tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 16/16] hw/net/e1000e: Fix compiler warning
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
X-List-Received-Date: Tue, 13 Sep 2016 16:08:00 -0000

From: Changlong Xie <xiecl.fnst@cn.fujitsu.com>

slave:~/.xie/qemu-colo # gcc --version
gcc (SUSE Linux) 4.3.4 [gcc-4_3-branch revision 152973]

slave:~/.xie/qemu-colo # make -j8
CC    hw/net/e1000e_core.o
hw/net/e1000e_core.c:56: warning: =E2=80=98e1000e_set_interrupt_cause=E2=80=
=99 declared inline after being called
hw/net/e1000e_core.c:56: warning: previous declaration of =E2=80=98e1000e=
_set_interrupt_cause=E2=80=99 was here
LINK  x86_64-softmmu/qemu-system-x86_64

Signed-off-by: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
Reviewed-by: Dmitry Fleytman <dmitry@daynix.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/net/e1000e_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index badb1fe..e0bd31c 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -52,7 +52,7 @@
                                      second according to spec 10.2.4.2 *=
/
 #define E1000E_MAX_TX_FRAGS (64)
=20
-static void
+static inline void
 e1000e_set_interrupt_cause(E1000ECore *core, uint32_t val);
=20
 static inline void
--=20
2.1.4


