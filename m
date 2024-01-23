Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rSEZl-0006xu-V1
	for mharc-qemu-trivial@gnu.org; Tue, 23 Jan 2024 06:04:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rSEZW-0006tx-GU
 for qemu-trivial@nongnu.org; Tue, 23 Jan 2024 06:04:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rSEZU-000303-Jg
 for qemu-trivial@nongnu.org; Tue, 23 Jan 2024 06:04:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706007840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=GYHrRmNkrdLNBEg4Iw3/WxRaa1aXq7tYr/zJR05srfc=;
 b=N6G3jFNzKqZo7w+Ht2yTxU9SKENbjYPPI9sGZ8zabuHlltaK/FCn0vKa3i4YkMoyOLOVhf
 pYCtHJi/5h9yiEFrrpaOxuHxLgZF7O8kbr9E5DJrxDldrESfND2CnpNlyLMKqw1xUNjceW
 Anc0YBWxVRZtlG9ExCVQ+xF3iyvixdA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-yQuDd-AdNPm0QA9g0du7yQ-1; Tue, 23 Jan 2024 06:03:55 -0500
X-MC-Unique: yQuDd-AdNPm0QA9g0du7yQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C25785A58E;
 Tue, 23 Jan 2024 11:03:55 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.192.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F7CE492BFA;
 Tue, 23 Jan 2024 11:03:54 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH] tests/qtest: Bump timeout of the boot-serial-test to 360
 seconds
Date: Tue, 23 Jan 2024 12:03:53 +0100
Message-ID: <20240123110353.30658-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.289,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 23 Jan 2024 11:04:08 -0000

On the slow k8s CI runner, the test sometimes takes more than 240
seconds. See for example this run here where it took ~ 267 seconds:

 https://gitlab.com/qemu-project/qemu/-/jobs/5806087027#L4769

Thus we have to bump the timeout here even further to be on the
safe side. Let's use 360 seconds which should hopefully really be
high enough now.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2097
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index d22434b14e..d22aec6734 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -9,7 +9,7 @@ slow_qtests = {
   'test-hmp' : 240,
   'pxe-test': 600,
   'prom-env-test': 360,
-  'boot-serial-test': 240,
+  'boot-serial-test': 360,
   'qos-test': 120,
 }
 
-- 
2.43.0


