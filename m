Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dc8O1-0004wO-HH
	for mharc-qemu-trivial@gnu.org; Mon, 31 Jul 2017 06:57:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60716)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dc8Ny-0004tf-Ux
	for qemu-trivial@nongnu.org; Mon, 31 Jul 2017 06:57:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dc8Ny-0004nF-8q
	for qemu-trivial@nongnu.org; Mon, 31 Jul 2017 06:57:19 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:36261)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dc8Ns-0004et-Ha; Mon, 31 Jul 2017 06:57:12 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 358CD42AC4;
	Mon, 31 Jul 2017 13:57:09 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 861A3B83;
	Mon, 31 Jul 2017 13:21:45 +0300 (MSK)
Received: (nullmailer pid 5567 invoked by uid 1000);
	Mon, 31 Jul 2017 10:21:45 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 31 Jul 2017 13:21:33 +0300
Message-Id: <72cd500b725fd9a3bbefeb468d54c192fdc28318.1501496349.git.mjt@msgid.tls.msk.ru>
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
Subject: [Qemu-trivial] [PULL 14/25] linux-user/sh4: fix incorrect memory
 write
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

not hit since 2009! :)

linux-user/elfload.c:1102:20: warning: Out of bound memory access (access=
 exceeds upper limit of memory block)
        (*regs[i]) =3D tswap32(env->gregs[i]);
        ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 linux-user/elfload.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 2a902f7806..79062882ba 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -1099,7 +1099,7 @@ static inline void elf_core_copy_regs(target_elf_gr=
egset_t *regs,
     int i;
=20
     for (i =3D 0; i < 16; i++) {
-        (*regs[i]) =3D tswapreg(env->gregs[i]);
+        (*regs)[i] =3D tswapreg(env->gregs[i]);
     }
=20
     (*regs)[TARGET_REG_PC] =3D tswapreg(env->pc);
--=20
2.11.0


