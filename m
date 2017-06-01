Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dGQZ1-0004vs-Th
	for mharc-qemu-trivial@gnu.org; Thu, 01 Jun 2017 09:54:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57228)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dGQYy-0004uO-LD
	for qemu-trivial@nongnu.org; Thu, 01 Jun 2017 09:54:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dGQYx-0006Oz-Ut
	for qemu-trivial@nongnu.org; Thu, 01 Jun 2017 09:54:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36726)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1dGQYs-0006ON-Le; Thu, 01 Jun 2017 09:54:50 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A05843F21F;
	Thu,  1 Jun 2017 13:54:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com A05843F21F
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=pbonzini@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com A05843F21F
Received: from donizetti.redhat.com (ovpn-117-20.ams2.redhat.com
	[10.36.117.20])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v51Dslgi018246; Thu, 1 Jun 2017 09:54:48 -0400
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, mst@redhat.com
Date: Thu,  1 Jun 2017 15:54:47 +0200
Message-Id: <20170601135447.2674-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 01 Jun 2017 13:54:49 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] virtio: add virtqueue_alloc_element
 tracepoint
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
X-List-Received-Date: Thu, 01 Jun 2017 13:54:57 -0000

This tracepoint can help diagnosing failures due to memory
fragmentation in the guest.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/virtio/trace-events | 1 +
 hw/virtio/virtio.c     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 1f7a7c1ae1..e24d8fa997 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -1,6 +1,7 @@
 # See docs/tracing.txt for syntax documentation.
 
 # hw/virtio/virtio.c
+virtqueue_alloc_element(void *elem, size_t sz, unsigned in_num, unsigned out_num) "elem %p size %zd in_num %u out_num %u"
 virtqueue_fill(void *vq, const void *elem, unsigned int len, unsigned int idx) "vq %p elem %p len %u idx %u"
 virtqueue_flush(void *vq, unsigned int count) "vq %p count %u"
 virtqueue_pop(void *vq, void *elem, unsigned int in_num, unsigned int out_num) "vq %p elem %p in_num %u out_num %u"
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 890b4d7eb7..286446b261 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -816,6 +816,7 @@ static void *virtqueue_alloc_element(size_t sz, unsigned out_num, unsigned in_nu
 
     assert(sz >= sizeof(VirtQueueElement));
     elem = g_malloc(out_sg_end);
+    trace_virtqueue_alloc_element(elem, sz, in_num, out_num);
     elem->out_num = out_num;
     elem->in_num = in_num;
     elem->in_addr = (void *)elem + in_addr_ofs;
-- 
2.13.0


