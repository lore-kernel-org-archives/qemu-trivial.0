Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dc7zm-0003Tb-TW
	for mharc-qemu-trivial@gnu.org; Mon, 31 Jul 2017 06:32:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54691)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dc7zj-0003Qi-Cc
	for qemu-trivial@nongnu.org; Mon, 31 Jul 2017 06:32:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dc7zg-0004V2-9G
	for qemu-trivial@nongnu.org; Mon, 31 Jul 2017 06:32:15 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59915)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dc7ze-0004TK-5P; Mon, 31 Jul 2017 06:32:10 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 5BAB442ABE;
	Mon, 31 Jul 2017 13:32:09 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 5FAC3B8E;
	Mon, 31 Jul 2017 13:21:46 +0300 (MSK)
Received: (nullmailer pid 5573 invoked by uid 1000);
	Mon, 31 Jul 2017 10:21:45 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 31 Jul 2017 13:21:36 +0300
Message-Id: <b929f7e56f505d18bea32b08b57a8b84c6b28f30.1501496350.git.mjt@msgid.tls.msk.ru>
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
Subject: [Qemu-trivial] [PULL 17/25] syscall: check inotify() and eventfd()
 return value
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
X-List-Received-Date: Mon, 31 Jul 2017 10:32:16 -0000

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

linux-user/syscall.c:555:25: warning: Out of bound memory access (accesse=
d memory precedes memory block)
    target_fd_trans[fd] =3D trans;
    ~~~~~~~~~~~~~~~~~~~~^~~~~~~

Reported-by: Clang Static Analyzer
Suggested-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 linux-user/syscall.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 81f52f7483..dfc1301e63 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -11742,7 +11742,9 @@ abi_long do_syscall(void *cpu_env, int num, abi_l=
ong arg1,
 #if defined(TARGET_NR_inotify_init) && defined(__NR_inotify_init)
     case TARGET_NR_inotify_init:
         ret =3D get_errno(sys_inotify_init());
-        fd_trans_register(ret, &target_inotify_trans);
+        if (ret >=3D 0) {
+            fd_trans_register(ret, &target_inotify_trans);
+        }
         break;
 #endif
 #ifdef CONFIG_INOTIFY1
@@ -11750,7 +11752,9 @@ abi_long do_syscall(void *cpu_env, int num, abi_l=
ong arg1,
     case TARGET_NR_inotify_init1:
         ret =3D get_errno(sys_inotify_init1(target_to_host_bitmask(arg1,
                                           fcntl_flags_tbl)));
-        fd_trans_register(ret, &target_inotify_trans);
+        if (ret >=3D 0) {
+            fd_trans_register(ret, &target_inotify_trans);
+        }
         break;
 #endif
 #endif
@@ -11916,7 +11920,9 @@ abi_long do_syscall(void *cpu_env, int num, abi_l=
ong arg1,
 #if defined(TARGET_NR_eventfd)
     case TARGET_NR_eventfd:
         ret =3D get_errno(eventfd(arg1, 0));
-        fd_trans_register(ret, &target_eventfd_trans);
+        if (ret >=3D 0) {
+            fd_trans_register(ret, &target_eventfd_trans);
+        }
         break;
 #endif
 #if defined(TARGET_NR_eventfd2)
@@ -11930,7 +11936,9 @@ abi_long do_syscall(void *cpu_env, int num, abi_l=
ong arg1,
             host_flags |=3D O_CLOEXEC;
         }
         ret =3D get_errno(eventfd(arg1, host_flags));
-        fd_trans_register(ret, &target_eventfd_trans);
+        if (ret >=3D 0) {
+            fd_trans_register(ret, &target_eventfd_trans);
+        }
         break;
     }
 #endif
--=20
2.11.0


