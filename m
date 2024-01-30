Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rUrdy-00039i-Nk
	for mharc-qemu-trivial@gnu.org; Tue, 30 Jan 2024 12:11:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rUrdj-0002wY-5o
 for qemu-trivial@nongnu.org; Tue, 30 Jan 2024 12:11:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rUrdh-0003WD-Mq
 for qemu-trivial@nongnu.org; Tue, 30 Jan 2024 12:11:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706634673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AiFSls8vnBdUuS+QjzaLq58UQZSM3qooD6fk+VI55xs=;
 b=NANgKhlJC4s6uwxsYbLh5n7jIxTQg/odgKCp9BV9vX5Xop97VhNLcrb5zfHC4tiInpXcRa
 q5a+OzQvlHHTc76M7IW2/fN4UvrMQ2tIRpK5mXPc0ajZa4vCFByTopS+0d7zxmrgqjZ9pP
 9kazsNxOwkOFP7j4q3d6ys+wNQr0eXo=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-80-BbrW7vhmMbyQ3bDPrb_mVg-1; Tue, 30 Jan 2024 12:11:10 -0500
X-MC-Unique: BbrW7vhmMbyQ3bDPrb_mVg-1
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-6ddc1bf229bso3579070b3a.1
 for <qemu-trivial@nongnu.org>; Tue, 30 Jan 2024 09:11:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706634669; x=1707239469;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+kzOBHm7GNoNaZFkMrt8k2W+/6HNS6eWcviTjYAg+To=;
 b=aE78hCynU5yoYu6hjc9rwAk2RMnkpz5PcZATBPAP+d3PCliRoJZnTh4qEGny0LEThy
 1wpz8+Mc3soYAhczxao0px3JLCS0tnoH562+Yf2sTcu3VtHO6dt5ixj/sSyjjjdugOKb
 eFXW3W5uc4CkTjUeBfyh1zQ5iMShW2S5TogUo5ZW83E4ldJt7DUUT3nWNWUdlTCRZSYB
 FEe7oNHwLGizs0hL6gfCYPZvef6Mm9OKlIIexzRPtidVopWnRm0eaumoEaAdb7yCUmXY
 uAgfnXLarUe+kM9DRfz69FHgVRC3btwW7aXjtG5qhD6U+0vsaend7a53RNgKTHOigyRP
 PG4A==
X-Gm-Message-State: AOJu0YzZP6nAunpEREBSb1cV2PrN0ZnAdrMrToUGmrAB3xyP+Hvvch/n
 UmLJFmUfzcIGRfl1o5/kruWaWRdCzQkaXGzJGAJj/SGYMPAYmiJrWV5eIMrJtB6uYe53lZRS4Vh
 JSEuFzi4+fKpm6td+voS6qN9xVZR4+JjZdI76hD68JRxYgh37b105bFU=
X-Received: by 2002:aa7:8ec2:0:b0:6da:ed17:bfa7 with SMTP id
 b2-20020aa78ec2000000b006daed17bfa7mr1874736pfr.6.1706634669486; 
 Tue, 30 Jan 2024 09:11:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGiLTbEwAud4WeaYLuHTLJqg3Z5VWq/FDNuSD1csbMGGhjP6hobrx+1RVBVk5ZRwW+obGfobQ==
X-Received: by 2002:aa7:8ec2:0:b0:6da:ed17:bfa7 with SMTP id
 b2-20020aa78ec2000000b006daed17bfa7mr1874717pfr.6.1706634669165; 
 Tue, 30 Jan 2024 09:11:09 -0800 (PST)
Received: from smtpclient.apple ([115.96.128.50])
 by smtp.gmail.com with ESMTPSA id
 d2-20020aa78682000000b006ddc5d8ecd7sm8002030pfo.32.2024.01.30.09.11.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Jan 2024 09:11:08 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: [PATCH v2 1/3] hw/i386: Add `\n` to hint message
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <20240130163741.145925-2-groug@kaod.org>
Date: Tue, 30 Jan 2024 22:40:54 +0530
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Song Gao <gaosong@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>
Message-Id: <7AD93A16-E040-4223-9AD8-93D73D62F572@redhat.com>
References: <20240130163741.145925-1-groug@kaod.org>
 <20240130163741.145925-2-groug@kaod.org>
To: Greg Kurz <groug@kaod.org>
X-Mailer: Apple Mail (2.3774.400.31)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.292,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 30 Jan 2024 17:11:21 -0000



> On 30-Jan-2024, at 22:07, Greg Kurz <groug@kaod.org> wrote:
>=20
> error_printf() doesn't add newlines.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>

Reviewed-by: Ani Sinha <anisinha@redhat.com>

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


