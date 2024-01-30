Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rUreU-000490-Fl
	for mharc-qemu-trivial@gnu.org; Tue, 30 Jan 2024 12:12:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rUreS-00041r-K4
 for qemu-trivial@nongnu.org; Tue, 30 Jan 2024 12:12:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rUreR-0003fC-3Z
 for qemu-trivial@nongnu.org; Tue, 30 Jan 2024 12:12:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706634718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3JbeLxGKYbzZ3XQl3u1s+TzD+mbxwvgqFTKzHuWqOso=;
 b=JDpNU0zSEuS7vknTOljSR1UufPg2LRX0FR6mHIbcPmRzOL1RTEwrIcx5giWat+ig2SWPfm
 Xy5MdGaoNK1Eo4oz8XbKWCaClkQm7iKEcANKx8QXfGwCz1eVkmvYtGNu7CZbX5t9GrAHxR
 x/5N0HPQWwoUemnzRo/VD/8K4G+2VQw=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-546-mlSy9tYeP0OvzlaIHb9ikg-1; Tue, 30 Jan 2024 12:11:56 -0500
X-MC-Unique: mlSy9tYeP0OvzlaIHb9ikg-1
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-6dde3743f0bso2642015b3a.2
 for <qemu-trivial@nongnu.org>; Tue, 30 Jan 2024 09:11:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706634715; x=1707239515;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R06aqEIOEXWCLhaarYTxa85WehQ4KktiwtrZ5hjYt9I=;
 b=b+21IgFnCj+cbUJI8mdkDg0aciFaH+aBf3nbOPy4Blr35dnxBGY1dRTcZ3ZirCRtGE
 DhGemQ3w9BnYp7bIme/c1Qk0ivauJXJxiPxuchVvq5HXtSax/XpPl/jOO0ogeakOTshv
 AbTuAQhUnyQnRS38N67N7vlfyVwaJxljTnQFbSE3yEGhAOT7E4SoO+k8LV2m4fOCC3zs
 gG7JtfSjYg2Gbm9/m3ml05oLO/yCcWN+codKlgJjX/AYCYx25iHwtyMqpy1OzD/046M/
 s9wKMr1uFutJkeQcHo7br006IRC1219rXgD1VkXEghAts6TEWdP4Oj5kCDG+YEcH8kk+
 aWeA==
X-Gm-Message-State: AOJu0YwKNZdC2+vSwuA5Z05Xna1pbrR+ezXSNZsGu6gvP7saHViyopoL
 irFQIB3sW8eWsukFqs2Aisa99FEF74/CHVNpPm3mmzbA3Ry7Bwr6olnxgsBhD71v9BfTCIMlm06
 IELxWUlk5ZHaLmPF42qbGigFnNOfbcGmk2A6hdIwJIrV0HcVC+afujKs=
X-Received: by 2002:a05:6a00:4503:b0:6db:605c:b9e4 with SMTP id
 cw3-20020a056a00450300b006db605cb9e4mr6316436pfb.31.1706634714941; 
 Tue, 30 Jan 2024 09:11:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHd/cH+0BEPRj09ztEkWsYZ0Xc6/rc4GdQJcBQmZHGqZ7wJ9SPmeo6/59Ho7nARr5ddZ/vdVA==
X-Received: by 2002:a05:6a00:4503:b0:6db:605c:b9e4 with SMTP id
 cw3-20020a056a00450300b006db605cb9e4mr6316408pfb.31.1706634714604; 
 Tue, 30 Jan 2024 09:11:54 -0800 (PST)
Received: from smtpclient.apple ([115.96.128.50])
 by smtp.gmail.com with ESMTPSA id
 d2-20020aa78682000000b006ddc5d8ecd7sm8002030pfo.32.2024.01.30.09.11.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Jan 2024 09:11:54 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: [PATCH v2 2/3] hw/loongarch: Add `\n` to hint message
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <20240130163741.145925-3-groug@kaod.org>
Date: Tue, 30 Jan 2024 22:41:39 +0530
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Song Gao <gaosong@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>
Message-Id: <65A9DB8A-66E8-4F60-AE26-2CD73DDA440B@redhat.com>
References: <20240130163741.145925-1-groug@kaod.org>
 <20240130163741.145925-3-groug@kaod.org>
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
X-List-Received-Date: Tue, 30 Jan 2024 17:12:00 -0000



> On 30-Jan-2024, at 22:07, Greg Kurz <groug@kaod.org> wrote:
>=20
> error_printf() doesn't add newlines.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>

Reviewed-by: Ani Sinha <anisinha@redhat.com>

> ---
> hw/loongarch/acpi-build.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/loongarch/acpi-build.c b/hw/loongarch/acpi-build.c
> index 730bc4a748c4..a1c419874123 100644
> --- a/hw/loongarch/acpi-build.c
> +++ b/hw/loongarch/acpi-build.c
> @@ -509,7 +509,7 @@ static void acpi_build(AcpiBuildTables *tables, Machi=
neState *machine)
>                     " migration may not work",
>                     tables_blob->len, ACPI_BUILD_TABLE_SIZE / 2);
>         error_printf("Try removing CPUs, NUMA nodes, memory slots"
> -                     " or PCI bridges.");
> +                     " or PCI bridges.\n");
>     }
>=20
>     acpi_align_size(tables->linker->cmd_blob, ACPI_BUILD_ALIGN_SIZE);
> --=20
> 2.43.0
>=20


