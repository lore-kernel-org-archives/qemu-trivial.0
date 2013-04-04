Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UNYaj-0004AR-BP
	for mharc-qemu-trivial@gnu.org; Wed, 03 Apr 2013 21:03:49 -0400
Received: from eggs.gnu.org ([208.118.235.92]:42629)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UNYad-00048F-ML
	for qemu-trivial@nongnu.org; Wed, 03 Apr 2013 21:03:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UNYaY-000145-5E
	for qemu-trivial@nongnu.org; Wed, 03 Apr 2013 21:03:43 -0400
Received: from mail-pa0-f41.google.com ([209.85.220.41]:40648)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UNYaX-00013q-Vn
	for qemu-trivial@nongnu.org; Wed, 03 Apr 2013 21:03:38 -0400
Received: by mail-pa0-f41.google.com with SMTP id kx1so1203386pab.14
	for <qemu-trivial@nongnu.org>; Wed, 03 Apr 2013 18:03:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=GPjVn+eTplbCfL+PFzPtIZpBwA2zfkXuAJLRpEG7YAU=;
	b=dj8ZKtfAfX4OP8JO6XnqjFUJ8AWWxuAIIgxQKTZl6pfbfXyrCPBG9YCSPktsJ951M9
	Y8NY7DxcaR/FuEI9gWsI/5AvdLFU12n7FAV3mvfE1A2aXG6qtmw0WGDZ1xb8hhivD0kx
	cXuNdX2HHIWuxjdBbODUfp1ros7HmtS5rnTLOLNXHO3WQt6HvdRyvXzh7EErEiFlynJY
	8Fxwtb5fbhDv8eGV7ppu+3v0q9zrAmbIyr3Yu0PXzqHSoDsuLegTFBJY5AxMf9bx77e5
	xOlA7QEQPxhJVITDNz7gx03wmlfNRBtCv4Fv5D9S3iIBnrTKGFp6WkX2den+/IhE4NUU
	1zFQ==
X-Received: by 10.66.146.232 with SMTP id tf8mr6725202pab.32.1365037416776;
	Wed, 03 Apr 2013 18:03:36 -0700 (PDT)
Received: from localhost ([149.199.62.254])
	by mx.google.com with ESMTPS id ux10sm9050045pab.1.2013.04.03.18.03.34
	(version=TLSv1.1 cipher=RC4-SHA bits=128/128);
	Wed, 03 Apr 2013 18:03:35 -0700 (PDT)
Sender: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: qemu-devel@nongnu.org
Date: Thu,  4 Apr 2013 11:03:14 +1000
Message-Id: <cover.1365037290.git.peter.crosthwaite@xilinx.com>
X-Mailer: git-send-email 1.7.0.4
X-Gm-Message-State: ALoCoQmDDKleaV+WgC/UteHCfl1O21r4W1zb8uBWkTBBPR0X/i3o6rpVEFXKKRMzH4wMoPFCCVHm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.220.41
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	dantesu@faraday-tech.com, edgar.iglesias@gmail.com
Subject: [Qemu-trivial] [PATCH v1 0/2] Remove un-needed use of
	ssi_create_slave_no_init
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
X-List-Received-Date: Thu, 04 Apr 2013 01:03:48 -0000

Trivial code cleanup of the PetaLogix and Zynq machine models.


Peter Crosthwaite (2):
  petalogix_ml605_mmu: Cleanup ssi_create_slave()
  xilinx_zynq: Cleanup ssi_create_slave

 hw/arm/xilinx_zynq.c                |    3 +--
 hw/microblaze/petalogix_ml605_mmu.c |    3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)


