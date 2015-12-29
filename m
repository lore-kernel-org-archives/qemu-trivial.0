Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aDqp1-0000xX-Mi
	for mharc-qemu-trivial@gnu.org; Tue, 29 Dec 2015 04:44:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52955)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aDqoz-0000vH-H6
	for qemu-trivial@nongnu.org; Tue, 29 Dec 2015 04:44:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aDqoy-0006bJ-LH
	for qemu-trivial@nongnu.org; Tue, 29 Dec 2015 04:44:01 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:33398)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aDqos-0006YU-Fr; Tue, 29 Dec 2015 04:43:54 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id D11E742519;
	Tue, 29 Dec 2015 12:43:42 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 33E89A81;
	Tue, 29 Dec 2015 12:43:42 +0300 (MSK)
Received: (nullmailer pid 5199 invoked by uid 1000);
	Tue, 29 Dec 2015 09:43:42 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: Riku Voipio <riku.voipio@iki.fi>, qemu-devel@nongnu.org
Date: Tue, 29 Dec 2015 12:43:39 +0300
Message-Id: <1451382219-5159-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PATCH trivial] unicore32: convert
	get_sp_from_cpustate from macro to inline
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
X-List-Received-Date: Tue, 29 Dec 2015 09:44:02 -0000

All other architectures define get_sp_from_cpustate as an inline function=
,
only unicore32 uses a #define.  With this, some usages are impossible, fo=
r
example, enabling sigaltstack in linux-user/syscall.c results in

linux-user/syscall.c: In function =E2=80=98do_syscall=E2=80=99:
linux-user/syscall.c:8299:39: error: dereferencing =E2=80=98void *=E2=80=99=
 pointer [-Werror]
  get_sp_from_cpustate(arg1, arg2, get_sp_from_cpustate((CPUArchState *)c=
pu_env));
                                       ^
linux-user/syscall.c:8299:39: error: request for member =E2=80=98regs=E2=80=
=99 in something not a structure or union

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 linux-user/unicore32/target_signal.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/linux-user/unicore32/target_signal.h b/linux-user/unicore32/=
target_signal.h
index 8b255c4..7c44238 100644
--- a/linux-user/unicore32/target_signal.h
+++ b/linux-user/unicore32/target_signal.h
@@ -21,6 +21,10 @@ typedef struct target_sigaltstack {
 #define TARGET_SS_ONSTACK               1
 #define TARGET_SS_DISABLE               2
=20
-#define get_sp_from_cpustate(cpustate)  (cpustate->regs[29])
+static inline abi_ulong get_sp_from_cpustate(CPUUniCore32State *state)
+{
+    return state->regs[29];
+}
+
=20
 #endif /* TARGET_SIGNAL_H */
--=20
2.1.4


