Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pKj0u-0000rG-Kq
	for mharc-qemu-trivial@gnu.org; Wed, 25 Jan 2023 11:52:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pKj0t-0000r7-Ve
 for qemu-trivial@nongnu.org; Wed, 25 Jan 2023 11:52:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pKj0s-00083n-Ir
 for qemu-trivial@nongnu.org; Wed, 25 Jan 2023 11:52:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674665562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bSFmnHFGif7dgrE59zWYMnyVoDjL3xoXVax/u2hth6o=;
 b=FWPhxklSWBzsnfGjxM6XvaEHJgeMzCBvwv0qHNf42aCQBo39YeNeu12n+oMmfQErHnH/QD
 JzQRQQTGMOuclQHzjMqGbledCVlwSDoaVDjunDDuSrxDrRm2W0Z9k/mX6JbFnZtTfIkH94
 EKoWRCsHKktMIaezVdMxEuONLZRrn68=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-456-48I1IftUMpuk17E2L-V6rQ-1; Wed, 25 Jan 2023 11:52:41 -0500
X-MC-Unique: 48I1IftUMpuk17E2L-V6rQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 q20-20020a056402519400b0049e5b8c71b3so13278843edd.17
 for <qemu-trivial@nongnu.org>; Wed, 25 Jan 2023 08:52:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bSFmnHFGif7dgrE59zWYMnyVoDjL3xoXVax/u2hth6o=;
 b=xmIuKvlAh8MmG9tkdth8t1aJ7/x6vInLzEjB2+946JP0XdDQ4n3XLm9RxgUf6HHuim
 C8CSKikAhACpAdiOB1HBhKaM/GIfyEwVT1oDKtzjlfNYa1MMWHUw0Pmq1jAs7SeGKxI2
 XiJv7+F41L1iJsc5jYYwS16B2ejIvKt1RqZaoIrdE+GSlc3kbqmOfquaC1DlTyXmj4z0
 y99tU4p/Cmjcn7WzMG4XACnPxwWlafUB3E/C5Ly1T+y1KEDdmN9dcAm/gZTtG8hMMX62
 HKBT/xUrIgQTTpM37ZJ/JZJ/rWfFdCphReLWhbNrnYCGoSLLngQgrU3RpcgIDiVKza+D
 vkwQ==
X-Gm-Message-State: AFqh2koxcPDyFw18ov71IJemKpfdL/GLydyqqedqek3TeoGG8Pd5r30/
 m4/9S9PSlfeuK94ufiYtarsvjAqGj6YZ58xFq2Gt36Es8Gbpe5O99ELiZ8vPkBCbZ3r/BJclt12
 PZdUVW8tstwgoUyPp8g==
X-Received: by 2002:a17:907:1b0f:b0:86b:93ea:3366 with SMTP id
 mp15-20020a1709071b0f00b0086b93ea3366mr46888778ejc.3.1674665557624; 
 Wed, 25 Jan 2023 08:52:37 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuvwKNwkk7b3j/FZhpfOtszP+AtX5qfK2YHT1FcgIQM8YqPEaJM3dgNzMET184mrHeMz/9Mng==
X-Received: by 2002:a17:907:1b0f:b0:86b:93ea:3366 with SMTP id
 mp15-20020a1709071b0f00b0086b93ea3366mr46888754ejc.3.1674665557480; 
 Wed, 25 Jan 2023 08:52:37 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 bp12-20020a170907918c00b007c0d6b34d54sm2561901ejb.129.2023.01.25.08.52.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 08:52:35 -0800 (PST)
Date: Wed, 25 Jan 2023 17:52:34 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-trivial@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>, Eduardo
 Habkost <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>, "Michael S.
 Tsirkin" <mst@redhat.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v4 0/7] AML Housekeeping
Message-ID: <20230125175234.2984e90d@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230121151941.24120-1-shentey@gmail.com>
References: <20230121151941.24120-1-shentey@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 25 Jan 2023 16:52:44 -0000

