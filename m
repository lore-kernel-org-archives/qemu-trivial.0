Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kUpMr-0002ZS-L5
	for mharc-qemu-trivial@gnu.org; Tue, 20 Oct 2020 06:59:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kUpMp-0002XW-Sy
 for qemu-trivial@nongnu.org; Tue, 20 Oct 2020 06:59:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kUpMo-00064h-C9
 for qemu-trivial@nongnu.org; Tue, 20 Oct 2020 06:59:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603191585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=b8dt7Ngk6ivHozgFhpCN03VTvz2toPLe9gvyAeHfzlw=;
 b=ThxR+dy3IjlSKmdGoDaq8duSvvR8WaX5BiwQCsbifIAWshtJyKP8ys/+AeOEpFrZiZ9tk9
 c+0iFAih3lYCxXFdfs9QoWr/E0PwbX5voswVIKQNAggPPF/Xe3zDfQ3FKB1AjwqHpMG1y9
 rlH25snruNfgG6rcr7CZFMLWkWWt9B4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-ZCzRoFVlPGKQkOnL5t2Krg-1; Tue, 20 Oct 2020 06:59:42 -0400
X-MC-Unique: ZCzRoFVlPGKQkOnL5t2Krg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD76064082;
 Tue, 20 Oct 2020 10:59:40 +0000 (UTC)
Received: from thuth.com (dhcp-192-238.str.redhat.com [10.33.192.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD9485D9D2;
 Tue, 20 Oct 2020 10:59:39 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Rob Herring <robh@kernel.org>, qemu-arm@nongnu.org, qemu-trivial@nongnu.org
Subject: [PATCH] hw/arm/highbank: Silence warnings about missing fallthrough
 statements
Date: Tue, 20 Oct 2020 12:59:38 +0200
Message-Id: <20201020105938.23209-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 01:16:16
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Tue, 20 Oct 2020 10:59:48 -0000

When compiling with -Werror=implicit-fallthrough, gcc complains about
missing fallthrough annotations in this file. Looking at the code,
the fallthrough is very likely intended here, so add some comments
to silence the compiler warnings.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/highbank.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index da0510d7ce..f71087860d 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -92,10 +92,12 @@ static void hb_reset_secondary(ARMCPU *cpu, const struct arm_boot_info *info)
         address_space_stl_notdirty(&address_space_memory,
                                    SMP_BOOT_REG + 0x30, 0,
                                    MEMTXATTRS_UNSPECIFIED, NULL);
+        /* fallthrough */
     case 3:
         address_space_stl_notdirty(&address_space_memory,
                                    SMP_BOOT_REG + 0x20, 0,
                                    MEMTXATTRS_UNSPECIFIED, NULL);
+        /* fallthrough */
     case 2:
         address_space_stl_notdirty(&address_space_memory,
                                    SMP_BOOT_REG + 0x10, 0,
-- 
2.18.2


