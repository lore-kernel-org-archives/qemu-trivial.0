Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tNEbA-0000zt-T1
	for mharc-qemu-trivial@gnu.org; Mon, 16 Dec 2024 12:09:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1tNEb6-0000zA-6I
 for qemu-trivial@nongnu.org; Mon, 16 Dec 2024 12:09:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1tNEb4-0007dH-G9
 for qemu-trivial@nongnu.org; Mon, 16 Dec 2024 12:09:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1734368961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=9tHH4zkZzZdjZA04clbr0cib8g9HeN+u6OhAHtHA+2o=;
 b=E+6+c4z4ViE7Sh+v0ISva0a27SGJCYrhwSij48Ew0noif0sLpSlpqzuDw6fnXqgACMLrBO
 l1RxjRBF05mMJjRY6cLu4IBtlkQI86RnMt8F992UUeBF6Gz7CjrXNX8N/22n83ztY4eCQW
 BVowctScqyOAO3PEBoqI/IUX40lKkWg=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-541-u77pG15HM4OdbvRhYKxNEQ-1; Mon,
 16 Dec 2024 12:09:20 -0500
X-MC-Unique: u77pG15HM4OdbvRhYKxNEQ-1
X-Mimecast-MFC-AGG-ID: u77pG15HM4OdbvRhYKxNEQ
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1BB971955F09; Mon, 16 Dec 2024 17:09:19 +0000 (UTC)
Received: from lenovo-t14s.redhat.com (unknown [10.39.193.84])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 93F1219560A3; Mon, 16 Dec 2024 17:09:16 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, jonah.palmer@oracle.com, qemu-trivial@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, aesteve@redhat.com,
 hreitz@redhat.com
Subject: [PATCH] qmp: update vhost-user protocol feature maps
Date: Mon, 16 Dec 2024 18:09:14 +0100
Message-ID: <20241216170914.1346403-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1.13,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 16 Dec 2024 17:09:32 -0000

Add VHOST_USER_PROTOCOL_F_SHARED_OBJECT and
VHOST_USER_PROTOCOL_F_DEVICE_STATE protocol feature maps to
the virtio introspection.

Cc: jonah.palmer@oracle.com
Fixes: 160947666276 ("vhost-user: add shared_object msg")
Cc: aesteve@redhat.com
Fixes: cda83adc62b6 ("vhost-user: Interface for migration state transfer")
Cc: hreitz@redhat.com
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 hw/virtio/virtio-qmp.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/virtio/virtio-qmp.c b/hw/virtio/virtio-qmp.c
index cccc6fe76183..8a32a3b1052c 100644
--- a/hw/virtio/virtio-qmp.c
+++ b/hw/virtio/virtio-qmp.c
@@ -121,6 +121,12 @@ static const qmp_virtio_feature_map_t vhost_user_protocol_map[] = {
     FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_STATUS, \
             "VHOST_USER_PROTOCOL_F_STATUS: Querying and notifying back-end "
             "device status supported"),
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_SHARED_OBJECT, \
+            "VHOST_USER_PROTOCOL_F_SHARED_OBJECT: Backend shared object "
+            "supported"),
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_DEVICE_STATE, \
+            "VHOST_USER_PROTOCOL_F_DEVICE_STATE: Backend device state transfer "
+            "supported"),
     { -1, "" }
 };
 
-- 
2.47.1


