Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1opUAi-00059R-On
	for mharc-qemu-trivial@gnu.org; Mon, 31 Oct 2022 08:45:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1opUAe-000575-6K
 for qemu-trivial@nongnu.org; Mon, 31 Oct 2022 08:45:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1opUAZ-0000MM-LE
 for qemu-trivial@nongnu.org; Mon, 31 Oct 2022 08:45:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pNEvmp/MpPQEzwuZZfpW//1pD/b/AvCVb8pAP7d5gsY=;
 b=XD1CyLUhOU8acM/h4r+jutYVU/Ek1sKRxxHSEB4ovcazjj+7kmabrRdxfg9bF338XooDJr
 nfY6brQqNM3b+8ebacw/BOnBxHA5yfL2ihiIS5m5LY0tQ6JAQziG80ZlouNFYbKqOKTegA
 0hfnKmQptD3uuPBtew+KgPePdWZFf+k=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-368-hNU3fAZEM8yL_lcGWN5cmA-1; Mon, 31 Oct 2022 08:45:33 -0400
X-MC-Unique: hNU3fAZEM8yL_lcGWN5cmA-1
Received: by mail-qv1-f69.google.com with SMTP id
 mi12-20020a056214558c00b004bb63393567so5788361qvb.21
 for <qemu-trivial@nongnu.org>; Mon, 31 Oct 2022 05:45:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eNtHxNST1Po8AXy71Jho73yLP1vkXkXP59/9JthCYiM=;
 b=J8aD5MFjLzaR6HECPP9E1a1B9+B5rARcNkTvcqsMDS9FkeU5pWPBmNy1KW8Lrzs+QZ
 v8eGRrijxr78L712q9jOlL9PRYkc+gbgZ91R69GIXczXyPcVZ2CAe6pLkSAm5ltonu9i
 LqTo4+kS9KtkY2aQHmegURBV1P8foF2wpL0eee74ha2aHSEjIR0TEQBfBcN+Fe2rqfD+
 SBb/vo9tIbU7rdbMqMtg3wARd7n8JYzaZXHzmQZfh5P4CO8mq+cndl5gRjcavEUWKFzE
 hsnlQw0L1WDQIcNJsdhclaS5No/KVGOIekmbI4TvWwjGqxkE9LiJ5rm/F1W9UA8yuLdp
 k1Zg==
X-Gm-Message-State: ACrzQf3XHoaXHkpRyH2TYSyTfYEAcjR1yObN/OMFGm8jqhgifwQPoyq1
 gsiHKoFjR3Dw+0d6iqxtg1Rqdu3OCPQ3MJNpLGf46pyIK0DcEeMyTM1nNzlpzjVaS6Zgp37l0sa
 7db5FSgWKJaint+LwHQ==
X-Received: by 2002:a05:620a:1319:b0:6fa:134e:1187 with SMTP id
 o25-20020a05620a131900b006fa134e1187mr8389468qkj.115.1667220333169; 
 Mon, 31 Oct 2022 05:45:33 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7acn54oOQw+fQpmonUWw6s1lufD6PdcnJIiUqKMPxuGa4UlExPyfFyLIgcVydQTqAoS9v2fQ==
X-Received: by 2002:a05:620a:1319:b0:6fa:134e:1187 with SMTP id
 o25-20020a05620a131900b006fa134e1187mr8389455qkj.115.1667220332964; 
 Mon, 31 Oct 2022 05:45:32 -0700 (PDT)
