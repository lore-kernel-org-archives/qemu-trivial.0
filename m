Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YQlH2-0004ZM-Rz
	for mharc-qemu-trivial@gnu.org; Wed, 25 Feb 2015 18:21:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52130)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jacereda@gmail.com>) id 1YQlH0-0004Td-HE
	for qemu-trivial@nongnu.org; Wed, 25 Feb 2015 18:21:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jacereda@gmail.com>) id 1YQlGz-0006cm-1M
	for qemu-trivial@nongnu.org; Wed, 25 Feb 2015 18:21:46 -0500
Received: from mail-we0-x231.google.com ([2a00:1450:400c:c03::231]:33784)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jacereda@gmail.com>)
	id 1YQlGu-0006bB-K3; Wed, 25 Feb 2015 18:21:40 -0500
Received: by wevk48 with SMTP id k48so6751488wev.0;
	Wed, 25 Feb 2015 15:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:date:message-id
	:cc:to:mime-version;
	bh=mqf4TUpag0lISbXDMDxdEKWy4oe3LZWIYKrkdR6lMQ8=;
	b=TLY8KGVsjz39dBrA4+xV5Lqq5DL8kW3uhGcTRrOVqVNwDRoZ4JkV64RPKuiTWHCmNJ
	al6ZHJ9dDTjkRYbLrLRjD7NadaYS05/pUl97v+T5OMEgdUCsuW6iw4dOC+zBpjvfeLav
	HBY9LWYrJ7efC2TFHo/mfuPKJ5Bj/EI8XUEA4J+OkBJ9+5omL96IFUuTqrLQHbZHB6yQ
	xjk5yvH5zsmszrRSdBMWbe7HsqbbwuygVANv+CNq7xaHyrPZWHJuZbY21fPSv1MyWHQG
	QhVIYJduvmpPw28tSqZA5E8y+ftKOiKrCSQSwO5byVLtQmE+DsDgFFaSC5EgVF4EW06a
	PpNw==
X-Received: by 10.194.21.137 with SMTP id v9mr10700494wje.140.1424906499690;
	Wed, 25 Feb 2015 15:21:39 -0800 (PST)
Received: from [192.168.0.101] ([185.39.42.1])
	by mx.google.com with ESMTPSA id u16sm27702632wjr.5.2015.02.25.15.21.38
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 25 Feb 2015 15:21:38 -0800 (PST)
From: =?utf-8?Q?Jorge_Acereda_Maci=C3=A1?= <jacereda@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Feb 2015 00:21:39 +0100
Message-Id: <8A3EBB15-2138-4AC6-92B7-B0DA9825225A@gmail.com>
To: qemu-devel@nongnu.org
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
X-Mailer: Apple Mail (2.2070.6)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c03::231
Cc: qemu-trivial@nongnu.org, kraxel@redhat.com, aliguori@amazon.com
Subject: [Qemu-trivial] [PATCH v2] Fix crash when connecting to VNC through
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
X-List-Received-Date: Wed, 25 Feb 2015 23:21:47 -0000


Connecting to VNC through websocket crashes in vnc_flush() when trying
to acquire a mutex that hasn't been initialized (vnc_init_state(vs)
hasn't been called at this point).

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



