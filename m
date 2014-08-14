Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XHv34-000296-8t
	for mharc-qemu-trivial@gnu.org; Thu, 14 Aug 2014 09:26:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45145)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XHpdl-0006kM-Ds
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 03:40:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XHpdh-0002dJ-4t
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 03:40:05 -0400
Received: from szxga01-in.huawei.com ([119.145.14.64]:10967)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XHpdX-0002bX-LK; Thu, 14 Aug 2014 03:39:52 -0400
Received: from 172.24.2.119 (EHLO szxeml410-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CAH33647; Thu, 14 Aug 2014 15:30:19 +0800 (CST)
Received: from localhost (10.177.22.69) by szxeml410-hub.china.huawei.com
	(10.82.67.137) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 14 Aug 2014 15:29:50 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 14 Aug 2014 15:29:12 +0800
Message-ID: <1408001361-13580-2-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
In-Reply-To: <1408001361-13580-1-git-send-email-zhang.zhanghailiang@huawei.com>
References: <1408001361-13580-1-git-send-email-zhang.zhanghailiang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
X-Mailman-Approved-At: Thu, 14 Aug 2014 09:26:29 -0400
Cc: kwolf@redhat.com, lkurusa@redhat.com,
	zhanghailiang <zhang.zhanghailiang@huawei.com>, mst@redhat.com,
	qemu-trivial@nongnu.org, jan.kiszka@siemens.com,
	riku.voipio@iki.fi, mjt@tls.msk.ru, peter.huangpeng@huawei.com,
	lcapitulino@redhat.com, stefanha@redhat.com,
	luonengjun@huawei.com, pbonzini@redhat.com,
	alex.bennee@linaro.org, rth@twiddle.net
Subject: [Qemu-trivial] [PATCH v6 01/10] l2cap: fix access freed memory
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
X-List-Received-Date: Thu, 14 Aug 2014 07:40:10 -0000

Pointer 'ch' will be used in function 'l2cap_channel_open_req_msg' after
it was previously freed in 'l2cap_channel_open'.
Assigned it to NULL after it is freed.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
---
 hw/bt/l2cap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/bt/l2cap.c b/hw/bt/l2cap.c
index 2301d6f..591e047 100644
--- a/hw/bt/l2cap.c
+++ b/hw/bt/l2cap.c
@@ -429,7 +429,7 @@ static struct l2cap_chan_s *l2cap_channel_open(struct l2cap_instance_s *l2cap,
                 status = L2CAP_CS_NO_INFO;
             } else {
                 g_free(ch);
-
+                ch = NULL;
                 result = L2CAP_CR_NO_MEM;
                 status = L2CAP_CS_NO_INFO;
             }
-- 
1.7.12.4



