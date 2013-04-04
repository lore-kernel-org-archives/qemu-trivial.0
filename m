Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UNYeZ-00071j-JH
	for mharc-qemu-trivial@gnu.org; Wed, 03 Apr 2013 21:07:47 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43721)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UNYeW-00070w-Sf
	for qemu-trivial@nongnu.org; Wed, 03 Apr 2013 21:07:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UNYeW-0002pI-30
	for qemu-trivial@nongnu.org; Wed, 03 Apr 2013 21:07:44 -0400
Received: from mail-pa0-f54.google.com ([209.85.220.54]:57087)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UNYc1-0001wv-0Y
	for qemu-trivial@nongnu.org; Wed, 03 Apr 2013 21:05:09 -0400
Received: by mail-pa0-f54.google.com with SMTP id fa11so1181639pad.27
	for <qemu-trivial@nongnu.org>; Wed, 03 Apr 2013 18:05:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references:x-gm-message-state;
	bh=IQ0blKHNfuWzlOb2KCj+HTzNzKTDBPvjCRJ4N6NYy/M=;
	b=XYx+AQxMmAl6miGX6TUfzMjL2lAz94P5bdDqsldexzvbfRm+ieBYUUVwslKxSwAWB1
	qxW93cuxQ+B7KG5Vni6iADlP1wO+eYWyXP9BKWQol8SNWWUuXJ/l2q7Atv/T0/2tEdL6
	NJ3zH/k4y2LErE+NbY/xwUuI8mFCmfQYemo/Jt6DQmeraYkZQ6WxjxbrmBy+jtaZ30tt
	o3I3ozal4g44UlELO/6gs/6C3NZWaO387xhofZkBFABZV1ZXVyZ0gkuvqOTcVA9eC80q
	dB41ywZE7ImgaZna6An8Xxx6AJBDi++298kiKp1W6yviYYYEJXGy2GbHc6Hf2XgvRRif
	EjLA==
X-Received: by 10.66.144.5 with SMTP id si5mr2927256pab.6.1365037508321;
	Wed, 03 Apr 2013 18:05:08 -0700 (PDT)
Received: from localhost ([149.199.62.254])
	by mx.google.com with ESMTPS id z1sm7921297pbw.19.2013.04.03.18.05.05
	(version=TLSv1.1 cipher=RC4-SHA bits=128/128);
	Wed, 03 Apr 2013 18:05:07 -0700 (PDT)
Sender: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: qemu-devel@nongnu.org
Date: Thu,  4 Apr 2013 11:04:12 +1000
Message-Id: <4b1965545888d7bdc92a2073932f34f8d3f0294a.1365037290.git.peter.crosthwaite@xilinx.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <d4f0f38d2fdbed4823a84c0d71880a5bfa41936c.1365037290.git.peter.crosthwaite@xilinx.com>
References: <d4f0f38d2fdbed4823a84c0d71880a5bfa41936c.1365037290.git.peter.crosthwaite@xilinx.com>
In-Reply-To: <cover.1365037290.git.peter.crosthwaite@xilinx.com>
References: <cover.1365037290.git.peter.crosthwaite@xilinx.com>
X-Gm-Message-State: ALoCoQnROxr0DS0xln5Kgw4X0XLbxNppq1bW0CAorukQFIKdWR/WgecZ9JU/AeIloKI7IxE5Ayz8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.220.54
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	dantesu@faraday-tech.com, edgar.iglesias@gmail.com
Subject: [Qemu-trivial] [PATCH v1 2/2] xilinx_zynq: Cleanup ssi_create_slave
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
X-List-Received-Date: Thu, 04 Apr 2013 01:07:45 -0000

With the recent m25p80 cleanup there is no need to use
ssi_create_slave_no_init() anymore. Just use ssi_create_slave().

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---

 hw/arm/xilinx_zynq.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 6f36286..5b9257a 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -86,8 +86,7 @@ static inline void zynq_init_spi_flashes(uint32_t base_addr, qemu_irq irq,
         spi = (SSIBus *)qdev_get_child_bus(dev, bus_name);
 
         for (j = 0; j < num_ss; ++j) {
-            flash_dev = ssi_create_slave_no_init(spi, "n25q128");
-            qdev_init_nofail(flash_dev);
+            flash_dev = ssi_create_slave(spi, "n25q128");
 
             cs_line = qdev_get_gpio_in(flash_dev, 0);
             sysbus_connect_irq(busdev, i * num_ss + j + 1, cs_line);
-- 
1.7.0.4


