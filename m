Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UNYbr-0005HU-No
	for mharc-qemu-trivial@gnu.org; Wed, 03 Apr 2013 21:04:59 -0400
Received: from eggs.gnu.org ([208.118.235.92]:42991)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UNYbe-0005DV-IH
	for qemu-trivial@nongnu.org; Wed, 03 Apr 2013 21:04:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UNYbR-0001Zr-KJ
	for qemu-trivial@nongnu.org; Wed, 03 Apr 2013 21:04:46 -0400
Received: from mail-pd0-f175.google.com ([209.85.192.175]:35954)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UNYbR-0001ZG-Bq
	for qemu-trivial@nongnu.org; Wed, 03 Apr 2013 21:04:33 -0400
Received: by mail-pd0-f175.google.com with SMTP id g10so916466pdj.34
	for <qemu-trivial@nongnu.org>; Wed, 03 Apr 2013 18:04:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:x-gm-message-state;
	bh=vu2YsGfaZ3a34fDvHn7+y46kevsBv1pQNv55+EqWxeE=;
	b=PxbtUZNZ4H7N6vY3RXeXlCshy2xtDAPtbr0JQsf0DNcoQgOxszXtbJU7qODIq1gAHs
	cZUz58TbArT8nrOpzD8EoFiCaGWMQ790pimlzKizJMl3Nq4XemG4GLdGvrmZ//Vf96J+
	z5rm6/+cPbqTsANW4jwUKbNlIZX62ujlJnZDBQanU80FGWbKAvmVEjlOmQAj77rZeW7O
	U9RiYXxl724BLn4HptpBTQXjAD1wPPksZycnJrD2CmXD782Cdkmd024qZv3FcpxB31xH
	NHP+iBowUk6qV8AWdM+xF02ETgEWpfooD6RSENlqDseIB9OLXoQzxq0COoljjEYqSsv9
	tgzA==
X-Received: by 10.68.213.132 with SMTP id ns4mr6047774pbc.84.1365037472551;
	Wed, 03 Apr 2013 18:04:32 -0700 (PDT)
Received: from localhost ([149.199.62.254])
	by mx.google.com with ESMTPS id in5sm7918188pbc.20.2013.04.03.18.04.30
	(version=TLSv1.1 cipher=RC4-SHA bits=128/128);
	Wed, 03 Apr 2013 18:04:31 -0700 (PDT)
Sender: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: qemu-devel@nongnu.org
Date: Thu,  4 Apr 2013 11:04:11 +1000
Message-Id: <d4f0f38d2fdbed4823a84c0d71880a5bfa41936c.1365037290.git.peter.crosthwaite@xilinx.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1365037290.git.peter.crosthwaite@xilinx.com>
References: <cover.1365037290.git.peter.crosthwaite@xilinx.com>
X-Gm-Message-State: ALoCoQkRWX8A5q4jdkLFUrBHmIDYbuvmJCx1hXk7rvDpLqTMpl5il3QVQp26e/ISBYMNv//2u6Qn
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.192.175
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	dantesu@faraday-tech.com, edgar.iglesias@gmail.com
Subject: [Qemu-trivial] [PATCH v1 1/2] petalogix_ml605_mmu: Cleanup
	ssi_create_slave()
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Apr 2013 01:04:58 -0000

With the recent m25p80 cleanup there is no need to use
ssi_create_slave_no_init() anymore. Just use ssi_create_slave().

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---

 hw/microblaze/petalogix_ml605_mmu.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petalogix_ml605_mmu.c
index cfc0220..07dc808 100644
--- a/hw/microblaze/petalogix_ml605_mmu.c
+++ b/hw/microblaze/petalogix_ml605_mmu.c
@@ -158,8 +158,7 @@ petalogix_ml605_init(QEMUMachineInitArgs *args)
         for (i = 0; i < NUM_SPI_FLASHES; i++) {
             qemu_irq cs_line;
 
-            dev = ssi_create_slave_no_init(spi, "n25q128");
-            qdev_init_nofail(dev);
+            dev = ssi_create_slave(spi, "n25q128");
             cs_line = qdev_get_gpio_in(dev, 0);
             sysbus_connect_irq(busdev, i+1, cs_line);
         }
-- 
1.7.0.4


