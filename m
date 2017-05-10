Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d8Lxg-0003S3-J5
	for mharc-qemu-trivial@gnu.org; Wed, 10 May 2017 03:23:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47640)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d8Lxf-0003Rj-CE
	for qemu-trivial@nongnu.org; Wed, 10 May 2017 03:23:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d8Lxe-00064T-JP
	for qemu-trivial@nongnu.org; Wed, 10 May 2017 03:23:03 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51863)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1d8Lxa-00062n-8z; Wed, 10 May 2017 03:22:58 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id AF124404EE;
	Wed, 10 May 2017 10:22:49 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 9D17D3BB;
	Wed, 10 May 2017 10:22:49 +0300 (MSK)
Received: (nullmailer pid 12236 invoked by uid 1000);
	Wed, 10 May 2017 07:22:49 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: "sochin.jiang" <sochin@aliyun.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 10 May 2017 10:22:46 +0300
Message-Id: <bcd711feb0420d66e069498ed243a9e2b81ec167.1494400777.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1494400777.git.mjt@msgid.tls.msk.ru>
References: <cover.1494400777.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1494400777.git.mjt@msgid.tls.msk.ru>
References: <cover.1494400777.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 11/23] channel-file: fix wrong parameter
 comments
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
X-List-Received-Date: Wed, 10 May 2017 07:23:04 -0000

From: "sochin.jiang" <sochin@aliyun.com>

Signed-off-by: sochin.jiang <sochin@aliyun.com>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/io/channel-file.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/io/channel-file.h b/include/io/channel-file.h
index d2462c2ed7..79245f1183 100644
--- a/include/io/channel-file.h
+++ b/include/io/channel-file.h
@@ -71,7 +71,7 @@ qio_channel_file_new_fd(int fd);
=20
 /**
  * qio_channel_file_new_path:
- * @fd: the file descriptor
+ * @path: the file path
  * @flags: the open flags (O_RDONLY|O_WRONLY|O_RDWR, etc)
  * @mode: the file creation mode if O_WRONLY is set in @flags
  * @errp: pointer to initialized error object
--=20
2.11.0


