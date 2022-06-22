Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o40xL-0007Gc-AZ
	for mharc-qemu-trivial@gnu.org; Wed, 22 Jun 2022 10:03:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o40xK-0007FY-1p
 for qemu-trivial@nongnu.org; Wed, 22 Jun 2022 10:03:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o40xE-0001h0-GH
 for qemu-trivial@nongnu.org; Wed, 22 Jun 2022 10:03:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655906615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=LIWjinE2AJh0qaz5Kku0jJs1fQUMaBcf4Q9GPcpSMDI=;
 b=B8sUNBkbv/8EtnlAzgNmcbjvNfviODu1SposUZZQPrGbRKpoQs8okbxTCt9vkpJ0+V9eKS
 PUECLLNpdLby34motyefIQN+SPhJaiX3B//5lmSrK06+eCXNzGc8g6NgUO3XpMbuMhW2hd
 fSjhFog6X3O3o5Yt3GyyWkODyV8BgAY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-WjjHLPqIPSuh1Q6j6DUjSA-1; Wed, 22 Jun 2022 10:03:33 -0400
X-MC-Unique: WjjHLPqIPSuh1Q6j6DUjSA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 316068117B0;
 Wed, 22 Jun 2022 14:03:33 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C4FE1121314;
 Wed, 22 Jun 2022 14:03:31 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Riku Voipio <riku.voipio@iki.fi>
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] common-user: Only compile the common user code if have_user
 is set
Date: Wed, 22 Jun 2022 16:03:28 +0200
Message-Id: <20220622140328.383961-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Wed, 22 Jun 2022 14:03:42 -0000

There is no need to waste cycles here if we only compile the system
binaries or tools. Additionally, this change is even a hard requirement
for building the tools on systems that do not have an entry in the
common-user/host/ folder (since common-user/meson.build is trying
to add such a path via the include_directories() command).

Reported-by: Michael Tokarev <mjt@tls.msk.ru>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 common-user/meson.build | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/common-user/meson.build b/common-user/meson.build
index 26212dda5c..ac9de5b9e3 100644
--- a/common-user/meson.build
+++ b/common-user/meson.build
@@ -1,3 +1,7 @@
+if not have_user
+   subdir_done()
+endif
+
 common_user_inc += include_directories('host/' / host_arch)
 
 user_ss.add(files(
-- 
2.31.1


