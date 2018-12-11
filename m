Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWmOk-0007pI-PB
	for mharc-qemu-trivial@gnu.org; Tue, 11 Dec 2018 13:04:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42729)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmOi-0007md-4M
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:04:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmOd-0007DH-8y
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:04:44 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:40177)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gWmOc-0007CH-Ue; Tue, 11 Dec 2018 13:04:39 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1N8n8I-1hYrlk1LJG-015oEt; Tue, 11 Dec 2018 19:04:02 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Paolo Bonzini <pbonzini@redhat.com>, Dongli Zhang <dongli.zhang@oracle.com>
Date: Tue, 11 Dec 2018 19:03:24 +0100
Message-Id: <20181211180352.19644-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181211180352.19644-1-laurent@vivier.eu>
References: <20181211180352.19644-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:fpJsAoGc7GC1l0PSv9fbvpsyxEoGTJbHlpQuIP19WeijIRJuaGN
	09xU87WWbmveuGX5rbnRaf2SeaYJwj3wy+qmMrTRUC4NZmGvFdHW+WYCji3U7BguEdJqAX9
	exKYFQswM0sFSaV2Crcs5wkLG/hFd2t6dY3r5o6XI8/iTRWG0SdpqWQd7QFmr5/MG1IO4O/
	1If3//ZM/rngU6/0tPByA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tDBpv1ywkjw=:q2Xsl1cIayz58WFhu4ajqo
	FHrh9AmwDS5ZXbgVI/yajUgK/3Rzjd3mV0DrP4bwiq+34b7EZgOZiVYyiU6Ay0EF+xLnnpMYD
	qUZ0sp2O8BmxuR2FMsG03d4OCTRGHcgRmLBtgslJJBSRAIknujHAXZj8ulCjJv4QBniB3R72K
	oAgR883dSGVauGhknwF+DbzTBmykflhZEV6gtm2yOn541v5BmwafYL3nPIHfgogSRvMMVRj5d
	qkIygVB69gixIn/AkMEo1RXzy0yUT2gIGlxPrWzCMmRvRj2VZ3osecn7IyOSx3vRRg2DlUKsB
	+bcHqHOTFv5MiEbHWyBsGWNYvfHcIAerdWuRjKEVbv5bQG0GgLQzFkyQe/6JgLI0t/AzxPBie
	1Xsqgh3BNTRvpeg/Q9XX0RuUMCzX/JjmPlnXOpYk4YdB4V7pMQ2xHvxynBlXU8IKJedq5j4FG
	fP5+KmJe3haIIkMfnb0NaV5bUIgER7goPFLA9Pdmi1eaJPXhdbL/Bgl1or/CspCllsM0AG7+x
	P0EApnOK9+fOSPREUXo++ZyvbIa+LezIXIPo9TW1s9WQULIwMDy9k32cPdQTLd3RROdzi/Q/w
	pzxfJnNoSdHEuewGFLCJPKoAsvQjYj6PqBjUh7pcxLp4cPNkA+LDEFYEWpRDwxVVortDKQ59c
	/E1GQL2bklifL+QvpWzR0Vc19NSRtI/p0/JLRBrwx2tlkzeN0WCEGVq/LZxopFtQsZafPKC32
	e+2BIieG8Cl1KjbOos6TVf8AHhBjk8Pw4NbWkA==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.135
Subject: [Qemu-trivial] [PULL 02/30] virtio: pass argument by value for
 virtqueue_map_iovec()
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
X-List-Received-Date: Tue, 11 Dec 2018 18:04:45 -0000

From: Dongli Zhang <dongli.zhang@oracle.com>

Pass num_sg by value instead of by pointer, as num_sg is never modified in
virtqueue_map_iovec().

Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <1541139396-4727-1-git-send-email-dongli.zhang@oracle.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/virtio/virtio.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 5828ed14df..22bd1ac34e 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -796,13 +796,13 @@ static void virtqueue_undo_map_desc(unsigned int out_num, unsigned int in_num,
 }
 
 static void virtqueue_map_iovec(VirtIODevice *vdev, struct iovec *sg,
-                                hwaddr *addr, unsigned int *num_sg,
+                                hwaddr *addr, unsigned int num_sg,
                                 int is_write)
 {
     unsigned int i;
     hwaddr len;
 
-    for (i = 0; i < *num_sg; i++) {
+    for (i = 0; i < num_sg; i++) {
         len = sg[i].iov_len;
         sg[i].iov_base = dma_memory_map(vdev->dma_as,
                                         addr[i], &len, is_write ?
@@ -821,8 +821,8 @@ static void virtqueue_map_iovec(VirtIODevice *vdev, struct iovec *sg,
 
 void virtqueue_map(VirtIODevice *vdev, VirtQueueElement *elem)
 {
-    virtqueue_map_iovec(vdev, elem->in_sg, elem->in_addr, &elem->in_num, 1);
-    virtqueue_map_iovec(vdev, elem->out_sg, elem->out_addr, &elem->out_num, 0);
+    virtqueue_map_iovec(vdev, elem->in_sg, elem->in_addr, elem->in_num, 1);
+    virtqueue_map_iovec(vdev, elem->out_sg, elem->out_addr, elem->out_num, 0);
 }
 
 static void *virtqueue_alloc_element(size_t sz, unsigned out_num, unsigned in_num)
-- 
2.19.2


