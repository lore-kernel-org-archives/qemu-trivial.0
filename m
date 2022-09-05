Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oV9BH-0000gt-Iw
	for mharc-qemu-trivial@gnu.org; Mon, 05 Sep 2022 06:18:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oV9BF-0000bp-Pc
 for qemu-trivial@nongnu.org; Mon, 05 Sep 2022 06:18:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oV9B4-00050i-JU
 for qemu-trivial@nongnu.org; Mon, 05 Sep 2022 06:18:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662373081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+/XZpaWOatQvZlf69VdQZSO4CQFd856M9KwjqSmktZ0=;
 b=BkDpaeIe9dPIXA1WhcRrDUi55CTtxjIF5AD7Zr74Yha9WZcfq+9jg7AFhDhnAmbdIOKb6q
 DNDA9ZiQlXuGWRfT0TA5R00SdKq/wB+XIJzMzPtCqwTl7F+o35iQ0hgvqsK5qDMXbF/3pe
 aKYnta3rfrUEaN5OIlcjmEjRUHTo6rA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-75-QfT7G49fMuCEv_HHqBxMtw-1; Mon, 05 Sep 2022 06:18:00 -0400
X-MC-Unique: QfT7G49fMuCEv_HHqBxMtw-1
Received: by mail-ej1-f71.google.com with SMTP id
 gs35-20020a1709072d2300b00730e14fd76eso2156890ejc.15
 for <qemu-trivial@nongnu.org>; Mon, 05 Sep 2022 03:18:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=+/XZpaWOatQvZlf69VdQZSO4CQFd856M9KwjqSmktZ0=;
 b=t8fZBe9h1ViO3GKqjCgW932JJLYtJVg7i1Oo1MNbXfSxpnJ9JNcWFR9PDwM+HbmM6K
 QQdmvunQi31FMNOr3KPsQjbGixv4l/FvqQiNyBZxWLlVh+U2HsWl2273BcP73FCuQtrS
 C+hg3vd4gY2yiTbu0hoKA8TahhNwS6YO+S+edjjVFlC76bIZANjcecV0WzV8jKNWBnar
 46mQnsnFqdL1DjhqLsVeV7G7qzSSGXevT/T6+R4kdLEspM3swFiRtMi1oiQUn3FLQ6TW
 iqri9GjP/TmpHoj2we1kMlKASIZPG5KPCgVcztYilIe+jnZMp3QYTM1u+X840d76ONOa
 Q0og==
X-Gm-Message-State: ACgBeo3ZJsfwVw5SN/oM4hQ1HmyjJNe62i95U7UE1VHUK1uloDZb4t7h
 ZZKqA2Mvlou9CHypHyy10J2n2OWwV7dJjqxGNIXJQsvsWno+MvdhJzjnSTUeWFAiL5ELNDNBs1o
 ZX2AZerVFysjwuIBFBw==
X-Received: by 2002:a17:906:ef8c:b0:73d:db28:dc32 with SMTP id
 ze12-20020a170906ef8c00b0073ddb28dc32mr33280198ejb.224.1662373079278; 
 Mon, 05 Sep 2022 03:17:59 -0700 (PDT)
X-Google-Smtp-Source: AA6agR57mWLJv3beC2dLnAUla5ului5IjGab7WMsDKaxi1ZYCa3ohhjs6K6+rOV4D5vjiBgTZOcS9Q==
X-Received: by 2002:a17:906:ef8c:b0:73d:db28:dc32 with SMTP id
 ze12-20020a170906ef8c00b0073ddb28dc32mr33280188ejb.224.1662373078940; 
 Mon, 05 Sep 2022 03:17:58 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 d21-20020a170906305500b0073d6ab5bcaasm4822930ejd.212.2022.09.05.03.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 03:17:58 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Subject: [PATCH] spapr_pci: fix leak in spapr_phb_vfio_get_loc_code
Date: Mon,  5 Sep 2022 12:17:57 +0200
Message-Id: <20220905101757.19885-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 05 Sep 2022 10:18:14 -0000

Overwriting "path" in the second call to g_strdup_printf() causes a memory leak,
even if the variable itself is g_autofree.

Reported by Coverity as CID 1460454.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/ppc/spapr_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index 67e9d468aa..57c8a4f085 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -800,6 +800,7 @@ static char *spapr_phb_vfio_get_loc_code(SpaprPhbState *sphb,  PCIDevice *pdev)
     }
 
     /* Construct and read from host device tree the loc-code */
+    g_free(path);
     path = g_strdup_printf("/proc/device-tree%s/ibm,loc-code", devspec);
     if (!g_file_get_contents(path, &buf, NULL, NULL)) {
         return NULL;
-- 
2.37.2


