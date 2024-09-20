Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1srgDv-0000wk-CL
	for mharc-qemu-trivial@gnu.org; Fri, 20 Sep 2024 12:11:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1srgDt-0000nx-Tg
 for qemu-trivial@nongnu.org; Fri, 20 Sep 2024 12:11:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1srgDe-00041w-DW
 for qemu-trivial@nongnu.org; Fri, 20 Sep 2024 12:11:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726848652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=+PgIX/tPajMVfVh6gYkWb1bwdlXDYGf/Hf77zKHTjKw=;
 b=ATd9kOEGoqLGy0VPf8EEL6a06YYtQwMuczHAJgn3UtDEU3coGKQM7cjZTUqxDDniQDHAfl
 IRsZN9Kux2cK6re0lkfw2fJsVlTynzcAg9ljxrF8OBYIhxz7s18g4qkaPLIsQmkJRifELc
 0+fdAEuuj3efvScHV6u85N66DvBwuxg=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-515-5izZFd4cOA-TYWlVIPc6VA-1; Fri,
 20 Sep 2024 12:10:50 -0400
X-MC-Unique: 5izZFd4cOA-TYWlVIPc6VA-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (unknown
 [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id F28171979053; Fri, 20 Sep 2024 16:10:49 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.194.56])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id E72AC19560AA; Fri, 20 Sep 2024 16:10:47 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Yoshinori Sato <ysato@users.sourceforge.jp>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Subject: [PATCH] configs: Fix typo in the sh4-softmmu devices config file
Date: Fri, 20 Sep 2024 18:10:45 +0200
Message-ID: <20240920161045.84622-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 20 Sep 2024 16:11:10 -0000

This is the config file for the little endian target, so there
should not be a "eb" in here.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configs/devices/sh4-softmmu/default.mak | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/devices/sh4-softmmu/default.mak b/configs/devices/sh4-softmmu/default.mak
index aa821e4b60..efb401bfb1 100644
--- a/configs/devices/sh4-softmmu/default.mak
+++ b/configs/devices/sh4-softmmu/default.mak
@@ -1,4 +1,4 @@
-# Default configuration for sh4eb-softmmu
+# Default configuration for sh4-softmmu
 
 # Uncomment the following lines to disable these optional devices:
 #
-- 
2.46.0


