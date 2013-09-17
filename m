Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VLygb-0005YP-F5
	for mharc-qemu-trivial@gnu.org; Tue, 17 Sep 2013 13:03:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47776)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VLygY-0005Vd-LF
	for qemu-trivial@nongnu.org; Tue, 17 Sep 2013 13:03:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VLygX-0006yQ-1K
	for qemu-trivial@nongnu.org; Tue, 17 Sep 2013 13:03:34 -0400
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:60789
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VLygQ-0006wd-UY; Tue, 17 Sep 2013 13:03:27 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id E1441189110; Tue, 17 Sep 2013 19:03:23 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel <qemu-devel@nongnu.org>
Date: Tue, 17 Sep 2013 19:03:22 +0200
Message-Id: <1379437402-30804-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	Jan Kiszka <jan.kiszka@web.de>, Anthony Liguori <anthony@codemonkey.ws>
Subject: [Qemu-trivial] [PATCH] cpu-exec: Fix compiler warning
	(-Werror=clobbered)
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
X-List-Received-Date: Tue, 17 Sep 2013 17:03:36 -0000

'cpu' and 'env' are not modified after sigsetjmp. Therefore they will
still have their last value after longjmp restored the stack context.

The code which should "reload" both variables causes a compiler warning:

cpu-exec.c:204:15: error:
variable =E2=80=98cpu=E2=80=99 might be clobbered by =E2=80=98longjmp=E2=80=
=99 or =E2=80=98vfork=E2=80=99 [-Werror=3Dclobbered]
cpu-exec.c:202:28: error:
argument =E2=80=98env=E2=80=99 might be clobbered by =E2=80=98longjmp=E2=80=
=99 or =E2=80=98vfork=E2=80=99 [-Werror=3Dclobbered]

Remove this unneeded code.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

Jan,

could you please review this patch which removes code added by you earlie=
r?
I have run tests with the old code and assertions to see whether the valu=
es
were really smashed. They never were, and from the documentation of setjm=
p
I'd not expect that they ever might be.

The patch is needed to fix a compiler warning with -Wextra.

Thanks,
Stefan

 cpu-exec.c |    5 -----
 1 file changed, 5 deletions(-)

diff --git a/cpu-exec.c b/cpu-exec.c
index 5a43995..fbfb749 100644
--- a/cpu-exec.c
+++ b/cpu-exec.c
@@ -676,11 +676,6 @@ int cpu_exec(CPUArchState *env)
                 /* reset soft MMU for next block (it can currently
                    only be set by a memory fault) */
             } /* for(;;) */
-        } else {
-            /* Reload env after longjmp - the compiler may have smashed =
all
-             * local variables as longjmp is marked 'noreturn'. */
-            cpu =3D current_cpu;
-            env =3D cpu->env_ptr;
         }
     } /* for(;;) */
=20
--=20
1.7.10.4


