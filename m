Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kGiYC-0005oP-W9
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2020 08:53:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kGiYB-0005mw-S2
 for qemu-trivial@nongnu.org; Fri, 11 Sep 2020 08:53:11 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:23408
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kGiY9-00043N-6i
 for qemu-trivial@nongnu.org; Fri, 11 Sep 2020 08:53:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599828788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=UX9AvpNZYAWYcvuk8HiroWjU3CWS/PepIA7paF1wlAc=;
 b=QkVLHApafJJGpsin3n7xGCsSEWJYrCA8gbVS7kis+0ws2L8a44lGRG1cPtWcCKtRoQLdqW
 ixBPBrcj3TePBdEaach6Vcoy4Sug7zlFDD00wqAfvDsXS5qffaWMMNBa8QtyAWEaCYjG6C
 l/C8/hEuCciA5K1o2NS2LIBHGlZntLg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-lblDRYJeM3inBDOkJTCE8A-1; Fri, 11 Sep 2020 08:53:06 -0400
X-MC-Unique: lblDRYJeM3inBDOkJTCE8A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6447CD040;
 Fri, 11 Sep 2020 12:53:05 +0000 (UTC)
Received: from thuth.com (ovpn-115-1.ams2.redhat.com [10.36.115.1])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C8FEE60C07;
 Fri, 11 Sep 2020 12:53:03 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Marcelo Tosatti <mtosatti@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org
Subject: [PATCH] target/i386/kvm: Add missing fallthrough comment
Date: Fri, 11 Sep 2020 14:53:01 +0200
Message-Id: <20200911125301.413081-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.61; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/11 03:40:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Fri, 11 Sep 2020 12:53:12 -0000

Let's make this file compilable with -Werror=implicit-fallthrough :
Looking at the code, it seems like the fallthrough is intended here,
so we should add the corresponding "/* fallthrough */" comment here.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/i386/kvm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index 205b68bc0c..283d3305d5 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -1568,6 +1568,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
             if (env->nr_dies < 2) {
                 break;
             }
+            /* fallthrough */
         case 4:
         case 0xb:
         case 0xd:
-- 
2.18.2


