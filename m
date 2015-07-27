Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZJoTp-0003I9-OY
	for mharc-qemu-trivial@gnu.org; Mon, 27 Jul 2015 15:54:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58014)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZJoTk-000349-Mj
	for qemu-trivial@nongnu.org; Mon, 27 Jul 2015 15:54:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZJoTk-0002cG-07
	for qemu-trivial@nongnu.org; Mon, 27 Jul 2015 15:54:28 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45944)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZJoTe-0002a0-EH; Mon, 27 Jul 2015 15:54:22 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id DBBAE425B3;
	Mon, 27 Jul 2015 22:54:20 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id BF893A57;
	Mon, 27 Jul 2015 22:54:20 +0300 (MSK)
Received: (nullmailer pid 9527 invoked by uid 1000);
	Mon, 27 Jul 2015 19:54:20 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 27 Jul 2015 22:54:09 +0300
Message-Id: <7155f2ca9d66f5598fd8d071e71d6758019a6e48.1438026619.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1438026619.git.mjt@msgid.tls.msk.ru>
References: <cover.1438026619.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>
Subject: [Qemu-trivial] [PULL 06/10] vmstate: remove unused declaration
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
X-List-Received-Date: Mon, 27 Jul 2015 19:54:29 -0000

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com>

Since 38e0735e, register_device_unmigratable() has been removed

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/migration/vmstate.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index f51ff69..2e5a97d 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -75,9 +75,6 @@ int register_savevm_live(DeviceState *dev,
                          void *opaque);
=20
 void unregister_savevm(DeviceState *dev, const char *idstr, void *opaque=
);
-void register_device_unmigratable(DeviceState *dev, const char *idstr,
-                                                                void *op=
aque);
-
=20
 typedef struct VMStateInfo VMStateInfo;
 typedef struct VMStateDescription VMStateDescription;
--=20
2.1.4


