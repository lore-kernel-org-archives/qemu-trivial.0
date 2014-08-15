Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XIJJC-0001gS-97
	for mharc-qemu-trivial@gnu.org; Fri, 15 Aug 2014 11:20:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59289)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XIJJ5-0001ZY-67
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 11:20:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XIJJ1-0007ME-2x
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 11:20:43 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56585)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XIJIr-0007Ib-Ip; Fri, 15 Aug 2014 11:20:29 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id EB32643050;
	Fri, 15 Aug 2014 19:20:28 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id DED1C6E8;
	Fri, 15 Aug 2014 19:15:14 +0400 (MSK)
Received: (nullmailer pid 17941 invoked by uid 1000);
	Fri, 15 Aug 2014 15:15:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 15 Aug 2014 19:15:10 +0400
Message-Id: <1408115711-17836-20-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1408115711-17836-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1408115711-17836-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>
Subject: [Qemu-trivial] [PULL 19/20] l2cap: fix access to freed memory
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
X-List-Received-Date: Fri, 15 Aug 2014 15:20:47 -0000

From: zhanghailiang <zhang.zhanghailiang@huawei.com>

Pointer 'ch' will be used in function 'l2cap_channel_open_req_msg' after
it was previously freed in 'l2cap_channel_open'.
Assigned it to NULL after it is freed.

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/bt/l2cap.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/bt/l2cap.c b/hw/bt/l2cap.c
index 2301d6f..591e047 100644
--- a/hw/bt/l2cap.c
+++ b/hw/bt/l2cap.c
@@ -429,7 +429,7 @@ static struct l2cap_chan_s *l2cap_channel_open(struct=
 l2cap_instance_s *l2cap,
                 status =3D L2CAP_CS_NO_INFO;
             } else {
                 g_free(ch);
-
+                ch =3D NULL;
                 result =3D L2CAP_CR_NO_MEM;
                 status =3D L2CAP_CS_NO_INFO;
             }
--=20
1.7.10.4


