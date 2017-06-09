Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dJLV9-0002Ul-5A
	for mharc-qemu-trivial@gnu.org; Fri, 09 Jun 2017 11:07:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33300)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dJLV5-0002RB-N8
	for qemu-trivial@nongnu.org; Fri, 09 Jun 2017 11:07:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dJLV3-00013H-Mi
	for qemu-trivial@nongnu.org; Fri, 09 Jun 2017 11:06:59 -0400
Received: from mail-qt0-x230.google.com ([2607:f8b0:400d:c0d::230]:34691)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dJLV1-00011l-2T; Fri, 09 Jun 2017 11:06:55 -0400
Received: by mail-qt0-x230.google.com with SMTP id c10so79018731qtd.1;
	Fri, 09 Jun 2017 08:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=FJLI1Ioge0GIb5YVYd1kohvWD1wS8ZfucCKSZ8QBKmI=;
	b=uVn5zd65qTNZxZjskNisyoL9lxeQvxAMZd76OiETKtD0wIiSJVKAj4Y4RX9i90T38I
	+6riOv2ORSVsWQOfDyafUTsRe4AQP+CEPJ9J6qMDKyWmMKsLqq8boZYZ1b0EzH9i0A2o
	URS+WTRRf+YQ1RZ3CK8oGhDme49DLkJR4hfuwl6l4+JM1vD2uiRAWDkHGV8V1tUZzM2e
	67OGB+lFFzWqjOsTJI4Z5AGR0bYnoZgub+ooWn/4TanEGBMTecAA947Vf/2H9m4m9K8n
	OBnucSdm/4K2iHmeyHTaJvE06dBNxfpdFT/tf1cc//IeXdinQeGmThU2jV6UxlVoT3K7
	jriQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=FJLI1Ioge0GIb5YVYd1kohvWD1wS8ZfucCKSZ8QBKmI=;
	b=SbBA/b/bvyLduyC9Ovi+gc2ttSfyQp6ksI1qzwinx/7bVyOShiuDl99cpW/CCvaLTr
	bBgKQ8gHPJKqu9sTJuorAkASpXHU8KnBWStSli1f5WXvyXQTT8J25lstNzti6AXZGtRq
	1KQRoKFAL9EvoKbZbeCWwlr/uXPJBwKioR0UbHF2t1Zhvo8hflBW5oAR6j+wk0lLdpoV
	m3Y8aobsiGIeSd/7XIedq/UQrmKsjcvnTTw7lSEAu00gdiBCUVrfXX/E/mqNpkTtow05
	RKxCZAZlgSSJcDNUVhWyXZHJ/rVAXADsThyaOqhstNL+1DVH9Uq/XfrhGD41RoxjqtAi
	m6Sw==
X-Gm-Message-State: AKS2vOzQ8GqlkP0vH3RZlQIu0yCYyvrY8VWdaP8pmi5F0/AyV6CgET8Q
	7Vy4camSCu2gIyd9dXA=
X-Received: by 10.200.58.71 with SMTP id w65mr30674599qte.131.1497020812990;
	Fri, 09 Jun 2017 08:06:52 -0700 (PDT)
Received: from yoga.offpageads.com ([170.51.96.162])
	by smtp.gmail.com with ESMTPSA id n11sm829983qtb.39.2017.06.09.08.06.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Jun 2017 08:06:52 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	"Michael S . Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Fri,  9 Jun 2017 12:06:21 -0300
Message-Id: <20170609150622.4720-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170609150622.4720-1-f4bug@amsat.org>
References: <20170609150622.4720-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::230
Subject: [Qemu-trivial] [PATCH v2] hw/pci: define msi_nonbroken in pci-stub
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Jun 2017 15:07:01 -0000

The kludged field 'msi_nonbroken' is declared in "hw/pci/msi.h" and defined in
hw/pci/msi.c.
When using an ARM config with CONFIG_PCI disabled, hw/pci/msi.c is not included.
Without being PCI-related, the files hw/intc/arm_gicv[23*].c do access this
field (to enable the kludge if PCI is enabled).
The final link fails since hw/pci/msi.c is not included.
Defining this field in pci-stub is safe enough for configs without CONFIG_PCI.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---

v2: Addressed review feedback from Thomas Huth

Error reported:

$ ../configure --target-list=armeb-softmmu && make
[...]
  LINK    armeb-softmmu/qemu-system-armeb
../hw/intc/arm_gicv2m.o: In function `gicv2m_realize':
qemu/hw/intc/arm_gicv2m.c:154: undefined reference to `msi_nonbroken'
../hw/intc/arm_gicv3_its_common.o: In function `gicv3_its_init_mmio':
qemu/hw/intc/arm_gicv3_its_common.c:110: undefined reference to `msi_nonbroken'
collect2: error: ld returned 1 exit status
Makefile:201: recipe for target 'qemu-system-armeb' failed
make[1]: *** [qemu-system-armeb] Error 1
Makefile:327: recipe for target 'subdir-armeb-softmmu' failed
make: *** [subdir-armeb-softmmu] Error 2

branch used (wip):

https://github.com/qemu/qemu/compare/master...philmd:armeb_wip

with following config:

$ cat default-configs/armeb-softmmu.mak
# Default configuration for armeb-softmmu
CONFIG_ECC=y
CONFIG_SERIAL=y
CONFIG_PTIMER=y
CONFIG_SD=y
CONFIG_SSI=y
#CONFIG_USB=y
CONFIG_PLATFORM_BUS=y
CONFIG_ARM_V7M=y
CONFIG_ARM_GIC=y
CONFIG_ARM_TIMER=y
CONFIG_PL011=y
CONFIG_PL022=y
CONFIG_PL031=y
CONFIG_PL041=y
CONFIG_PL050=y
CONFIG_PL061=y
CONFIG_PL080=y
CONFIG_PL181=y
CONFIG_PL190=y
CONFIG_PL310=y
CONFIG_PL330=y
CONFIG_BITBANG_I2C=y
CONFIG_GPIO_KEY=y
CONFIG_HERCULES=y

 hw/pci/pci-stub.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/pci/pci-stub.c b/hw/pci/pci-stub.c
index 36d2c430c5..ecad664946 100644
--- a/hw/pci/pci-stub.c
+++ b/hw/pci/pci-stub.c
@@ -24,6 +24,9 @@
 #include "qapi/qmp/qerror.h"
 #include "hw/pci/pci.h"
 #include "qmp-commands.h"
+#include "hw/pci/msi.h"
+
+bool msi_nonbroken;
 
 PciInfoList *qmp_query_pci(Error **errp)
 {
-- 
2.11.0


