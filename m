Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kQHWb-0005Sx-8J
	for mharc-qemu-trivial@gnu.org; Wed, 07 Oct 2020 18:03:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kQHWZ-0005Sf-QP
 for qemu-trivial@nongnu.org; Wed, 07 Oct 2020 18:03:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kQHWX-0004zg-Kh
 for qemu-trivial@nongnu.org; Wed, 07 Oct 2020 18:03:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602108180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PyfIfX8LP5+E2vBfnDHqh7rcRTvroB+t4JZUvmZk7vk=;
 b=XiANgwvr1Qv2JknJdJ0gM7JUaQyTQCZZg96pN0+YjWcK4QuD5lw5BqSHrPK64l2kVuP3kF
 kO1PPkxHMETcS6wOOsD16h1lcuqSFkn88gjxTZ6OyNyzdezpPog8sgWmmDRA+JxqkCS3HA
 gbE24GirQ93l1T6Wr9xu84itltTcgfA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-ro_6IzN0Mvu4muG5KZezRw-1; Wed, 07 Oct 2020 18:02:58 -0400
X-MC-Unique: ro_6IzN0Mvu4muG5KZezRw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA7DD18BE164;
 Wed,  7 Oct 2020 22:02:57 +0000 (UTC)
Received: from localhost (ovpn-119-102.rdu2.redhat.com [10.10.119.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5505F5D9DD;
 Wed,  7 Oct 2020 22:02:57 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] qom: Fix "typddef" typo
Date: Wed,  7 Oct 2020 18:02:55 -0400
Message-Id: <20201007220255.1170167-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/07 00:44:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
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
X-List-Received-Date: Wed, 07 Oct 2020 22:03:04 -0000

Fix typo introduced in the C11 #ifdef for qemu_max_align_t.  It
never caused any problems because we always compile using
-std=gnu99.

Fixes: 4c880f363e9e ("qom: Allow objects to be allocated with increased alignment")
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 qom/object.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qom/object.c b/qom/object.c
index c335dce7e4..125dabd28b 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -692,7 +692,7 @@ static void object_finalize(void *data)
 
 /* Find the minimum alignment guaranteed by the system malloc. */
 #if __STDC_VERSION__ >= 201112L
-typddef max_align_t qemu_max_align_t;
+typedef max_align_t qemu_max_align_t;
 #else
 typedef union {
     long l;
-- 
2.26.2


