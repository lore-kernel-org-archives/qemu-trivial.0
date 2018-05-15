Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fIT0g-0008V6-Ny
	for mharc-qemu-trivial@gnu.org; Tue, 15 May 2018 02:00:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36245)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <olaf@aepfle.de>) id 1fIT0W-0008Th-Eg
	for qemu-trivial@nongnu.org; Tue, 15 May 2018 02:00:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <olaf@aepfle.de>) id 1fIT0S-0007Z1-EG
	for qemu-trivial@nongnu.org; Tue, 15 May 2018 02:00:20 -0400
Received: from mo6-p00-ob.smtp.rzone.de ([2a01:238:20a:202:5300::1]:13716)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <olaf@aepfle.de>)
	id 1fIT0R-0007Y7-Lg; Tue, 15 May 2018 02:00:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1526364012;
	s=strato-dkim-0002; d=aepfle.de;
	h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
	Subject:Sender;
	bh=xPQk1kGjuxs+VUyqOKMEHca6EXqf9epJfLKDbySo7o4=;
	b=hVt7ezX9qIEya6EJj22W2kDfnY2VmBP/NyAAtB4gf4Wrglw3f3vNGFBLTyDhJ7rsLq
	s40q4trcCAy0Wj5sQp3Vc2MoGxtmnYhHzYbMviv7kVDZLpGnPXL85yRSQHnCQ45jpaNf
	9hLfCmAJykNeTwsW8FCU7RsU4NBALANV2a5t5u8dyk7NGWC0EqnhNBE3Gx1v1Z5/21mV
	d8/DUqHQhN1jv6dt5bnFb6+NK0SiiLWtMgtaXRgbZJZ3t/vUYC/mdDiZR52izkPtSXF4
	s6ym23AWXFP2YhWtzk0c7bDiT/TXLEzEeAclejcgnk/0xNp0PwfPqFryI/Gi+QKN7H4v
	+xdA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgc09VbzR8stxx+XNVGnx9ZX3co74kFtJGu5gyLH"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 43.8 AUTH)
	with ESMTPSA id h032f7u4F5xt2Nt
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1
	with 521 ECDH bits, eq. 15360 bits RSA))
	(Client did not present a certificate);
	Tue, 15 May 2018 07:59:55 +0200 (CEST)
From: Olaf Hering <olaf@aepfle.de>
To: qemu-trivial@nongnu.org
Cc: Olaf Hering <olaf@aepfle.de>, Fam Zheng <famz@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org (open list:All patches CC here)
Date: Tue, 15 May 2018 07:59:48 +0200
Message-Id: <20180515055949.6446-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.16.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 2a01:238:20a:202:5300::1
Subject: [Qemu-trivial] [PATCH] replace functions which are only available
 in glib-2.24
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
X-List-Received-Date: Tue, 15 May 2018 06:00:30 -0000

Currently the minimal supported version of glib is 2.22.
Since testing is done with a glib that claims to be 2.22, but in fact
has APIs from newer version of glib, this bug was not caught during
submit of the patch referenced below.

Replace g_realloc_n, which is available only since 2.24, with g_renew.

Fixes commit 418026ca43 ("util: Introduce vfio helpers")

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---

This must go into stable-2.12.


 util/vfio-helpers.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
index 006674c916..5fd4f5f212 100644
--- a/util/vfio-helpers.c
+++ b/util/vfio-helpers.c
@@ -522,8 +522,7 @@ static IOVAMapping *qemu_vfio_add_mapping(QEMUVFIOState *s,
 
     assert(index >= 0);
     s->nr_mappings++;
-    s->mappings = g_realloc_n(s->mappings, sizeof(s->mappings[0]),
-                              s->nr_mappings);
+    s->mappings = g_renew(IOVAMapping *, s->mappings, s->nr_mappings);
     insert = &s->mappings[index];
     shift = s->nr_mappings - index - 1;
     if (shift) {
@@ -577,8 +576,7 @@ static void qemu_vfio_undo_mapping(QEMUVFIOState *s, IOVAMapping *mapping,
     memmove(mapping, &s->mappings[index + 1],
             sizeof(s->mappings[0]) * (s->nr_mappings - index - 1));
     s->nr_mappings--;
-    s->mappings = g_realloc_n(s->mappings, sizeof(s->mappings[0]),
-                              s->nr_mappings);
+    s->mappings = g_renew(IOVAMapping *, s->mappings, s->nr_mappings);
 }
 
 /* Check if the mapping list is (ascending) ordered. */

