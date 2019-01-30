Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1goppx-0001ez-2J
	for mharc-qemu-trivial@gnu.org; Wed, 30 Jan 2019 08:23:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37007)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1goppt-0001YA-0F
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 08:23:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1goppr-0006bM-Sm
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 08:23:24 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:36391)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1goppp-0006SR-7u; Wed, 30 Jan 2019 08:23:21 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MSbov-1gi0DK1Fc1-00SvxU; Wed, 30 Jan 2019 14:22:59 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Jiri Slaby <jslaby@suse.cz>, qemu-s390x@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Richard Henderson <rth@twiddle.net>, Igor Mammedov <imammedo@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Riku Voipio <riku.voipio@iki.fi>, Stefan Hajnoczi <stefanha@redhat.com>,
	Stafford Horne <shorne@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
	qemu-trivial@nongnu.org, Max Reitz <mreitz@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Michael Tokarev <mjt@tls.msk.ru>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Stefano Garzarella <sgarzare@redhat.com>, Thomas Huth <thuth@redhat.com>
Date: Wed, 30 Jan 2019 14:22:14 +0100
Message-Id: <20190130132214.25493-14-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190130132214.25493-1-laurent@vivier.eu>
References: <20190130132214.25493-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:WTvKS9r9s4rNnHcLG2PfUfC87jDKh5rHSnvZGg93icvsUH6XO0t
	Ln9+xvxNCb3a/8PzAbhnWcW76kVnCJqqmzNACosKc2E6VcuDw3BwL0Z1Sh0sVerataQmsNG
	Bv1JgfFnuyVve5oTwTli0UtEqqVr2oLZdCVEtPpdOMYJMDTnACA0RRX4cWjaKk8L+VVoIud
	Mz6ASLqZfSm9uUK72cnqA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:u6cW1nZkfQw=:Yb/gVrd9u1NQKhK5Xi+XvO
	P2CKYlVdOCC4+ekCmpXKq5aYIFXPoYKFeGeWZItIXpvsVUb60eXnYW2CXo3i+QKF1oVhR4FIi
	lTEIV8DEVxhI41oi7ZSy8ubzqQY8NUNp4IF30lBnvtMR4x80Li/0ugOgYAiQNGQmF1kOEsjhK
	nTD3IMePbUqXSBdT5tVSGF5ZCx2oGhl2N05dIfAFyXSXEu1Q8w4S2l6OstkethYwuwWjBQ0CO
	M6vnz0vnPaigmb9lsUxTah85Rsu4ixEBOglLC9kbO2ZICjW5BjhulEfOm/OgtQqJ4rJOfuvIQ
	7z2h0D17xdHx9zX0eDt2vlalIia6cR3KmIZwmKfbXN7foFoRrn6E/m4T7d6GLFvIuYYfok5k3
	VFaNUsldssUsFUGZMOezTGkkaVmoRhQBVMqCVrluE7KjZqOmSwjCOfanS7hcnU6cD7zZTXnb4
	VhdyJFah4Y41jmW68w8RF5C+WdNc4gu9JvqXaQMvi1gx09xjt1xaZxMs7oL8DOzzNkEJ5K8q6
	kscP8ab7/4tyhxmnEyx+tASzb4+BhWh4POoClEvToa94IWzLJXgn2U8r1tpdcUn6lVdd9nRWs
	5PMjAA3FquHXJ7rfDwaX7So2n8xQJwX8xfFq0vQoJOa56ynmLRvM4anA9yWvo/DtrrH6U5QeB
	uPIYKw+bYXOFae777D5TPPb6zFdamZ9mYun2PT6Pt1++rE505DLql0G9Bthf3dBjXD3IFzw2+
	g6n18vO04/yg4CBgwhXsKM4TnQFNPWGpdwvTKw==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.187
Subject: [Qemu-trivial] [PULL 13/13] virtio-blk: remove duplicate definition
 of VirtIOBlock *s pointer
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
X-List-Received-Date: Wed, 30 Jan 2019 13:23:26 -0000

From: Stefano Garzarella <sgarzare@redhat.com>

VirtIOBlock *s is already defined and initialized with req->dev
on top of virtio_blk_handle_request(), so we can remove it from
the code block of VIRTIO_BLK_T_GET_ID case.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20190130095231.42081-1-sgarzare@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/block/virtio-blk.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index f208c6ddb9..9a87b3bfac 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -569,8 +569,6 @@ static int virtio_blk_handle_request(VirtIOBlockReq *req, MultiReqBuffer *mrb)
         break;
     case VIRTIO_BLK_T_GET_ID:
     {
-        VirtIOBlock *s = req->dev;
-
         /*
          * NB: per existing s/n string convention the string is
          * terminated by '\0' only when shorter than buffer.
-- 
2.20.1


