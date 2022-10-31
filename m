Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1opTyT-0002jk-Lv
	for mharc-qemu-trivial@gnu.org; Mon, 31 Oct 2022 08:33:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1opTyF-0002hO-1x
 for qemu-trivial@nongnu.org; Mon, 31 Oct 2022 08:32:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1opTy5-0003uT-7g
 for qemu-trivial@nongnu.org; Mon, 31 Oct 2022 08:32:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667219560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+410bms61PLJS6NdJuVCX+OOaNgZU0KlC8GkOp8PEhs=;
 b=jG0IAWvsY+T+r9Hro6uyQ7wpPSVVdbEbbh/wMEG+SLacZSLxFi9u371o+rJCiV5KdfWsWO
 fIreYWeHHX0TFDd8Qig9vOvrUHtszvGHzUy/ZB3idX+PkeysSXSgot2LAS9Yl5KsgQcDjR
 3dbBD5u4TXRdpN2KBXosUXPmB3wNma0=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-1-W9YLY4y1PHCOH0aZkmKNyQ-1; Mon, 31 Oct 2022 08:32:39 -0400
X-MC-Unique: W9YLY4y1PHCOH0aZkmKNyQ-1
Received: by mail-qt1-f198.google.com with SMTP id
 v12-20020ac8578c000000b003a50eb13e29so4351289qta.3
 for <qemu-trivial@nongnu.org>; Mon, 31 Oct 2022 05:32:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+410bms61PLJS6NdJuVCX+OOaNgZU0KlC8GkOp8PEhs=;
 b=uPtmBc6SMc6E96zLKH6XqvErDlQU/TvKRquhycJ0edprMnIswWxkHyhVd54mRCbRMW
 F0usDwyVNX97Qx6Z8HqBm3kcNhxRCLBTorScMBYknVB8WuyqhlPL44FKBuv912Q76qFN
 pwO9jwwZLdHZYrr6x//f5X1VaeTf6Z4q5XeNlSRGMmc0JfeLnZhdKjkD3KmVyCLIKsLf
 h3bDhC5n8cXQySd86Y42fi67SZMfsghog00Lpj32AyLWVYRe4Ulih9ScXoRNdY+hMqbM
 VaLTL1KHsCvxkg8mGDuEh9QwzbFovH0UBhrq7l0zG5ObLR+F+QEaMLUo9AH9V5zVqJno
 Z75A==
X-Gm-Message-State: ACrzQf2yLq0NrKQOCaq8gUO3L+ubUxGDy+W+fQp1p2VMFbCwx13ewX/B
 YhGUViB7ABdhw2ouOKz74AtJwpoBCxJAFI1VRDLwjTFpeWOFDTH5L3vD2lOW1tauccoNC1egVn1
 7UgI4j5bldI5zIeMwrg==
X-Received: by 2002:a0c:b447:0:b0:4b3:cf2b:92f6 with SMTP id
 e7-20020a0cb447000000b004b3cf2b92f6mr10692648qvf.79.1667219557988; 
 Mon, 31 Oct 2022 05:32:37 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5y6hmrYQEKCvRrD1n7Vk6/Q5qSGRnzuqUPTSM3zWYWlUEEI6m6cT+X+aAbFMe6yGBvoribkA==
X-Received: by 2002:a0c:b447:0:b0:4b3:cf2b:92f6 with SMTP id
 e7-20020a0cb447000000b004b3cf2b92f6mr10692620qvf.79.1667219557728; 
 Mon, 31 Oct 2022 05:32:37 -0700 (PDT)
Received: from fedora (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 x14-20020ac8730e000000b0039cb59f00fcsm3571940qto.30.2022.10.31.05.32.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:32:37 -0700 (PDT)
Date: Mon, 31 Oct 2022 13:32:33 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Eduardo Habkost
 <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <ani@anisinha.ca>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philmd@linaro.org>
Subject: Re: [PATCH v2 1/3] hw/i386/acpi-build: Remove unused struct
Message-ID: <20221031133233.597f3067@fedora>
In-Reply-To: <20221028103419.93398-2-shentey@gmail.com>
References: <20221028103419.93398-1-shentey@gmail.com>
 <20221028103419.93398-2-shentey@gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
X-List-Received-Date: Mon, 31 Oct 2022 12:33:01 -0000

On Fri, 28 Oct 2022 12:34:17 +0200
Bernhard Beschow <shentey@gmail.com> wrote:

> Ammends commit b23046abe78f48498a423b802d6d86ba0172d57f 'pc: acpi-build:
> simplify PCI bus tree generation'.
>=20
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Message-Id: <20221026133110.91828-2-shentey@gmail.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/i386/acpi-build.c | 7 -------
>  1 file changed, 7 deletions(-)
>=20
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 960305462c..1ebf14b899 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -121,13 +121,6 @@ typedef struct AcpiMiscInfo {
>      unsigned dsdt_size;
>  } AcpiMiscInfo;
> =20
> -typedef struct AcpiBuildPciBusHotplugState {
> -    GArray *device_table;
> -    GArray *notify_table;
> -    struct AcpiBuildPciBusHotplugState *parent;
> -    bool pcihp_bridge_en;
> -} AcpiBuildPciBusHotplugState;
> -
>  typedef struct FwCfgTPMConfig {
>      uint32_t tpmppi_address;
>      uint8_t tpm_version;


