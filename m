Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL4yj-0002hk-KZ
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 02:11:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59671)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL4yg-0002c8-Po
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 02:11:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL4yb-0007Fz-SO
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 02:11:22 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:42909)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YL4yO-00077c-PP; Tue, 10 Feb 2015 02:11:05 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 500FC41824;
	Tue, 10 Feb 2015 10:11:03 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 7F42B95A;
	Tue, 10 Feb 2015 09:34:47 +0300 (MSK)
Received: (nullmailer pid 9367 invoked by uid 1000);
	Tue, 10 Feb 2015 06:34:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Feb 2015 09:34:06 +0300
Message-Id: <a50c7c869a4fa1c78b4c38d3419566dd25d32e90.1423549659.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
References: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 17/46] aes: remove a dead return statement
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
X-List-Received-Date: Tue, 10 Feb 2015 07:11:24 -0000

From: Paolo Bonzini <pbonzini@redhat.com>

bits is checked to be 128, 192 or 256 at the beginning of the function.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 util/aes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/aes.c b/util/aes.c
index 6058f19..3d7c4be 100644
--- a/util/aes.c
+++ b/util/aes.c
@@ -1161,7 +1161,7 @@ int AES_set_encrypt_key(const unsigned char *userKey, const int bits,
 			rk += 8;
         	}
 	}
-	return 0;
+        abort();
 }
 
 /**
-- 
2.1.4


