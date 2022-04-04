Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nbAzy-0007qk-VR
	for mharc-qemu-trivial@gnu.org; Sun, 03 Apr 2022 20:55:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <austin@amass.space>)
 id 1nbARG-0004QD-Nz
 for qemu-trivial@nongnu.org; Sun, 03 Apr 2022 20:19:23 -0400
Received: from [2a00:1450:4864:20::229] (port=47056
 helo=mail-lj1-x229.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <austin@amass.space>)
 id 1nbARF-0002T3-9p
 for qemu-trivial@nongnu.org; Sun, 03 Apr 2022 20:19:22 -0400
Received: by mail-lj1-x229.google.com with SMTP id a30so10857108ljq.13
 for <qemu-trivial@nongnu.org>; Sun, 03 Apr 2022 17:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amass-space.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=I2Z5YIAMMt3lLHgt7ls6RIVjULAR0yLAbgtvFElHX7w=;
 b=BvCIQUxqcOa2pJFP37tRX8LjmUTDLWrJuZ/e1GMo0NG2QMTRdulIacDE1YmUzaCwWX
 3SRAkrvy2mGHLQt6B2HgWsU4FO3B9wmCWkHjY30C4aZgZBmyA0dZ6lnoETFex3J2FpS+
 CUCML5aJAXIXIlErUjajGyok69UmlfUUkKK4AadnIH8iKUKGF64c6jYDiwidJ/yVHDq5
 mzv2HuL41xxiwRT6/h9a0/qrqSU4vdkXhVgLGgqZ4canory/NEmqF3E5PIyNb0/sUu3e
 TCCSVbtJaRrnYNb4dv6aVYff7djHugne+BVfeY4Qt0cDzwozMKWVV2FahLqcEMICWABI
 meNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=I2Z5YIAMMt3lLHgt7ls6RIVjULAR0yLAbgtvFElHX7w=;
 b=YjfYTS41YmN9evM9l44G7QuvtE6FKkL4DNbBDq+traokEHB+Tx3Ui8Uh8Tnu/gZVJG
 Hd3s5hu0EWCr84KU7rhetSOgYf45JViFHMzx1GKW15GbvD56rtZ7YepV5lN+bRSbA0qO
 o+HUTqjVmi+HS7m4MK5cUWUMimCfwupZsghgr1I7O68iCwjGRc+FQO4DKnuZ/ZuobPbp
 ZZSoSJrGvTo3bINXJ8qJsBNIAahwyfKirAJr1X1HpMehtcHHn9uSo+OFjippVjJ21W/K
 VggwlZxvw6hd1X0r2Dr4Zet0RBcg7FcRaU0FF1ZVvoWQgW7HkFSVEtUy6DitXMdl008E
 Qn5w==
X-Gm-Message-State: AOAM533SMZz1YxgLwNRGn3v6783/lpn6jWXWBSa2S27v5e7i8ZUuS7R2
 nhSE03Wikk1lJ+E/PnUmS9HKJehlmwq4FrJaFBYWKA==
X-Google-Smtp-Source: ABdhPJxq3uEWAxkTELD/JusnxGV1FNjaxhMDpCRS7EOBrtW96vq/kqs3Jh+ypTQNKI4qOvFGdjjURCOeyAO18a8mSrQ=
X-Received: by 2002:a2e:9183:0:b0:24b:1220:a4d8 with SMTP id
 f3-20020a2e9183000000b0024b1220a4d8mr4241606ljg.259.1649031558458; Sun, 03
 Apr 2022 17:19:18 -0700 (PDT)
MIME-Version: 1.0
From: Austin Conatser <austin@amass.space>
Date: Sun, 3 Apr 2022 20:19:07 -0400
Message-ID: <CAO7oc52NECtz_0xQgyezgp9A-J-9Vvv8xUP92aTizCHKh550fA@mail.gmail.com>
Subject: [PATCH] hw/i386/amd_iommu: Fix remapping of APIC registers
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::229
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::229;
 envelope-from=austin@amass.space; helo=mail-lj1-x229.google.com
X-Spam_score_int: 20
X-Spam_score: 2.0
X-Spam_bar: ++
X-Spam_report: (2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 FROM_SUSPICIOUS_NTLD=0.499, FROM_SUSPICIOUS_NTLD_FP=1.997,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 03 Apr 2022 20:55:11 -0400
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
X-List-Received-Date: Mon, 04 Apr 2022 00:19:23 -0000

Changes the check from only allowing the APIC base address to
allowing the entire APIC address space.

Signed-off-by: Austin Conatser <austin@amass.space>
---
 hw/i386/amd_iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index ea8eaeb330..61b7416d50 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -1248,7 +1248,7 @@ static int amdvi_int_remap_msi(AMDVIState *iommu,
         return -AMDVI_IR_ERR;
     }

-    if ((origin->address & AMDVI_MSI_ADDR_LO_MASK) != APIC_DEFAULT_ADDRESS) {
+    if (!amdvi_is_interrupt_addr(origin->address & AMDVI_MSI_ADDR_LO_MASK)) {
         trace_amdvi_err("MSI is not from IOAPIC.");
         return -AMDVI_IR_ERR;
     }
-- 
2.34.1

