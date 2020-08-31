Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kChKp-00034W-AY
	for mharc-qemu-trivial@gnu.org; Mon, 31 Aug 2020 06:46:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kChKn-00033i-Di
 for qemu-trivial@nongnu.org; Mon, 31 Aug 2020 06:46:45 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40739
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kChKk-0006D2-Ct
 for qemu-trivial@nongnu.org; Mon, 31 Aug 2020 06:46:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598870799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WggWi+voPbZe+Rd1hOnadW9OVt+clz+6b359Lf5wcUA=;
 b=DD2GlYQNxDSyclvbBKmX3Ty6niPySJx5HqlQYsvfM654FHJDjU727fB4UeTnwmezR1dJim
 aMI1KNPLvraaveCuVPFA+8NR329isn4xmRa3lNNrGtIjFpCop3W3D4nDL3o+2rdGne3Mvn
 AnsBYwaGidS4KhLHDvljY4rSFYtKW7Y=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-aUQ3gjsLPMuOoUnddIP9bw-1; Mon, 31 Aug 2020 06:46:38 -0400
X-MC-Unique: aUQ3gjsLPMuOoUnddIP9bw-1
Received: by mail-wr1-f70.google.com with SMTP id m7so3051827wrb.20
 for <qemu-trivial@nongnu.org>; Mon, 31 Aug 2020 03:46:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WggWi+voPbZe+Rd1hOnadW9OVt+clz+6b359Lf5wcUA=;
 b=E8GPsh3NwUtpJwb4hDfW7RDkY7xfLghF0C989r+KOm2Ey7vAizXi615ucXorBc/Nop
 SZMQ0OxSo+cFMrWJ2fAqrducKfuVBdQLrsLCmlhqtW4q2Vvh0TGBE/NU8bXTq5tzWgHS
 y3z0vbnVbvbvkebipgMkfyCHoRwvp3HWD7Fjj7/8+3tMyZzbrRQFNFee6wSqWtzjqRdO
 KpZQE7lN1b/8QOMj4/IsvqixvhrHNSMT4nbrjlYzFQ6LrSL9HMBEYpOeNqVcNsg1SgFJ
 b3b1rDd+m0KLgSJxLAA9+DR8ve6V97L47bsQ0QPIZ1mDUHm5MAhmOAaib7RNjaqD4ANK
 xhfQ==
X-Gm-Message-State: AOAM532g19s4Cx5JFvk7/rF1KVj9m47h5MBmk6mc/2gUTc40mzNKmux1
 kKr5gZMi+f2u6wqtHeVbCtKWCHwPAECBtHLhKAR3J7ybUdsNbdBzZjFC6FeCt6JRkow/nm3hE9v
 17LDkutm8z1gkAPgR1A==
X-Received: by 2002:adf:a1d6:: with SMTP id v22mr1095688wrv.185.1598870797158; 
 Mon, 31 Aug 2020 03:46:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzD7C4exS0K84INqFc8PwVw9sMNfyOD7vCLFEBFJ+J1ZPIdUTrB2jMZZvhQybSG4EIprKSfaw==
X-Received: by 2002:adf:a1d6:: with SMTP id v22mr1095658wrv.185.1598870796956; 
 Mon, 31 Aug 2020 03:46:36 -0700 (PDT)
Received: from redhat.com (bzq-109-66-64-75.red.bezeqint.net. [109.66.64.75])
 by smtp.gmail.com with ESMTPSA id
 q8sm11607586wrx.79.2020.08.31.03.46.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 03:46:36 -0700 (PDT)
Date: Mon, 31 Aug 2020 06:46:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Chen Qun <kuhn.chenqun@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, pannengyuan@huawei.com,
 zhang.zhanghailiang@huawei.com, Euler Robot <euler.robot@huawei.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH 01/11] hw/arm/virt-acpi-build:Remove dead assignment in
 build_madt()
Message-ID: <20200831064614-mutt-send-email-mst@kernel.org>
References: <20200813073712.4001404-1-kuhn.chenqun@huawei.com>
 <20200813073712.4001404-2-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200813073712.4001404-2-kuhn.chenqun@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=mst@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/31 02:54:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 31 Aug 2020 10:46:45 -0000

On Thu, Aug 13, 2020 at 03:37:02PM +0800, Chen Qun wrote:
> Clang static code analyzer show warning:
> hw/arm/virt-acpi-build.c:641:5: warning: Value stored to 'madt' is never read
>     madt = acpi_data_push(table_data, sizeof *madt);
>     ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

feel free to merge through the trivial tree.

> ---
> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: qemu-arm@nongnu.org
> ---
>  hw/arm/virt-acpi-build.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 91f0df7b13..f830f9b779 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -633,12 +633,11 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      int madt_start = table_data->len;
>      const MemMapEntry *memmap = vms->memmap;
>      const int *irqmap = vms->irqmap;
> -    AcpiMultipleApicTable *madt;
>      AcpiMadtGenericDistributor *gicd;
>      AcpiMadtGenericMsiFrame *gic_msi;
>      int i;
>  
> -    madt = acpi_data_push(table_data, sizeof *madt);
> +    acpi_data_push(table_data, sizeof(AcpiMultipleApicTable));
>  
>      gicd = acpi_data_push(table_data, sizeof *gicd);
>      gicd->type = ACPI_APIC_GENERIC_DISTRIBUTOR;
> -- 
> 2.23.0


