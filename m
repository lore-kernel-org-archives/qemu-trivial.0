Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bXFLK-0001RK-2Z
	for mharc-qemu-trivial@gnu.org; Tue, 09 Aug 2016 18:17:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55432)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <opensource.dxs@aliyun.com>) id 1bX89d-0004AU-Nv
	for qemu-trivial@nongnu.org; Tue, 09 Aug 2016 10:37:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <opensource.dxs@aliyun.com>) id 1bX89a-0007Bw-Hb
	for qemu-trivial@nongnu.org; Tue, 09 Aug 2016 10:37:17 -0400
Received: from smtpcm9-312.freemail.mail.aliyun.com ([110.75.46.12]:41676)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <opensource.dxs@aliyun.com>) id 1bX89Z-0007A8-Ud
	for qemu-trivial@nongnu.org; Tue, 09 Aug 2016 10:37:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aliyun.com; s=s1024;
	t=1470753429;
	h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type; 
	bh=EyeDD8kYfAI+8pF40+L54Zqb8LOh3BCGwlrGIwEYPEQ=;
	b=mcYJYjdwv+lW9Ws5ndzs+sWyIigFEL/uWnCxie3dm3eGvYkVym0UxuFCqkPLwq3NbnzkKrEgLg5prZ8uRz4biDY9iCBpZm836QzlPd9yWsaiWD5LHp44NhDBqw4V2yqkPgatSXmQr2QcmZYv+e/Xu/klOGxNYExLHafatsswBs8=
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1535394|-1; FP=0|0|0|0|0|-1|-1|-1;
	HT=36d007040; MF=opensource.dxs@aliyun.com; NM=1; PH=DS; RN=6;
	RT=6; SR=0; TI=SMTPD_----DqJCreF_1470753426; 
Received: from localhost.localdomain(mailfrom:opensource.dxs@aliyun.com
	ip:27.38.41.38) by smtp.aliyun-inc.com(127.0.0.1);
	Tue, 09 Aug 2016 22:37:07 +0800
From: =?UTF-8?q?Stefano=20Dong=20=28=E8=91=A3=E5=85=B4=E6=B0=B4=29?=
	<opensource.dxs@aliyun.com>
To: marcandre.lureau@gmail.com, armbru@redhat.com, pbonzini@redhat.com,
	mst@redhat.com
Cc: qemu-trivial@nongnu.org,
	opensource.dxs@aliyun.com
Date: Wed, 10 Aug 2016 06:37:02 +0800
Message-Id: <1470782222-4316-1-git-send-email-opensource.dxs@aliyun.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 110.75.46.12
X-Mailman-Approved-At: Tue, 09 Aug 2016 18:17:48 -0400
Subject: [Qemu-trivial]  [PATCH] ivshmem: Delete duplicate debug message
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
X-List-Received-Date: Tue, 09 Aug 2016 14:37:18 -0000

Duplicated in commit ca0b756.  Delete it.

Signed-off-by: Stefano Dong (董兴水) <opensource.dxs@aliyun.com>
---
 hw/misc/ivshmem.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
index 40a2ebc..f803dfd 100644
--- a/hw/misc/ivshmem.c
+++ b/hw/misc/ivshmem.c
@@ -628,7 +628,6 @@ static void ivshmem_read(void *opaque, const uint8_t *buf, int size)
     s->msg_buffered_bytes = 0;
 
     fd = qemu_chr_fe_get_msgfd(s->server_chr);
-    IVSHMEM_DPRINTF("posn is %" PRId64 ", fd is %d\n", msg, fd);
 
     process_msg(s, msg, fd, &err);
     if (err) {
-- 
2.7.4


