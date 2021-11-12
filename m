Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mlcKH-0003Ph-7D
	for mharc-qemu-trivial@gnu.org; Fri, 12 Nov 2021 14:35:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mlcKA-0003N6-Ry
 for qemu-trivial@nongnu.org; Fri, 12 Nov 2021 14:34:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mlcK7-0007yE-Pl
 for qemu-trivial@nongnu.org; Fri, 12 Nov 2021 14:34:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636745695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v7wWWwLuA0w2/3OXVrR2o4AEAv2i1t0oR12O6Lnvd1Y=;
 b=etxYjQCsyqpuU/Q1nXug/M1i4Lu0r+UTB5xcFCRzCuwDM3rkgsiZod9cn+sFV+tw0VUpwT
 AsFDXo2JDJrzWCe+M52j/xuaMz4vwKuo2ZBENa7KYMalSTtX7n1Qz0EHe5YWNUUDpJJxDa
 BZ8eZYBxftAMqDgLOFyJwF4nIPV2GMI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-HypJtP8UPEafYyulfsG-ng-1; Fri, 12 Nov 2021 14:34:51 -0500
X-MC-Unique: HypJtP8UPEafYyulfsG-ng-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 960411023F4F;
 Fri, 12 Nov 2021 19:34:50 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0DDB119723;
 Fri, 12 Nov 2021 19:34:48 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Cindy Lu <lulu@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PATCH 1/2] vdpa: Replace qemu_open_old by qemu_open at
Date: Fri, 12 Nov 2021 20:34:30 +0100
Message-Id: <20211112193431.2379298-2-eperezma@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 12 Nov 2021 19:34:59 -0000

There is no reason to keep using the old one, since we neither use the
variadics arguments nor open it with O_DIRECT.

Also, net_client_init1, the caller of net_init_vhost_vdpa, wants all
net_client_init_fun to use Error API, so it's a good step in that
direction.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 49ab322511..6ffb29f4da 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -261,7 +261,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
     assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
     opts = &netdev->u.vhost_vdpa;
 
-    vdpa_device_fd = qemu_open_old(opts->vhostdev, O_RDWR);
+    vdpa_device_fd = qemu_open(opts->vhostdev, O_RDWR, errp);
     if (vdpa_device_fd == -1) {
         return -errno;
     }
-- 
2.27.0


