Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1opgNw-0005pO-HL
	for mharc-qemu-trivial@gnu.org; Mon, 31 Oct 2022 21:48:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hhan@redhat.com>) id 1opgNq-0005mo-6q
 for qemu-trivial@nongnu.org; Mon, 31 Oct 2022 21:48:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hhan@redhat.com>) id 1opgNo-0006yN-Cr
 for qemu-trivial@nongnu.org; Mon, 31 Oct 2022 21:48:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667267283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=/bh0J3BY1Yvgq0rK5l1bonq9t0qxAjWKw4W/mitU1cg=;
 b=XPMt96NeeleiwXDiSw8OXuGm3SX6sXSifKicHI2c/r2Mp+jBuBy3jW6QnA6aVbldIQ/Qwy
 3P4ApRZH/CuFqD+zTeAgsvkI6BtG9MRiTKWfWwHo6dCILl8X16ShlQrVMy69wipVksUSB1
 NUyD504SbTK6o2MD9y/etzd984Jqpps=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-38-zdyS1u_fMIGr51XHkguTRA-1; Mon, 31 Oct 2022 21:46:57 -0400
X-MC-Unique: zdyS1u_fMIGr51XHkguTRA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C37D80280D;
 Tue,  1 Nov 2022 01:46:57 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-12-204.pek2.redhat.com
 [10.72.12.204])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9684B202322E;
 Tue,  1 Nov 2022 01:46:55 +0000 (UTC)
From: Han Han <hhan@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	lvivier@redhat.com,
	Han Han <hhan@redhat.com>
Subject: [PATCH] qapi: virtio: Fix the introduced version
Date: Tue,  1 Nov 2022 09:46:47 +0800
Message-Id: <20221101014647.3000801-1-hhan@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hhan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 01 Nov 2022 01:48:06 -0000

The items of qapi/virtio.json are introduced at a5ebce38576. They will be
in the version 7.2 not 7.1.

Signed-off-by: Han Han <hhan@redhat.com>
---
 qapi/virtio.json | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/qapi/virtio.json b/qapi/virtio.json
index e47a8fb2e0..872c7e3623 100644
--- a/qapi/virtio.json
+++ b/qapi/virtio.json
@@ -15,7 +15,7 @@
 #
 # @name: Name of the VirtIODevice
 #
-# Since: 7.1
+# Since: 7.2
 #
 ##
 { 'struct': 'VirtioInfo',
@@ -32,7 +32,7 @@
 #
 # Returns: List of gathered VirtIODevices
 #
-# Since: 7.1
+# Since: 7.2
 #
 # Example:
 #
@@ -97,7 +97,7 @@
 #
 # @log-size: vhost_dev log_size
 #
-# Since: 7.1
+# Since: 7.2
 #
 ##
 
@@ -167,7 +167,7 @@
 #             Present if the given VirtIODevice has an active vhost
 #             device.
 #
-# Since: 7.1
+# Since: 7.2
 #
 ##
 
@@ -206,7 +206,7 @@
 #
 # Returns: VirtioStatus of the virtio device
 #
-# Since: 7.1
+# Since: 7.2
 #
 # Examples:
 #
@@ -452,7 +452,7 @@
 #
 # @unknown-statuses: Virtio device statuses bitmap that have not been decoded
 #
-# Since: 7.1
+# Since: 7.2
 ##
 
 { 'struct': 'VirtioDeviceStatus',
@@ -471,7 +471,7 @@
 # @unknown-protocols: Vhost user device protocol features bitmap that
 #                     have not been decoded
 #
-# Since: 7.1
+# Since: 7.2
 ##
 
 { 'struct': 'VhostDeviceProtocols',
@@ -492,7 +492,7 @@
 # @unknown-dev-features: Virtio device features bitmap that have not
 #                        been decoded
 #
-# Since: 7.1
+# Since: 7.2
 ##
 
 { 'struct': 'VirtioDeviceFeatures',
@@ -535,7 +535,7 @@
 #
 # @signalled-used-valid: VirtQueue signalled_used_valid flag
 #
-# Since: 7.1
+# Since: 7.2
 #
 ##
 
@@ -576,7 +576,7 @@
 #        shadow_avail_idx will not be displayed in the case where
 #        the selected VirtIODevice has a running vhost device.
 #
-# Since: 7.1
+# Since: 7.2
 #
 # Examples:
 #
@@ -666,7 +666,7 @@
 #
 # @used-size: vhost_virtqueue used_size
 #
-# Since: 7.1
+# Since: 7.2
 #
 ##
 
@@ -699,7 +699,7 @@
 #
 # Returns: VirtVhostQueueStatus of the vhost_virtqueue
 #
-# Since: 7.1
+# Since: 7.2
 #
 # Examples:
 #
@@ -767,7 +767,7 @@
 #
 # @flags: List of descriptor flags
 #
-# Since: 7.1
+# Since: 7.2
 #
 ##
 
@@ -787,7 +787,7 @@
 #
 # @ring: VRingAvail ring[] entry at provided index
 #
-# Since: 7.1
+# Since: 7.2
 #
 ##
 
@@ -805,7 +805,7 @@
 #
 # @idx: VRingUsed index
 #
-# Since: 7.1
+# Since: 7.2
 #
 ##
 
@@ -829,7 +829,7 @@
 #
 # @used: VRingUsed info
 #
-# Since: 7.1
+# Since: 7.2
 #
 ##
 
@@ -857,7 +857,7 @@
 #
 # Returns: VirtioQueueElement information
 #
-# Since: 7.1
+# Since: 7.2
 #
 # Examples:
 #
-- 
2.38.1


