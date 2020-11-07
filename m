Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kbMA4-0004MJ-Jx
	for mharc-qemu-trivial@gnu.org; Sat, 07 Nov 2020 06:13:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kbMA2-0004Jk-F4
 for qemu-trivial@nongnu.org; Sat, 07 Nov 2020 06:13:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kbMA0-0002ow-Vq
 for qemu-trivial@nongnu.org; Sat, 07 Nov 2020 06:13:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604747612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qfseJWujaVPa0a8Aenqsf/GWeCPDNQLBt0wn/9+sZ0Q=;
 b=MRq4vcxxTLtsG7L/tcYNa1aLOCmAzjxWPW0VjrhlgN/6ew3ES9oLV8hqPprb6GKToXB2Eu
 TUmoNzI4oYdokAM5V483UeLL6PWOyIGtM0wfTKcaI6v+E5sUOMpjjOLwKk+FYlY2aIxMMV
 6YrvYxv+OM1c9QFktHeWiBQ9/DH0I4w=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-q_MbeJA9OPipftEmqPQzBA-1; Sat, 07 Nov 2020 06:13:30 -0500
X-MC-Unique: q_MbeJA9OPipftEmqPQzBA-1
Received: by mail-wr1-f71.google.com with SMTP id u1so1605646wri.6
 for <qemu-trivial@nongnu.org>; Sat, 07 Nov 2020 03:13:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qfseJWujaVPa0a8Aenqsf/GWeCPDNQLBt0wn/9+sZ0Q=;
 b=C+tTv/PHzmrdLv7VwkC424qdWcaSYo85WXJxdTGcsIwOQvxRhxrMXzgkziVp6l7NFq
 OFaS1iSee5VMHI+2nOZlyM0jKZncZ5FFnDC0JILavcZ1q3t5L1J8oOXI8V9tecG3Lv/W
 wnO+eutnkIvJIr6BgMpyRIFJOWFOc4p9xfApjwAQMfZkwTeu8U8BTFQGpZ5MLN2nLx6E
 cv+i3Ze3PW3sAzS2JSc51XJ5jOUet+WvNsK9g/eJmJgQMHodzHK6AmKFGkS2kimTlnKv
 tivW6flz856wmGgn//9OE5RuBJ3oJuBLcq5fMPzHYDKPa+O/WYZbjTr0ByJivOtS1u8a
 0acg==
X-Gm-Message-State: AOAM530mMAHhPPcaqmZ3h5M7Mq1WFDtt6Ip7mhFapO47vBu1lXEaaq+X
 3Sv4fKEj0pV5Y6geTUsSt6/T5CEPrsV84U0D/eTwj7tqMPmSiG0sFiKtbx2AR0KAhJi3mBYHL9W
 rS2qIJeUzhkfScWMwcQ==
X-Received: by 2002:adf:f00f:: with SMTP id j15mr3531648wro.102.1604747609284; 
 Sat, 07 Nov 2020 03:13:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzQNMxxhARgrbB8iQk7h6BLzmK0BLf4IZWvJh7+aIAiergiLTRpjKEuEOQCUTAW0hfBN1H2SA==
X-Received: by 2002:adf:f00f:: with SMTP id j15mr3531630wro.102.1604747609150; 
 Sat, 07 Nov 2020 03:13:29 -0800 (PST)
Received: from localhost.localdomain (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id v9sm6012072wrp.11.2020.11.07.03.13.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Nov 2020 03:13:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org
Subject: [PATCH-for-6.0 4/5] hw/usb/hcd-xhci-pci: Use
 OBJECT_DECLARE_SIMPLE_TYPE() macro
Date: Sat,  7 Nov 2020 12:13:06 +0100
Message-Id: <20201107111307.262263-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201107111307.262263-1-philmd@redhat.com>
References: <20201107111307.262263-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/07 03:12:58
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
X-List-Received-Date: Sat, 07 Nov 2020 11:13:35 -0000

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-trivial@nongnu.org

 hw/usb/hcd-xhci-pci.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/usb/hcd-xhci-pci.h b/hw/usb/hcd-xhci-pci.h
index aa2e890627c..cf9a180caa4 100644
--- a/hw/usb/hcd-xhci-pci.h
+++ b/hw/usb/hcd-xhci-pci.h
@@ -28,9 +28,7 @@
 #include "hcd-xhci.h"
 
 #define TYPE_XHCI_PCI "pci-xhci"
-#define XHCI_PCI(obj) \
-    OBJECT_CHECK(XHCIPciState, (obj), TYPE_XHCI_PCI)
-
+OBJECT_DECLARE_SIMPLE_TYPE(XHCIPciState, XHCI_PCI)
 
 typedef struct XHCIPciState {
     /*< private >*/
-- 
2.26.2


