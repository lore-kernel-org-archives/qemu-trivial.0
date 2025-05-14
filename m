Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uFBvx-00043r-1I
	for mharc-qemu-trivial@gnu.org; Wed, 14 May 2025 09:14:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1uFBs6-0003bI-DL
 for qemu-trivial@nongnu.org; Wed, 14 May 2025 09:10:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1uFBs2-00010y-Q9
 for qemu-trivial@nongnu.org; Wed, 14 May 2025 09:10:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747228201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UjvPFTZxlUTCgxQgiB+/awojF3gbVDt0w+ZaWf8Kprk=;
 b=P3L/Vs6HTIbnBtFswVIcEGLSbRZ3sOaXxfhDHUiYpI2n7h5YfR8geZvOoKLkEC8z6Ljxz/
 Z3W171dcmIAlDpJrNa1pSDGFoVEMOlxLnIrDt5a0rGHNIEbo85BoL7wtIYZvQdsn1NWIHk
 inYNfQKXUoZluJpT/h1LvQXwgteV+eo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-131-RVQP3n9iPxm4npUNv73BWg-1; Wed, 14 May 2025 09:08:45 -0400
X-MC-Unique: RVQP3n9iPxm4npUNv73BWg-1
X-Mimecast-MFC-AGG-ID: RVQP3n9iPxm4npUNv73BWg_1747228124
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-ad22c5408e7so511550766b.3
 for <qemu-trivial@nongnu.org>; Wed, 14 May 2025 06:08:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747228124; x=1747832924;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UjvPFTZxlUTCgxQgiB+/awojF3gbVDt0w+ZaWf8Kprk=;
 b=QJXRmwYd/APJvtEGx8UrVjXkav9I4XntbL6eB6Vw7L3q5JaDsSGhdnCTqd5r8bFl81
 4fMvFNy7fh92jvyO3eKo2WaWZ4xlLfZH9QPd+gcoRuMKq6e8ihFngIvUrrlz/H+xkBwe
 EdSOuyztcr2MjzDT+ar9Pk42UIuZWpTYDJ8p/wOLXeMaZaSx3ZxP3yDaO+YUFotGlpbY
 qojawsUdKB1/wnO1b1pykGpXtNgwSPGHhJec1vPbvlvbE9+EUTr/XrKC+cgOMgJFvDju
 Y6F7h7otPCa4glryAaxmXYTBSIH0fxvChFvWZcqMeIJAJWyTCmk1T+IuGEP9m34clJ7j
 /XDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4U51880FguluYIi0hgGf/m7SD3InW8Ajx1ZZZH0SuXw3cZZAumzDghUFWOyihro/74IZCFDi3h3+AXNU=@nongnu.org
X-Gm-Message-State: AOJu0YzwlslHb3M+JNNTMAQsIl9vrV3VYUcheTY6v/l1KLzUKtRF2WzP
 bcE8y5p3+wtOF5GJ/C4rtligF2QoJwfgU2dG7s+c6s9XuWE+l9h1FA4uvZlQJSN/iXq/iWxASrE
 QrM2z9Ly9tWfteMI6P1txRR78RQsdpcl4HxkMUc/5zo8v0s6IU673vjssTbIZQwe9AuoWFX/+wh
 NBYWPCKKX3ewrprQwistXeYYdzGWMKDA==
X-Gm-Gg: ASbGncuLGvOPIWs4pL23cN1YsQyHIgOiEvaQhLETMUr7zkxJzmerxZ65xwotKpD7s5X
 a7mgYyPh6sDGQR3AKXBxqGeD+TKjP55h0t5k9WkcvLfCHFqnfE394bldvTXiidMLK2aZbtQ==
X-Received: by 2002:a17:907:7e8b:b0:ad2:5657:3161 with SMTP id
 a640c23a62f3a-ad4f74a836emr371089766b.59.1747228123873; 
 Wed, 14 May 2025 06:08:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsDNHGfAzkup7t7LmuEjs9mO0TvsN/0cCBnh8QYpnknCDfmai+awibI2DOsk+myFjrs4Vq+fITNPfIB8Zq12Q=
X-Received: by 2002:a17:907:7e8b:b0:ad2:5657:3161 with SMTP id
 a640c23a62f3a-ad4f74a836emr371086066b.59.1747228123483; Wed, 14 May 2025
 06:08:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250514084957.2221975-1-zhao1.liu@intel.com>
 <20250514084957.2221975-4-zhao1.liu@intel.com>
