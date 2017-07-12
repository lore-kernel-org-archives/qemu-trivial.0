Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVHqV-0000BK-7N
	for mharc-qemu-trivial@gnu.org; Wed, 12 Jul 2017 09:38:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59359)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dVHqP-0008Vf-1G
	for qemu-trivial@nongnu.org; Wed, 12 Jul 2017 09:38:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dVHqO-0005OK-4A
	for qemu-trivial@nongnu.org; Wed, 12 Jul 2017 09:38:20 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51619)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dVHqI-0005Iv-51; Wed, 12 Jul 2017 09:38:14 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id C4E6040F62;
	Wed, 12 Jul 2017 16:38:12 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id A1AC8ACA;
	Wed, 12 Jul 2017 16:38:12 +0300 (MSK)
Received: (nullmailer pid 29044 invoked by uid 1000);
	Wed, 12 Jul 2017 13:38:12 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 12 Jul 2017 16:38:03 +0300
Message-Id: <c8e1158cf611000eca67761eb19847c8e156e180.1499866676.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1499866676.git.mjt@msgid.tls.msk.ru>
References: <cover.1499866676.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1499866676.git.mjt@msgid.tls.msk.ru>
References: <cover.1499866676.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 07/13] elf-loader: warn about invalid
 endianness
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
X-List-Received-Date: Wed, 12 Jul 2017 13:38:22 -0000

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

fprintf(stderr) is how errors are reported in this file.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/core/loader.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/core/loader.c b/hw/core/loader.c
index f72930ca4a..3409cc6d1d 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -478,6 +478,7 @@ int load_elf_ram(const char *filename,
     }
=20
     if (target_data_order !=3D e_ident[EI_DATA]) {
+        fprintf(stderr, "%s: wrong endianness\n", filename);
         ret =3D ELF_LOAD_WRONG_ENDIAN;
         goto fail;
     }
--=20
2.11.0


