Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kUtjq-0006nq-Fk
	for mharc-qemu-trivial@gnu.org; Tue, 20 Oct 2020 11:39:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kUtjo-0006jE-Oq
 for qemu-trivial@nongnu.org; Tue, 20 Oct 2020 11:39:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kUtjn-0001Qq-5u
 for qemu-trivial@nongnu.org; Tue, 20 Oct 2020 11:39:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603208386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=00KM4f2VWpsnzdCiWTlBAYahGIiw9FH66M8ACJQmM70=;
 b=KdLSzu+FBCw9L2l4c8QIdrC0ecFWliY4VRtPjkSa9A1ux7T8RQkM9845FvmS9gJQt8yrk+
 +yEM5VHCvojE0ipie9AHcjpaQKtyI0aeN3IAcchNEuHf0Gb3W/G1me4e7Cgf1yKjXECFnd
 twk3fNB+YVQjP1aAuNu7IjPOWChDOl0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-a2LShN4dNhySGnNI3pyN4w-1; Tue, 20 Oct 2020 11:39:42 -0400
X-MC-Unique: a2LShN4dNhySGnNI3pyN4w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BCF757084;
 Tue, 20 Oct 2020 15:39:41 +0000 (UTC)
Received: from thuth.com (dhcp-192-238.str.redhat.com [10.33.192.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9FF965B4A1;
 Tue, 20 Oct 2020 15:39:40 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Yoshinori Sato <ysato@users.sourceforge.jp>,
	qemu-devel@nongnu.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
	qemu-trivial@nongnu.org
Subject: [PATCH 3/3] hw/timer/sh_timer: Remove superfluous "break" statements
Date: Tue, 20 Oct 2020 17:39:35 +0200
Message-Id: <20201020153935.54315-4-thuth@redhat.com>
In-Reply-To: <20201020153935.54315-1-thuth@redhat.com>
References: <20201020153935.54315-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-List-Received-Date: Tue, 20 Oct 2020 15:39:49 -0000

hw_error() is marked as QEMU_NORETURN, so the "break" statements
after this function are just dead code.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/timer/sh_timer.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/timer/sh_timer.c b/hw/timer/sh_timer.c
index 934daaa7dc..58af1a1edb 100644
--- a/hw/timer/sh_timer.c
+++ b/hw/timer/sh_timer.c
@@ -125,7 +125,6 @@ static void sh_timer_write(void *opaque, hwaddr offset,
             /* fallthrough */
         default:
             hw_error("sh_timer_write: Reserved TPSC value\n");
-            break;
         }
         switch ((value & TIMER_TCR_CKEG) >> 3) {
         case 0:
@@ -139,7 +138,6 @@ static void sh_timer_write(void *opaque, hwaddr offset,
             /* fallthrough */
         default:
             hw_error("sh_timer_write: Reserved CKEG value\n");
-            break;
         }
         switch ((value & TIMER_TCR_ICPE) >> 6) {
         case 0:
@@ -152,7 +150,6 @@ static void sh_timer_write(void *opaque, hwaddr offset,
             /* fallthrough */
         default:
             hw_error("sh_timer_write: Reserved ICPE value\n");
-            break;
         }
         if ((value & TIMER_TCR_UNF) == 0) {
             s->int_level = 0;
-- 
2.18.2


