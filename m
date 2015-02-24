Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YQ3Ni-0004jr-4w
	for mharc-qemu-trivial@gnu.org; Mon, 23 Feb 2015 19:29:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56027)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jacereda@gmail.com>) id 1YQ3Nf-0004d1-AX
	for qemu-trivial@nongnu.org; Mon, 23 Feb 2015 19:29:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jacereda@gmail.com>) id 1YQ3Nd-0002Em-RO
	for qemu-trivial@nongnu.org; Mon, 23 Feb 2015 19:29:42 -0500
Received: from mail-wg0-x232.google.com ([2a00:1450:400c:c00::232]:33604)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jacereda@gmail.com>)
	id 1YQ3NX-0002C6-DI; Mon, 23 Feb 2015 19:29:35 -0500
Received: by wghb13 with SMTP id b13so2115526wgh.0;
	Mon, 23 Feb 2015 16:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:date:message-id
	:cc:to:mime-version;
	bh=qm+0tQ9trjGjBPmnhz4Bb0/hOz4qD012hQog8sp7wpU=;
	b=XmLb+ytu+vDrC5TYZndYejtG9ExxjFCpp1I6ACkFcic8PC9DUaVe6IAZ9MkurcJ9QM
	bqtVMXMOd82MhF9+v3LCNTzpHGm9mE/RcUyn0O3MFdJigrT8dEdh6hAWrg/BWEatuv0p
	LcLTDEUC51E9QTQ2d69qKo/3dPSyaqn0KCa3lxThow9QGiheb1fSBMTkHj2LXdaqQuQm
	G6ENVP4na2y5irxOnuuy39uSuN+b0fjT6YPi6/WZ/GyMotMY9SLcIyYzH0L8j0DNtK33
	rMneBi41k19pBbUVn38fgT+n/EYDB4MH7+OfdIaDwQVzyITvYT3sAxIoe9/SnNZuQcM7
	ZyPw==
X-Received: by 10.180.92.136 with SMTP id cm8mr25725875wib.41.1424737774566;
	Mon, 23 Feb 2015 16:29:34 -0800 (PST)
Received: from [192.168.0.106] ([185.39.42.1])
	by mx.google.com with ESMTPSA id 18sm57778551wjr.46.2015.02.23.16.29.32
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 23 Feb 2015 16:29:33 -0800 (PST)
From: =?utf-8?Q?Jorge_Acereda_Maci=C3=A1?= <jacereda@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Feb 2015 01:29:34 +0100
Message-Id: <A24CCA9D-484A-4AD0-A34C-8DFB6D891D7F@gmail.com>
To: qemu-devel@nongnu.org
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
X-Mailer: Apple Mail (2.2070.6)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::232
Cc: qemu-trivial@nongnu.org, kraxel@redhat.com, aliguori@amazon.com
Subject: [Qemu-trivial] [PATCH] Fix crash when connecting to VNC through
	websocket
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
X-List-Received-Date: Tue, 24 Feb 2015 00:29:44 -0000

Please, forget my previous patch, worked somehow with Chrome but failed =
with Safari (with a good reason, the sent headers were incorrect). This =
one should be correct and simpler.

Signed-off-by: Jorge Acereda Macia <jacereda@gmail.com>

---
 ui/vnc-ws.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/ui/vnc-ws.c b/ui/vnc-ws.c
index e304baf..d75950d 100644
--- a/ui/vnc-ws.c
+++ b/ui/vnc-ws.c
@@ -207,8 +207,7 @@ static void vncws_send_handshake_response(VncState =
*vs, const char* key)
     }
=20
     response =3D g_strdup_printf(WS_HANDSHAKE, accept);
-    vnc_write(vs, response, strlen(response));
-    vnc_flush(vs);
+    vnc_client_write_buf(vs, (const uint8_t *)response, =
strlen(response));
=20
     g_free(accept);
     g_free(response);
--=20
1.9.3 (Apple Git-50)



