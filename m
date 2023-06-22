Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qCIh8-0002E8-1Y
	for mharc-qemu-trivial@gnu.org; Thu, 22 Jun 2023 07:41:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qCIh4-0002Dv-H2
 for qemu-trivial@nongnu.org; Thu, 22 Jun 2023 07:41:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qCIh1-0007Eu-Gw
 for qemu-trivial@nongnu.org; Thu, 22 Jun 2023 07:41:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687434098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=UoL844toXPkUkSMzhyTnXgIiRzdMSmR43RKGHRw1pQw=;
 b=cCKnwDQR5hq9njRBLlJpR3SoeYCLDt2ljwm8mpIGc5tFNGTEzslZafvYZaCSpPJ4fusjt0
 KyrN9spYxMvr1ktSdqlKZrB2ugmdcVdA11/y2DK528OXDEsJW7sBROZ8L7PqepyV2c6iis
 1MuAQNgTH9Hv/5WFwC74wKDc78U1h1A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-qB3trCfSPkaYnmPdq84MJg-1; Thu, 22 Jun 2023 07:41:36 -0400
X-MC-Unique: qB3trCfSPkaYnmPdq84MJg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C2312812951;
 Thu, 22 Jun 2023 11:41:36 +0000 (UTC)
Received: from thuth.com (dhcp-192-205.str.redhat.com [10.33.192.205])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E113A200A3AD;
 Thu, 22 Jun 2023 11:41:34 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: qemu-trivial@nongnu.org,
	Fan Ni <fan.ni@samsung.com>
Subject: [PATCH] tests/qtest/cxl-test: Clean up temporary directories after
 testing
Date: Thu, 22 Jun 2023 13:41:32 +0200
Message-Id: <20230622114132.372898-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Thu, 22 Jun 2023 11:41:44 -0000

It's good style to clean up temporary directories when they
are not needed anymore.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/cxl-test.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/qtest/cxl-test.c b/tests/qtest/cxl-test.c
index edcad4a0ce..a600331843 100644
--- a/tests/qtest/cxl-test.c
+++ b/tests/qtest/cxl-test.c
@@ -124,6 +124,7 @@ static void cxl_t3d_deprecated(void)
 
     qtest_start(cmdline->str);
     qtest_end();
+    rmdir(tmpfs);
 }
 
 static void cxl_t3d_persistent(void)
@@ -138,6 +139,7 @@ static void cxl_t3d_persistent(void)
 
     qtest_start(cmdline->str);
     qtest_end();
+    rmdir(tmpfs);
 }
 
 static void cxl_t3d_volatile(void)
-- 
2.39.3


