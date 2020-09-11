Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kGi13-00028L-1a
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2020 08:18:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kGi11-00027C-HI
 for qemu-trivial@nongnu.org; Fri, 11 Sep 2020 08:18:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kGi0z-0007RW-6b
 for qemu-trivial@nongnu.org; Fri, 11 Sep 2020 08:18:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599826731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=0sonYEoIK5vfUm9HV1fIji2OCjDdFDC+pHgrtmXxuUc=;
 b=E3BgTvvx8scykg2lfjs96eP1pl/hKfsyyZ70OlGqmfpgfcBR7qiXnXsj9NNGK66yFQVcQj
 AzoiASp8GmwQuLvnJqWgqmOfp9rwv7DrsegCmldYji46D+bPespuLSZTc5IP/Gm/kG7Igm
 cBwwvmf5ClwXQ+4UH5LAt8m1N+PrcyI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-S6Q7ZHrENDKE6GmYZaanVQ-1; Fri, 11 Sep 2020 08:18:49 -0400
X-MC-Unique: S6Q7ZHrENDKE6GmYZaanVQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85C228030DD;
 Fri, 11 Sep 2020 12:18:48 +0000 (UTC)
Received: from thuth.com (ovpn-115-1.ams2.redhat.com [10.36.115.1])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2755C7E8F1;
 Fri, 11 Sep 2020 12:18:46 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Subject: [PATCH] hw/arm/pxa2xx: Add missing fallthrough comment
Date: Fri, 11 Sep 2020 14:18:44 +0200
Message-Id: <20200911121844.404434-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/11 08:18:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Fri, 11 Sep 2020 12:18:55 -0000

Let's make this file compilable with -Werror=implicit-fallthrough :
Looking at the code, it seems like the fallthrough is intended here,
so we should add the corresponding "/* fallthrough */" comment here.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/pxa2xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index 76975d17a4..c1f45b2adf 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -443,7 +443,7 @@ static void pxa2xx_mm_write(void *opaque, hwaddr addr,
             s->mm_regs[addr >> 2] = value;
             break;
         }
-
+        /* fallthrough */
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: Bad write offset 0x%"HWADDR_PRIx"\n",
-- 
2.18.2


