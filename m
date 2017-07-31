Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dc8O1-0004w4-Bo
	for mharc-qemu-trivial@gnu.org; Mon, 31 Jul 2017 06:57:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60717)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dc8Ny-0004tg-Ux
	for qemu-trivial@nongnu.org; Mon, 31 Jul 2017 06:57:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dc8Ny-0004n8-83
	for qemu-trivial@nongnu.org; Mon, 31 Jul 2017 06:57:19 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:57735)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dc8Ns-0004es-HW; Mon, 31 Jul 2017 06:57:12 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 265A342AC2;
	Mon, 31 Jul 2017 13:57:09 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 2522DB7F;
	Mon, 31 Jul 2017 13:21:45 +0300 (MSK)
Received: (nullmailer pid 5590 invoked by uid 1000);
	Mon, 31 Jul 2017 10:21:45 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 31 Jul 2017 13:21:44 +0300
Message-Id: <25e11d8774630600ef4c5e9906419a77163a28a1.1501496350.git.mjt@msgid.tls.msk.ru>
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
Subject: [Qemu-trivial] [PULL 25/25] docs: fix broken paths to
 docs/specs/ivshmem-spec.txt
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
X-List-Received-Date: Mon, 31 Jul 2017 10:57:20 -0000

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

When this file was rewritten/renamed in fdee2025dd,
a reference path was not updated.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 docs/specs/pci-ids.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/specs/pci-ids.txt b/docs/specs/pci-ids.txt
index 95adee07d6..bb99a0257e 100644
--- a/docs/specs/pci-ids.txt
+++ b/docs/specs/pci-ids.txt
@@ -40,7 +40,7 @@ maintained as part of the virtio specification.
 1af4:1100  Used as PCI Subsystem ID for existing hardware devices emulat=
ed
            by qemu.
=20
-1af4:1110  ivshmem device (shared memory, docs/specs/ivshmem_device_spec=
.txt)
+1af4:1110  ivshmem device (shared memory, docs/specs/ivshmem-spec.txt)
=20
 All other device IDs are reserved.
=20
--=20
2.11.0


