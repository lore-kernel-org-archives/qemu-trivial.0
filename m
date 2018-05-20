Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fKIEc-000844-Sh
	for mharc-qemu-trivial@gnu.org; Sun, 20 May 2018 02:54:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47670)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1fKIEa-0007vn-GX
	for qemu-trivial@nongnu.org; Sun, 20 May 2018 02:54:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1fKIEZ-0002Oi-Qr
	for qemu-trivial@nongnu.org; Sun, 20 May 2018 02:54:24 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52015)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1fKIEV-0002Jc-Ae; Sun, 20 May 2018 02:54:19 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 45E9F4112C;
	Sun, 20 May 2018 09:54:18 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 15CCD10C0;
	Sun, 20 May 2018 09:15:13 +0300 (MSK)
Received: (nullmailer pid 7391 invoked by uid 1000);
	Sun, 20 May 2018 06:15:11 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-trivial@nongnu.org, Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun, 20 May 2018 09:14:58 +0300
Message-Id: <7647d5c6b5e3b3f36a6e0441c81ae3fe797eb233.1526796813.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1526796813.git.mjt@msgid.tls.msk.ru>
References: <cover.1526796813.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1526796813.git.mjt@msgid.tls.msk.ru>
References: <cover.1526796813.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 12/22] tests: fix tpm-crb tpm-tis tests race
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
X-List-Received-Date: Sun, 20 May 2018 06:54:25 -0000

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

No need to close the TPM data socket on the emulator end, qemu will
close it after a SHUTDOWN. This avoids a race between close() and
read() in the TPM data thread.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 tests/tpm-emu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/tpm-emu.c b/tests/tpm-emu.c
index 4dada76834..8c2bd53cad 100644
--- a/tests/tpm-emu.c
+++ b/tests/tpm-emu.c
@@ -125,7 +125,7 @@ void *tpm_emu_ctrl_thread(void *data)
         case CMD_SHUTDOWN: {
             ptm_res res =3D 0;
             qio_channel_write(ioc, (char *)&res, sizeof(res), &error_abo=
rt);
-            qio_channel_close(s->tpm_ioc, &error_abort);
+            /* the tpm data thread is expected to finish now */
             g_thread_join(s->emu_tpm_thread);
             break;
         }
--=20
2.11.0


