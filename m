Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1romYG-0004xO-AK
	for mharc-qemu-trivial@gnu.org; Mon, 25 Mar 2024 11:47:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1romYF-0004wK-Gy
 for qemu-trivial@nongnu.org; Mon, 25 Mar 2024 11:47:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1romYE-0003Cw-5K
 for qemu-trivial@nongnu.org; Mon, 25 Mar 2024 11:47:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711381673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=RevTI6Vw8tFcN0fqER1/fleyA2YfZ7oDe+IWELV2cro=;
 b=PHAUaY5Tmj4gSNtnZjARQccDDhDXxCGxs8oWQzNZepyZnyITslA5sztbbWfxPvr+Lg4HVU
 eNoo3FKV+mfm0Aqcgh2yUOC/uLFrjIBelhUMrdaDpZ1EmW7Y1YmSi188CbjDBVO4NHH/sR
 SNZmXjpTX6Maa+zHcDKohfqt9cG4yb0=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-66-Xu77eA9jPrSuHbdasLjjqQ-1; Mon,
 25 Mar 2024 11:47:50 -0400
X-MC-Unique: Xu77eA9jPrSuHbdasLjjqQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF5D91C2CDE3;
 Mon, 25 Mar 2024 15:47:49 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.192.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E50AE10189;
 Mon, 25 Mar 2024 15:47:47 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH] tests/qemu-iotests: Test 157 and 227 require virtio-blk
Date: Mon, 25 Mar 2024 16:47:37 +0100
Message-ID: <20240325154737.1305063-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.065,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Mon, 25 Mar 2024 15:47:55 -0000

Tests 157 and 227 use the virtio-blk device, so we have to mark these
tests accordingly to be skipped if this devices is not available (e.g.
when running the tests with qemu-system-avr only).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qemu-iotests/157 | 2 ++
 tests/qemu-iotests/227 | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/tests/qemu-iotests/157 b/tests/qemu-iotests/157
index 0dc9ba68d2..aa2ebbfb4b 100755
--- a/tests/qemu-iotests/157
+++ b/tests/qemu-iotests/157
@@ -40,6 +40,8 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 _supported_fmt generic
 _supported_proto file
 
+_require_devices virtio-blk
+
 do_run_qemu()
 {
     (
diff --git a/tests/qemu-iotests/227 b/tests/qemu-iotests/227
index 7e45a47ac6..eddaad679e 100755
--- a/tests/qemu-iotests/227
+++ b/tests/qemu-iotests/227
@@ -40,6 +40,8 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 _supported_fmt generic
 _supported_proto file
 
+_require_devices virtio-blk
+
 do_run_qemu()
 {
     echo Testing: "$@"
-- 
2.44.0


