Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sEZVp-0004QW-8M
	for mharc-qemu-trivial@gnu.org; Tue, 04 Jun 2024 15:08:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1sEZVn-00044S-Ba
 for qemu-trivial@nongnu.org; Tue, 04 Jun 2024 15:07:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1sEZVl-0000yR-Ed
 for qemu-trivial@nongnu.org; Tue, 04 Jun 2024 15:07:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717528076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VYKkp6fHZoal2oiYNWaG4icBm491Zje1r86kUs5B3ls=;
 b=OZwsTCuNXg5b613I+ciJOPNr5Gn7CTCzrDu5mKU0WumZwHKQiAjWrvnL3FSL9lqcvOSkKy
 vHYjIpY9LtJs4pyXnHHCodVbkEX4tL8Ss9TTEPtXf6dr3/2no48I4YUYN2BekjM/07jP61
 KPb5DAYDsKuZlJOTcLCVPW3lgqaHLX8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-478-tZKp7RBvOQKER34yqde77A-1; Tue, 04 Jun 2024 15:07:53 -0400
X-MC-Unique: tZKp7RBvOQKER34yqde77A-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4213530af1aso22857245e9.2
 for <qemu-trivial@nongnu.org>; Tue, 04 Jun 2024 12:07:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717528072; x=1718132872;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VYKkp6fHZoal2oiYNWaG4icBm491Zje1r86kUs5B3ls=;
 b=MeRUYpWMzx5OoZNpg7+nSw7YXNVjKf11AobZF3vc9Rub5E3Sd6RfEPFmdBuCoCbEEE
 9zwt52F8J8sj/nIn7zmjiFVN2XE66oVWlIQdpcca/+PbcebLN8M9FZnTZNLY2phgEBr5
 tREO8oCICUo0pY5cFidR5YjmXpx9rdj1gbxbh6Nj8r3AFj9KM6yMhyfEXqWmtUlmpv//
 NZCeFdNwu4xnwqfuKaNcIRt2Eann5b2aTKvUzoheJkQSkrK3ST4Fu9axzgfbQsG2YR7U
 H+gGjEGDAvPaqedP/TbDbeZJGCJtqH6v6IUJ03JpaiDMPm2NVmhekxWy7+vsGhrm3xXj
 cCTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2+fqt3JfvcqsILZAYiTkiH8hAHYPm0EZ9dpB2Htbf/0ihdTP2WPAkGWpY5AmmHZqql6ejo2LfJGJM4nV+n8j5AuB7aBc64A==
X-Gm-Message-State: AOJu0Yy9d1S8iIJFyzPe8x6YhfwQRkbr6rvYdXokBtxgcL0QWol0auHI
 KVYCcnxtpAdGECE5M2CDkMjml3psUSkVk8e29/NsmBjNf1eL9euk3VR9m8oXUOD8aIcvE6nXcLa
 Q4548GPTDpR9b+oQM6I2UhcCF5fg7/GKG24n6zAmcbRSzbD/yYr3hSX4=
X-Received: by 2002:a05:600c:1da3:b0:419:f9ae:e50 with SMTP id
 5b1f17b1804b1-4215634dba3mr3428725e9.37.1717528072125; 
 Tue, 04 Jun 2024 12:07:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtmf1otv2cfBpSc0kN/2tPZPOjIDE3hj4mgg2t9VZw5P52wHDeIYV7CndRteKV44ug4AObAg==
X-Received: by 2002:a05:600c:1da3:b0:419:f9ae:e50 with SMTP id
 5b1f17b1804b1-4215634dba3mr3428565e9.37.1717528071749; 
 Tue, 04 Jun 2024 12:07:51 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:552:cf5c:2b13:215c:b9df:f231])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ed8b574e3sm52528f8f.79.2024.06.04.12.07.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 12:07:51 -0700 (PDT)
Date: Tue, 4 Jun 2024 15:07:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Ankit Agrawal <ankita@nvidia.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org
Subject: [PULL 31/46] hw/acpi/GI: Fix trivial parameter alignment issue.
Message-ID: <481a30a72769a5086a0596fb6ebe19d16d2bac77.1717527933.git.mst@redhat.com>
References: <cover.1717527933.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1717527933.git.mst@redhat.com>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 04 Jun 2024 19:07:59 -0000

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


