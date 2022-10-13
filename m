Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oixtt-0002qc-HM
	for mharc-qemu-trivial@gnu.org; Thu, 13 Oct 2022 09:05:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oixtc-0002lW-LH
 for qemu-trivial@nongnu.org; Thu, 13 Oct 2022 09:05:09 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:37858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oixtZ-0000ye-N6
 for qemu-trivial@nongnu.org; Thu, 13 Oct 2022 09:05:07 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 c7-20020a05600c0ac700b003c6cad86f38so3206455wmr.2
 for <qemu-trivial@nongnu.org>; Thu, 13 Oct 2022 06:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Z10mhDJVwk3ax3+lJRI6nda2u/R14pZqSMyReUBFvks=;
 b=IggOtt0So2ArUTBoVhaV9bst0rq7Ghme4eZIHDwQxBNGJknVmiFiBmoZPIGYfKjTYc
 xtV1agjZyJTz4EOueElLX8gKbR0PLTSlvu9VZcz/5r/tkcDvbscNHD1LHb/9C5HSevKT
 mr8FaixwFNqAcx8rNp6ZhYMlD2OxJLlueXgye9XX+DAmqO2BYhfAokxUnbvBiA5Lx1KN
 v0GDpH8RASjN/zZHn+i1zf1CD+fwtxltX35H5GhdtBWdyreJljQHogq2Uge59lb7Spxg
 g12X+YtIOZWRHeT5OOr67fp9HQgIauDvhq4n/cmWX4b9vA/AnrgVF7Xctt2YaiEVthEq
 yolA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z10mhDJVwk3ax3+lJRI6nda2u/R14pZqSMyReUBFvks=;
 b=1DNsjkqROqF6Me8JlBM7quuLb0cyRJ9VWj3O8o/cg9sF1+4RLLxNdMJslVx1paQjPt
 mKQ5obnG8trtuF6vANWbXPvBtXbr8Ctos35HvUqv5+KYSg+CvKhwdvDkKQff0LdJNqbl
 l6PbLPmJfy1BWjPRgqBwe0DqMEFGlvXng6Ef3rrImY/SFSiAZ5GUFvtCva1RAhB2bAnv
 JNB+kfSdISEujY9a4bXYJLLziTo/5G0BkPQ2BESPlKYNbnc5vUNljEMjh+ikggy3bBq9
 YgjACvZP4Hs7MTnDaHEf0o+zbCWHm4UMBa7owKrJ7ngmcZRb6Qgod5dK08tI7enISfl4
 7YFw==
X-Gm-Message-State: ACrzQf1J5GnXIlgHkLXqJvdkWB2FzAPfOnodv8d0V6NfvngSEhrkOBzf
 T7OVSXDvOMRi5E/vcquy9zFIfjX50LFWPw==
X-Google-Smtp-Source: AMsMyM6ralNB0Rr7dk8acmThnq9NCnrgxqXBvOQ/Lw1++iJZ2v1SlPaTWlnR8WpAyzgn4zaB68+Qgg==
X-Received: by 2002:a05:600c:538b:b0:3c6:b66d:4027 with SMTP id
 hg11-20020a05600c538b00b003c6b66d4027mr6190443wmb.146.1665666303345; 
 Thu, 13 Oct 2022 06:05:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 r5-20020a5d6945000000b0022cc0a2cbecsm1995599wrw.15.2022.10.13.06.05.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 06:05:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>
Subject: [PATCH] include/hw/scsi/scsi.h: Remove unused
 scsi_legacy_handle_cmdline() prototype
Date: Thu, 13 Oct 2022 14:05:00 +0100
Message-Id: <20221013130500.967432-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 13 Oct 2022 13:05:15 -0000

In commit 1454509726719e0933c80 we removed the function
scsi_legacy_handle_cmdline() and all of its callers, but forgot to
delete the prototype from the header function.  Delete the prototype
too.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/scsi/scsi.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
index 001103488c2..9ad86b25bb4 100644
--- a/include/hw/scsi/scsi.h
+++ b/include/hw/scsi/scsi.h
@@ -187,7 +187,6 @@ SCSIDevice *scsi_bus_legacy_add_drive(SCSIBus *bus, BlockBackend *blk,
                                       BlockdevOnError werror,
                                       const char *serial, Error **errp);
 void scsi_bus_legacy_handle_cmdline(SCSIBus *bus);
-void scsi_legacy_handle_cmdline(void);
 
 SCSIRequest *scsi_req_alloc(const SCSIReqOps *reqops, SCSIDevice *d,
                             uint32_t tag, uint32_t lun, void *hba_private);
-- 
2.25.1