In-Reply-To: <20250514084957.2221975-4-zhao1.liu@intel.com>
From: Ani Sinha <anisinha@redhat.com>
Date: Wed, 14 May 2025 18:38:32 +0530
X-Gm-Features: AX0GCFvztF3hOmQVCp-L4OH09uBMSDdE9_k3iVSa8ZrM9g2Xy8s75S1BT2Nw-WE
Message-ID: <CAK3XEhPuL8YBdnTekTOBdE09ZegLgpBxHey9iDX61ewj98n1XQ@mail.gmail.com>
Subject: Re: [PATCH 3/9] hw/acpi/pci: Consolidate
 OBJECT_DEFINE_SIMPLE_TYPE_WITH_INTERFACES
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, 
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 27TmighKKjg9p8880fFzV1nNunGw_4wJ9EJ137gmlr0_1747228124
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.686,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 14 May 2025 13:10:15 -0000

On Wed, May 14, 2025 at 1:59=E2=80=AFPM Zhao Liu <zhao1.liu@intel.com> wrot=
e:
>
> The QOM types of AcpiGenericInitiator and AcpiGenericPort are declared
> by OBJECT_DECLARE_SIMPLE_TYPE, which means they don't need the class!
>
> Therefore, use OBJECT_DEFINE_SIMPLE_TYPE_WITH_INTERFACES to implement
> the type, then there's no need for class definition.
>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Ani Sinha <anisinha@redhat.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>

Reviewed-by: Ani Sinha <anisinha@redhat.com>

> ---
>  hw/acpi/pci.c | 24 ++++++++----------------
>  1 file changed, 8 insertions(+), 16 deletions(-)
>
> diff --git a/hw/acpi/pci.c b/hw/acpi/pci.c
> index d511a8502954..acac6744525e 100644
> --- a/hw/acpi/pci.c
> +++ b/hw/acpi/pci.c
> @@ -75,16 +75,12 @@ typedef struct AcpiGenericInitiator {
>      uint32_t node;
>  } AcpiGenericInitiator;
>
> -typedef struct AcpiGenericInitiatorClass {
> -    ObjectClass parent_class;
> -} AcpiGenericInitiatorClass;
> -
>  #define TYPE_ACPI_GENERIC_INITIATOR "acpi-generic-initiator"
>
> -OBJECT_DEFINE_TYPE_WITH_INTERFACES(AcpiGenericInitiator, acpi_generic_in=
itiator,
> -                   ACPI_GENERIC_INITIATOR, OBJECT,
> -                   { TYPE_USER_CREATABLE },
> -                   { NULL })
> +OBJECT_DEFINE_SIMPLE_TYPE_WITH_INTERFACES(AcpiGenericInitiator, acpi_gen=
eric_initiator,
> +                                          ACPI_GENERIC_INITIATOR, OBJECT=
,
> +                                          { TYPE_USER_CREATABLE },
> +                                          { NULL })
>
>  OBJECT_DECLARE_SIMPLE_TYPE(AcpiGenericInitiator, ACPI_GENERIC_INITIATOR)
>
> @@ -191,16 +187,12 @@ typedef struct AcpiGenericPort {
>      uint32_t node;
>  } AcpiGenericPort;
>
> -typedef struct AcpiGenericPortClass {
> -    ObjectClass parent_class;
> -} AcpiGenericPortClass;
> -
>  #define TYPE_ACPI_GENERIC_PORT "acpi-generic-port"
>
> -OBJECT_DEFINE_TYPE_WITH_INTERFACES(AcpiGenericPort, acpi_generic_port,
> -                   ACPI_GENERIC_PORT, OBJECT,
> -                   { TYPE_USER_CREATABLE },
> -                   { NULL })
> +OBJECT_DEFINE_SIMPLE_TYPE_WITH_INTERFACES(AcpiGenericPort, acpi_generic_=
port,
> +                                          ACPI_GENERIC_PORT, OBJECT,
> +                                          { TYPE_USER_CREATABLE },
> +                                          { NULL })
>
>  OBJECT_DECLARE_SIMPLE_TYPE(AcpiGenericPort, ACPI_GENERIC_PORT)
>
> --
> 2.34.1
>


