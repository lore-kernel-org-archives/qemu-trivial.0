Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qZayE-0005Ml-Ne
	for mharc-qemu-trivial@gnu.org; Fri, 25 Aug 2023 13:51:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qZayD-0005M6-5I
 for qemu-trivial@nongnu.org; Fri, 25 Aug 2023 13:51:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qZay9-0000kO-Qr
 for qemu-trivial@nongnu.org; Fri, 25 Aug 2023 13:51:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692985897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q/U6yu/q06QRRglGNRuIjVC/824TEYwlNE4A/1nMHOk=;
 b=SN7SgthwuPFLbRHCFo0J1mrTMWucK/7V4ybgALzSQd7JQa8aV3xuOCyb4Z04CtWoMp43UY
 WS2Wc7tNhRy7cWpTe2bfg0zENkUB+chNLq7NoG9ded/jqeoPsehULOlvCP8IPYoZMSVN38
 NMVCZoeckymUGLYpcSg/QQSso7BGXXk=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-ejIGPbiXMmeLYh3amTi3SA-1; Fri, 25 Aug 2023 13:51:34 -0400
X-MC-Unique: ejIGPbiXMmeLYh3amTi3SA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9047F1C07846;
 Fri, 25 Aug 2023 17:51:33 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 51E1A6B2B6;
 Fri, 25 Aug 2023 17:51:32 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
	qemu-trivial@nongnu.org
Subject: [PATCH 3/3] hw/mips/jazz: Simplify the NIC setup code
Date: Fri, 25 Aug 2023 19:51:23 +0200
Message-Id: <20230825175123.624114-4-thuth@redhat.com>
In-Reply-To: <20230825175123.624114-1-thuth@redhat.com>
References: <20230825175123.624114-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Aug 2023 17:51:41 -0000

The for-loop does not make much sense here - it is always left after
the first iteration, so we can also check for nb_nics == 1 instead
which is way easier to understand.

Also, the checks for nd->model are superfluous since the code in
mips_jazz_init_net() calls qemu_check_nic_model() that already
takes care of this (i.e. initializing nd->model if it has not been
set yet, and checking whether it is the "help" option or the
supported NIC model).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/mips/jazz.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index a95a1bd743..86cd1d2fb2 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -172,7 +172,6 @@ static void mips_jazz_init(MachineState *machine,
     MemoryRegion *rtc = g_new(MemoryRegion, 1);
     MemoryRegion *dma_dummy = g_new(MemoryRegion, 1);
     MemoryRegion *dp8393x_prom = g_new(MemoryRegion, 1);
-    NICInfo *nd;
     DeviceState *dev, *rc4030;
     MMIOKBDState *i8042;
     SysBusDevice *sysbus;
@@ -315,21 +314,11 @@ static void mips_jazz_init(MachineState *machine,
     }
 
     /* Network controller */
-    for (n = 0; n < nb_nics; n++) {
-        nd = &nd_table[n];
-        if (!nd->model) {
-            nd->model = g_strdup("dp83932");
-        }
-        if (strcmp(nd->model, "dp83932") == 0) {
-            mips_jazz_init_net(nd, rc4030_dma_mr, rc4030, dp8393x_prom);
-            break;
-        } else if (is_help_option(nd->model)) {
-            error_report("Supported NICs: dp83932");
-            exit(1);
-        } else {
-            error_report("Unsupported NIC: %s", nd->model);
-            exit(1);
-        }
+    if (nb_nics == 1) {
+        mips_jazz_init_net(&nd_table[0], rc4030_dma_mr, rc4030, dp8393x_prom);
+    } else if (nb_nics > 1) {
+        error_report("This machine only supports one NIC");
+        exit(1);
     }
 
     /* SCSI adapter */
-- 
2.39.3


