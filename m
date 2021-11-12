Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mlcKI-0003Tz-BX
	for mharc-qemu-trivial@gnu.org; Fri, 12 Nov 2021 14:35:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mlcKD-0003Ox-4e
 for qemu-trivial@nongnu.org; Fri, 12 Nov 2021 14:35:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mlcKB-0007yd-2i
 for qemu-trivial@nongnu.org; Fri, 12 Nov 2021 14:35:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636745698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3NlTKCv+dB2uLiS+nu6ZWpM01wn+xk+NhHBbif2PWUE=;
 b=i9WDhB37b9g6AxojRHTDP0qY676Ry/PPgOizWRcTQvNiCkUfzaVifMVxXNNERAjcX7PKXO
 YqvgPM0VB9wdSAQbJXeuD3Pxikoa4zZGVkLoLYEh4vtVVNdVg9pr7XPdO/aJerkguhPNxJ
 KiFTtQqIKCoy5LHxUABkVWLTPEF8060=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-x2k6HkZrMLm8leF4R445WA-1; Fri, 12 Nov 2021 14:34:57 -0500
X-MC-Unique: x2k6HkZrMLm8leF4R445WA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4AF7315722;
 Fri, 12 Nov 2021 19:34:56 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE6F419723;
 Fri, 12 Nov 2021 19:34:50 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Cindy Lu <lulu@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PATCH 2/2] vdpa: Check for existence of opts.vhostdev
Date: Fri, 12 Nov 2021 20:34:31 +0100
Message-Id: <20211112193431.2379298-3-eperezma@redhat.com>
In-Reply-To: <20211112193431.2379298-1-eperezma@redhat.com>
References: <20211112193431.2379298-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Nov 2021 19:35:05 -0000

Since net_init_vhost_vdpa is trying to open it. Not specifying it in the
command line crash qemu.

Fixes: 7327813d17 ("vhost-vdpa: open device fd in net_init_vhost_vdpa()")
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 6ffb29f4da..bbd3576f23 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -260,6 +260,10 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
 
     assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
     opts = &netdev->u.vhost_vdpa;
+    if (!opts->vhostdev) {
+        error_setg(errp, "vdpa character device not specified with vhostdev");
+        return -1;
+    }
 
     vdpa_device_fd = qemu_open(opts->vhostdev, O_RDWR, errp);
     if (vdpa_device_fd == -1) {
-- 
2.27.0


