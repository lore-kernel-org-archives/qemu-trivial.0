Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k2UXw-0003Aw-5p
	for mharc-qemu-trivial@gnu.org; Mon, 03 Aug 2020 03:06:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1k2UXt-00036d-93
 for qemu-trivial@nongnu.org; Mon, 03 Aug 2020 03:06:05 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:56399
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1k2UXq-0003Cy-PL
 for qemu-trivial@nongnu.org; Mon, 03 Aug 2020 03:06:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596438360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=VF3bskFpUo+3gNHg5QL/8e3CZFfA1bCslOI9EqbBneA=;
 b=c90wU8tNmrab1cpu3dZGobvdJPNEmE1GYUhfKFlasRG0M4XhfZcnQPBeRMCrNy6zioj6cJ
 4Yeg+y8rjn8EfeyT3xoOXGzwyU5LhsRfK5RHC8ru1MBrv/tP55BhXoGRCDnykbDZiYrLEu
 HFyGYwrj3or63iKl/jSRfbrrfslVrNo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-ipETdeXmOTC2yPqb4eEHlQ-1; Mon, 03 Aug 2020 03:05:58 -0400
X-MC-Unique: ipETdeXmOTC2yPqb4eEHlQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84CCF106B247;
 Mon,  3 Aug 2020 07:05:57 +0000 (UTC)
Received: from thuth.com (ovpn-112-113.ams2.redhat.com [10.36.112.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A96A35FC31;
 Mon,  3 Aug 2020 07:05:56 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Subject: [PATCH] tests/Makefile: test-replication needs CONFIG_POSIX
Date: Mon,  3 Aug 2020 09:05:54 +0200
Message-Id: <20200803070554.21655-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/03 01:24:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 03 Aug 2020 07:06:05 -0000

test-replication uses sigaction() and friends which are only available
on posix-like systems.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/Makefile.include | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 1e5ca3b585..430119db74 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -155,11 +155,13 @@ check-unit-$(CONFIG_BLOCK)  += tests/test-crypto-afsplit$(EXESUF)
 check-unit-$(call land,$(CONFIG_BLOCK),$(CONFIG_QEMU_PRIVATE_XTS)) += tests/test-crypto-xts$(EXESUF)
 check-unit-$(CONFIG_BLOCK)  += tests/test-crypto-block$(EXESUF)
 check-unit-y += tests/test-logging$(EXESUF)
-check-unit-$(call land,$(CONFIG_BLOCK),$(CONFIG_REPLICATION)) += tests/test-replication$(EXESUF)
 check-unit-$(CONFIG_SOFTMMU) += tests/test-bufferiszero$(EXESUF)
 check-unit-y += tests/test-uuid$(EXESUF)
 check-unit-y += tests/ptimer-test$(EXESUF)
 check-unit-y += tests/test-qapi-util$(EXESUF)
+ifeq ($(CONFIG_BLOCK)$(CONFIG_REPLICATION)$(CONFIG_POSIX),yyy)
+check-unit-y += tests/test-replication$(EXESUF)
+endif
 
 check-block-$(call land,$(CONFIG_POSIX),$(CONFIG_SOFTMMU)) += tests/check-block.sh
 
-- 
2.18.1


