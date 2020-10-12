Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kRxws-00074T-HJ
	for mharc-qemu-trivial@gnu.org; Mon, 12 Oct 2020 09:33:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eafanasova@gmail.com>)
 id 1kRxwr-00073k-DL; Mon, 12 Oct 2020 09:33:09 -0400
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:46311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eafanasova@gmail.com>)
 id 1kRxwp-0006y5-5T; Mon, 12 Oct 2020 09:33:09 -0400
Received: by mail-lf1-x142.google.com with SMTP id v6so2721755lfa.13;
 Mon, 12 Oct 2020 06:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=5K086FO462wmszI+hBM+jjP61a7FY2AqPedu6W0K3fI=;
 b=mk6DRktiMVqPBvLK/39/hJE3RYmk2BvBzIpcfAeOFdyBKLPD8U7nCSRswRYaKR2bgS
 nYTz/vdpdoIPLR2G/XUzUCYUlgTp+vI+5lCyKC2jZ6MxmR4LmwdGbGI07UKX3Tb7JfKQ
 tZs7uP8VydTFYzkPr9GSlmTVQtkroXMpYi/XGfsDeWJFiEJ+q2/O3aOmCR538qWQDHTR
 d7XwHTANH5Ypz0HCXC6rMTL6jGJviff+jvjdm8Vn9SNQ9CsHIQLbcfFLCBX6YWlKEims
 evtTD8UrRecGrq5gruy3st98jRoO6MPHYfgSUrf00VsWxwtv0CJc2NgIomJj1prTu4P4
 Aubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:user-agent
 :mime-version:content-transfer-encoding;
 bh=5K086FO462wmszI+hBM+jjP61a7FY2AqPedu6W0K3fI=;
 b=ionXQI2xBFw9/gwHoKb5rPLDYdwusva5OIsJeFajk+cfUKQBxA0wq1j8Cd5WxEiW7Y
 WXFso7ZfzNikUY+JU3JCi5PVBL36Urry1Ajg0IspBQQFPHVAe/uqf1Yyr1YAP0R3Dvs4
 Pe1P1hLvonxEgWNulv96qvKQO449YAdc3CHS8UR+HbN4WFApoXMhH38vnsu8Zf/3mnlT
 PEwiDc7lNmKMib19ufpp86astxpShokjLb3LZPwSVCG7HJzKLNpCh2jJDlbg4fIQVO2G
 1h6LlQy4DbZB7br4it/RhHcgqhXDKwSUa7ehBnnbpqlOCfv0SFN9ZDx01awnmQLTq4Nk
 UpUg==
X-Gm-Message-State: AOAM533ccmNNIV4zdWF/JT4eXnpAnEEKkL+4UnGSwKG7YU5ZS0FcX9mx
 bY0inBJ4RukK8sXdbX4DZvI=
X-Google-Smtp-Source: ABdhPJyCuXcSyBcsvbr8oEpDz/K0d7EXfIb4Oy/iB1H0DBAjnuGSa/S59VaEKHpwk/DbDDr+9SgLdg==
X-Received: by 2002:a19:fc1c:: with SMTP id a28mr8888921lfi.517.1602509584142; 
 Mon, 12 Oct 2020 06:33:04 -0700 (PDT)
Received: from [192.168.167.128] (37-145-186-126.broadband.corbina.ru.
 [37.145.186.126])
 by smtp.gmail.com with ESMTPSA id h17sm3284021lfj.188.2020.10.12.06.33.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 06:33:03 -0700 (PDT)
Message-ID: <ea41618a040224242fced25fc3d09d3b1f75a06a.camel@gmail.com>
Subject: [PATCH] hw/scsi: remove dead code
From: Elena Afanasova <eafanasova@gmail.com>
To: hare@suse.com, pbonzini@redhat.com, fam@euphon.net, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 12 Oct 2020 06:32:42 -0700
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::142;
 envelope-from=eafanasova@gmail.com; helo=mail-lf1-x142.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 12 Oct 2020 13:33:09 -0000

Since MEGASAS_MAX_SGE is defined to be 128 the following if statement can be removed.
Spotted by PVS-Studio.

Signed-off-by: Elena Afanasova <eafanasova@gmail.com>
---
 hw/scsi/megasas.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index e24c12d7ee..6dcaad55fa 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -2393,8 +2393,6 @@ static void megasas_scsi_realize(PCIDevice *dev, Error **errp)
     }
     if (s->fw_sge >= MEGASAS_MAX_SGE - MFI_PASS_FRAME_SIZE) {
         s->fw_sge = MEGASAS_MAX_SGE - MFI_PASS_FRAME_SIZE;
-    } else if (s->fw_sge >= 128 - MFI_PASS_FRAME_SIZE) {
-        s->fw_sge = 128 - MFI_PASS_FRAME_SIZE;
     } else {
         s->fw_sge = 64 - MFI_PASS_FRAME_SIZE;
     }
-- 
2.25.1



