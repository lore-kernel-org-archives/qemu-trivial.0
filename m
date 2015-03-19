Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YYWOv-0004a7-VF
	for mharc-qemu-trivial@gnu.org; Thu, 19 Mar 2015 05:06:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55523)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYWOq-0004QQ-9y
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 05:05:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYWOp-0004ml-DB
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 05:05:56 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53233)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YYWOh-0004kK-GD; Thu, 19 Mar 2015 05:05:47 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E62E641E44;
	Thu, 19 Mar 2015 12:05:44 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id B131B91E;
	Thu, 19 Mar 2015 12:05:44 +0300 (MSK)
Received: (nullmailer pid 337 invoked by uid 1000);
	Thu, 19 Mar 2015 09:05:44 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 19 Mar 2015 12:05:25 +0300
Message-Id: <fbe95bfb654f5f79778c9f292e55a67f91f5cc37.1426755483.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1426755483.git.mjt@msgid.tls.msk.ru>
References: <cover.1426755483.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [Qemu-trivial] [PULL 07/24] qom: Fix warning from Sparse
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
X-List-Received-Date: Thu, 19 Mar 2015 09:05:59 -0000

From: Stefan Weil <sw@weilnetz.de>

Sparse report:

qom/cpu.c:99:5: warning: returning void-valued expression

Cc: Andreas F=C3=A4rber <afaerber@suse.de>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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


