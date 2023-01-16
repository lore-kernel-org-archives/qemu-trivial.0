Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pHSUM-0000OD-DL
	for mharc-qemu-trivial@gnu.org; Mon, 16 Jan 2023 11:37:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pHSUJ-0000NU-QD
 for qemu-trivial@nongnu.org; Mon, 16 Jan 2023 11:37:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pHSUG-0003KK-Ni
 for qemu-trivial@nongnu.org; Mon, 16 Jan 2023 11:37:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673887052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D5lv6nxqxKL4Uj2DyZf4N5d7X3X8IIDgtzlVJU8pf6Q=;
 b=Y6K/AE65lMxf74SYmmwUoBJqyNjW0FpnKZZ93K9iaivDiMarhCPM+vW6kPYve5rh4u+tLU
 XT575LTD0aak7VftrgK5io5NOTQLhx7YCpM+Dvq0/qOQS2XntEu1C143KQ+QIaf9e4Kp8a
 qP6gFcoy9lhP1EEKoZoX7jawSLqcIsU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-6-Tvy5lTm8Ox-EE8jaz8Tjig-1; Mon, 16 Jan 2023 11:37:30 -0500
X-MC-Unique: Tvy5lTm8Ox-EE8jaz8Tjig-1
Received: by mail-ej1-f70.google.com with SMTP id
 sb39-20020a1709076da700b0086b1cfb06f0so5847340ejc.4
 for <qemu-trivial@nongnu.org>; Mon, 16 Jan 2023 08:37:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D5lv6nxqxKL4Uj2DyZf4N5d7X3X8IIDgtzlVJU8pf6Q=;
 b=DXDP2TPnCKKQpcIZzik29Nk6ovnM/wLub5jfbgJPEGEGh+SPvtBzWsOjv9Fybyfl6J
 dltsDPHRAdIO8G5E6hz0TtAFnTTTLSRoTE3x9I3eyy7scT42YCumZV07Nj+PqIGEsv/q
 25fAs+mos9PfleZdFSKLEfWvqKwgnqkjtj4+dl6HjSnGZluP09nd/Gx/3SrKat4zo3SW
 odu4KA2fn/MNNtEnxw24r2aW5dxX542tRnnwCOeTQoxYuC6dkhkV+nE9V6Ov4rOCokt4
 POxAtjO/e5tyHyzQJHQ5sEbU7vCfWJ+ssruBxzg2VEgcLLS3GEP5XTPXxrpZzi0pfZlb
 uivQ==
X-Gm-Message-State: AFqh2koyTGxAECxKZpXJWoecvGNnZ6y8QvlLDeYJCjDLauBqAM5EB/B0
 T87K+zVF96iCMA/SlrZgJwiAct4vJjjdJ9cZUYBndIX8VW3RQjRS7ApgJVHC4upUc4OplA6W9QU
 W9wA+DUtpBjv33CCaEA==
X-Received: by 2002:a17:906:1c59:b0:86b:49c6:259a with SMTP id
 l25-20020a1709061c5900b0086b49c6259amr11794248ejg.62.1673887049800; 
 Mon, 16 Jan 2023 08:37:29 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtZavZbMsc8luZPEQ0RBVx2ME2Fj6g/ue20nSAOHYYwEPxw2UEWhyQn+i0qOikiHG376wTnNA==
X-Received: by 2002:a17:906:1c59:b0:86b:49c6:259a with SMTP id
 l25-20020a1709061c5900b0086b49c6259amr11794223ejg.62.1673887049516; 
 Mon, 16 Jan 2023 08:37:29 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 f27-20020a17090631db00b007c11f2a3b3dsm11970443ejf.107.2023.01.16.08.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 08:37:28 -0800 (PST)
Date: Mon, 16 Jan 2023 17:37:27 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, Richard Henderson
 <richard.henderson@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Markus
 Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Aurelien Jarno
 <aurelien@aurel32.net>
Subject: Re: [PATCH v3 1/7] hw/acpi/acpi_dev_interface: Remove unused
 parameter from AcpiDeviceIfClass::madt_cpu
Message-ID: <20230116173727.231b7811@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230116152908.147275-2-shentey@gmail.com>
References: <20230116152908.147275-1-shentey@gmail.com>
 <20230116152908.147275-2-shentey@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
X-List-Received-Date: Mon, 16 Jan 2023 16:37:37 -0000

On Mon, 16 Jan 2023 16:29:02 +0100
Bernhard Beschow <shentey@gmail.com> wrote:

