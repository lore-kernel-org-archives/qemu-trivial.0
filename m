Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1swhxD-0001I2-6s
	for mharc-qemu-trivial@gnu.org; Fri, 04 Oct 2024 09:02:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1swhx8-0001HJ-Kd
 for qemu-trivial@nongnu.org; Fri, 04 Oct 2024 09:02:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1swhx6-0007n1-Ii
 for qemu-trivial@nongnu.org; Fri, 04 Oct 2024 09:02:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1728046954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=DtReNS6pT4fNYyHx94Lkyyryh1zP1mLYJecc8WY04KY=;
 b=bngIQSGzJCSFW4/1vVJ0FptSW66TzCk9THgcl2KmR+zjhVWJU98NPmXcTp1+FdjTSFzO0F
 jvJVYEo59W2MBp8+Z7bahDemsvFYt/Kudu+7NvT0bkbmO37dszOXiT0T9tg/DB30EO9ALS
 bIswDPmbEIh77Z0d/HdwsN8mwirgzo0=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-643-tydbeoHjOIa5kS9lTofiWQ-1; Fri,
 04 Oct 2024 09:02:31 -0400
X-MC-Unique: tydbeoHjOIa5kS9lTofiWQ-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id F0BF21955F42; Fri,  4 Oct 2024 13:02:29 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.193.65])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 62EFB19560AE; Fri,  4 Oct 2024 13:02:26 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Brian Cain <bcain@quicinc.com>
Subject: [PATCH] tests/functional: Fix hash validation
Date: Fri,  4 Oct 2024 15:02:25 +0200
Message-ID: <20241004130225.217441-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.146,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-List-Received-Date: Fri, 04 Oct 2024 13:02:38 -0000

The _check() function is supposed to check whether the hash of the
downloaded file matches the expected one. Unfortunately, during the
last rework of this function, the check was accidentally turned into
returning the hash value itself instead of a True/False value,
effectively accepting each hash as valid. Let's do a proper check
again now.

Fixes:05e303210d ("tests/functional/qemu_test: Use Python hashlib ...")
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/functional/qemu_test/asset.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/functional/qemu_test/asset.py b/tests/functional/qemu_test/asset.py
index 3ec429217e..e47bfac035 100644
--- a/tests/functional/qemu_test/asset.py
+++ b/tests/functional/qemu_test/asset.py
@@ -57,7 +57,7 @@ def _check(self, cache_file):
                     break
                 hl.update(chunk)
 
-        return  hl.hexdigest()
+        return self.hash == hl.hexdigest()
 
     def valid(self):
         return self.cache_file.exists() and self._check(self.cache_file)
-- 
2.46.1


