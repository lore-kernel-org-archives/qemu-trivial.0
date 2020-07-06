Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jsQaT-0006XZ-1w
	for mharc-qemu-trivial@gnu.org; Mon, 06 Jul 2020 08:51:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jsQaS-0006XL-2C
 for qemu-trivial@nongnu.org; Mon, 06 Jul 2020 08:51:08 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:58668
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jsQaM-0005MX-GH
 for qemu-trivial@nongnu.org; Mon, 06 Jul 2020 08:51:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594039861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=B2V6sLlr56ArBAbGlzHM8dummsy6684FuhpC4doiVac=;
 b=D5wE0k31QFC0NCrngjgBo2zhkk6BmU17Xrouu5uRKCSeT59af0BZKw6Pq6C8P0xwJ5WPIb
 TWYYT24D7PDbSU+r5SKwekXMXYCRNZZ2HhV0BBDdaCRLypkPivf35SLkxJ7Mq/zkTA4KSV
 RgQpvLt2FhJyapNOF1ZkjpnM6QGAFxM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-Jim0tnW3NDKA5pDHUpbW1A-1; Mon, 06 Jul 2020 08:50:59 -0400
X-MC-Unique: Jim0tnW3NDKA5pDHUpbW1A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C692804018;
 Mon,  6 Jul 2020 12:50:58 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.36.110.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD98771665;
 Mon,  6 Jul 2020 12:50:56 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH] scripts: improve message when TAP based tests fail
Date: Mon,  6 Jul 2020 13:50:54 +0100
Message-Id: <20200706125054.2619012-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=berrange@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/06 01:52:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Jul 2020 12:51:08 -0000

If one of the qtests fails, the TAP driver prints out a message like:

  ERROR - too few tests run (expected 3, got 1)

which fails to tell you which test program failed. This is a critical
ommission when many tests are running in parallel as their output is
interleaved. The improved message is:

  ERROR endianness-test - too few tests run (expected 3, got 1)

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 scripts/tap-driver.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/tap-driver.pl b/scripts/tap-driver.pl
index 6621a5cd67..b1d3880c50 100755
--- a/scripts/tap-driver.pl
+++ b/scripts/tap-driver.pl
@@ -217,7 +217,7 @@ sub report ($;$)
 
 sub testsuite_error ($)
 {
-  report "ERROR", "- $_[0]";
+  report "ERROR", "$test_name - $_[0]";
 }
 
 sub handle_tap_result ($)
-- 
2.26.2


