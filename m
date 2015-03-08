Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YUfra-0003ze-5s
	for mharc-qemu-trivial@gnu.org; Sun, 08 Mar 2015 14:23:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50815)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1YUfrX-0003vN-DX
	for qemu-trivial@nongnu.org; Sun, 08 Mar 2015 14:23:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1YUfrW-0007do-MK
	for qemu-trivial@nongnu.org; Sun, 08 Mar 2015 14:23:39 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:46118)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1YUfrS-0007cm-GA; Sun, 08 Mar 2015 14:23:34 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 6D04717F9E9; Sun,  8 Mar 2015 19:23:32 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Trivial <qemu-trivial@nongnu.org>
Date: Sun,  8 Mar 2015 19:23:32 +0100
Message-Id: <1425839012-28716-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: Stefan Weil <sw@weilnetz.de>, QEMU Developer <qemu-devel@nongnu.org>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [Qemu-trivial] =?utf-8?q?=5BPATCH_6/7=5D_qom=3A_Fix_warning_from_?=
	=?utf-8?q?Sparse?=
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
X-List-Received-Date: Sun, 08 Mar 2015 18:23:40 -0000

Sparse report:

qom/cpu.c:99:5: warning: returning void-valued expression

Cc: Andreas F=C3=A4rber <afaerber@suse.de>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 qom/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qom/cpu.c b/qom/cpu.c
index 970377e..108bfa2 100644
--- a/qom/cpu.c
+++ b/qom/cpu.c
@@ -96,7 +96,7 @@ void cpu_get_memory_mapping(CPUState *cpu, MemoryMappin=
gList *list,
 {
     CPUClass *cc =3D CPU_GET_CLASS(cpu);
=20
-    return cc->get_memory_mapping(cpu, list, errp);
+    cc->get_memory_mapping(cpu, list, errp);
 }
=20
 static void cpu_common_get_memory_mapping(CPUState *cpu,
--=20
2.1.4


