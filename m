Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pNC1L-0007XJ-SJ
	for mharc-qemu-trivial@gnu.org; Wed, 01 Feb 2023 07:15:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNC1J-0007Ww-UN
 for qemu-trivial@nongnu.org; Wed, 01 Feb 2023 07:15:22 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNC1H-00032t-Rf
 for qemu-trivial@nongnu.org; Wed, 01 Feb 2023 07:15:21 -0500
Received: by mail-wm1-x32d.google.com with SMTP id n13so5505664wmr.4
 for <qemu-trivial@nongnu.org>; Wed, 01 Feb 2023 04:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Dj02NefZD9/37/v6Oky4QdBYPh8YstL5fhnmYEpitXA=;
 b=QKvMNfwCplyPFogEjr5TD33vIppK0UpiPta468APlZ6V3GmbQdye5KKLGLctL7gsD9
 DVMJVKl/XkSYKuIJzqkK1gLULhKpZ7xlV12Dzxby8uuHF04oBQS+ZBDgznH+Nq3MSvcU
 KMeV80VixCHZKIr1+Z7zoGVLPmb3BuU8SSTeYE5iYFmy+3FFRiaunj7DqJLQsNoahJ+1
 PimCdubYmaNIDVM3ZbZvHUpaNUX3ynDqHX5mnZyEqXEKZ3xnHpdcarlDhMxmE9qKYrNg
 YRudOdwcRbZheWm3g31NZM2uP9PHEzkmZoA+aUG1N4IybsrKYVd/uXPY8W0zB0BC0vz2
 kL+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Dj02NefZD9/37/v6Oky4QdBYPh8YstL5fhnmYEpitXA=;
 b=Ed9CBAJmvlO846htvJTaOhljE6XHHHnt0mt7vyoEK2YUFU1QV+S6u1HUgF4xaRJjAd
 ODvaiQuk76XQ2m8cKWjIhL8uRC1lXZlI0W1900cuADt/+FDtrpGNgGy7AjQovulNF96z
 I/EwLdtBDT1uUwO5Ya2rffSWEIscx6L6GIFAhKQ5GgB+PzUogOXWXAMAwUbVpjGnXIsA
 5E6An7v8mYzTcdcVvg/mm91UADlK/u6c1KOP5YK16oRmz5NNx8W+ammcUuX+RseDUwEi
 xO/dbIeOuvRJ+fEZFLy2MTD+kwZdvq+eOiji3VbKEHAxpsPVyUozqEsBfqsxj7zTuTyi
 PKBg==
X-Gm-Message-State: AO0yUKUfoL+DK1x1mYMPm++KcDSsoyhLO5Y80LfYSs0XjSo+t981488P
 tIxmSQpPEeIQhd9oXOQR4Wn9tQ==
X-Google-Smtp-Source: AK7set9n60049MECodvGV5ZT27Jj2EG+Nfec5qEqumx6udl+rOHOzoxReD3gCCGOIupBqe3kvL7SwQ==
X-Received: by 2002:a05:600c:4b2f:b0:3dc:53a2:2690 with SMTP id
 i47-20020a05600c4b2f00b003dc53a22690mr1839361wmp.7.1675253718041; 
 Wed, 01 Feb 2023 04:15:18 -0800 (PST)
Received: from localhost.localdomain
 (107.red-88-29-181.dynamicip.rima-tde.net. [88.29.181.107])
 by smtp.gmail.com with ESMTPSA id
 iz10-20020a05600c554a00b003dd19baf45asm1570929wmb.40.2023.02.01.04.15.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Feb 2023 04:15:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] hw/usb/hcd-ohci: Fix typo
Date: Wed,  1 Feb 2023 13:15:15 +0100
Message-Id: <20230201121515.23016-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Feb 2023 12:15:22 -0000

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/usb/hcd-ohci.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index 9d68036d23..bd8b9d50e5 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -58,7 +58,7 @@ struct ohci_hcca {
 #define ED_WBACK_OFFSET offsetof(struct ohci_ed, head)
 #define ED_WBACK_SIZE   4
 
-/* Bitfields for the first word of an Endpoint Desciptor.  */
+/* Bitfields for the first word of an Endpoint Descriptor.  */
 #define OHCI_ED_FA_SHIFT  0
 #define OHCI_ED_FA_MASK   (0x7f<<OHCI_ED_FA_SHIFT)
 #define OHCI_ED_EN_SHIFT  7
@@ -71,11 +71,11 @@ struct ohci_hcca {
 #define OHCI_ED_MPS_SHIFT 16
 #define OHCI_ED_MPS_MASK  (0x7ff<<OHCI_ED_MPS_SHIFT)
 
-/* Flags in the head field of an Endpoint Desciptor.  */
+/* Flags in the head field of an Endpoint Descriptor.  */
 #define OHCI_ED_H         1
 #define OHCI_ED_C         2
 
-/* Bitfields for the first word of a Transfer Desciptor.  */
+/* Bitfields for the first word of a Transfer Descriptor.  */
 #define OHCI_TD_R         (1<<18)
 #define OHCI_TD_DP_SHIFT  19
 #define OHCI_TD_DP_MASK   (3<<OHCI_TD_DP_SHIFT)
@@ -88,14 +88,14 @@ struct ohci_hcca {
 #define OHCI_TD_CC_SHIFT  28
 #define OHCI_TD_CC_MASK   (0xf<<OHCI_TD_CC_SHIFT)
 
-/* Bitfields for the first word of an Isochronous Transfer Desciptor.  */
-/* CC & DI - same as in the General Transfer Desciptor */
+/* Bitfields for the first word of an Isochronous Transfer Descriptor.  */
+/* CC & DI - same as in the General Transfer Descriptor */
 #define OHCI_TD_SF_SHIFT  0
 #define OHCI_TD_SF_MASK   (0xffff<<OHCI_TD_SF_SHIFT)
 #define OHCI_TD_FC_SHIFT  24
 #define OHCI_TD_FC_MASK   (7<<OHCI_TD_FC_SHIFT)
 
-/* Isochronous Transfer Desciptor - Offset / PacketStatusWord */
+/* Isochronous Transfer Descriptor - Offset / PacketStatusWord */
 #define OHCI_TD_PSW_CC_SHIFT 12
 #define OHCI_TD_PSW_CC_MASK  (0xf<<OHCI_TD_PSW_CC_SHIFT)
 #define OHCI_TD_PSW_SIZE_SHIFT 0
-- 
2.38.1


