Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qZayD-0005M7-7Y
	for mharc-qemu-trivial@gnu.org; Fri, 25 Aug 2023 13:51:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qZayB-0005LS-0m
 for qemu-trivial@nongnu.org; Fri, 25 Aug 2023 13:51:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qZay9-0000kI-1g
 for qemu-trivial@nongnu.org; Fri, 25 Aug 2023 13:51:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692985896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MiClRXdogTezlcvTudaRXCOPViXaDDclj60JZDUw0qY=;
 b=e7rr7AoH5o2waujAyk55RU3AS111NfHYAovx1xam1wlUiP0mHWun/0d0EpF3Dm2ngAfJ8g
 yCbKlSL53nJMI9mVkMMpNhFNKD67h1Qm6dB/6F04mfbSZbBWtEjAoc4Gb8I5GHik5+3Mek
 y3UqjLmpb8EuOrfNrfyDpKYaIms/V6w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-0F1uKZscNu6iBd4iPYJZJg-1; Fri, 25 Aug 2023 13:51:30 -0400
X-MC-Unique: 0F1uKZscNu6iBd4iPYJZJg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41B1B8030A9;
 Fri, 25 Aug 2023 17:51:30 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CEA7463A63;
 Fri, 25 Aug 2023 17:51:28 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
	qemu-trivial@nongnu.org
Subject: [PATCH 1/3] hw/mips/jazz: Remove the big_endian variable
Date: Fri, 25 Aug 2023 19:51:21 +0200
Message-Id: <20230825175123.624114-2-thuth@redhat.com>
In-Reply-To: <20230825175123.624114-1-thuth@redhat.com>
References: <20230825175123.624114-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 25 Aug 2023 17:51:39 -0000

There is an easier way to get a value that can be used to decide
whether the target is big endian or not: Simply use the
target_words_bigendian() function instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/mips/jazz.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index ca4426a92c..358bb6f74f 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -125,7 +125,7 @@ static void mips_jazz_init(MachineState *machine,
 {
     MemoryRegion *address_space = get_system_memory();
     char *filename;
-    int bios_size, n, big_endian;
+    int bios_size, n;
     Clock *cpuclk;
     MIPSCPU *cpu;
     MIPSCPUClass *mcc;
@@ -157,12 +157,6 @@ static void mips_jazz_init(MachineState *machine,
         [JAZZ_PICA61] = {33333333, 4},
     };
 
-#if TARGET_BIG_ENDIAN
-    big_endian = 1;
-#else
-    big_endian = 0;
-#endif
-
     if (machine->ram_size > 256 * MiB) {
         error_report("RAM size more than 256Mb is not supported");
         exit(EXIT_FAILURE);
@@ -301,7 +295,7 @@ static void mips_jazz_init(MachineState *machine,
             dev = qdev_new("dp8393x");
             qdev_set_nic_properties(dev, nd);
             qdev_prop_set_uint8(dev, "it_shift", 2);
-            qdev_prop_set_bit(dev, "big_endian", big_endian > 0);
+            qdev_prop_set_bit(dev, "big_endian", target_words_bigendian());
             object_property_set_link(OBJECT(dev), "dma_mr",
                                      OBJECT(rc4030_dma_mr), &error_abort);
             sysbus = SYS_BUS_DEVICE(dev);
-- 
2.39.3


