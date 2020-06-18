Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jlp9h-0007ox-99
	for mharc-qemu-trivial@gnu.org; Thu, 18 Jun 2020 03:40:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jlp9f-0007o4-Gk
 for qemu-trivial@nongnu.org; Thu, 18 Jun 2020 03:40:11 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:22584
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jlp9d-0000qY-17
 for qemu-trivial@nongnu.org; Thu, 18 Jun 2020 03:40:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592466007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=vwyadaPW4AJLKYmDPXDTYtTsO+DcvRY65yH9JPyf5Ss=;
 b=S+qCsQTl572XyyiyJ4qrw+aeysMiqjbktrcEXcjRGrBpA7nP8ui4aJNb8KTObb+hzAMF9h
 0TBTPjUYf9a+WjEU+2Vy/i2h4zgZq1/DejfmXa2yoowYEJzOpgFzFSKcNFFJWkXD2vco/d
 YZfRPgXQaroAjsg4tuI3Hc1EXh0xTSU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-vcdPbQ_3O_W9GM7qMO2sjw-1; Thu, 18 Jun 2020 03:40:06 -0400
X-MC-Unique: vcdPbQ_3O_W9GM7qMO2sjw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 591E08018AC;
 Thu, 18 Jun 2020 07:40:05 +0000 (UTC)
Received: from thuth.com (ovpn-114-95.ams2.redhat.com [10.36.114.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E6DCA7931C;
 Thu, 18 Jun 2020 07:40:03 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org
Subject: [PATCH] softmmu/vl: Remove the check for colons in -accel parameters
Date: Thu, 18 Jun 2020 09:40:01 +0200
Message-Id: <20200618074001.13642-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/18 01:21:16
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Thu, 18 Jun 2020 07:40:11 -0000

The new -accel option does not accept colons in the parameters anymore
(since it does not convert the parameters to -machine accel=... parameters
anymore). Thus we can now remove the check for colons in -accel:

$ qemu-system-x86_64 -accel kvm:tcg
qemu-system-x86_64: -accel kvm:tcg: invalid accelerator kvm:tcg

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 softmmu/vl.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index f669c06ede..273acfcf6b 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3485,11 +3485,6 @@ void qemu_init(int argc, char **argv, char **envp)
                     g_slist_free(accel_list);
                     exit(0);
                 }
-                if (optarg && strchr(optarg, ':')) {
-                    error_report("Don't use ':' with -accel, "
-                                 "use -M accel=... for now instead");
-                    exit(1);
-                }
                 break;
             case QEMU_OPTION_usb:
                 olist = qemu_find_opts("machine");
-- 
2.18.1


