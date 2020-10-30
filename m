Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kYQle-0006Fq-4x
	for mharc-qemu-trivial@gnu.org; Fri, 30 Oct 2020 05:32:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kYQlc-0006EV-Vl
 for qemu-trivial@nongnu.org; Fri, 30 Oct 2020 05:32:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kYQlZ-0006H2-QO
 for qemu-trivial@nongnu.org; Fri, 30 Oct 2020 05:32:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604050328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=j9+co+yHNebq0st5iScvOYiGRcFH9wqN3HV3MiZmaMQ=;
 b=NFw6tIo5KMY5YAQncsJW0jk6ovEXCBqS62mCamy4sKZoFMfiKP+ULQGo8oW59AkQ3vKpPa
 C1s7/F+ZAl0BCJLJx2hM3iINFxe/KJIx790Z2Dc+RLt1lD6IukRewyXbKnQRHOsoEMPIWr
 bILsqhR/nsXgI7vEHwqqUXw680vSgWM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-cNCtOz6VOnSWcfnF2kaxkA-1; Fri, 30 Oct 2020 05:32:03 -0400
X-MC-Unique: cNCtOz6VOnSWcfnF2kaxkA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D179F10B9CA1;
 Fri, 30 Oct 2020 09:32:01 +0000 (UTC)
Received: from thuth.com (ovpn-113-87.ams2.redhat.com [10.36.113.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 53E876198B;
 Fri, 30 Oct 2020 09:32:00 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Guan Xuetao <gxt@mprc.pku.edu.cn>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-trivial@nongnu.org
Subject: [PATCH] target/unicore32/translate: Add missing fallthrough
 annotations
Date: Fri, 30 Oct 2020 10:31:57 +0100
Message-Id: <20201030093157.11795-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/30 01:22:25
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
X-List-Received-Date: Fri, 30 Oct 2020 09:32:17 -0000

Looking at the way the code is formatted here (there is an empty
line after break statements, but none where the break is missing),
the fallthrough is very likely intended here. So add a fallthrough
comment to make the it compilable with -Werror=implicit-fallthrough.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/unicore32/translate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/unicore32/translate.c b/target/unicore32/translate.c
index d4b06df672..962f9877a0 100644
--- a/target/unicore32/translate.c
+++ b/target/unicore32/translate.c
@@ -1801,6 +1801,7 @@ static void disas_uc32_insn(CPUUniCore32State *env, DisasContext *s)
             do_misc(env, s, insn);
             break;
         }
+        /* fallthrough */
     case 0x1:
         if (((UCOP_OPCODES >> 2) == 2) && !UCOP_SET_S) {
             do_misc(env, s, insn);
@@ -1817,6 +1818,7 @@ static void disas_uc32_insn(CPUUniCore32State *env, DisasContext *s)
         if (UCOP_SET(8) || UCOP_SET(5)) {
             ILLEGAL;
         }
+        /* fallthrough */
     case 0x3:
         do_ldst_ir(env, s, insn);
         break;
-- 
2.18.2


