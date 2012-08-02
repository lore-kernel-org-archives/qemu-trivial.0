Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Swqwr-0007HC-GR
	for mharc-qemu-trivial@gnu.org; Thu, 02 Aug 2012 04:40:01 -0400
Received: from eggs.gnu.org ([208.118.235.92]:50215)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1Swqwk-0006ue-B4
	for qemu-trivial@nongnu.org; Thu, 02 Aug 2012 04:39:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1Swqwg-0006xV-FZ
	for qemu-trivial@nongnu.org; Thu, 02 Aug 2012 04:39:54 -0400
Received: from smtp1-g21.free.fr ([212.27.42.1]:52114)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>)
	id 1SwqwX-0006uF-42; Thu, 02 Aug 2012 04:39:41 -0400
Received: from localhost.localdomain (unknown [82.227.227.196])
	by smtp1-g21.free.fr (Postfix) with ESMTP id BF86B940158;
	Thu,  2 Aug 2012 10:39:35 +0200 (CEST)
From: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
To: qemu-devel@nongnu.org
Date: Thu,  2 Aug 2012 10:40:29 +0200
Message-Id: <1343896830-3503-1-git-send-email-hpoussin@reactos.org>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 212.27.42.1
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Subject: [Qemu-trivial] [PATCH 1/2] qom: add missing 'const' in
	documentation sample
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
X-List-Received-Date: Thu, 02 Aug 2012 08:40:00 -0000


Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
---
 include/qemu/object.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qemu/object.h b/include/qemu/object.h
index 8b17776..e0d326f 100644
--- a/include/qemu/object.h
+++ b/include/qemu/object.h
@@ -65,7 +65,7 @@ typedef struct InterfaceInfo InterfaceInfo;
  *     int reg0, reg1, reg2;
  * } MyDevice;
  *
- * static TypeInfo my_device_info =3D {
+ * static const TypeInfo my_device_info =3D {
  *     .name =3D TYPE_MY_DEVICE,
  *     .parent =3D TYPE_DEVICE,
  *     .instance_size =3D sizeof(MyDevice),
--=20
1.7.10.4


