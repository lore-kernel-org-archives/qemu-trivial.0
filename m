Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rUqkI-00008T-L2
	for mharc-qemu-trivial@gnu.org; Tue, 30 Jan 2024 11:13:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rUqkH-0008W1-0B
 for qemu-trivial@nongnu.org; Tue, 30 Jan 2024 11:13:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rUqkD-0008Pc-Ek
 for qemu-trivial@nongnu.org; Tue, 30 Jan 2024 11:13:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706631232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PA4zWU1Lm86ToeIZgFSkuXwGmu3ERuGa4Rv1lrSr3O8=;
 b=irmwYuztEgToM9QOi/ukaAyz1rE092n+bgL8Aq1Ki+l2puJp/ZawZW7NALIp+WobLhgyKm
 nVZP3xyDyEE04mirbklXsIrKHRyb8Re0Zd87OkbH1U1jilYHuQyp8a2BHHGgLzf5xwoKGS
 Sjj+uCyFWg/EaTrSlGEGgnlzeMG19kM=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-fHPPJ2DVPCCAEC_d7wsnrQ-1; Tue, 30 Jan 2024 11:13:45 -0500
X-MC-Unique: fHPPJ2DVPCCAEC_d7wsnrQ-1
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-1d8dee47308so21007995ad.2
 for <qemu-trivial@nongnu.org>; Tue, 30 Jan 2024 08:13:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706631224; x=1707236024;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h2TXQY7oLkByMa20k4kM2kuAi6geHCpwaT9GmhgYfg4=;
 b=c5PE5AupT96nU6MaIjAoPeydF2EtkPQf698ij6HIqqtesS0NNCG2rXoFuemeMSDnh3
 L57yDphLpPZBbkfP2k+wlIojqRMPIiOz6OPxwxqHj2Asb25MuxP9qHPDb6RyM7JSGHpG
 twtJlCNI5EUAm/T+W9p0PGo+YbXJNJQ+5kazPD0ZzPoRGpy5mcRzsXdq3VeirarbkzzH
 owgY/DAOf1X7n4LX+gPvh9/6rmME71/pQkDDY5o1WGz/Zl5oLRwuZO0LBuv+o89WkRXA
 ClgXRB3JovWw6yO+BQx1Tw//sY28Oj6KXR4dlNRlyg1zdZ1sEAZ7Dq/uBf3vGPT5YSg/
 IBzQ==
X-Gm-Message-State: AOJu0YwldBpvEW223saH6hhA/fsPmsUNzoB2iYqjhCANUaJzCfi4+OWM
 WZ3LCKNuNl5T5GKdI0i++sZy4+AfZwGQToy3orJSbmnEXecq4gO6pMSFZeoJNkiZDrJBS4MlWMJ
 7RFM6zwb2c38zw+0bxzu0Eyk4Ft1OOdfgvL+kypcc8NVS2loEmErzfH0=
X-Received: by 2002:a17:902:7482:b0:1d7:690f:a961 with SMTP id
 h2-20020a170902748200b001d7690fa961mr8057429pll.44.1706631224687; 
 Tue, 30 Jan 2024 08:13:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEoUC5dZkqOrk3Ruu5iIsAE9bfnf1tDPMjgnvxw87bssrw4+DoBsKbykAyTUED4BCFgz9ejUw==
X-Received: by 2002:a17:902:7482:b0:1d7:690f:a961 with SMTP id
 h2-20020a170902748200b001d7690fa961mr8057407pll.44.1706631224363; 
 Tue, 30 Jan 2024 08:13:44 -0800 (PST)
Received: from smtpclient.apple ([115.96.128.50])
 by smtp.gmail.com with ESMTPSA id
 r18-20020a170903411200b001d73adf350asm7394811pld.56.2024.01.30.08.13.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Jan 2024 08:13:43 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: [PATCH 1/3] hw/i386: Add `\n` to hint message
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <20240130155653.142283-2-groug@kaod.org>
Date: Tue, 30 Jan 2024 21:43:27 +0530
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-trivial@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>
Message-Id: <6E771066-49E8-448D-B90A-21766B108874@redhat.com>
References: <20240130155653.142283-1-groug@kaod.org>
 <20240130155653.142283-2-groug@kaod.org>
To: Greg Kurz <groug@kaod.org>
X-Mailer: Apple Mail (2.3774.400.31)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.292,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 30 Jan 2024 16:13:57 -0000



> On 30-Jan-2024, at 21:26, Greg Kurz <groug@kaod.org> wrote:
>=20
> error_fprintf() doesn't add newlines.

^^^^^^^^^^^^^^^^^

Should be error_printf(). Ditto for other patches.

>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
> hw/i386/acpi-build.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index edc979379c03..e990b0ae927f 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -2697,7 +2697,7 @@ void acpi_build(AcpiBuildTables *tables, MachineSta=
te *machine)
>                         " migration may not work",
>                         tables_blob->len, legacy_table_size);
>             error_printf("Try removing CPUs, NUMA nodes, memory slots"
> -                         " or PCI bridges.");
> +                         " or PCI bridges.\n");
>         }
>         g_array_set_size(tables_blob, legacy_table_size);
>     } else {
> @@ -2709,7 +2709,7 @@ void acpi_build(AcpiBuildTables *tables, MachineSta=
te *machine)
>                         " migration may not work",
>                         tables_blob->len, ACPI_BUILD_TABLE_SIZE / 2);
>             error_printf("Try removing CPUs, NUMA nodes, memory slots"
> -                         " or PCI bridges.");
> +                         " or PCI bridges.\n");
>         }
>         acpi_align_size(tables_blob, ACPI_BUILD_TABLE_SIZE);
>     }
> --=20
> 2.43.0
>=20


