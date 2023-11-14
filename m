Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1r2wlp-0008MD-QI
	for mharc-qemu-trivial@gnu.org; Tue, 14 Nov 2023 12:00:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1r2wlm-0008Ci-PH; Tue, 14 Nov 2023 12:00:10 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1r2wlj-0005Z8-UN; Tue, 14 Nov 2023 12:00:10 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id C1FDD33278;
 Tue, 14 Nov 2023 19:59:01 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 8FA4D351FF;
 Tue, 14 Nov 2023 19:58:43 +0300 (MSK)
Received: (nullmailer pid 2949127 invoked by uid 1000);
 Tue, 14 Nov 2023 16:58:42 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Hyman Huang <yong.huang@smartx.com>, Juan Quintela <quintela@redhat.com>
Subject: [PATCH trivial 18/21] tests/qtest/migration-test.c: spelling fix:
 bandwith
Date: Tue, 14 Nov 2023 19:58:31 +0300
Message-Id: <20231114165834.2949011-19-mjt@tls.msk.ru>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231114165834.2949011-1-mjt@tls.msk.ru>
References: <20231114165834.2949011-1-mjt@tls.msk.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
X-List-Received-Date: Tue, 14 Nov 2023 17:00:11 -0000

Fixes: 17257b90be4f "tests: Add migration dirty-limit capability test"
Cc: Hyman Huang <yong.huang@smartx.com>
Cc: Juan Quintela <quintela@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 tests/qtest/migration-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 5752412b64..0fbaa6a90f 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -3138,7 +3138,7 @@ static void test_migrate_dirty_limit(void)
     uint64_t throttle_us_per_full;
     /*
      * We want the test to be stable and as fast as possible.
-     * E.g., with 1Gb/s bandwith migration may pass without dirty limit,
+     * E.g., with 1Gb/s bandwidth migration may pass without dirty limit,
      * so we need to decrease a bandwidth.
      */
     const int64_t dirtylimit_period = 1000, dirtylimit_value = 50;
-- 
2.39.2


