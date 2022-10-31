Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1opLvL-0008IP-7b
	for mharc-qemu-trivial@gnu.org; Sun, 30 Oct 2022 23:57:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1opLvJ-0008I2-MG
 for qemu-trivial@nongnu.org; Sun, 30 Oct 2022 23:57:17 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1opLvG-0006KE-5t
 for qemu-trivial@nongnu.org; Sun, 30 Oct 2022 23:57:17 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 t10-20020a17090a4e4a00b0020af4bcae10so9250808pjl.3
 for <qemu-trivial@nongnu.org>; Sun, 30 Oct 2022 20:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=+BLMDcCIepSKfMj16IgCtlTZD4thqaR3parT4AoU37o=;
 b=gd0f8ooo+DtRe3Z4MBiRfDXMfMyduYbXK5gtbTvfDZ3dl9LG6vdCt+9KcA4xa/IfPM
 1OsoNVi+XXavnV6ac41SO1niqrqDNQxBl9pRBfzdi3RyGNi08dTkXrXpDUPRoQbfwJLz
 4W3lT36JDiP7jp1q2bHk65ellr/6Frd5KAWuZ+ZiwH5zuF7sLcwlmhAksGU8Cb4ZiGY0
 bdFa12zmpZqpgXIpr4sKTjHWlOCg14xW884E2zCByMaCyZbs9g/NMYSt0ivyoGjkxdeP
 Tb7upxNGFggMNIAqDcr535OrHp/KcMW3fh0PzknHKqyPda9YguKJpvCcVhTVXFLftkHP
 R67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+BLMDcCIepSKfMj16IgCtlTZD4thqaR3parT4AoU37o=;
 b=6gj+UccrW0DWRvrdKqclsZfKRlIUuD1wCwBdhg6YwAOZqfCWliJpErd2ltu2M2bLWk
 WGwzKr1xBNJNDjR5yZWOLrGKY0sfFZ75sgqO0UWfhmzZRHV7t0jNWhMpENFCHosi+YgP
 C+DDIFiRh1UQo+6/L7FEyeny9LZbsRrgcCpS2cp4xi1BA/4SiTWOeHSi0IQsAyTa8R18
 OvshyO2MKfM1dYEqsRhy/E8GtfJ50ko76ZPOFriZ0k4Xv6FgD8x6FF/cJBQm1toIcUhg
 C0RrNei1txs7+MVEDmip9G3xFuTQhc8hETkY9TDyKiEi7kUzj9Gg4ee1cSSIv82MVL9O
 YhhA==
X-Gm-Message-State: ACrzQf2moFYW645s4TZ9IUBfS+Uxpltg3yXj0RCbYUlsnH1vwJi0qQzG
 WgBLTwbtiOswt1BhjNykUIP6aQ==
X-Google-Smtp-Source: AMsMyM6PpXmRRiQcPyyMw5WPpP5+UwWtepB2mgCjpHZKRm5ZAF0BRYCbbi3fnRt1U/8I2KD3wrSr3A==
X-Received: by 2002:a17:90a:fe6:b0:212:bfc3:31f5 with SMTP id
 93-20020a17090a0fe600b00212bfc331f5mr30366085pjz.215.1667188631526; 
 Sun, 30 Oct 2022 20:57:11 -0700 (PDT)
Received: from ani-ubuntu ([156.146.57.109])
 by smtp.googlemail.com with ESMTPSA id
 q8-20020a170902dac800b00186b3528a06sm3399992plx.41.2022.10.30.20.57.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 20:57:11 -0700 (PDT)
Date: Mon, 31 Oct 2022 09:27:05 +0530 (IST)
From: Ani Sinha <ani@anisinha.ca>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Igor Mammedov <imammedo@redhat.com>, qemu-trivial@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Eduardo Habkost <eduardo@habkost.net>, 
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 3/3] hw/i386/acpi-build: Resolve north rather than
 south bridges
In-Reply-To: <20221028103419.93398-4-shentey@gmail.com>
Message-ID: <d4818273-e057-1eb4-2037-7b64aac4acec@anisinha.ca>
References: <20221028103419.93398-1-shentey@gmail.com>
 <20221028103419.93398-4-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::102e;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 31 Oct 2022 03:57:17 -0000



On Fri, 28 Oct 2022, Bernhard Beschow wrote:

> The code currently assumes Q35 iff ICH9 and i440fx iff PIIX. Now that more
> AML generation has been moved into the south bridges and since the
> machines define themselves primarily through their north bridges, let's
> switch to resolving the north bridges for AML generation instead. This
> also allows for easier experimentation with different south bridges in
> the "pc" machine, e.g. with PIIX4 and VT82xx.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Reviewed-by: Ani Sinha <ani@anisinha.ca>

> ---
>  hw/i386/acpi-build.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 73d8a59737..d9eaa5fc4d 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -60,6 +60,7 @@
>  #include "hw/i386/fw_cfg.h"
>  #include "hw/i386/ich9.h"
>  #include "hw/pci/pci_bus.h"
> +#include "hw/pci-host/i440fx.h"
>  #include "hw/pci-host/q35.h"
>  #include "hw/i386/x86-iommu.h"
>
> @@ -1322,8 +1323,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>             AcpiPmInfo *pm, AcpiMiscInfo *misc,
>             Range *pci_hole, Range *pci_hole64, MachineState *machine)
>  {
> -    Object *piix = object_resolve_type_unambiguous(TYPE_PIIX4_PM);
> -    Object *lpc = object_resolve_type_unambiguous(TYPE_ICH9_LPC_DEVICE);
> +    Object *i440fx = object_resolve_type_unambiguous(TYPE_I440FX_PCI_HOST_BRIDGE);
> +    Object *q35 = object_resolve_type_unambiguous(TYPE_Q35_HOST_DEVICE);
>      CrsRangeEntry *entry;
>      Aml *dsdt, *sb_scope, *scope, *dev, *method, *field, *pkg, *crs;
>      CrsRangeSet crs_range_set;
> @@ -1344,13 +1345,13 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>      AcpiTable table = { .sig = "DSDT", .rev = 1, .oem_id = x86ms->oem_id,
>                          .oem_table_id = x86ms->oem_table_id };
>
> -    assert(!!piix != !!lpc);
> +    assert(!!i440fx != !!q35);
>
>      acpi_table_begin(&table, table_data);
>      dsdt = init_aml_allocator();
>
>      build_dbg_aml(dsdt);
> -    if (piix) {
> +    if (i440fx) {
>          sb_scope = aml_scope("_SB");
>          dev = aml_device("PCI0");
>          aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
> @@ -1363,7 +1364,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>              build_x86_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
>          }
>          build_piix4_pci0_int(dsdt);
> -    } else if (lpc) {
> +    } else if (q35) {
>          sb_scope = aml_scope("_SB");
>          dev = aml_device("PCI0");
>          aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
> --
> 2.38.1
>
>

