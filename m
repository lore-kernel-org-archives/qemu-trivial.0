Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kUtjp-0006jt-29
	for mharc-qemu-trivial@gnu.org; Tue, 20 Oct 2020 11:39:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kUtjm-0006eZ-RB
 for qemu-trivial@nongnu.org; Tue, 20 Oct 2020 11:39:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kUtjk-0001QM-Vi
 for qemu-trivial@nongnu.org; Tue, 20 Oct 2020 11:39:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603208383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=ON/re6l/Dv6x0V1ypsA/2QI8DNbvfVaMF39pigVEdMg=;
 b=PG0EtB1bL8SnFT5H2O+wU9+BUC7UhduQuPbPllQbOkpp1t3hQcaPg2Rpwcxj4M20Bg+ItG
 xWQztp8/G8AxX69Sbk/CckRsSwV1SrpR70FYF1CWNNjoiKKfh5IGhFaby/QlHhrwubMIN1
 ucNdWl9j8AkRnHyiZi2W51Z6eTq9cxU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-Y4oR3-4OPq2mmubDsPObNw-1; Tue, 20 Oct 2020 11:39:41 -0400
X-MC-Unique: Y4oR3-4OPq2mmubDsPObNw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5AE558049DD;
 Tue, 20 Oct 2020 15:39:40 +0000 (UTC)
Received: from thuth.com (dhcp-192-238.str.redhat.com [10.33.192.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F2A15B4A1;
 Tue, 20 Oct 2020 15:39:39 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Yoshinori Sato <ysato@users.sourceforge.jp>,
	qemu-devel@nongnu.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
	qemu-trivial@nongnu.org
Subject: [PATCH 2/3] hw/timer/sh_timer: Silence warnings about missing
 fallthrough statements
Date: Tue, 20 Oct 2020 17:39:34 +0200
Message-Id: <20201020153935.54315-3-thuth@redhat.com>
In-Reply-To: <20201020153935.54315-1-thuth@redhat.com>
References: <20201020153935.54315-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 01:15:43
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
X-List-Received-Date: Tue, 20 Oct 2020 15:39:47 -0000

When compiling with -Werror=implicit-fallthrough, gcc complains about
missing fallthrough annotations in this file. Looking at the code,
the fallthrough is very likely intended here, so add some comments
to silence the compiler warnings.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/timer/sh_timer.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/timer/sh_timer.c b/hw/timer/sh_timer.c
index b09e30f938..934daaa7dc 100644
--- a/hw/timer/sh_timer.c
+++ b/hw/timer/sh_timer.c
@@ -122,6 +122,7 @@ static void sh_timer_write(void *opaque, hwaddr offset,
             if (s->feat & TIMER_FEAT_EXTCLK) {
                 break;
             }
+            /* fallthrough */
         default:
             hw_error("sh_timer_write: Reserved TPSC value\n");
             break;
@@ -135,6 +136,7 @@ static void sh_timer_write(void *opaque, hwaddr offset,
             if (s->feat & TIMER_FEAT_EXTCLK) {
                 break;
             }
+            /* fallthrough */
         default:
             hw_error("sh_timer_write: Reserved CKEG value\n");
             break;
@@ -147,6 +149,7 @@ static void sh_timer_write(void *opaque, hwaddr offset,
             if (s->feat & TIMER_FEAT_CAPT) {
                 break;
             }
+            /* fallthrough */
         default:
             hw_error("sh_timer_write: Reserved ICPE value\n");
             break;
@@ -180,6 +183,7 @@ static void sh_timer_write(void *opaque, hwaddr offset,
             s->tcpr = value;
             break;
         }
+        /* fallthrough */
     default:
         hw_error("sh_timer_write: Bad offset %x\n", (int)offset);
     }
-- 
2.18.2


