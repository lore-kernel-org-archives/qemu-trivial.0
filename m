Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1q6nw4-0008VO-6H
	for mharc-qemu-trivial@gnu.org; Wed, 07 Jun 2023 03:50:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1q6nw2-0008Uu-PH
 for qemu-trivial@nongnu.org; Wed, 07 Jun 2023 03:50:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1q6nw1-00047R-CI
 for qemu-trivial@nongnu.org; Wed, 07 Jun 2023 03:50:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686124224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=g4yeAbUkfqDROXp7WZr3jaLIKaXa7y1xtLxoJAo6Ngc=;
 b=eYdFZnOkRNEsasSenFH5bat4dByxlQOeID/edtNRpAk/A1syldFHZPtmOW4vkO19hwVhgY
 PUpvib+Y5MSvC/s2D3PxbjbWhbW7yjKGrkvFO0JW4gq37C+oStRv2zUA4wr8ThYWYnxAP/
 NQ1QPjDaMG242qO4Dr8nyRt64qpbgRQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-fvXU-YJ2O2-CECUecxbwFQ-1; Wed, 07 Jun 2023 03:50:21 -0400
X-MC-Unique: fvXU-YJ2O2-CECUecxbwFQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD2AA185A791;
 Wed,  7 Jun 2023 07:50:20 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.43.2.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F9AC140E954;
 Wed,  7 Jun 2023 07:50:20 +0000 (UTC)
From: Michal Privoznik <mprivozn@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	pbonzini@redhat.com
Subject: [PATCH] configure: check for $download value properly
Date: Wed,  7 Jun 2023 09:50:06 +0200
Message-Id: <3236bc555c76dcd561d38a3aea6e8489e917bc15.1686124161.git.mprivozn@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 07 Jun 2023 07:50:27 -0000

If configure was invoked with --disable-download and git
submodules were not checked out a warning is produced and the
configure script fails. But the $download variable (which
reflects the enable/disable download argument) is checked for in
a weird fashion:

  test -f "$download" = disabled

Drop the '-f' to check for the actual value of the variable.

Fixes: 2019cabfee0
Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 8765b88e12..8a638dd82a 100755
--- a/configure
+++ b/configure
@@ -767,7 +767,7 @@ if test "$plugins" = "yes" -a "$tcg" = "disabled"; then
 fi
 
 if ! test -f "$source_path/subprojects/keycodemapdb/README" \
-    && test -f "$download" = disabled
+    && test "$download" = disabled
 then
     echo
     echo "ERROR: missing subprojects"
-- 
2.39.3


