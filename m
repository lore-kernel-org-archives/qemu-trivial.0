Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tOCHJ-0002Mo-Bf
	for mharc-qemu-trivial@gnu.org; Thu, 19 Dec 2024 03:53:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hhan@redhat.com>) id 1tOCHI-0002Ma-Gj
 for qemu-trivial@nongnu.org; Thu, 19 Dec 2024 03:53:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hhan@redhat.com>) id 1tOCHH-0001EB-60
 for qemu-trivial@nongnu.org; Thu, 19 Dec 2024 03:53:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1734598382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rWbtMfwnWBywnZatq079oxPpSXU9USMm3HCByRx9/hE=;
 b=bPd+jJxVZ9Miqi1er7ivmeAtEELK2/EhMv7AS0jJjBsrapzQxS8qrllGCbxhDrxzBXxAyj
 2XcCiIIYtiL5vma4xM7l1aH+2dUEUpPd8NOEFhz0dl3u4MIqBvqBv6ZFqwUFvEDRnaY9k6
 cYBc6mgYlJ+x/k5327+GEinHkMYYiDk=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-451-hmHt9e1eNmO6uA_d_Km0iQ-1; Thu,
 19 Dec 2024 03:51:50 -0500
X-MC-Unique: hmHt9e1eNmO6uA_d_Km0iQ-1
X-Mimecast-MFC-AGG-ID: hmHt9e1eNmO6uA_d_Km0iQ
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 3241F19560B5
 for <qemu-trivial@nongnu.org>; Thu, 19 Dec 2024 08:51:49 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.72.112.148])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 5B5271956096; Thu, 19 Dec 2024 08:51:46 +0000 (UTC)
From: Han Han <hhan@redhat.com>
To: qemu-trivial@nongnu.org
Cc: Han Han <hhan@redhat.com>
Subject: [PATCH] target/i386/cpu: Fix notes for CPU models
Date: Thu, 19 Dec 2024 16:51:38 +0800
Message-ID: <20241219085141.1857343-1-hhan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3ioAlIe6EEDhZRTBBnWu-E4lC9Blt6F38eSnXoCIDac_1734598309
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hhan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1.116,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 19 Dec 2024 08:53:04 -0000

Signed-off-by: Han Han <hhan@redhat.com>
---
 target/i386/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 5253399459..820571761d 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -3691,6 +3691,7 @@ static const X86CPUDefinition builtin_x86_defs[] = {
             },
             {
                 .version = 4,
+                .note = "IBRS, EPT switching, no TSX",
                 .props = (PropValue[]) {
                     { "vmx-eptp-switching", "on" },
                     { /* end of list */ }
@@ -3825,7 +3826,7 @@ static const X86CPUDefinition builtin_x86_defs[] = {
               },
             },
             { .version = 4,
-              .note = "ARCH_CAPABILITIES, no TSX",
+              .note = "ARCH_CAPABILITIES, EPT switching, no TSX",
               .props = (PropValue[]) {
                   { "vmx-eptp-switching", "on" },
                   { /* end of list */ }
-- 
2.47.1


