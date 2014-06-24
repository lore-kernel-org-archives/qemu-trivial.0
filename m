Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WzXi3-0006Ht-LT
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jun 2014 16:52:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43613)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1WzXhx-00069g-63
	for qemu-trivial@nongnu.org; Tue, 24 Jun 2014 16:52:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1WzXhs-0002wZ-8r
	for qemu-trivial@nongnu.org; Tue, 24 Jun 2014 16:52:49 -0400
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:35033)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1WzXhi-0002v0-1A; Tue, 24 Jun 2014 16:52:34 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 843E617FD63; Tue, 24 Jun 2014 22:52:30 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Tue, 24 Jun 2014 22:52:29 +0200
Message-Id: <1403643149-30440-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] oslib-posix: Fix new compiler error with
	-Wclobbered
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
X-List-Received-Date: Tue, 24 Jun 2014 20:52:54 -0000

Newer versions of gcc report a warning (or an error with -Werror) when
compiler option -Wclobbered (or -Wextra) is active:

util/oslib-posix.c:372:12: error:
 variable =E2=80=98hpagesize=E2=80=99 might be clobbered by =E2=80=98long=
jmp=E2=80=99 or =E2=80=98vfork=E2=80=99 [-Werror=3Dclobbered]

The rewritten code fixes this warning: variable 'hpagesize' is now set an=
d
used in a block without any call of sigsetjmp or similar functions.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 util/oslib-posix.c |   30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 1524ead..cdbfb2e 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -366,10 +366,9 @@ static size_t fd_getpagesize(int fd)
=20
 void os_mem_prealloc(int fd, char *area, size_t memory)
 {
-    int ret, i;
+    int ret;
     struct sigaction act, oldact;
     sigset_t set, oldset;
-    size_t hpagesize =3D fd_getpagesize(fd);
=20
     memset(&act, 0, sizeof(act));
     act.sa_handler =3D &sigbus_handler;
@@ -389,19 +388,22 @@ void os_mem_prealloc(int fd, char *area, size_t mem=
ory)
     if (sigsetjmp(sigjump, 1)) {
         fprintf(stderr, "os_mem_prealloc: failed to preallocate pages\n"=
);
         exit(1);
-    }
+    } else {
+        int i;
+        size_t hpagesize =3D fd_getpagesize(fd);
=20
-    /* MAP_POPULATE silently ignores failures */
-    memory =3D (memory + hpagesize - 1) & -hpagesize;
-    for (i =3D 0; i < (memory/hpagesize); i++) {
-        memset(area + (hpagesize*i), 0, 1);
-    }
+        /* MAP_POPULATE silently ignores failures */
+        memory =3D (memory + hpagesize - 1) & -hpagesize;
+        for (i =3D 0; i < (memory / hpagesize); i++) {
+            memset(area + (hpagesize * i), 0, 1);
+        }
=20
-    ret =3D sigaction(SIGBUS, &oldact, NULL);
-    if (ret) {
-        perror("os_mem_prealloc: failed to reinstall signal handler");
-        exit(1);
-    }
+        ret =3D sigaction(SIGBUS, &oldact, NULL);
+        if (ret) {
+            perror("os_mem_prealloc: failed to reinstall signal handler"=
);
+            exit(1);
+        }
=20
-    pthread_sigmask(SIG_SETMASK, &oldset, NULL);
+        pthread_sigmask(SIG_SETMASK, &oldset, NULL);
+    }
 }
--=20
1.7.10.4


