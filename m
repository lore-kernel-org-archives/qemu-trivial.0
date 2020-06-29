Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jpqQ8-00042a-AI
	for mharc-qemu-trivial@gnu.org; Mon, 29 Jun 2020 05:49:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1jpqQ5-000407-7b
 for qemu-trivial@nongnu.org; Mon, 29 Jun 2020 05:49:45 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:47706
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1jpqQ3-0002T8-3N
 for qemu-trivial@nongnu.org; Mon, 29 Jun 2020 05:49:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593424181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+7v4H19gOLds3S1kkRmPNXdo3AM71Sm1+ZQ5zPupneA=;
 b=NbXiCNjfDrSY+uCij7ruXwDeM4bLrsneBSOTNE/cSfZ093a9xjcjj4PzG3KC9bdIVM0xv8
 pflD0ij7bfSXdWlXOC9JcrEujLjLgrugpnST9eY7xCuFdpkHPFogJBPBKEwmEZRCJwhh/J
 Vvx7hkd2eN4PkNDlEnL4CmgoUG+XI0Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-A9-4eBnbO5em29s876-F6g-1; Mon, 29 Jun 2020 05:49:37 -0400
X-MC-Unique: A9-4eBnbO5em29s876-F6g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8B871800D42;
 Mon, 29 Jun 2020 09:49:36 +0000 (UTC)
Received: from turbo.com (ovpn-112-91.ams2.redhat.com [10.36.112.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F9D61C8;
 Mon, 29 Jun 2020 09:49:35 +0000 (UTC)
From: Christophe de Dinechin <dinechin@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org
Subject: [PATCH] trivial: Respect alphabetical order of .o files in
 Makefile.objs
Date: Mon, 29 Jun 2020 11:49:34 +0200
Message-Id: <20200629094934.2081180-1-dinechin@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dinechin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=dinechin@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/29 01:06:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
X-List-Received-Date: Mon, 29 Jun 2020 09:49:46 -0000

The vmgenid.o is the only file that is not in alphabetical order.

Signed-off-by: Christophe de Dinechin <dinechin@redhat.com>
---
 stubs/Makefile.objs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/stubs/Makefile.objs b/stubs/Makefile.objs
index f32b9e47a3..1df8bb3814 100644
--- a/stubs/Makefile.objs
+++ b/stubs/Makefile.objs
@@ -19,10 +19,10 @@ stub-obj-y += replay.o
 stub-obj-y += runstate-check.o
 stub-obj-$(CONFIG_SOFTMMU) += semihost.o
 stub-obj-y += set-fd-handler.o
-stub-obj-y += vmgenid.o
 stub-obj-y += sysbus.o
 stub-obj-y += tpm.o
 stub-obj-y += trace-control.o
+stub-obj-y += vmgenid.o
 stub-obj-y += vmstate.o
 stub-obj-$(CONFIG_SOFTMMU) += win32-kbd-hook.o
 
-- 
2.26.2


