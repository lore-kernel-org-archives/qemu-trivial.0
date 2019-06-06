Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hYqF6-00008f-G9
	for mharc-qemu-trivial@gnu.org; Thu, 06 Jun 2019 07:07:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60266)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hYqF4-00006g-GZ
	for qemu-trivial@nongnu.org; Thu, 06 Jun 2019 07:07:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hYqF3-00039i-IQ
	for qemu-trivial@nongnu.org; Thu, 06 Jun 2019 07:07:34 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:58621)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hYqF1-0002z6-0o; Thu, 06 Jun 2019 07:07:31 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1MauFB-1gy8V734dX-00cSgp; Thu, 06 Jun 2019 13:06:43 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Aleksandar Rikalo <arikalo@wavecomp.com>,
	Juan Quintela <quintela@redhat.com>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Fam Zheng <fam@euphon.net>, Michael Walle <michael@walle.cc>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, David Hildenbrand <david@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Yuval Shaia <yuval.shaia@oracle.com>, qemu-trivial@nongnu.org,
	Halil Pasic <pasic@linux.ibm.com>, Richard Henderson <rth@twiddle.net>,
	qemu-s390x@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Jie Wang <wangjie88@huawei.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Thu,  6 Jun 2019 13:06:12 +0200
Message-Id: <20190606110625.32127-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190606110625.32127-1-laurent@vivier.eu>
References: <20190606110625.32127-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:CaPomUUU0ZJp2dT6eUq05+g7tIBXfeNTk8JnnR47rG4Bb3m2Amu
	FYawHFxHtEN6ZwcplHPtkRE8L99QdHTARU0DkOY5IX6Khlx0ZOP1VVSVn6jDU4cyT9rzXkh
	OXaCHxOgKUg+NpeQ/u4xYfYdSNT/lncnGfEUNJS7Sjt6PStGn1qP322oM4iT75BrRb6CBMO
	Cd9LcRhoU7u+7OHe0NImA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:41tRHKGJyP0=:4ymjpaXSKln4RHBYeKTaxe
	eHWyXozSKm/GfW/N7OJ1Zc3S0QRUoGie3/x2d9eHdXM8jgRb3Bpn9trcYMOS7x23oa2QC51eF
	rD3Ajl+Kko9qZVsUpoPb2ZCQe+ejJdBGwmLLeGP634ant7VNwHnNNv1z1zyhv/IkfdTWFzLDz
	4fIOZ5dGwIBtoJSXHGGnfKMhaROJiy69Kc9jUQqIZKJRTuNAnGcYPSvagkCcwQ1WD8b3+6iAl
	c4eLCHB/4PBsauGmZRy2oA+6aczUWZrK1KUFML2K/dkFkF14ikiuRgve99MLwTYjw1IbRrG2t
	+xzLn7CXcojeu/kpbk+uqjJcSEMnzKm9iYey8ue05T0SV3y/5OKrYR8OZD1h9Kh7rZEnQvwd2
	4+ZmV2UPrsTozj2CiuOeeF1bu5k4q9kRh0vJm6gxy82O+Ah3g1JLz+Fh/lAG5Qi3GJ1v6/bDo
	/febZbm//dL/wxA/uqOSKjnqXZbtRuRZN2voi9/nvCrVYjWgsr2tqM/ejh6p6QgqxzwtfX4la
	S1xjp5j6K0s0Bu6hRtGUkOQ+EOjKE1XhN8xuHiVi/eG0Bsl4Y6D3XyADr3sPb1tl1reywT2q/
	sZpVLZwh6KWE/Kq735ggQAk+WI/Wy6QFC/5VYxHRGaxVp+Sd/8gGj/620fIP61ahFlb8rgyD5
	XJliIqnJR5W0CtqVhKlNYvQp7uhZohjAuRTnMB7ZziPVyuVr8pSAvZOFErkNOY9nqB9KraFQr
	WpyhXhuuvVMmOi/PNpcTo7iMvda2OWyk6sfLQsXAQBy8pliKk02eM/6Jlb8=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.73
Subject: [Qemu-trivial] [PULL 03/16] vhost: fix incorrect print type
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
X-List-Received-Date: Thu, 06 Jun 2019 11:07:35 -0000

From: Jie Wang <wangjie88@huawei.com>

fix incorrect print type in vhost_virtqueue_stop

Signed-off-by: Jie Wang <wangjie88@huawei.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <1556605773-42019-1-git-send-email-wangjie88@huawei.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/virtio/vhost.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 7f61018f2a3f..286bb27c6539 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1081,7 +1081,7 @@ static void vhost_virtqueue_stop(struct vhost_dev *dev,
 
     r = dev->vhost_ops->vhost_get_vring_base(dev, &state);
     if (r < 0) {
-        VHOST_OPS_DEBUG("vhost VQ %d ring restore failed: %d", idx, r);
+        VHOST_OPS_DEBUG("vhost VQ %u ring restore failed: %d", idx, r);
         /* Connection to the backend is broken, so let's sync internal
          * last avail idx to the device used idx.
          */
-- 
2.21.0


