Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1t84Gn-0003M9-Fd
	for mharc-qemu-trivial@gnu.org; Mon, 04 Nov 2024 16:05:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1t84Gk-0003L1-Ey
 for qemu-trivial@nongnu.org; Mon, 04 Nov 2024 16:05:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1t84Gi-0005GY-4W
 for qemu-trivial@nongnu.org; Mon, 04 Nov 2024 16:05:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1730754346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y1W8qMTzmc/wmoX2fFpOYJHtHzp6CM0hX7vN3XVw4RY=;
 b=GrTd087E0h+eekVR3k7ja8CS0tMy1Wij9hYADUoQdCoIQu1OfV//X5TnJx6o+G/pz0V0+F
 P/mBnaN7oeDlgaB/JMEGQxY3NoJt+kbej+SexyYrIgAbqWJmX19vA3SvTG7L9FeF++Bl/g
 qTRsXigx5oPVci4P6Te+pk/PaPOrvPQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-ZIOAhdrMO42OkjoEGDb3aQ-1; Mon, 04 Nov 2024 16:05:45 -0500
X-MC-Unique: ZIOAhdrMO42OkjoEGDb3aQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-5c95b050667so4705437a12.2
 for <qemu-trivial@nongnu.org>; Mon, 04 Nov 2024 13:05:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730754344; x=1731359144;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y1W8qMTzmc/wmoX2fFpOYJHtHzp6CM0hX7vN3XVw4RY=;
 b=ZEkyhMeE4rJ01pBZr3aQMnnuqkDbn7DGC3nNdbbXbXYYVV6hkO87TMNMbHL9MDmQOJ
 +H+Bt7/izbe+u5dnMyJQVbAP2wfEyJP96JQz7y97dms7taAddBAyH14paHVpDgndEa9c
 AzRT2YXp4IzfuF4Mdu7CC6y1TTRAlmwicgypC/wvzN1fugUqj+RUoQQfPrnEst1HTfM3
 mYUz4lgdinOAGlZ9HNtg0DEbD0z92KNiI+bfR9kYHNPaZL6cOMRTyJ8Z0wcejPumjiER
 OlaMSoLdjqLXY4vddbVSGwBikxXZbB8bMVgRoR9UZI5o2pThXuJMfJ0VUARWE6qoYMlx
 65Fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrZeCgliqmDSxtl5covssKAacX0BMXF9JzJvzELc+mrX3CENWzfUF0ohWRF9Ujn/Fh+dyQeyUAxSmxpMc=@nongnu.org
X-Gm-Message-State: AOJu0YzR6fgAVTl9TaQB4LSn88ou2r9TJuwdxdTW7lAcb5W2GAH4OZtU
 rV7Ja4YQvg5oypNnS2zlMdeHTUArLer6Ej2JaSqioHKPl6D6TSvuESIteevf4VmHAbI0tAmBw9v
 LIFs6I9NZntIEtuUmkwleYYQ8LteYewoatg1FlHSxLftBypELxLz0GO8=
X-Received: by 2002:a05:6402:34d1:b0:5c9:6ae4:332e with SMTP id
 4fb4d7f45d1cf-5cea967a284mr14175961a12.8.1730754344156; 
 Mon, 04 Nov 2024 13:05:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEimZNn07o87EOuLe5muomRglOfncRjDqVqInm7Zg0iTEpVIJLheUmlDyDhrLLR0D5buExIzA==
X-Received: by 2002:a05:6402:34d1:b0:5c9:6ae4:332e with SMTP id
 4fb4d7f45d1cf-5cea967a284mr14175903a12.8.1730754342188; 
 Mon, 04 Nov 2024 13:05:42 -0800 (PST)
Received: from redhat.com ([2.52.14.134]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cee6b0fac0sm293771a12.79.2024.11.04.13.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2024 13:05:41 -0800 (PST)
Date: Mon, 4 Nov 2024 16:05:37 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Ankit Agrawal <ankita@nvidia.com>, Igor Mammedov <imammedo@redhat.com>,
 "Huang, Ying" <ying.huang@intel.com>,
 Ani Sinha <anisinha@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org
Subject: [PULL 04/65] hw/acpi/GI: Fix trivial parameter alignment issue.
Message-ID: <dc55a90e295e05b6246b0b152a854612467e417f.1730754238.git.mst@redhat.com>
References: <cover.1730754238.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1730754238.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.34,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 04 Nov 2024 21:05:50 -0000

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Before making additional modification, tidy up this misleading indentation.

Reviewed-by: Ankit Agrawal <ankita@nvidia.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Tested-by: "Huang, Ying" <ying.huang@intel.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <20240916171017.1841767-3-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/acpi_generic_initiator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/acpi/acpi_generic_initiator.c b/hw/acpi/acpi_generic_initiator.c
index 3d2b567999..4a02c19468 100644
--- a/hw/acpi/acpi_generic_initiator.c
+++ b/hw/acpi/acpi_generic_initiator.c
@@ -133,7 +133,7 @@ static int build_all_acpi_generic_initiators(Object *obj, void *opaque)
 
     dev_handle.segment = 0;
     dev_handle.bdf = PCI_BUILD_BDF(pci_bus_num(pci_get_bus(pci_dev)),
-                                               pci_dev->devfn);
+                                   pci_dev->devfn);
 
     build_srat_generic_pci_initiator_affinity(table_data,
                                               gi->node, &dev_handle);
-- 
MST


