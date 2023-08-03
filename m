Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qRghT-0004TA-5O
	for mharc-qemu-trivial@gnu.org; Thu, 03 Aug 2023 18:21:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1qRghR-0004Se-3q
 for qemu-trivial@nongnu.org; Thu, 03 Aug 2023 18:21:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1qRghP-0000XO-It
 for qemu-trivial@nongnu.org; Thu, 03 Aug 2023 18:21:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691101299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TVuqOt0marpKSqE9sEGY+DQ7kMdO14FEtpwntaCFVNY=;
 b=X4X1/FIcs7HoPVyVrG6joIffIpLabNHXVVConN03UdbigfgaZVYIbZbZuse1YcsgpIbuR/
 rv37N44mhJBXOix9WGLo55e6k1+YHSk3gn6zW6Dx4wUrGmALWE5Si+EnjirHSSPIzRx3HV
 RpspeS/bJamyGIq/vxGetF0M9+12TtA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-DxCS_yCoMZqjCrN3fVXY0g-1; Thu, 03 Aug 2023 18:21:38 -0400
X-MC-Unique: DxCS_yCoMZqjCrN3fVXY0g-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-99c20561244so92644766b.0
 for <qemu-trivial@nongnu.org>; Thu, 03 Aug 2023 15:21:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691101296; x=1691706096;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TVuqOt0marpKSqE9sEGY+DQ7kMdO14FEtpwntaCFVNY=;
 b=Tha9aNTK07u/qFTV9k/QXM5iYHwwfv3d/3GeW+2mfSo2P4ZqB60nCd6Jl5Z+2bjaH3
 rkbPYifyd7g/laonvwRNJMVt9+xpf9u631BZV4QECA7MmKuC5HkE2SlmNtHVis74PHuj
 kcd5tKTe62LZhuG7EMLiVPKUfbmkDE8aIB2ePut+wpMzQ4uzWQQZJG7tsnD76ihE5exC
 AlE+kTJMUVJGanx2nfMmoHw+zHbQt4dodb3KuKgFxNuwgV65siumPmJNwCPatZ8d3uup
 7q5Wb+RY7Aq1DC9CwmCSVAkrNEZ4pnwmfa2PXqsL9GcBk6Hezraewb7zb0OledKUzT+m
 lXKw==
X-Gm-Message-State: AOJu0YyhK60xRFCdhxiTv4DqOrtqpguDgJi56+lZQ9sdaBvnTIhzWT2B
 IqbnOBZOt6hsz/gH3104cxtYLk07lUV/dWIfb68dENSQpsE7fGI3Bby1pACtYjIiavA0yEOcvKt
 CR5A8qhHo5/4tfoJmxj9e6Km1QA==
X-Received: by 2002:a50:ee90:0:b0:522:203d:c9b1 with SMTP id
 f16-20020a50ee90000000b00522203dc9b1mr98591edr.11.1691101296431; 
 Thu, 03 Aug 2023 15:21:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGU74j3MbAzUnyPB9qtD7vu2ksShX3aXjezzp6G7rMTcVM03zf54oUtFU0PK8trs7WnvFP94Q==
X-Received: by 2002:a50:ee90:0:b0:522:203d:c9b1 with SMTP id
 f16-20020a50ee90000000b00522203dc9b1mr98575edr.11.1691101296216; 
 Thu, 03 Aug 2023 15:21:36 -0700 (PDT)
Received: from redhat.com ([2.52.12.104]) by smtp.gmail.com with ESMTPSA id
 m13-20020aa7c2cd000000b0051df54c6a27sm355860edp.56.2023.08.03.15.21.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 15:21:35 -0700 (PDT)
Date: Thu, 3 Aug 2023 18:21:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org
Subject: [PULL 15/22] hw/i386/intel_iommu: Fix trivial endianness problems
Message-ID: <cc2a08480e19007c05be8fe5b6893e20448954dc.1691101215.git.mst@redhat.com>
References: <cover.1691101215.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1691101215.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Thu, 03 Aug 2023 22:21:41 -0000

From: Thomas Huth <thuth@redhat.com>

After reading the guest memory with dma_memory_read(), we have
to make sure that we byteswap the little endian data to the host's
byte order.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230802135723.178083-2-thuth@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Xu <peterx@redhat.com>
---
 hw/i386/intel_iommu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index dcc334060c..13fcde8e91 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -756,6 +756,8 @@ static int vtd_get_pdire_from_pdir_table(dma_addr_t pasid_dir_base,
         return -VTD_FR_PASID_TABLE_INV;
     }
 
+    pdire->val = le64_to_cpu(pdire->val);
+
     return 0;
 }
 
@@ -780,6 +782,9 @@ static int vtd_get_pe_in_pasid_leaf_table(IntelIOMMUState *s,
                         pe, entry_size, MEMTXATTRS_UNSPECIFIED)) {
         return -VTD_FR_PASID_TABLE_INV;
     }
+    for (size_t i = 0; i < ARRAY_SIZE(pe->val); i++) {
+        pe->val[i] = le64_to_cpu(pe->val[i]);
+    }
 
     /* Do translation type check */
     if (!vtd_pe_type_check(x86_iommu, pe)) {
-- 
MST


