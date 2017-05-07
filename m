Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d7GoA-0001Up-79
	for mharc-qemu-trivial@gnu.org; Sun, 07 May 2017 03:40:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58175)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d7Go3-0001Qa-MZ
	for qemu-trivial@nongnu.org; Sun, 07 May 2017 03:40:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d7Go3-00074N-0c
	for qemu-trivial@nongnu.org; Sun, 07 May 2017 03:40:39 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54401)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1d7Gny-00071e-5h; Sun, 07 May 2017 03:40:34 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 4548D40476;
	Sun,  7 May 2017 10:40:32 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id CF93642E;
	Sun,  7 May 2017 10:02:31 +0300 (MSK)
Received: (nullmailer pid 26581 invoked by uid 1000);
	Sun, 07 May 2017 07:02:29 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  7 May 2017 10:02:24 +0300
Message-Id: <7f8393c41831e21228cf10e40c581826c90db4f7.1494140528.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
References: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
References: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 21/23] MAINTAINERS: Update paths for main loop
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
X-List-Received-Date: Sun, 07 May 2017 07:40:40 -0000

From: Paolo Bonzini <pbonzini@redhat.com>

Moved by c2b38b2 ("block: move AioContext, QEMUTimer, main-loop to
libqemuutil"), let's update MAINTAINERS too.

Reported-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a1d2b3a4d3..e6822b23bf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1305,8 +1305,8 @@ Main loop
 M: Paolo Bonzini <pbonzini@redhat.com>
 S: Maintained
 F: cpus.c
-F: main-loop.c
-F: qemu-timer.c
+F: util/main-loop.c
+F: util/qemu-timer.c
 F: vl.c
=20
 Human Monitor (HMP)
--=20
2.11.0


