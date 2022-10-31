Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1opUHV-0004zB-MI
	for mharc-qemu-trivial@gnu.org; Mon, 31 Oct 2022 08:52:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1opUHS-0004Ws-4H
 for qemu-trivial@nongnu.org; Mon, 31 Oct 2022 08:52:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1opUHP-0002oE-10
 for qemu-trivial@nongnu.org; Mon, 31 Oct 2022 08:52:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9D/I++u1aic6WS/dHHfJSVcu58NrP1m9K35CCl7L8oY=;
 b=LR+dDoKtBq+IgYh2s+eBYZCT+G2UsVErD6TzVibgBVlg5xS8ncknsuVg83AjpBuMe+YxFP
 QX/h88pT3YEU0bjoYQ+Lq6nmra64b9S/GCq/QthPG4Ssr35ygwza/EmQPexukCBiHuk/Dj
 n7s/2DRnmbZRlpRHI0xlVCy9YX5Ooo8=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-605-bht4yiW-ONC15o9qY0GKSA-1; Mon, 31 Oct 2022 08:52:37 -0400
X-MC-Unique: bht4yiW-ONC15o9qY0GKSA-1
Received: by mail-qk1-f200.google.com with SMTP id
 i17-20020a05620a249100b006fa2e10a2ecso1981676qkn.16
 for <qemu-trivial@nongnu.org>; Mon, 31 Oct 2022 05:52:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9D/I++u1aic6WS/dHHfJSVcu58NrP1m9K35CCl7L8oY=;
 b=6D2jvtCpWF0W21s3xkNss0sWjr3UNJH7PeRLcZ+bq2pfOvaqmoMODHHpaLsWYN24r3
 HsjNqDKnnuLNtg0FSUpclTt+s7oEK7UvFcS2Qr3ma/dTWMZH3BbIOdac67LfGSoR8Y1B
 lxoZcV1b40Be38Rxw51ljDJWwNgXmK+q+LKmHczIiZQQJEHJGHQ5wO47daghnBO8qQPi
 urjKmD4TlwEzyplLNSu8w2b2t4tcW6P3QqBQbQB+vqs1cdz+wfpy/JIaKcQvJ2m2n3EH
 C08kRS1cGj+WBUITl6WTTD/vAnkZtqkqr2nKcfHA3WZ23QxTtuzWlclyxCjZ7JNugG0J
 l9KA==
X-Gm-Message-State: ACrzQf0varl+soZG6bBpoHf/+W7twC2euk8kljwc/xaQI29FjMdTZ4h8
 tyVevgES0/ZGB62KAr0ulLG23vfqxFGxdg5NHErU/yc1wy3Ax3khaaPChpoNgANq4730xNXgVeK
 q1IsV6GHmepGxXxESVQ==
X-Received: by 2002:a37:97c4:0:b0:6fa:3139:1825 with SMTP id
 z187-20020a3797c4000000b006fa31391825mr2165952qkd.341.1667220756675; 
 Mon, 31 Oct 2022 05:52:36 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Kp6ISfO1TeYuOpfO2+945iJe8t2Z/89DjhzNiRCW9U9UNcEWm9Ptv34FUE+KGhu0y2Kms9A==
X-Received: by 2002:a37:97c4:0:b0:6fa:3139:1825 with SMTP id
 z187-20020a3797c4000000b006fa31391825mr2165944qkd.341.1667220756460; 
 Mon, 31 Oct 2022 05:52:36 -0700 (PDT)
Received: from fedora (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 r15-20020ac8520f000000b003972790deb9sm3551881qtn.84.2022.10.31.05.52.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:52:35 -0700 (PDT)
Date: Mon, 31 Oct 2022 13:52:32 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Eduardo Habkost
 <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <ani@anisinha.ca>
Subject: Re: [PATCH v2 3/3] hw/i386/acpi-build: Resolve north rather than
 south bridges
Message-ID: <20221031135232.118ae0ea@fedora>
In-Reply-To: <20221028103419.93398-4-shentey@gmail.com>
References: <20221028103419.93398-1-shentey@gmail.com>
 <20221028103419.93398-4-shentey@gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 31 Oct 2022 12:52:42 -0000

On Fri, 28 Oct 2022 12:34:19 +0200
Bernhard Beschow <shentey@gmail.com> wrote:

> The code currently assumes Q35 iff ICH9 and i440fx iff PIIX. Now that more
> AML generation has been moved into the south bridges and since the
> machines define themselves primarily through their north bridges, let's
> switch to resolving the north bridges for AML generation instead. This
> also allows for easier experimentation with different south bridges in
> the "pc" machine, e.g. with PIIX4 and VT82xx.

Patch looks fine to me in a sense that either would work.

But the commit message lacks clear answer to 'why'
and what issues it resolves or would resolve/make
our easier life down to road.

> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
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