On Sat, 21 Jan 2023 16:19:34 +0100
Bernhard Beschow <shentey@gmail.com> wrote:

> This series factors out AcpiCpuAmlIfClass::madt_cpu from AcpiDeviceIfClass.
> By letting the (x86) CPUs implement the new interface, AML generation is
> delegated to the CPUs, freeing the ACPI controllers from worrying about x86 CPU
> specifics. The delegation to the CPUs is especially interesting for the PIIX4 PM
> since it is also used in MIPS only contexts where no ACPI bios is available.
> 
> Furthermore, the series introduces qbus_build_aml() which replaces
> isa_build_aml() and resolves some open coding.

I'm done with this series review
(skipped 6-7/7, since they depend on 5/7 which seems unnecessary to me)

> 
> v4:
> - Squash qbus_build_aml() patches into one (Igor)
> - Don't use a bare function pointer for AcpiDeviceIfClass::madt_cpu (Igor)
> 
> Testing done:
> * `make check`
> * `qemu-system-x86_64 -M pc -m 2G -cdrom manjaro-kde-21.2.6-220416-linux515.iso`
> * `qemu-system-x86_64 -M q35 -m 2G -cdrom \
>    manjaro-kde-21.2.6-220416-linux515.iso`
> 
> v3:
> - Clean up includes in AcpiDeviceIfClass::madt_cpu sub series last (Markus)
> - Restructure qbus_build_aml() sub series (Phil, me)
> 
> v2:
> - Don't inline qbus_build_aml() (Phil)
> - Add 'hw/acpi/piix4: No need to #include "hw/southbridge/piix.h"'
> 
> Bernhard Beschow (7):
>   hw/i386/acpi-build: Remove unused attributes
>   hw/isa/isa-bus: Turn isa_build_aml() into qbus_build_aml()
>   hw/acpi/piix4: No need to #include "hw/southbridge/piix.h"
>   hw/acpi/acpi_dev_interface: Remove unused parameter from
>     AcpiDeviceIfClass::madt_cpu
>   hw/acpi/acpi_dev_interface: Factor out TYPE_ACPI_CPU_AML_IF
>   hw/acpi/acpi_dev_interface: Remove now unused #include "hw/boards.h"
>   hw/i386/pc: Unexport pc_madt_cpu_entry()
> 
>  hw/acpi/hmat.h                       |  3 +-
>  hw/i386/acpi-common.h                |  3 +-
>  include/hw/acpi/acpi_aml_interface.h |  3 ++
>  include/hw/acpi/acpi_cpu_interface.h | 26 ++++++++++++++++
>  include/hw/acpi/acpi_dev_interface.h |  4 ---
>  include/hw/i386/pc.h                 |  6 ----
>  include/hw/isa/isa.h                 |  1 -
>  hw/acpi/acpi-x86-stub.c              |  7 -----
>  hw/acpi/acpi_interface.c             | 18 ++++++++++-
>  hw/acpi/cpu.c                        | 13 ++++----
>  hw/acpi/hmat.c                       |  1 +
>  hw/acpi/memory_hotplug.c             |  1 +
>  hw/acpi/piix4.c                      |  3 --
>  hw/i2c/smbus_ich9.c                  |  5 +--
>  hw/i386/acpi-build.c                 |  5 +--
>  hw/i386/acpi-common.c                | 42 +++----------------------
>  hw/i386/acpi-microvm.c               |  6 ++--
>  hw/i386/generic_event_device_x86.c   |  9 ------
>  hw/isa/isa-bus.c                     | 10 ------
>  hw/isa/lpc_ich9.c                    |  6 +---
>  hw/isa/piix3.c                       |  5 +--
>  monitor/qmp-cmds.c                   |  1 +
>  target/i386/cpu.c                    | 46 ++++++++++++++++++++++++++++
>  23 files changed, 117 insertions(+), 107 deletions(-)
>  create mode 100644 include/hw/acpi/acpi_cpu_interface.h
> 


