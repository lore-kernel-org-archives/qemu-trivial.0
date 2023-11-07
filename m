Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1r0JMY-000790-3G
	for mharc-qemu-trivial@gnu.org; Tue, 07 Nov 2023 05:31:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1r0JMW-00078k-MH
 for qemu-trivial@nongnu.org; Tue, 07 Nov 2023 05:31:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1r0JMV-0006fT-3m
 for qemu-trivial@nongnu.org; Tue, 07 Nov 2023 05:31:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699353070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=mZONFbQdlZzlbfr0XU3FyR9cVXeV4YuUOlZvxxmMhxE=;
 b=OkFdY0DTSkTMtkDJxkukLF1aLMDMYN4y0AoahXncY72tfQJE05mxMn41XgWMODlbrato4J
 YBOgkek9/8yI4pVCps8vs6BDJ3iRETMhfTTkF+cY6i7w0O+YUWcvN3XdYe6ZtIX1E44M7P
 q7Z5DfnDKa/E2Q6/gk/1jFRcDHvz5Wk=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-617-fayZ4JPiP5mvQStk7XicPg-1; Tue,
 07 Nov 2023 05:30:46 -0500
X-MC-Unique: fayZ4JPiP5mvQStk7XicPg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C4BA3C1AF47;
 Tue,  7 Nov 2023 10:30:46 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.192.124])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 73B3B25C0;
 Tue,  7 Nov 2023 10:30:45 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Subject: [PATCH] MAINTAINERS: Add artist.c to the hppa machine section
Date: Tue,  7 Nov 2023 11:30:44 +0100
Message-ID: <20231107103044.15089-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Tue, 07 Nov 2023 10:31:12 -0000

The artist graphics adapter is only used by the hppa machine, so
let's add this file to the corresponding section.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c1ddf9d623..0c2ef567f0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1204,6 +1204,7 @@ M: Richard Henderson <richard.henderson@linaro.org>
 R: Helge Deller <deller@gmx.de>
 S: Odd Fixes
 F: configs/devices/hppa-softmmu/default.mak
+F: hw/display/artist.c
 F: hw/hppa/
 F: hw/input/lasips2.c
 F: hw/net/*i82596*
-- 
2.41.0


