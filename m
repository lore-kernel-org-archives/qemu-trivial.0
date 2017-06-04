Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dHXpb-0006vx-Ev
	for mharc-qemu-trivial@gnu.org; Sun, 04 Jun 2017 11:52:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32771)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dHXpY-0006sG-C8
	for qemu-trivial@nongnu.org; Sun, 04 Jun 2017 11:52:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dHXpX-0005Ac-H4
	for qemu-trivial@nongnu.org; Sun, 04 Jun 2017 11:52:40 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:49275)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dHXpS-0004y6-2Y; Sun, 04 Jun 2017 11:52:34 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 43461404D1;
	Sun,  4 Jun 2017 18:52:33 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 5A9C85ED;
	Sun,  4 Jun 2017 18:45:29 +0300 (MSK)
Received: (nullmailer pid 16389 invoked by uid 1000);
	Sun, 04 Jun 2017 15:45:27 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  4 Jun 2017 18:45:21 +0300
Message-Id: <7064024dee8eb8af89fe6f0d93983b7de2c72ecc.1496591095.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
References: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
References: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 17/22] qemu-ga: remove useless allocation
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
X-List-Received-Date: Sun, 04 Jun 2017 15:52:41 -0000

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

There is no need to duplicate a fixed string.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qga/commands-posix.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 284ecc6d7e..d8e412275e 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -2197,12 +2197,10 @@ static void transfer_memory_block(GuestMemoryBloc=
k *mem_blk, bool sys2memblk,
         }
     } else {
         if (mem_blk->online !=3D (strncmp(status, "online", 6) =3D=3D 0)=
) {
-            char *new_state =3D mem_blk->online ? g_strdup("online") :
-                                                g_strdup("offline");
+            const char *new_state =3D mem_blk->online ? "online" : "offl=
ine";
=20
             ga_write_sysfs_file(dirfd, "state", new_state, strlen(new_st=
ate),
                                 &local_err);
-            g_free(new_state);
             if (local_err) {
                 error_free(local_err);
                 result->response =3D
--=20
2.11.0


