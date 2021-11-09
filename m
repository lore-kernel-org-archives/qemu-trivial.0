Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mkLWH-0002XP-5s
	for mharc-qemu-trivial@gnu.org; Tue, 09 Nov 2021 02:26:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mkLW5-0002Nu-OI
 for qemu-trivial@nongnu.org; Tue, 09 Nov 2021 02:26:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mkLVx-0006sj-76
 for qemu-trivial@nongnu.org; Tue, 09 Nov 2021 02:26:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636442751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wc8YSvWKejoB+4eiI7TxQzjT6oH9Ijl6efdaxvB1haA=;
 b=FHClSiFXPPcH7CY6NQ0FjGPrcdbS2pSbeZdDimgB/uk1uiIwsaW6wJH+pYggLqXncXFjNB
 WbLr+0fZuGvKV7OgcaR+goCkNHdVdA2L03UvPrLQWiBAubAh6bDY1nUHByi0fyTkA3jqri
 moNa+f7eG9g6UHbw0ndbAjytbTmFQEI=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-_-yPJ8H6MEOmdqY3La1FdQ-1; Tue, 09 Nov 2021 02:25:48 -0500
X-MC-Unique: _-yPJ8H6MEOmdqY3La1FdQ-1
Received: by mail-pl1-f198.google.com with SMTP id
 s15-20020a170902b18f00b0013fb4449cecso8153449plr.19
 for <qemu-trivial@nongnu.org>; Mon, 08 Nov 2021 23:25:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wc8YSvWKejoB+4eiI7TxQzjT6oH9Ijl6efdaxvB1haA=;
 b=VhPQ/QhIrU9bRtqJ0dIvHODp1odWZVFSfYxJBcpF/O7B4ZJwjG1Ia+upQMn+8yk2Sc
 YlUnO9w0N2WwB+Z4pkjEJKx4AS6p3pveyHOyOW79ZKVFUa8ylzolXIza+ARbgP5KfV/7
 8qRdLQcvhct0CcMv3b7N8UXIQeJFUhQypuQhgIJx1S2+J3dI8n284wAmJJNklunvram7
 M7oh/eit4Yk3SHNPqVkCAveOib0uZi1QOg5n6kf5bry3gwGShhZN70LpyWIR2IPfb84p
 +OcroXfBvYchxWuJS2eaCJdeRC3VtfAKG3vujQzXn62b7Lil5XPfUv9LpWnWAk6p7LnP
 jlmA==
X-Gm-Message-State: AOAM531Q2C4seown4SzU95b1OoNx4hOl2Vjt5K9oyI1c48GmwWrcl4b3
 uDQXsKCrttLWJ+0v4uzMyadiDpFtBBbcUj/juOuKMIvydQbYt5w6Fq0Ek+DwiklBRYxtbQOdWwF
 LU4yTADVlIyVKgS6NxbcqAuDCyA13ljd0Mw==
X-Received: by 2002:a17:902:7b84:b0:13b:90a7:e270 with SMTP id
 w4-20020a1709027b8400b0013b90a7e270mr5304004pll.21.1636442747115; 
 Mon, 08 Nov 2021 23:25:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwu5t68JdtqX02hdU2UNWRnvw9Z1OZpNG4P4y7RbSomo65kJnHecrr0YoG/ZkpHxSn6yi5z30njEev1IzhaAcQ=
X-Received: by 2002:a17:902:7b84:b0:13b:90a7:e270 with SMTP id
 w4-20020a1709027b8400b0013b90a7e270mr5303984pll.21.1636442746821; Mon, 08 Nov
 2021 23:25:46 -0800 (PST)
MIME-Version: 1.0
References: <20211109003733.3177378-1-stefanb@linux.vnet.ibm.com>
In-Reply-To: <20211109003733.3177378-1-stefanb@linux.vnet.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 9 Nov 2021 11:25:35 +0400
Message-ID: <CAMxuvax+T0sVp512idiCkngZJqFOWcQGR3mkfUy6-gO8yEofKA@mail.gmail.com>
Subject: Re: [PATCH] acpi: tpm: Add missing device identification objects
To: Stefan Berger <stefanb@linux.vnet.ibm.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-trivial <qemu-trivial@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>, 
 Stefan Berger <stefanb@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 09 Nov 2021 07:26:06 -0000

On Tue, Nov 9, 2021 at 4:37 AM Stefan Berger <stefanb@linux.vnet.ibm.com> w=
rote:
>
> Add missing device identification objects _STR and _UID. They will appear
> as files 'description' and 'uid' under Linux sysfs.
>
> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Ani Sinha <ani@anisinha.ca>
> Fixes: #708
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

(on my host, for some reason the UID is 1, does this matter?)

> ---
>  hw/arm/virt-acpi-build.c | 1 +
>  hw/i386/acpi-build.c     | 4 ++++
>  2 files changed, 5 insertions(+)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 674f902652..09456424aa 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -228,6 +228,7 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachine=
State *vms)
>
>      Aml *dev =3D aml_device("TPM0");
>      aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
> +    aml_append(dev, aml_name_decl("_STR", aml_string("TPM 2.0 Device")))=
;
>      aml_append(dev, aml_name_decl("_UID", aml_int(0)));
>
>      Aml *crs =3D aml_resource_template();
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index a3ad6abd33..d6d3541407 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1808,6 +1808,10 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>                      dev =3D aml_device("TPM");
>                      aml_append(dev, aml_name_decl("_HID",
>                                                    aml_string("MSFT0101")=
));
> +                    aml_append(dev,
> +                               aml_name_decl("_STR",
> +                                             aml_string("TPM 2.0 Device"=
)));
> +                    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
>                  } else {
>                      dev =3D aml_device("ISA.TPM");
>                      aml_append(dev, aml_name_decl("_HID",
> --
> 2.31.1
>


