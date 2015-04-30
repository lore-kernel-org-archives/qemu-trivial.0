Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YnoEl-00060s-81
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2015 09:10:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48112)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YnoEe-0005x6-QT
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 09:10:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YnoEY-0004rW-Sr
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 09:10:36 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38511)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YnoEN-0004qH-JJ; Thu, 30 Apr 2015 09:10:19 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0848141A8B;
	Thu, 30 Apr 2015 16:10:19 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id EF214921;
	Thu, 30 Apr 2015 16:10:18 +0300 (MSK)
Received: (nullmailer pid 10837 invoked by uid 1000);
	Thu, 30 Apr 2015 13:10:18 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 30 Apr 2015 16:10:17 +0300
Message-Id: <553029351bac9f5b4f9ea72793e55f02e7677ec2.1430399272.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1430399271.git.mjt@msgid.tls.msk.ru>
References: <cover.1430399271.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: [Qemu-trivial] [PULL 42/42] openrisc: cpu: Remove unused cpu_get_pc
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
X-List-Received-Date: Thu, 30 Apr 2015 13:10:41 -0000

From: Peter Crosthwaite <crosthwaitepeter@gmail.com>

This function is not used by anything. Remove.

Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target-openrisc/cpu.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/target-openrisc/cpu.h b/target-openrisc/cpu.h
index b25324b..9e23cd0 100644
--- a/target-openrisc/cpu.h
+++ b/target-openrisc/cpu.h
@@ -415,9 +415,4 @@ static inline int cpu_mmu_index(CPUOpenRISCState *env=
)
=20
 #include "exec/exec-all.h"
=20
-static inline target_ulong cpu_get_pc(CPUOpenRISCState *env)
-{
-    return env->pc;
-}
-
 #endif /* CPU_OPENRISC_H */
--=20
2.1.4


