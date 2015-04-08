Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YfvcH-0005eE-KO
	for mharc-qemu-trivial@gnu.org; Wed, 08 Apr 2015 15:26:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59594)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cmchao@gmail.com>) id 1YfuKw-0001Wj-Fn
	for qemu-trivial@nongnu.org; Wed, 08 Apr 2015 14:04:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cmchao@gmail.com>) id 1YfuKv-0001JW-Iv
	for qemu-trivial@nongnu.org; Wed, 08 Apr 2015 14:04:26 -0400
Received: from mail-pd0-x230.google.com ([2607:f8b0:400e:c02::230]:35380)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cmchao@gmail.com>)
	id 1YfuKt-0001IS-G3; Wed, 08 Apr 2015 14:04:23 -0400
Received: by pddn5 with SMTP id n5so123211406pdd.2;
	Wed, 08 Apr 2015 11:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=AXbdAsaBBGWHu1eEkEKjA3PKWW7CdNqsvEeSpu4Vn9U=;
	b=0faFml46aiBLE67LYb8ojLX6QJ7qcZ6iLzSiii5zUlN8ejg0ZGp0MVtEEl5HwvioVT
	QgxXYaJTwtrHBKr3VXr0ov6scqQFeU8ZMxf3Fz8nKnMADte6XCgezpqyej2WJ+U+Ndxj
	0cLUJuutZ8P6EozY+Wa0CZ4EV+XqRPlcn2EihkCwQ06sqUcj3sinQTfc2opRZ8O+6yE6
	0+mysghQOOAXDPm9Aqyc3Qt294T/qqXQ1S6cEoAxtzqxB9NRnLlfKIN4r4SbaI0QdcJJ
	FY9fnX1xSbxekiOmCzinyU3d4IN92U0v9h8+/x8Jc68/GveT0SIioXJOeX9LNc+u2WYY
	Dyag==
X-Received: by 10.70.93.69 with SMTP id cs5mr679380pdb.165.1428516262775;
	Wed, 08 Apr 2015 11:04:22 -0700 (PDT)
Received: from localhost.localdomain (118-167-152-188.dynamic.hinet.net.
	[118.167.152.188])
	by mx.google.com with ESMTPSA id w1sm11968593pdp.25.2015.04.08.11.04.21
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Apr 2015 11:04:22 -0700 (PDT)
From: Chih-Min Chao <cmchao@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu,  9 Apr 2015 02:04:11 +0800
Message-Id: <1428516254-23054-3-git-send-email-cmchao@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1428516254-23054-1-git-send-email-cmchao@gmail.com>
References: <1428516254-23054-1-git-send-email-cmchao@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::230
X-Mailman-Approved-At: Wed, 08 Apr 2015 15:26:23 -0400
Cc: qemu-trivial@nongnu.org, kraxel@redhat.com,
	Chih-Min Chao <cmchao@gmail.com>
Subject: [Qemu-trivial] [PATCH 2/5] ui/vnc : fix coding style
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
X-List-Received-Date: Wed, 08 Apr 2015 18:04:27 -0000

    reported by checkpatch.pl

Signed-off-by: Chih-Min Chao <cmchao@gmail.com>
---
 ui/vnc-auth-vencrypt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/ui/vnc-auth-vencrypt.c b/ui/vnc-auth-vencrypt.c
index a420ccb..65f1afa 100644
--- a/ui/vnc-auth-vencrypt.c
+++ b/ui/vnc-auth-vencrypt.c
@@ -65,7 +65,8 @@ static void start_auth_vencrypt_subauth(VncState *vs)
 
 static void vnc_tls_handshake_io(void *opaque);
 
-static int vnc_start_vencrypt_handshake(struct VncState *vs) {
+static int vnc_start_vencrypt_handshake(struct VncState *vs)
+{
     int ret;
 
     if ((ret = gnutls_handshake(vs->tls.session)) < 0) {
@@ -100,7 +101,8 @@ static int vnc_start_vencrypt_handshake(struct VncState *vs) {
     return 0;
 }
 
-static void vnc_tls_handshake_io(void *opaque) {
+static void vnc_tls_handshake_io(void *opaque)
+{
     struct VncState *vs = (struct VncState *)opaque;
 
     VNC_DEBUG("Handshake IO continue\n");
-- 
1.9.1


