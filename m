Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dc8O2-0004xx-WE
	for mharc-qemu-trivial@gnu.org; Mon, 31 Jul 2017 06:57:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60725)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dc8Nz-0004ts-9r
	for qemu-trivial@nongnu.org; Mon, 31 Jul 2017 06:57:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dc8Ny-0004nX-Iz
	for qemu-trivial@nongnu.org; Mon, 31 Jul 2017 06:57:19 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56349)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dc8Ns-0004ex-Hk; Mon, 31 Jul 2017 06:57:12 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 073BE42AC1;
	Mon, 31 Jul 2017 13:57:09 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id C4883B78;
	Mon, 31 Jul 2017 13:21:44 +0300 (MSK)
Received: (nullmailer pid 5548 invoked by uid 1000);
	Mon, 31 Jul 2017 10:21:45 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 31 Jul 2017 13:21:24 +0300
Message-Id: <7a0b7eba4b577bceb8aa795ae46d9812e2d6f4ca.1501496349.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1501496349.git.mjt@msgid.tls.msk.ru>
References: <cover.1501496349.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1501496349.git.mjt@msgid.tls.msk.ru>
References: <cover.1501496349.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 05/25] build-sys: there is no qemu-ga.c
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
X-List-Received-Date: Mon, 31 Jul 2017 10:57:21 -0000

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

It got moved in qga/main.c from commit 2870dc3456c9c.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Michael Roth <mdroth@linux.vnet.ibm.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index ef721480eb..97a58a0f4e 100644
--- a/Makefile
+++ b/Makefile
@@ -443,7 +443,7 @@ $(qapi-modules) $(SRC_PATH)/scripts/qapi-introspect.p=
y $(qapi-py)
 		"GEN","$@")
=20
 QGALIB_GEN=3D$(addprefix qga/qapi-generated/, qga-qapi-types.h qga-qapi-=
visit.h qga-qmp-commands.h)
-$(qga-obj-y) qemu-ga.o: $(QGALIB_GEN)
+$(qga-obj-y): $(QGALIB_GEN)
=20
 qemu-ga$(EXESUF): $(qga-obj-y) $(COMMON_LDADDS)
 	$(call LINK, $^)
--=20
2.11.0


