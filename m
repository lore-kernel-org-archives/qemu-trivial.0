Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ljcUd-0008OJ-8D
	for mharc-qemu-trivial@gnu.org; Thu, 20 May 2021 02:49:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljcUb-0008MJ-1J
 for qemu-trivial@nongnu.org; Thu, 20 May 2021 02:49:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljcUU-0000F3-IO
 for qemu-trivial@nongnu.org; Thu, 20 May 2021 02:49:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621493345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Qb2jTKgpI/8jzWMA/fGcIeY07/BtSeOxotYpWWJgiMA=;
 b=W0udbSbZ7Tq4VPP88lfpnrL+l54x0DBrLf4tEvB1nPq8Y25VbIfZlsosQnJ+IoBhQNhsBV
 bgPW2DUUHCbUh1A4Tch0JqJFgCiYWmqfW/qV16g0n75hfX6oLTU+c9T2Kk8ZPRbC49RNFe
 zn2srKl+fl1xYJb29Yz/IPRW8Hkn8Ck=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-WNkeCTuDOgm4QCYV_ahxUQ-1; Thu, 20 May 2021 02:49:03 -0400
X-MC-Unique: WNkeCTuDOgm4QCYV_ahxUQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 l15-20020a1ced0f0000b029017140e7436dso1067125wmh.2
 for <qemu-trivial@nongnu.org>; Wed, 19 May 2021 23:49:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qb2jTKgpI/8jzWMA/fGcIeY07/BtSeOxotYpWWJgiMA=;
 b=Fen/TkFhjgzv9u6yR832AGYtd1dm/oaVi/LH6YO2xZmfxLS8RHVyipYYObm4pzSf9F
 EtLUiUEMYqyFePmJvm+qzsA7n3YELkW/Ude7no/+ImoVR9hpDbZLy/5LhqFOKUGga5gF
 7PEL4BVm2i1sJTN609GLFYrUqLtc9CZcbWFWdgyJHjM7EzaQLbbpiSCbbyv1pwAU229T
 865s8UN6PpEr42I3RE14cbDsvwHpafG4VLweaIQa089AM6Rvx4pWeG/B5ovyEOKtyJHQ
 iAkWKRcbvLXuOiAy+tLsiQSodPHF8dxLLuxwS6ZeLPjW0Yl159Hmo2GguFNDDmaV+01t
 SeBw==
X-Gm-Message-State: AOAM533YugcscnoyCFArjmewXFI0SFrfxWM6t0iIb8sJuYNg7bl2Z5SV
 CByHVE/qAg+pCEeqC66nTvBo1gikEZQSaW3U9JcbtkPsb+8RquorhGwelSw/HqVCNW6Rt8mvmEQ
 CJpGMHw+P8O7eQ3ogLA==
X-Received: by 2002:a5d:638b:: with SMTP id p11mr2598954wru.90.1621493342604; 
 Wed, 19 May 2021 23:49:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxglwyztEVEdE7RE97jv69WDujaCXZDD23lEnshfpec5hG0doeGDUiwGAL4x6ES7ZT4n/UPJg==
X-Received: by 2002:a5d:638b:: with SMTP id p11mr2598931wru.90.1621493342351; 
 Wed, 19 May 2021 23:49:02 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id u126sm9580157wmb.9.2021.05.19.23.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 23:49:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] hw/virtio: Document *_should_notify() are called within
 rcu_read_lock()
Date: Thu, 20 May 2021 08:49:00 +0200
Message-Id: <20210520064900.2413612-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 20 May 2021 06:49:13 -0000

Such comments make reviewing this file somehow easier.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/virtio/virtio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index e02544b2df7..2b4c6c4b875 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -2449,6 +2449,7 @@ static void virtio_set_isr(VirtIODevice *vdev, int value)
     }
 }
 
+/* Called within rcu_read_lock().  */
 static bool virtio_split_should_notify(VirtIODevice *vdev, VirtQueue *vq)
 {
     uint16_t old, new;
@@ -2485,6 +2486,7 @@ static bool vring_packed_need_event(VirtQueue *vq, bool wrap,
     return vring_need_event(off, new, old);
 }
 
+/* Called within rcu_read_lock().  */
 static bool virtio_packed_should_notify(VirtIODevice *vdev, VirtQueue *vq)
 {
     VRingPackedDescEvent e;
-- 
2.26.3


