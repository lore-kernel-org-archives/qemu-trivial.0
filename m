Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kOOd5-00041k-Is
	for mharc-qemu-trivial@gnu.org; Fri, 02 Oct 2020 13:13:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kOOd3-000402-Ul
 for qemu-trivial@nongnu.org; Fri, 02 Oct 2020 13:13:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kOOd2-0000ho-Do
 for qemu-trivial@nongnu.org; Fri, 02 Oct 2020 13:13:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601658835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=KCRz8TBfrLlsAglmmhI1z/Iun6VO75VvQ6hf6kVLBkw=;
 b=B3QPzkH5XcQgqKsCiTHEp7nvQKCsGTc1DRjsjWutznGKRV+aoynsseihEbDxH/cds/ssWH
 CUwwF9mpjNzizaUN5sAA2k8Rd/6wEheGB1sp+GdF5+zOmyFrBAtDiLKaxm1rSxCeCsI+Co
 rH+QMHeYEI51dK5cNwZ4PEHxV2NJNCI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-ihCvRLwyNT2aBq0fE8CRsg-1; Fri, 02 Oct 2020 13:13:54 -0400
X-MC-Unique: ihCvRLwyNT2aBq0fE8CRsg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1BA780B702;
 Fri,  2 Oct 2020 17:13:52 +0000 (UTC)
Received: from thuth.com (ovpn-112-90.ams2.redhat.com [10.36.112.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE2055D9E4;
 Fri,  2 Oct 2020 17:13:45 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-trivial@nongnu.org
Subject: [PATCH] tests/test-char: Use a proper fallthrough comment
Date: Fri,  2 Oct 2020 19:13:43 +0200
Message-Id: <20201002171343.283426-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/01 23:37:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 02 Oct 2020 17:13:58 -0000

For being able to compile with -Werror=implicit-fallthrough we need
to use comments that the compiler recognizes. Use "fallthrough" instead
of "no break" here.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/test-char.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/test-char.c b/tests/test-char.c
index d35cc839bc..9196e566e9 100644
--- a/tests/test-char.c
+++ b/tests/test-char.c
@@ -70,7 +70,7 @@ static void fe_event(void *opaque, QEMUChrEvent event)
             h->openclose_mismatch = true;
         }
         h->is_open = new_open_state;
-        /* no break */
+        /* fallthrough */
     default:
         quit = true;
         break;
-- 
2.18.2


