Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kIF2f-0001kE-11
	for mharc-qemu-trivial@gnu.org; Tue, 15 Sep 2020 13:46:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kIF2a-0001eP-N4
 for qemu-trivial@nongnu.org; Tue, 15 Sep 2020 13:46:52 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:29252
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kIF2V-0007Gd-2j
 for qemu-trivial@nongnu.org; Tue, 15 Sep 2020 13:46:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600192005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=V9E5diWhrRbicYgJlE9jOABL332i7DZaKEazsBktu98=;
 b=i2q+VDU3fEXnlzRj6bf25A5DtKoldHUeVs1m1+1tKkWH5wvauoF6q7x1Xtav+olacaAcLy
 Zn5C1Y5y7ps0ZfOFNlb496i405n7lKN7rDvn1+x1Ql0aLJ3NX85Jf3cUaMAt8UcpnVgbCo
 1gxh8YkmUHWmXTkLBAeZpoDpUNx1I90=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-CSYyltxINL-jF7uGYiM8tg-1; Tue, 15 Sep 2020 13:46:44 -0400
X-MC-Unique: CSYyltxINL-jF7uGYiM8tg-1
Received: by mail-wm1-f69.google.com with SMTP id u5so95404wme.3
 for <qemu-trivial@nongnu.org>; Tue, 15 Sep 2020 10:46:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V9E5diWhrRbicYgJlE9jOABL332i7DZaKEazsBktu98=;
 b=RnT+pMK0TndDCDHac8UIf1Frr/vBpDelLaTUhE6PNoq7Xw9VpKEy5Gtc2UQOcCaEbF
 Gjiy0j3GO7q7fQ67/vKnBJl//QLOrxcmKmaC+Z0PBnc07K6oJT/vxuuqcih4wrbYzdca
 SVaxM1HxFz2TdMwhL73qIKaN/LtWQfKvonsOrp1Y5Jme6q3DPj7kI1e5QzWspYZzsjAB
 JHF1d+eRzUlfPb+IUQwMubowckSjQZLgwp4aph7LcZPzUJGAdA2lkBYL3kFNWdt3RKYc
 n1bIfWUA3P15JoB8X+Sq+Ok9RpMuQbSEJMU7et5u29jjbWhaL1QE8YZUUbEb33TpVFjS
 cyqQ==
X-Gm-Message-State: AOAM532vL4R/DUk4afp7CrdXiFKYw0TZBVW0o0Vg3tvQ8sLhnnwn2Icy
 Nsyx9qbYP2oAzORADeRac8vY8xmrbqF6jlJxcRUIZWWwpJ8LJl0/Bfnd9R0XPzEH0BOXTlnOsqa
 fDSK+Kt6xMj11KFpgBA==
X-Received: by 2002:a7b:cf30:: with SMTP id m16mr543203wmg.0.1600192001867;
 Tue, 15 Sep 2020 10:46:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzn8hlVTm9vMvPskzb2OpiF/YlQkmj82TAZVB/hRy4HshHRviUWl4L8IXZZzAr1cLVjur3vRg==
X-Received: by 2002:a7b:cf30:: with SMTP id m16mr543188wmg.0.1600192001640;
 Tue, 15 Sep 2020 10:46:41 -0700 (PDT)
Received: from x1w.redhat.com (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id q84sm578177wme.23.2020.09.15.10.46.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 10:46:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] hw/scsi/lsi53c895a: Sanitize some trace events format
Date: Tue, 15 Sep 2020 19:46:39 +0200
Message-Id: <20200915174639.1366226-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/15 11:09:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 15 Sep 2020 17:46:53 -0000

Make some lsi53c895a trace events more understandable.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/scsi/trace-events | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/scsi/trace-events b/hw/scsi/trace-events
index 9a4a60ca635..ac4209f361e 100644
--- a/hw/scsi/trace-events
+++ b/hw/scsi/trace-events
@@ -234,9 +234,9 @@ spapr_vscsi_do_crq(unsigned c0, unsigned c1) "crq: %02x %02x ..."
 
 # lsi53c895a.c
 lsi_reset(void) "Reset"
-lsi_update_irq(int level, uint8_t dstat, uint8_t sist1, uint8_t sist0) "Update IRQ level %d dstat 0x%02x sist 0x%02x0x%02x"
+lsi_update_irq(int level, uint8_t dstat, uint8_t sist1, uint8_t sist0) "Update IRQ level %d dstat 0x%02x sist 1:0x%02x 0:0x%02x"
 lsi_update_irq_disconnected(void) "Handled IRQs & disconnected, looking for pending processes"
-lsi_script_scsi_interrupt(uint8_t stat1, uint8_t stat0, uint8_t sist1, uint8_t sist0) "SCSI Interrupt 0x%02x0x%02x prev 0x%02x0x%02x"
+lsi_script_scsi_interrupt(uint8_t stat1, uint8_t stat0, uint8_t sist1, uint8_t sist0) "SCSI Interrupt stat 1:0x%02x 0:0x%02x sist 1:0x%02x 0:0x%02x"
 lsi_script_dma_interrupt(uint8_t stat, uint8_t dstat) "DMA Interrupt 0x%x prev 0x%x"
 lsi_bad_phase_jump(uint32_t dsp) "Data phase mismatch jump to 0x%"PRIX32
 lsi_bad_phase_interrupt(void) "Phase mismatch interrupt"
-- 
2.26.2


