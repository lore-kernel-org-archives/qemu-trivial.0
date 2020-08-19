Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k8Lvb-0001ZK-Q0
	for mharc-qemu-trivial@gnu.org; Wed, 19 Aug 2020 07:06:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1k8Lva-0001Xn-Eb
 for qemu-trivial@nongnu.org; Wed, 19 Aug 2020 07:06:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1k8LvX-0006aW-Ll
 for qemu-trivial@nongnu.org; Wed, 19 Aug 2020 07:06:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597835202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=awSgDr+zzbPKf8mSaJKIeRgyTzSxIEzRCTWBG0eezQk=;
 b=ff4BKk+h2H4hZ+HW/sHDXSqBNSKvw5VYmZN4zydoR/sHLrNmX6JSIYqfwKVEAZt8FacFRp
 WofiZ4yD7vSaNWvWLzLMissAoL4S3vhXYS5bqyvG6VJuMhwInnORaC/vYFBOBfPvaVKxP0
 zkHswiOa+WWZdttaWARRl4ZDHpOw/Aw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-GVdjY_SnPPOzUY5tzpXC0w-1; Wed, 19 Aug 2020 07:06:38 -0400
X-MC-Unique: GVdjY_SnPPOzUY5tzpXC0w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BD0881F02B;
 Wed, 19 Aug 2020 11:06:37 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 80EDB7BE8F;
 Wed, 19 Aug 2020 11:06:30 +0000 (UTC)
Date: Wed, 19 Aug 2020 13:06:28 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Chen Qun <kuhn.chenqun@huawei.com>
Cc: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>, zhang.zhanghailiang@huawei.com, "Michael S.
 Tsirkin" <mst@redhat.com>, pannengyuan@huawei.com, Shannon Zhao
 <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org, Euler Robot
 <euler.robot@huawei.com>
Subject: Re: [PATCH 01/11] hw/arm/virt-acpi-build:Remove dead assignment in
 build_madt()
Message-ID: <20200819130628.2c2018db@redhat.com>
In-Reply-To: <20200813073712.4001404-2-kuhn.chenqun@huawei.com>
References: <20200813073712.4001404-1-kuhn.chenqun@huawei.com>
 <20200813073712.4001404-2-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 06:57:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 19 Aug 2020 11:06:46 -0000

On Thu, 13 Aug 2020 15:37:02 +0800
Chen Qun <kuhn.chenqun@huawei.com> wrote:

> Clang static code analyzer show warning:
> hw/arm/virt-acpi-build.c:641:5: warning: Value stored to 'madt' is never read
>     madt = acpi_data_push(table_data, sizeof *madt);
>     ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
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


