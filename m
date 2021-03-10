Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lJvTU-0004kt-DS
	for mharc-qemu-trivial@gnu.org; Wed, 10 Mar 2021 04:49:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJvTS-0004kS-WD
 for qemu-trivial@nongnu.org; Wed, 10 Mar 2021 04:49:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJvTR-0002RU-Iq
 for qemu-trivial@nongnu.org; Wed, 10 Mar 2021 04:49:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615369788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DJj+Q5q0OwCpgqtccQsSNMhMWsi8s0dhoJ03bzf6Pag=;
 b=Cb+VkfTGImGnKslqR65OFhq3FXWQRyJZq1pXbW1EIFDbGfEzMsQ8BOgvbRuinTy+ffvPjg
 aUbM/LaNfwjgYuFTQG6oFaoyl0c3cB1KGUlttixfAcOUsx0n0TNy4oJJz9lDOHkCi2QnGa
 wu5zqG6nZv6n807OOTuQKEscKbYlAy4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-QifjL_kFMAyyn7muCs_lAA-1; Wed, 10 Mar 2021 04:49:45 -0500
X-MC-Unique: QifjL_kFMAyyn7muCs_lAA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0957618397F1;
 Wed, 10 Mar 2021 09:49:44 +0000 (UTC)
Received: from thuth.com (ovpn-112-19.ams2.redhat.com [10.36.112.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C0BF5DA2D;
 Wed, 10 Mar 2021 09:49:38 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-trivial@nongnu.org
Subject: [PATCH] tests: Fix broken "make check-speed"
Date: Wed, 10 Mar 2021 10:49:36 +0100
Message-Id: <20210310094936.1318317-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 10 Mar 2021 09:49:51 -0000

When running "make check-speed", currently nothing happens. This is
because the redirection to "bench-speed" is not working as expected
(since the bench-speed rule in the generated Makefile.mtest filters
for "bench-speed" and "bench" in the MAKECMDGOALS variable).
Fix it by calling "make bench-speed" instead of using a dependency.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/Makefile.include | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index d34254fb29..2a43cce4f6 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -134,7 +134,7 @@ check-acceptance: check-venv $(TESTS_RESULTS_DIR) get-vm-images
 
 # Consolidated targets
 
-.PHONY: check-block check check-clean get-vm-images
+.PHONY: check-block check check-clean get-vm-images check-speed
 check:
 
 ifeq ($(CONFIG_TOOLS)$(CONFIG_POSIX),yy)
@@ -156,6 +156,7 @@ clean: check-clean
 
 # For backwards compatibility
 
-check-speed: bench-speed
+check-speed:
+	$(MAKE) bench-speed
 
 endif
-- 
2.27.0


