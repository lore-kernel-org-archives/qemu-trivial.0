Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kGGaT-0004aY-Us
	for mharc-qemu-trivial@gnu.org; Thu, 10 Sep 2020 03:01:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kGGaT-0004aL-7p
 for qemu-trivial@nongnu.org; Thu, 10 Sep 2020 03:01:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kGGaR-0001iR-53
 for qemu-trivial@nongnu.org; Thu, 10 Sep 2020 03:01:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599721297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Y1vGmD/fvsXEOWa6wkRKs3aLydzIceOGg7Tbh5f+UXQ=;
 b=GWjYsRTrA+NnxLIECRMVdbYv0rX9n/OjSIMEmuL36MAooVd+C2d5d/Mmtc20YCUQh2dHe7
 uznluxpwZIPTOi4BwtjK7RhVkJ3zwmoGwPkbZO7xGDBqfqJ0ZTZzX53Q4BH1W0hQ2kH9Uy
 //26XvyVJxHD7EUN7bpJLF09yCgSWwo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-8v4ncaLrM5S6FCkDNYuINA-1; Thu, 10 Sep 2020 03:01:35 -0400
X-MC-Unique: 8v4ncaLrM5S6FCkDNYuINA-1
Received: by mail-wm1-f71.google.com with SMTP id k12so551653wmj.1
 for <qemu-trivial@nongnu.org>; Thu, 10 Sep 2020 00:01:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y1vGmD/fvsXEOWa6wkRKs3aLydzIceOGg7Tbh5f+UXQ=;
 b=GqGS8JlYjy5bI5tQeb88KsfUMi+1nyDM80CIJfk+U8AMZ0vxD0b0hCSaQNT4W91+5x
 xSegieCXY3VT+524mu4TYG5A2Jtj9KMK5Y+uBB/E9ymkQIrY1luO2L06KGy9/WOIbhVe
 0pNodC5c5L5RjYddgkJ8sowRPK8gSoLHoYAOSlhD1F71iuduCEkvC+7t3aBmrfDl3xS0
 mZs6MJUn0CjnPP9KhkMXtFeWz2zBPBt6t+wk+sLhjx8ku6S1LrHuKdA6OZPa0LwMNqR4
 IS3RJcRVVBk64O9en8IbUa1s9NmSbs1tqwAwxLY6v5MJj+hASFEbdcFEI4pAT50EeGrZ
 14bw==
X-Gm-Message-State: AOAM532dgGv8B8XQiNh8jF+atVyDLZTc7i1cBbnNLXOXsX8anMFxbNWT
 p1mFvB7r0cjJ75JXLc35xOvRe75l87BJnzYs1U+B7KXDV1BGE//fm8BSoo0+c4MzsTtReSgQsoo
 gGhS7vzl70cVHbNvmYg==
X-Received: by 2002:adf:f2d0:: with SMTP id d16mr7037173wrp.332.1599721294494; 
 Thu, 10 Sep 2020 00:01:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOgVJywoHM/rmr+qzXsusn/6m5n3bTGfi1VzgpHQxefWx1TwErPpn8kQ+0ho5qhfDSLK+sVw==
X-Received: by 2002:adf:f2d0:: with SMTP id d16mr7037127wrp.332.1599721294215; 
 Thu, 10 Sep 2020 00:01:34 -0700 (PDT)
Received: from x1w.redhat.com (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id c14sm7314726wrv.12.2020.09.10.00.01.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 00:01:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Marcelo Tosatti <mtosatti@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Jason Wang <jasowang@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-trivial@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 0/6] misc: Some inclusive terminology changes
Date: Thu, 10 Sep 2020 09:01:25 +0200
Message-Id: <20200910070131.435543-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/10 02:38:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 10 Sep 2020 07:01:41 -0000

We don't have (yet?) inclusive terminology guidelines,
but the PCI hole memory is not "black", the DMA sources
don't stream to "slaves", and there isn't really a TSX
"black" list, we only check for broken fields.

As this terms can be considered offensive, and changing
them is a no-brain operation, simply do it.

Philippe Mathieu-Daudé (6):
  hw/ssi/aspeed_smc: Rename max_slaves as max_devices
  hw/core/stream: Rename StreamSlave as StreamSink
  hw/dma/xilinx_axidma: Rename StreamSlave as StreamSink
  hw/net/xilinx_axienet: Rename StreamSlave as StreamSink
  hw/pci-host/q35: Rename PCI 'black hole as '(memory) hole'
  target/i386/kvm: Rename host_tsx_blacklisted() as host_tsx_broken()

 include/hw/pci-host/q35.h     |  4 +--
 include/hw/ssi/aspeed_smc.h   |  2 +-
 include/hw/ssi/xilinx_spips.h |  2 +-
 include/hw/stream.h           | 46 +++++++++++++--------------
 hw/core/stream.c              | 20 ++++++------
 hw/dma/xilinx_axidma.c        | 58 +++++++++++++++++------------------
 hw/net/xilinx_axienet.c       | 44 +++++++++++++-------------
 hw/pci-host/q35.c             | 38 +++++++++++------------
 hw/ssi/aspeed_smc.c           | 40 ++++++++++++------------
 hw/ssi/xilinx_spips.c         |  2 +-
 target/i386/kvm.c             |  4 +--
 tests/qtest/q35-test.c        |  2 +-
 12 files changed, 131 insertions(+), 131 deletions(-)

-- 
2.26.2


