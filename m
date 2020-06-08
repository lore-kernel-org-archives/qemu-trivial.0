Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jiBzB-0006zm-Kc
	for mharc-qemu-trivial@gnu.org; Mon, 08 Jun 2020 03:14:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiBz9-0006zX-W6
 for qemu-trivial@nongnu.org; Mon, 08 Jun 2020 03:14:20 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44930
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiBz8-0004la-At
 for qemu-trivial@nongnu.org; Mon, 08 Jun 2020 03:14:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591600457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SMx5SpnyStznYe62dUidIf4jRnxg6ybMRVo0DpRP+yU=;
 b=DQnbUiKn+n7ZANPib6gjfn88xY+xiGH2YF7HAj6mDH00USAS8a7eWnhhs4Qo0Zg7W7LV5l
 bU9eDQ15BTjyb9WZHmxNMmdGlDhDAXD/tZgKcVd0rUQwczPSpbVtGVi9576PFKWcG/HCAf
 vgp55Q0iTGpCJ33CwEodlIA1qDYkQl8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-Ki5E4qypODicmXeJ3i5KDA-1; Mon, 08 Jun 2020 03:14:13 -0400
X-MC-Unique: Ki5E4qypODicmXeJ3i5KDA-1
Received: by mail-wm1-f72.google.com with SMTP id t145so4892545wmt.2
 for <qemu-trivial@nongnu.org>; Mon, 08 Jun 2020 00:14:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SMx5SpnyStznYe62dUidIf4jRnxg6ybMRVo0DpRP+yU=;
 b=FPfEuIMiXmp2COnHfKfMRtQ6b2EbuvY8wBES6m1PXfK4MzivTGnJVG4tvrdDQyQo1L
 7cOwMWYlsvjHrjh9U/pVADjuskLrlUr0P1xvmB8W2aeIfdOA94XVL1F0K9bw27QTcmrQ
 5ZI398xWzPJMlLsZjfXvkVTEd+j87E1G0wMfjQL5X6umCZHEDTymIXii+zjMH42WMIot
 kIgymKpKmjShWsEU9jSir2Bf+Bk/NnO7FRvswL8Ba9MrVYrk+8nvCff80PnkCsCgCX1n
 xTlDQRG5/fPqFQ5ShVzp31Xbk2fivv/luUmyFaGEZRn4MqSyu3l/sNikFm9qCxbBYmU/
 eJew==
X-Gm-Message-State: AOAM531Vc6AFZXhilckfW1LairKZYMlK00acmEYZy1zmayB4jhbRxujm
 d6VhAsi5MyLMV3zz4g6K9x84p2Y+3L5vXn5CRq+Ztm2dRosowGtwXpovh/Hy1bK8WinVLKXVMRb
 V32G+mDwjhVkD6GVTjQ==
X-Received: by 2002:adf:aad7:: with SMTP id i23mr22304130wrc.331.1591600452360; 
 Mon, 08 Jun 2020 00:14:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyg5Jz7y3JYvwmiaJta9Zp1LkW9JbXgFnbaU+r1MEfh465XbMGkY/a5Sojc/ahcvizrU7Q2mw==
X-Received: by 2002:adf:aad7:: with SMTP id i23mr22304113wrc.331.1591600452110; 
 Mon, 08 Jun 2020 00:14:12 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id v19sm21109368wml.26.2020.06.08.00.14.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 00:14:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org, =?UTF-8?q?Martin=20Li=C5=A1ka?= <mliska@suse.cz>,
 Eric Blake <eblake@redhat.com>
Cc: Stafford Horne <shorne@gmail.com>, qemu-trivial@nongnu.org,
 Christophe de Dinechin <dinechin@redhat.com>, 1874073@bugs.launchpad.net,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jia Liu <proljc@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] hw/openrisc/openrisc_sim: Add assertion to silent GCC warning
Date: Mon,  8 Jun 2020 09:14:09 +0200
Message-Id: <20200608071409.17024-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 00:45:23
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 08 Jun 2020 07:14:20 -0000

When compiling with GCC 10 (Fedora 32) using CFLAGS=-O2 we get:

    CC      or1k-softmmu/hw/openrisc/openrisc_sim.o
  hw/openrisc/openrisc_sim.c: In function ‘openrisc_sim_init’:
  hw/openrisc/openrisc_sim.c:87:42: error: ‘cpu_irqs[0]’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
     87 |         sysbus_connect_irq(s, i, cpu_irqs[i][irq_pin]);
        |                                  ~~~~~~~~^~~

While humans can tell smp_cpus will always be in the [1, 2] range,
(openrisc_sim_machine_init sets mc->max_cpus = 2), the compiler
can't.

Add an assertion to give the compiler a hint there's no use of
uninitialized data.

Buglink: https://bugs.launchpad.net/qemu/+bug/1874073
Reported-by: Martin Liška <mliska@suse.cz>
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/openrisc/openrisc_sim.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
index d08ce61811..02f5259e5e 100644
--- a/hw/openrisc/openrisc_sim.c
+++ b/hw/openrisc/openrisc_sim.c
@@ -134,6 +134,7 @@ static void openrisc_sim_init(MachineState *machine)
     int n;
     unsigned int smp_cpus = machine->smp.cpus;
 
+    assert(smp_cpus >= 1 && smp_cpus <= 2);
     for (n = 0; n < smp_cpus; n++) {
         cpu = OPENRISC_CPU(cpu_create(machine->cpu_type));
         if (cpu == NULL) {
-- 
2.21.3


