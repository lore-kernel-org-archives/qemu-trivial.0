Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sF0BN-0007t8-J5
	for mharc-qemu-trivial@gnu.org; Wed, 05 Jun 2024 19:36:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1sF0BL-0007ig-Mt
 for qemu-trivial@nongnu.org; Wed, 05 Jun 2024 19:36:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1sF0BJ-0005t4-6w
 for qemu-trivial@nongnu.org; Wed, 05 Jun 2024 19:36:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717630596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VYKkp6fHZoal2oiYNWaG4icBm491Zje1r86kUs5B3ls=;
 b=RAT/OFEIKlUkR7JuK/SRVFrGemLRXvpK54uLT61+6vXSsEKQxFtG242s9OJgZB9JjPiQvM
 HIqH1XtP8U7r492nRQNOJ6aDWGuENqmdq+fLU0BLpvSmw93Da85OUPapE/uWroHg6cgASc
 A1cwlgoBk/pECAgMyuWFYZRYT/KRfgw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-308-5eRZynM8OvyZjZ6k7vDnvA-1; Wed, 05 Jun 2024 19:36:35 -0400
X-MC-Unique: 5eRZynM8OvyZjZ6k7vDnvA-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-57a7946685aso128864a12.2
 for <qemu-trivial@nongnu.org>; Wed, 05 Jun 2024 16:36:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717630594; x=1718235394;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VYKkp6fHZoal2oiYNWaG4icBm491Zje1r86kUs5B3ls=;
 b=GpKFH6/MUR53nufZHHkv9kVqwyddZVxqd5RqPo5FYnNzRJhHLXMoSUBOTayP5kDGqA
 wdntoONv2ljbHR4zLn2/C8IhG349W/4nv5gpkaL2giFGoARC3JzPr/6q6Ab9kgyJvnZI
 FoC07nYfF74wWqEmJZIzjqU61popqMnNRQX42d8FisEtnI+iU5F86XIDX7DvEKWqpRZh
 69h1BU/RbNTzTkRCwRd3BsuRuAhnrLRNxBOTxXrK6si00KgrOO7DtRhHbkZ1uKFkxvxL
 5B61hPoLSNDv5w4Q0upwaqL+2lP/d0Rquvp2e2Nlp+D4Uad8AMDVLEHhuoV0KMisEsMe
 uPkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkuNLe5YVMapPE8fX0bsyHWTkXnvcFJKVksZ2MpVcvdogabAX3RX7cZAQ7gF42+jd41xgwis1ZaO4C6NW60+dtMu1WNMUpmg==
X-Gm-Message-State: AOJu0YwcxYLI3oKp1mcVXJwuUVElQboNk9pBbPLvhdy2DFo4YwFmwYjT
 topVe9ygN6E89QvHN6l4K8jx4wjkiaE/oSspr0pB/ucu1JszGEQbbEbf5+L/knXlrXHC0LXBF3N
 hbPoqxI13NEz6pG+BwIzVp+ybdTaw9BBEwU7UD5tWvydziH1q+WO5wno=
X-Received: by 2002:a50:f69d:0:b0:57a:79c2:e9d7 with SMTP id
 4fb4d7f45d1cf-57a8b7c6141mr2531858a12.27.1717630594174; 
 Wed, 05 Jun 2024 16:36:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqDL5XbCU5fqlEGdBT3VAnL6174hRz+Kbaud0YHpoylqwlOVNg+ayQGc3yGA8kSZ3smxm1cQ==
X-Received: by 2002:a50:f69d:0:b0:57a:79c2:e9d7 with SMTP id
 4fb4d7f45d1cf-57a8b7c6141mr2531849a12.27.1717630593817; 
 Wed, 05 Jun 2024 16:36:33 -0700 (PDT)
Received: from redhat.com ([2.55.56.67]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57aae11a98csm98999a12.48.2024.06.05.16.36.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 16:36:33 -0700 (PDT)
Date: Wed, 5 Jun 2024 19:36:30 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Ankit Agrawal <ankita@nvidia.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org
Subject: [PULL v3 30/41] hw/acpi/GI: Fix trivial parameter alignment issue.
Message-ID: <a8ff9b58450fb1df51302a5d698041aca6adcaaf.1717630437.git.mst@redhat.com>
References: <cover.1717630437.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1717630437.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
X-List-Received-Date: Wed, 05 Jun 2024 23:36:40 -0000

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Before making additional modification, tidy up this misleading indentation.

Reviewed-by: Ankit Agrawal <ankita@nvidia.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <20240524100507.32106-2-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/acpi_generic_initiator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/acpi/acpi_generic_initiator.c b/hw/acpi/acpi_generic_initiator.c
index 17b9a052f5..18a939b0e5 100644
--- a/hw/acpi/acpi_generic_initiator.c
+++ b/hw/acpi/acpi_generic_initiator.c
@@ -132,7 +132,7 @@ static int build_all_acpi_generic_initiators(Object *obj, void *opaque)
 
     dev_handle.segment = 0;
     dev_handle.bdf = PCI_BUILD_BDF(pci_bus_num(pci_get_bus(pci_dev)),
-                                               pci_dev->devfn);
+                                   pci_dev->devfn);
 
     build_srat_generic_pci_initiator_affinity(table_data,
                                               gi->node, &dev_handle);
-- 
MST


