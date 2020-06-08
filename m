Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jiKI4-0002mb-W5
	for mharc-qemu-trivial@gnu.org; Mon, 08 Jun 2020 12:06:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKI3-0002jz-0m
 for qemu-trivial@nongnu.org; Mon, 08 Jun 2020 12:06:23 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:54720
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKI2-0000Fp-2z
 for qemu-trivial@nongnu.org; Mon, 08 Jun 2020 12:06:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IQ2Zwmt+Uey5o0Uah3Zvdno8y42e5J5YjRZjcD6UUkc=;
 b=gVF8ZjhxKYcSP/3EwW+uoAirFjxhYKfmkrQVfMCjlNEGHdc3SvOxFhtJK2Ir19KElsMUtT
 FgcBaYz9encpYBDBLzzzQvSbwYnP2BLs7ikYeG4maQB5qHUJ36f5XvTZYivpgRrV9H6V2A
 NFHUSSGHN7hLeXjLa2LinFEV1CKOkNE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-zn0nTvn9Pq29XUsEsBsz5w-1; Mon, 08 Jun 2020 12:06:15 -0400
X-MC-Unique: zn0nTvn9Pq29XUsEsBsz5w-1
Received: by mail-wr1-f69.google.com with SMTP id a4so7343441wrp.5
 for <qemu-trivial@nongnu.org>; Mon, 08 Jun 2020 09:06:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IQ2Zwmt+Uey5o0Uah3Zvdno8y42e5J5YjRZjcD6UUkc=;
 b=XY4OxDigJoOIaDffvnsqHZT8fgALEJOULZYxal/XzaLZae1nlyZeoubRWHErDobZ/5
 iIdX+AftDazl86SxpJ4ucNJmoQgwEfLFjcdZ1WSk6CH9/3C1AFuUvFxNCgE9qrIymDCn
 HrSHVlPFyG+SKorean6jGs1N4tgp6xzvJuHeG8aYHNS4qAjmhtbMqZj/hBlybBT5uCEh
 K/v2LA01D8/Tl4hwZXzGant1TUlk9WDkMB6cW+GUidWiP6N6aUqomblkXp1zmo9KZ8IL
 FlQnuF+xJBXjEClTHD5tympfEkwVL5tigcOtkML5rW71FAN3s9jnvVPoMCFGIXkoRz4/
 zH3Q==
X-Gm-Message-State: AOAM532b7QwYY816TnBlgQBzDXJs9hdBM2H8Ll099vdlTfjrF7wJ2WCk
 njOHOC/ZFhoTB47hA2kM1u/D5mRX21zKQRhcpfRDR8pshINkjyBymDwJSLTmw63vzf9mOpSeiIh
 NnJ5YavhLpQFznZK8+g==
X-Received: by 2002:a05:6000:1104:: with SMTP id
 z4mr24024561wrw.272.1591632374444; 
 Mon, 08 Jun 2020 09:06:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPKGJLisyMOH/ojvihDYa0lan6gnwMhb7yaO/6lsrH3bKYJhiQTZOhUJwlTONMDJsyX94C8g==
X-Received: by 2002:a05:6000:1104:: with SMTP id
 z4mr24024548wrw.272.1591632374222; 
 Mon, 08 Jun 2020 09:06:14 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id j4sm48617wma.7.2020.06.08.09.06.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:06:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org, =?UTF-8?q?Martin=20Li=C5=A1ka?= <mliska@suse.cz>,
 Eric Blake <eblake@redhat.com>
Cc: Christophe de Dinechin <dinechin@redhat.com>,
 Stafford Horne <shorne@gmail.com>, qemu-trivial@nongnu.org,
 1874073@bugs.launchpad.net, Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jia Liu <proljc@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2] hw/openrisc/openrisc_sim: Add assertion to silence GCC
 warning
Date: Mon,  8 Jun 2020 18:06:11 +0200
Message-Id: <20200608160611.16966-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 05:40:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Mon, 08 Jun 2020 16:06:24 -0000

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
Reviewed-by: Thomas Huth <thuth@redhat.com>
Tested-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v2: Fixed typo in subject (eblake)
Supersedes: <20200608071409.17024-1-philmd@redhat.com>
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


