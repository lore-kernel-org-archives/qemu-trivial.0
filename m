Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kEARc-0000xc-08
	for mharc-qemu-trivial@gnu.org; Fri, 04 Sep 2020 08:03:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kEARa-0000uc-80
 for qemu-trivial@nongnu.org; Fri, 04 Sep 2020 08:03:50 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:29798
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kEARY-0008E1-PH
 for qemu-trivial@nongnu.org; Fri, 04 Sep 2020 08:03:49 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-O3U5crGkOHuxgVp4swQI5g-1; Fri, 04 Sep 2020 08:03:43 -0400
X-MC-Unique: O3U5crGkOHuxgVp4swQI5g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D782184E243;
 Fri,  4 Sep 2020 12:03:42 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78C3569CA3;
 Fri,  4 Sep 2020 12:03:42 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com,
	lvivier@redhat.com,
	qemu-trivial@nongnu.org
Subject: [PATCH] tests/qtest: do not list ahci-test twice
Date: Fri,  4 Sep 2020 08:03:42 -0400
Message-Id: <20200904120342.11370-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/04 03:58:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 04 Sep 2020 12:03:50 -0000

This is caught by "meson test", which complains about two tests with the
same name.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qtest/meson.build | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 8f8fdb1336..874b5be62b 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -49,7 +49,6 @@ qtests_i386 = \
   qtests_pci +                                                                              \
   ['fdc-test',
    'ide-test',
-   'ahci-test',
    'hd-geo-test',
    'boot-order-test',
    'bios-tables-test',
-- 
2.26.2


