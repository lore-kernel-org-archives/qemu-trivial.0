Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qtitM-0004SY-MF
	for mharc-qemu-trivial@gnu.org; Fri, 20 Oct 2023 02:21:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qtitK-0004S6-62
 for qemu-trivial@nongnu.org; Fri, 20 Oct 2023 02:21:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qtitI-0000Fv-RX
 for qemu-trivial@nongnu.org; Fri, 20 Oct 2023 02:21:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697782908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=38tZ1dNDZZhAFvvxYb+RcrQ8meQPRpMGUjFtvjz0Dlo=;
 b=OGSLM8+OjQqcE5L4JWYohqCqouLBtuDRBbwqWSqP4hW21gJZsn5jiQSgylTFmpTm9f4Tbz
 U6SKaIYTRjtTuaMc6BYDHyqe/GouWThQkdCr1/fUlFB9g+5wIzybzqBlS+STflP0UABIbd
 J09MEM54ZfDgLDUm05xx8tml9PM7gIk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-138-BtOwHUIcNASPth7T0gdz7A-1; Fri, 20 Oct 2023 02:21:44 -0400
X-MC-Unique: BtOwHUIcNASPth7T0gdz7A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 44A6E185A795;
 Fri, 20 Oct 2023 06:21:44 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.192.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 83F1C2026D4C;
 Fri, 20 Oct 2023 06:21:43 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Subject: [PATCH] MAINTAINERS: Extend entry to cover util/qemu-timer-common.c,
 too
Date: Fri, 20 Oct 2023 08:21:42 +0200
Message-ID: <20231020062142.525405-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Fri, 20 Oct 2023 06:21:50 -0000

We already cover util/qemu-timer.c in MAINTAINERS - change this entry
to util/qemu-timer*.c so that it covers util/qemu-timer-common.c, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4cc71d1675..efd3eda7d1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2968,7 +2968,7 @@ F: include/qemu/main-loop.h
 F: include/sysemu/runstate.h
 F: include/sysemu/runstate-action.h
 F: util/main-loop.c
-F: util/qemu-timer.c
+F: util/qemu-timer*.c
 F: system/vl.c
 F: system/main.c
 F: system/cpus.c
-- 
2.41.0


