Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qmDMN-0002QT-Sn
	for mharc-qemu-trivial@gnu.org; Fri, 29 Sep 2023 09:16:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qmDMM-0002QC-Pl
 for qemu-trivial@nongnu.org; Fri, 29 Sep 2023 09:16:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qmDMJ-0005iH-V2
 for qemu-trivial@nongnu.org; Fri, 29 Sep 2023 09:16:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695993401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Bs4FdaeweoTjNwQM9gIwka8ho67MOsMJKlfGipKlQhE=;
 b=IKQ7PUxgxp8yy/hecw2aGAB19h3BFDigunAGjbnUAXyQDp9AfAkeNaCU4zIT0IzywzK5Rr
 O0UzYw3mwBexKnu6AuRoz6Mq0kB+TD/kHDrgGnM7pUi05D+8UsnyCqs0YguWGfsbYpRAtC
 YNRVg1N9aUbfXKHZaUx+NWVXSK/9ZmE=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-53-ghQtMXRsOzyNWfwtv8tUjA-1; Fri, 29 Sep 2023 09:16:39 -0400
X-MC-Unique: ghQtMXRsOzyNWfwtv8tUjA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F5C63827DF6;
 Fri, 29 Sep 2023 13:16:38 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.192.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 92CD21004145;
 Fri, 29 Sep 2023 13:16:37 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-trivial@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH] MAINTAINERS: Add the CI-related doc files to the CI section
Date: Fri, 29 Sep 2023 15:16:36 +0200
Message-ID: <20230929131636.394715-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 29 Sep 2023 13:16:47 -0000

The docs/devel/ci* were not covered yet, add them to MAINTAINERS
so that the right people are put on CC: for related patches.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7ecf3fbc2d..3914bbd85b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3888,6 +3888,7 @@ F: .github/workflows/lockdown.yml
 F: .gitlab-ci.yml
 F: .gitlab-ci.d/
 F: .travis.yml
+F: docs/devel/ci*
 F: scripts/ci/
 F: tests/docker/
 F: tests/vm/
-- 
2.41.0


