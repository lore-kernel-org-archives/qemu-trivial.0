Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gle5A-0002Gp-Ev
	for mharc-qemu-trivial@gnu.org; Mon, 21 Jan 2019 13:14:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53875)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gle58-0002F4-Gv
	for qemu-trivial@nongnu.org; Mon, 21 Jan 2019 13:13:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gle56-00028n-MI
	for qemu-trivial@nongnu.org; Mon, 21 Jan 2019 13:13:58 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46216)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gle52-000250-UD; Mon, 21 Jan 2019 13:13:53 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4213113D10;
	Mon, 21 Jan 2019 18:13:51 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-28.brq.redhat.com [10.40.204.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C72B668B09;
	Mon, 21 Jan 2019 18:13:38 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Wei Xu <wexu@redhat.com>, Yuri Benditovich <yuri.benditovich@daynix.com>,
	Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Mon, 21 Jan 2019 19:13:35 +0100
Message-Id: <20190121181335.3326-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 21 Jan 2019 18:13:51 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] virtio-net: Fix a typo
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
X-List-Received-Date: Mon, 21 Jan 2019 18:13:59 -0000

Fixes: 2974e916df8
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 include/hw/virtio/virtio-net.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-ne=
t.h
index c7ec1a755f..756eee8af0 100644
--- a/include/hw/virtio/virtio-net.h
+++ b/include/hw/virtio/virtio-net.h
@@ -94,7 +94,7 @@ typedef struct VirtioNetRscUnit {
     uint16_t payload;       /* pure payload without virtio/eth/ip/tcp */
 } VirtioNetRscUnit;
=20
-/* Coalesced segmant */
+/* Coalesced segment */
 typedef struct VirtioNetRscSeg {
     QTAILQ_ENTRY(VirtioNetRscSeg) next;
     void *buf;
--=20
2.20.1


