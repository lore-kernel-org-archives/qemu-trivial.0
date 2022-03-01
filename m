Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nOyLg-0007Qz-Bd
	for mharc-qemu-trivial@gnu.org; Tue, 01 Mar 2022 03:59:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nOyLe-0007Ji-0T
 for qemu-trivial@nongnu.org; Tue, 01 Mar 2022 03:59:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nOyLa-0004bW-Vc
 for qemu-trivial@nongnu.org; Tue, 01 Mar 2022 03:59:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646125145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1mB8Rmk7azzWgiSCorUh3Arp9bleh7d37IIKsc+UUMA=;
 b=QmnZ46eK6qM43PTMtZvsRdUIhe0rRhnteGo/Ria9XniTs7pfCorvrgJm/1Pz2f9ihJpRiq
 uH94CmFCXEbttg9kpDc+x4V0OI+QPhPOwyzTIaTeAJ6aif/UaPvCpiT4xqFmrEb+CUjTRR
 cMzrFbBACGHdsU6WRon4zzOkRNFrm+o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-257-gD1J9I6BM-W6d4pfGy-Psw-1; Tue, 01 Mar 2022 03:59:04 -0500
X-MC-Unique: gD1J9I6BM-W6d4pfGy-Psw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0243A8070ED;
 Tue,  1 Mar 2022 08:59:03 +0000 (UTC)
Received: from thuth.com (dhcp-192-205.str.redhat.com [10.33.192.205])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D6CF45ED32;
 Tue,  1 Mar 2022 08:59:01 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org
Subject: [PATCH] tests/Makefile.include: Let "make clean" remove the TCG tests, too
Date: Tue,  1 Mar 2022 09:59:00 +0100
Message-Id: <20220301085900.1443232-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Tue, 01 Mar 2022 08:59:10 -0000

"make clean" should clear all binaries that have been built, but so
far it left the TCG tests still in place. Let's make sure that they
are now removed, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/Makefile.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index e7153c8e91..7a932caf91 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -162,6 +162,6 @@ check-build: run-ninja
 check-clean:
 	rm -rf $(TESTS_VENV_DIR) $(TESTS_RESULTS_DIR)
 
-clean: check-clean
+clean: check-clean clean-tcg
 
 endif
-- 
2.27.0


