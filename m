Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dHXzI-00076y-RK
	for mharc-qemu-trivial@gnu.org; Sun, 04 Jun 2017 12:02:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35169)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dHXzE-00073D-Jy
	for qemu-trivial@nongnu.org; Sun, 04 Jun 2017 12:02:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dHXzE-0003yp-0b
	for qemu-trivial@nongnu.org; Sun, 04 Jun 2017 12:02:40 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51801)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dHXzA-0003wY-81; Sun, 04 Jun 2017 12:02:36 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 37177404E7;
	Sun,  4 Jun 2017 19:02:34 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id CA9BF5F3;
	Sun,  4 Jun 2017 18:45:29 +0300 (MSK)
Received: (nullmailer pid 16395 invoked by uid 1000);
	Sun, 04 Jun 2017 15:45:27 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  4 Jun 2017 18:45:24 +0300
Message-Id: <22c3aea8dbaac8616db71b6adf18dee801a24fde.1496591095.git.mjt@msgid.tls.msk.ru>
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
Subject: [Qemu-trivial] [PULL 20/22] dump: fix memory_mapping_filter leak
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
X-List-Received-Date: Sun, 04 Jun 2017 16:02:41 -0000

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Spotted by ASAN.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 memory_mapping.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/memory_mapping.c b/memory_mapping.c
index 6a39d71da2..a5d38552a6 100644
--- a/memory_mapping.c
+++ b/memory_mapping.c
@@ -337,6 +337,7 @@ void memory_mapping_filter(MemoryMappingList *list, i=
nt64_t begin,
         if (cur->phys_addr >=3D begin + length ||
             cur->phys_addr + cur->length <=3D begin) {
             QTAILQ_REMOVE(&list->head, cur, next);
+            g_free(cur);
             list->num--;
             continue;
         }
--=20
2.11.0


