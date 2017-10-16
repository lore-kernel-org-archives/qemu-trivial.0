Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4CE2-0006lf-DP
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 16:43:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52031)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1e4CDz-0006gU-7B
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 16:43:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1e4CDx-0006T2-8i
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 16:42:58 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:57549)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1e4CDt-0006QT-Kj; Mon, 16 Oct 2017 16:42:53 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 44B3F40D2F;
	Mon, 16 Oct 2017 23:42:52 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 669A8C38;
	Mon, 16 Oct 2017 23:33:44 +0300 (MSK)
Received: (nullmailer pid 12338 invoked by uid 1000);
	Mon, 16 Oct 2017 20:33:42 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 16 Oct 2017 23:33:41 +0300
Message-Id: <6b4f250bfc529bdf73a10ca6873a460175e666cc.1508185933.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1508185933.git.mjt@msgid.tls.msk.ru>
References: <cover.1508185933.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1508185933.git.mjt@msgid.tls.msk.ru>
References: <cover.1508185933.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 14/14] Add myself as maintainer for TPM code
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
X-List-Received-Date: Mon, 16 Oct 2017 20:43:00 -0000

From: Stefan Berger <stefanb@linux.vnet.ibm.com>

Also add backends/tpm.c to the list of files.

Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
Acked-by: Markus Armbruster <armbru@redhat.com>
Acked-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 MAINTAINERS | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 162e914a2d..cee32914bd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1535,12 +1535,14 @@ F: docs/devel/tracing.txt
 T: git git://github.com/stefanha/qemu.git tracing
=20
 TPM
-S: Orphan
+M: Stefan Berger <stefanb@linux.vnet.ibm.com>
+S: Maintained
 F: tpm.c
 F: hw/tpm/*
 F: include/hw/acpi/tpm.h
 F: include/sysemu/tpm*
 F: qapi/tpm.json
+F: backends/tpm.c
=20
 Checkpatch
 S: Odd Fixes
--=20
2.11.0


