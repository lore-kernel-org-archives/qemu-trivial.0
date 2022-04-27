Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1njhm4-0007YS-Qs
	for mharc-qemu-trivial@gnu.org; Wed, 27 Apr 2022 09:32:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1njhm3-0007Pa-5G
 for qemu-trivial@nongnu.org; Wed, 27 Apr 2022 09:32:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1njhlz-0006qv-3i
 for qemu-trivial@nongnu.org; Wed, 27 Apr 2022 09:32:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651066321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=zYhgACUWQgq9l8pXl+6GzDv56SU2M/vIYGGXa0gaxtU=;
 b=EoXspNYeiIhNo2NPSswfoMKq5FrotXOLiEJdYVNXuOEFBMw25+dRDrWxzgG/SvsYBw07+Y
 xkb+/R6dd8dmGWoYmNKDLCrQ+Sz7ug54PN7nhv+AowKHCcTrbr90dpM80YdF5+epOujWHG
 tqRHn3aGeHzC05bOPkW3opQi7wCKVkE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-148-nK8wegdCPM-TDGnzXO5hFQ-1; Wed, 27 Apr 2022 09:31:59 -0400
X-MC-Unique: nK8wegdCPM-TDGnzXO5hFQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B59E9804184;
 Wed, 27 Apr 2022 13:31:58 +0000 (UTC)
Received: from thuth.com (dhcp-192-232.str.redhat.com [10.33.192.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B24C257AF7C;
 Wed, 27 Apr 2022 13:31:57 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 xen-devel@lists.xenproject.org
Subject: [PATCH] qemu-options: Limit the -xen options to x86 and arm
Date: Wed, 27 Apr 2022 15:31:56 +0200
Message-Id: <20220427133156.344418-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
X-List-Received-Date: Wed, 27 Apr 2022 13:32:07 -0000

The Xen hypervisor is only available on x86 and arm - thus let's
limit the related options to these targets.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 qemu-options.hx | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 1764eebfaf..cc3a39d21a 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4184,16 +4184,17 @@ SRST
 ERST
 
 DEF("xen-domid", HAS_ARG, QEMU_OPTION_xen_domid,
-    "-xen-domid id   specify xen guest domain id\n", QEMU_ARCH_ALL)
+    "-xen-domid id   specify xen guest domain id\n",
+    QEMU_ARCH_ARM | QEMU_ARCH_I386)
 DEF("xen-attach", 0, QEMU_OPTION_xen_attach,
     "-xen-attach     attach to existing xen domain\n"
     "                libxl will use this when starting QEMU\n",
-    QEMU_ARCH_ALL)
+    QEMU_ARCH_ARM | QEMU_ARCH_I386)
 DEF("xen-domid-restrict", 0, QEMU_OPTION_xen_domid_restrict,
     "-xen-domid-restrict     restrict set of available xen operations\n"
     "                        to specified domain id. (Does not affect\n"
     "                        xenpv machine type).\n",
-    QEMU_ARCH_ALL)
+    QEMU_ARCH_ARM | QEMU_ARCH_I386)
 SRST
 ``-xen-domid id``
     Specify xen guest domain id (XEN only).
-- 
2.27.0