> The only function ever assigned to AcpiDeviceIfClass::madt_cpu is
> pc_madt_cpu_entry() which doesn't use the AcpiDeviceIf parameter.
>=20
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  include/hw/acpi/acpi_dev_interface.h | 3 +--
>  include/hw/i386/pc.h                 | 6 ++----
>  hw/acpi/acpi-x86-stub.c              | 5 ++---
>  hw/acpi/cpu.c                        | 3 +--
>  hw/i386/acpi-common.c                | 7 +++----
>  5 files changed, 9 insertions(+), 15 deletions(-)
>=20
> diff --git a/include/hw/acpi/acpi_dev_interface.h b/include/hw/acpi/acpi_=
dev_interface.h
> index ea6056ab92..a1648220ff 100644
> --- a/include/hw/acpi/acpi_dev_interface.h
> +++ b/include/hw/acpi/acpi_dev_interface.h
> @@ -52,8 +52,7 @@ struct AcpiDeviceIfClass {
>      /* <public> */
>      void (*ospm_status)(AcpiDeviceIf *adev, ACPIOSTInfoList ***list);
>      void (*send_event)(AcpiDeviceIf *adev, AcpiEventStatusBits ev);
> -    void (*madt_cpu)(AcpiDeviceIf *adev, int uid,
> -                     const CPUArchIdList *apic_ids, GArray *entry,
> +    void (*madt_cpu)(int uid, const CPUArchIdList *apic_ids, GArray *ent=
ry,
>                       bool force_enabled);
>  };
>  #endif
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 991f905f5d..a0647165d1 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -9,7 +9,6 @@
>  #include "hw/block/flash.h"
>  #include "hw/i386/x86.h"
> =20
> -#include "hw/acpi/acpi_dev_interface.h"
>  #include "hw/hotplug.h"
>  #include "qom/object.h"
>  #include "hw/i386/sgx-epc.h"
> @@ -193,9 +192,8 @@ bool pc_system_ovmf_table_find(const char *entry, uin=
t8_t **data,
>  void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size);
> =20
>  /* hw/i386/acpi-common.c */
> -void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
> -                       const CPUArchIdList *apic_ids, GArray *entry,
> -                       bool force_enabled);
> +void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids,
> +                       GArray *entry, bool force_enabled);
> =20
>  /* sgx.c */
>  void pc_machine_init_sgx_epc(PCMachineState *pcms);
> diff --git a/hw/acpi/acpi-x86-stub.c b/hw/acpi/acpi-x86-stub.c
> index 3df1e090f4..d0d399d26b 100644
> --- a/hw/acpi/acpi-x86-stub.c
> +++ b/hw/acpi/acpi-x86-stub.c
> @@ -2,9 +2,8 @@
>  #include "hw/i386/pc.h"
>  #include "hw/i386/acpi-build.h"
> =20
> -void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
> -                       const CPUArchIdList *apic_ids, GArray *entry,
> -                       bool force_enabled)
> +void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids,
> +                       GArray *entry, bool force_enabled)
>  {
>  }
> =20
> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> index 4e580959a2..19c154d78f 100644
> --- a/hw/acpi/cpu.c
> +++ b/hw/acpi/cpu.c
> @@ -355,7 +355,6 @@ void build_cpus_aml(Aml *table, MachineState *machine=
, CPUHotplugFeatures opts,
>      char *cphp_res_path =3D g_strdup_printf("%s." CPUHP_RES_DEVICE, res_=
root);
>      Object *obj =3D object_resolve_path_type("", TYPE_ACPI_DEVICE_IF, NU=
LL);
>      AcpiDeviceIfClass *adevc =3D ACPI_DEVICE_IF_GET_CLASS(obj);
> -    AcpiDeviceIf *adev =3D ACPI_DEVICE_IF(obj);
> =20
>      cpu_ctrl_dev =3D aml_device("%s", cphp_res_path);
>      {
> @@ -666,7 +665,7 @@ void build_cpus_aml(Aml *table, MachineState *machine=
, CPUHotplugFeatures opts,
> =20
>              /* build _MAT object */
>              assert(adevc && adevc->madt_cpu);
> -            adevc->madt_cpu(adev, i, arch_ids, madt_buf,
> +            adevc->madt_cpu(i, arch_ids, madt_buf,
>                              true); /* set enabled flag */
>              aml_append(dev, aml_name_decl("_MAT",
>                  aml_buffer(madt_buf->len, (uint8_t *)madt_buf->data)));
> diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
> index 4aaafbdd7b..52e5c1439a 100644
> --- a/hw/i386/acpi-common.c
> +++ b/hw/i386/acpi-common.c
> @@ -33,9 +33,8 @@
>  #include "acpi-build.h"
>  #include "acpi-common.h"
> =20
> -void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
> -                       const CPUArchIdList *apic_ids, GArray *entry,
> -                       bool force_enabled)
> +void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids,
> +                       GArray *entry, bool force_enabled)
>  {
>      uint32_t apic_id =3D apic_ids->cpus[uid].arch_id;
>      /* Flags =E2=80=93 Local APIC Flags */
> @@ -112,7 +111,7 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *=
linker,
>      build_append_int_noprefix(table_data, 1 /* PCAT_COMPAT */, 4); /* Fl=
ags */
> =20
>      for (i =3D 0; i < apic_ids->len; i++) {
> -        adevc->madt_cpu(adev, i, apic_ids, table_data, false);
> +        adevc->madt_cpu(i, apic_ids, table_data, false);
>          if (apic_ids->cpus[i].arch_id > 254) {
>              x2apic_mode =3D true;
>          }


