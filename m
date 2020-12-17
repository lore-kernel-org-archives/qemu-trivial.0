Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpvPa-0000A5-19
	for mharc-qemu-trivial@gnu.org; Thu, 17 Dec 2020 10:41:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kpvPY-00006v-89
 for qemu-trivial@nongnu.org; Thu, 17 Dec 2020 10:41:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kpvPV-0007aO-UW
 for qemu-trivial@nongnu.org; Thu, 17 Dec 2020 10:41:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608219705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zRpfl96RlD8uxmRlNN4pQcruvr8fhVfRIuzzWGmoph0=;
 b=JWr+zBJ1SVORAQpihoIS1bfosYTvhJoeRtdVL4hkHMUOMv/rTKSoqvXj+Bbh8+8F0xPvif
 Wq2OVVrmT7n35EieQrkGxp65GbucUzyaCVDC/aKjDeixRfjeelHX6BfBgEuGSKWevxLUY7
 lAlYvqJ1Y7J0te8w/+GoZ+HF1ctMffs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-Dzdyav6aMw-lUR1i12Kg0A-1; Thu, 17 Dec 2020 10:41:42 -0500
X-MC-Unique: Dzdyav6aMw-lUR1i12Kg0A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7374B801AEC;
 Thu, 17 Dec 2020 15:41:41 +0000 (UTC)
Received: from thuth.com (ovpn-112-175.ams2.redhat.com [10.36.112.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 178D01002391;
 Thu, 17 Dec 2020 15:41:39 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Sean Bruno <sbruno@freebsd.org>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Ed Maste <emaste@freebsd.org>, qemu-trivial@nongnu.org
Subject: [PATCH] bsd-user: Silence warnings about missing fallthrough statement
Date: Thu, 17 Dec 2020 16:41:38 +0100
Message-Id: <20201217154138.1547274-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
X-List-Received-Date: Thu, 17 Dec 2020 15:41:48 -0000

When compiling with -Werror=implicit-fallthrough, the compiler complains
about a missing fallthrough annotation in this file. Looking at the code,
the fallthrough is indeed wanted here, so let's add a proper comment.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 bsd-user/main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 0a918e8f74..9c700c6234 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -512,6 +512,7 @@ void cpu_loop(CPUSPARCState *env)
         case 0x141:
             if (bsd_type != target_freebsd)
                 goto badtrap;
+            /* fallthrough */
         case 0x100:
 #endif
             syscall_nr = env->gregs[1];
-- 
2.27.0


