Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oQlSG-0001uG-FX
	for mharc-qemu-trivial@gnu.org; Wed, 24 Aug 2022 04:09:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oQlSD-0001nr-4X
 for qemu-trivial@nongnu.org; Wed, 24 Aug 2022 04:09:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oQlSA-00049d-Nd
 for qemu-trivial@nongnu.org; Wed, 24 Aug 2022 04:09:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661328573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=L5KZwnYLedjY9IOYk0Fh07/1ljSDC6l11hcWy6tHmh0=;
 b=W2i+lOGsNyw6paihTgK+QhZ7LlnHIbDOtB8OzTr0hjFaPSL4W0rp9QlPItOjlQmAKcjsP9
 TN8Pbt5TgFrR6Ln4JlrjbRIjcMXjIqJM1rICwg0VcTxmbxLpbvNtJ+vuUibKjY2vt9W95k
 JKafH2uR4XQLhPrIVtts7GQkRKnm+Js=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-fcrDR7eRNrCMfEiB1NmP4g-1; Wed, 24 Aug 2022 04:09:30 -0400
X-MC-Unique: fcrDR7eRNrCMfEiB1NmP4g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2964C80231E;
 Wed, 24 Aug 2022 08:09:30 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 927D91415125;
 Wed, 24 Aug 2022 08:09:28 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-trivial@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH] tests/avocado: Fix trivial typo
Date: Wed, 24 Aug 2022 10:09:26 +0200
Message-Id: <20220824080926.568935-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Wed, 24 Aug 2022 08:09:38 -0000

The intention was likely to use "intend" instead of "indent" here.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/avocado/avocado_qemu/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index ed4853c805..26ebf01440 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -508,7 +508,7 @@ def default_kernel_params(self):
 class LinuxTest(LinuxSSHMixIn, QemuSystemTest):
     """Facilitates having a cloud-image Linux based available.
 
-    For tests that indent to interact with guests, this is a better choice
+    For tests that intend to interact with guests, this is a better choice
     to start with than the more vanilla `QemuSystemTest` class.
     """
 
-- 
2.31.1


