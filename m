Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iCNHS-0006Yf-DD
	for mharc-qemu-trivial@gnu.org; Mon, 23 Sep 2019 08:17:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47914)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iCNHP-0006Vh-CJ
 for qemu-trivial@nongnu.org; Mon, 23 Sep 2019 08:17:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iCNHO-0001WO-Ey
 for qemu-trivial@nongnu.org; Mon, 23 Sep 2019 08:17:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57746)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1iCNHK-0001VS-Ex; Mon, 23 Sep 2019 08:17:18 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B26C618CB903;
 Mon, 23 Sep 2019 12:17:17 +0000 (UTC)
Received: from thuth.com (ovpn-116-120.ams2.redhat.com [10.36.116.120])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 86D8A600C4;
 Mon, 23 Sep 2019 12:17:16 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-trivial@nongnu.org
Subject: [PATCH] Disallow colons in the parameter of "-accel"
Date: Mon, 23 Sep 2019 14:17:12 +0200
Message-Id: <20190923121712.22971-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Mon, 23 Sep 2019 12:17:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Mon, 23 Sep 2019 12:17:25 -0000

Everybody who used something like "-machine accel=kvm:tcg" in the past
might be tempted to specify a similar list with the -accel parameter,
too, for example "-accel kvm:tcg". However, this is not how this
options is thought to be used, since each "-accel" should only take care
of one specific accelerator.

In the long run, we really should rework the "-accel" code completely,
so that it does not set "-machine accel=..." anymore internally, but
is completely independent from "-machine". For the short run, let's
make sure that users cannot use "-accel xyz:tcg", so that we avoid
that we have to deal with such cases in the wild later.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 vl.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/vl.c b/vl.c
index 630f5c5e9c..68f47a9c25 100644
--- a/vl.c
+++ b/vl.c
@@ -3554,6 +3554,11 @@ int main(int argc, char **argv, char **envp)
                     g_slist_free(accel_list);
                     exit(0);
                 }
+                if (optarg && strchr(optarg, ':')) {
+                    error_report("Don't use ':' with -accel, "
+                                 "use -M accel=... in this case instead");
+                    exit(1);
+                }
                 opts = qemu_opts_create(qemu_find_opts("machine"), NULL,
                                         false, &error_abort);
                 qemu_opt_set(opts, "accel", optarg, &error_abort);
-- 
2.18.1