Received: from fedora (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 d2-20020ac81182000000b00397b1c60780sm3524113qtj.61.2022.10.31.05.45.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:45:32 -0700 (PDT)
Date: Mon, 31 Oct 2022 13:45:29 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Eduardo Habkost
 <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <ani@anisinha.ca>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philmd@linaro.org>
Subject: Re: [PATCH v2 2/3] hw/i386/acpi-build: Resolve redundant attribute
Message-ID: <20221031134529.5f7250ce@fedora>
In-Reply-To: <20221028103419.93398-3-shentey@gmail.com>
References: <20221028103419.93398-1-shentey@gmail.com>
 <20221028103419.93398-3-shentey@gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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
X-List-Received-Date: Mon, 31 Oct 2022 12:45:41 -0000

On Fri, 28 Oct 2022 12:34:18 +0200
Bernhard Beschow <shentey@gmail.com> wrote:

> The is_piix4 attribute is set once in one location and read once in
> another. Doing both in one location allows for removing the attribute
> altogether.

we also test for piix4 in acpi_get_pm_info(),
Perhaps we should move is_piix4 to AcpiPmInfo
and reuse it in build_dsdt()?

Also should use is_piix4 as argument to build_iqcr_method()
to make its call places self documenting. But that's another patch.

> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Message-Id: <20221026133110.91828-3-shentey@gmail.com>
> ---
>  hw/i386/acpi-build.c | 20 ++++++--------------
>  1 file changed, 6 insertions(+), 14 deletions(-)
>=20
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 1ebf14b899..73d8a59737 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -112,7 +112,6 @@ typedef struct AcpiPmInfo {
>  } AcpiPmInfo;
> =20
>  typedef struct AcpiMiscInfo {
> -    bool is_piix4;
>      bool has_hpet;
>  #ifdef CONFIG_TPM
>      TPMVersion tpm_version;
> @@ -281,17 +280,6 @@ static void acpi_get_pm_info(MachineState *machine, =
AcpiPmInfo *pm)
> =20
>  static void acpi_get_misc_info(AcpiMiscInfo *info)
>  {
> -    Object *piix =3D object_resolve_type_unambiguous(TYPE_PIIX4_PM);
> -    Object *lpc =3D object_resolve_type_unambiguous(TYPE_ICH9_LPC_DEVICE=
);
> -    assert(!!piix !=3D !!lpc);
> -
> -    if (piix) {
> -        info->is_piix4 =3D true;
> -    }
> -    if (lpc) {
> -        info->is_piix4 =3D false;
> -    }

ack for this hunk

>      info->has_hpet =3D hpet_find();
>  #ifdef CONFIG_TPM
>      info->tpm_version =3D tpm_get_version(tpm_find());
> @@ -1334,6 +1322,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>             AcpiPmInfo *pm, AcpiMiscInfo *misc,
>             Range *pci_hole, Range *pci_hole64, MachineState *machine)
>  {
> +    Object *piix =3D object_resolve_type_unambiguous(TYPE_PIIX4_PM);
> +    Object *lpc =3D object_resolve_type_unambiguous(TYPE_ICH9_LPC_DEVICE=
);
>      CrsRangeEntry *entry;
>      Aml *dsdt, *sb_scope, *scope, *dev, *method, *field, *pkg, *crs;
>      CrsRangeSet crs_range_set;
> @@ -1354,11 +1344,13 @@ build_dsdt(GArray *table_data, BIOSLinker *linker=
,
>      AcpiTable table =3D { .sig =3D "DSDT", .rev =3D 1, .oem_id =3D x86ms=
->oem_id,
>                          .oem_table_id =3D x86ms->oem_table_id };
> =20
> +    assert(!!piix !=3D !!lpc);
> +
>      acpi_table_begin(&table, table_data);
>      dsdt =3D init_aml_allocator();
> =20
>      build_dbg_aml(dsdt);
> -    if (misc->is_piix4) {
> +    if (piix) {
>          sb_scope =3D aml_scope("_SB");
>          dev =3D aml_device("PCI0");
>          aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
> @@ -1371,7 +1363,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>              build_x86_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
>          }
>          build_piix4_pci0_int(dsdt);
> -    } else {
> +    } else if (lpc) {
>          sb_scope =3D aml_scope("_SB");
>          dev =3D aml_device("PCI0");
>          aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));


