Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZugcS-0007a0-Fw
	for mharc-qemu-trivial@gnu.org; Fri, 06 Nov 2015 07:59:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33628)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZugcM-0007LZ-Es
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 07:59:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZugcL-0004q9-94
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 07:59:46 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:38249)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZugcF-0004hN-Re; Fri, 06 Nov 2015 07:59:40 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0DE9E40D82;
	Fri,  6 Nov 2015 15:59:39 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 38E50AD5;
	Fri,  6 Nov 2015 15:44:06 +0300 (MSK)
Received: (nullmailer pid 31711 invoked by uid 1000);
	Fri, 06 Nov 2015 12:44:03 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri,  6 Nov 2015 15:43:56 +0300
Message-Id: <258133bda9a6f22ba436ef9b63b7c086cc80190b.1446813769.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1446813768.git.mjt@msgid.tls.msk.ru>
References: <cover.1446813768.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 19/24] ivshmem-server: fix possible OVERRUN
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
X-List-Received-Date: Fri, 06 Nov 2015 12:59:47 -0000

From: Gonglei <arei.gonglei@huawei.com>

>>>     CID 1337991:  Memory - illegal accesses  (OVERRUN)
>>>     Decrementing "i". The value of "i" is now 65534.
218         while (i--) {
219             event_notifier_cleanup(&peer->vectors[i]);
220         }

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 contrib/ivshmem-server/ivshmem-server.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/contrib/ivshmem-server/ivshmem-server.c b/contrib/ivshmem-se=
rver/ivshmem-server.c
index 5e5239c..d9e26b0 100644
--- a/contrib/ivshmem-server/ivshmem-server.c
+++ b/contrib/ivshmem-server/ivshmem-server.c
@@ -168,7 +168,9 @@ ivshmem_server_handle_new_conn(IvshmemServer *server)
     }
     if (i =3D=3D G_MAXUINT16) {
         IVSHMEM_SERVER_DEBUG(server, "cannot allocate new client id\n");
-        goto fail;
+        close(newfd);
+        g_free(peer);
+        return -1;
     }
     peer->id =3D server->cur_id++;
=20
--=20
2.1.4


