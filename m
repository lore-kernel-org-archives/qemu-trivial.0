Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YPnU6-0000Np-Gk
	for mharc-qemu-trivial@gnu.org; Mon, 23 Feb 2015 02:31:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48093)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jacereda@gmail.com>) id 1YPeYv-0006E4-2B
	for qemu-trivial@nongnu.org; Sun, 22 Feb 2015 16:59:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jacereda@gmail.com>) id 1YPeYt-0001jA-SL
	for qemu-trivial@nongnu.org; Sun, 22 Feb 2015 16:59:41 -0500
Received: from mail-wg0-x236.google.com ([2a00:1450:400c:c00::236]:48773)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jacereda@gmail.com>)
	id 1YPeYp-0001hf-KX; Sun, 22 Feb 2015 16:59:35 -0500
Received: by mail-wg0-f54.google.com with SMTP id y19so22282668wgg.13;
	Sun, 22 Feb 2015 13:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:date:message-id
	:cc:to:mime-version;
	bh=0EtpHnfGHBuXNGwjac2BV4yS0k5VQIXTrAvIAZA/c+g=;
	b=TydHEHbVRmzqpCgi/55U2a+fEd58FXXEpaFqROydttbzT4NFVbHbXOPUwAFCI7UcOz
	IKV21VPL41Q+QySNvCRJtBxSvwaXW4kqLZtX8PINe0lLKQJ5V1N7tqm5RCax/78iTxey
	+Wgz5kkuZlnhnXf9EgPidW1MGYhtqXj71zA2qFGbkaMCha9iCThjjE/kJoz6v/bzGIZD
	nqnzj/OSj1E7T0p6JCq1SoN2SImxTH1MfgEXilYr/VEfIviyiIBMu2ssOcaDmg9tvnoC
	z+eY0dJcoQTZ5w3lZpJL9kq2gDzTgYTz8VdUAG1sl9QHqILd7IKio4HWp4ftfGCzjOdl
	HOOw==
X-Received: by 10.195.12.97 with SMTP id ep1mr16604693wjd.134.1424642374213;
	Sun, 22 Feb 2015 13:59:34 -0800 (PST)
Received: from [192.168.0.105] ([185.39.42.1]) by mx.google.com with ESMTPSA id
	vh8sm52823909wjc.12.2015.02.22.13.59.31
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 22 Feb 2015 13:59:33 -0800 (PST)
From: =?utf-8?Q?Jorge_Acereda_Maci=C3=A1?= <jacereda@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Feb 2015 22:58:30 +0100
Message-Id: <4EE0ACB8-AA07-4A62-92D1-AF866DA241FB@gmail.com>
To: qemu-devel@nongnu.org
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
X-Mailer: Apple Mail (2.2070.6)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::236
X-Mailman-Approved-At: Mon, 23 Feb 2015 02:31:17 -0500
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
X-List-Received-Date: Sun, 22 Feb 2015 21:59:41 -0000

Connecting to VNC through websocket crashes in vnc_flush() when trying
to acquire a mutex that hasn't been initialized (vnc_init_state(vs)
hasn't been called at this point).
=20
Signed-off-by: Jorge Acereda Macia <jacereda@gmail.com>

---
 ui/vnc-ws.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/vnc-ws.c b/ui/vnc-ws.c
index e304baf..30cb3ae 100644
--- a/ui/vnc-ws.c
+++ b/ui/vnc-ws.c
@@ -208,7 +208,7 @@ static void vncws_send_handshake_response(VncState =
*vs, const char* key)
=20
     response =3D g_strdup_printf(WS_HANDSHAKE, accept);
     vnc_write(vs, response, strlen(response));
-    vnc_flush(vs);
+    vnc_client_write_ws(vs);
=20
     g_free(accept);
     g_free(response);
--=20
1.9.3 (Apple Git-50)


