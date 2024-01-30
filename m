Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rUrdo-0002xM-33
	for mharc-qemu-trivial@gnu.org; Tue, 30 Jan 2024 12:11:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rUrdf-0002vi-KU
 for qemu-trivial@nongnu.org; Tue, 30 Jan 2024 12:11:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rUrdc-0003VM-Tq
 for qemu-trivial@nongnu.org; Tue, 30 Jan 2024 12:11:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706634666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w3US3GYINWUDRxxsHxW1CK1XIJEN6r/XxxRFKNDrYZA=;
 b=JSEYyfv3UDPpR63J4WYl2x67/2e/WmezFKw56ov4hKzoDU7aUOsTaPSaDzWa8V8Jpf3z9B
 oZAGyHkrg6XghdMbhZ6nRqFPBnBVm9zD5UkMzGRCN7rtBDdZn2YKq0xoyDG72mpLCJ3pHC
 IQ+gWMg0u17AEL67rZtLU0jBCaiiHZw=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-311-v7spG-UxPyq46WW0LLlNBA-1; Tue, 30 Jan 2024 12:11:02 -0500
X-MC-Unique: v7spG-UxPyq46WW0LLlNBA-1
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-5cec8bc5c66so2239402a12.1
 for <qemu-trivial@nongnu.org>; Tue, 30 Jan 2024 09:11:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706634661; x=1707239461;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EDpf39m9/K8wpY2UV02GGHmrme+FZzgNAG9ovgKJupE=;
 b=PeyTDrHH2KOQEpY596Vh9qmW7C2htPFRi9vZv97TLgc6x5A9dmhlDUFm2pr4nOYjkF
 P36EmiypsG8n0h4cvcwjIM6tFgNd7CgWJlc5xD0Mn90yp5BXjyOSliXsKm7IW1ws1dlw
 ZDaZDr6ZBUD349FkAkI7FXk38YBBLOCsY9xZNBMkFmO2YTWTThSI6powdfJSLttmLRTD
 mcXYDwO/nnpo/vvG5mxdFdeXtkC9SgJL2L0ZUXFf6UXn5bcD2+vVY7/vMnPorPBEu0q1
 AjvrGwYY1xcMRCYxqdweX7fdXZH66VzifN6d0Uvg2LY7jAWD+5Arc06HjM41T97TxTmW
 4ijA==
X-Gm-Message-State: AOJu0YztQbR7Fui5esfHohovb9dZOyDavTi9exmiJgd59jxbEYqXQwqY
 ak0wVAeY3qqV4YusFgt5EXqsDilYlaCFs/yBnJQ2iVPqEMN0AFIZ81HDmnqPCvQ1ocb578Z7Ltm
 NcNUstRKHMSLiXEK+NLGAX7WSCZYMeY3KRTXPJUIHeSWbLbJoPfgveqU=
X-Received: by 2002:a05:6a21:61e:b0:19c:7c49:4e6 with SMTP id
 ll30-20020a056a21061e00b0019c7c4904e6mr4568337pzb.51.1706634661184; 
 Tue, 30 Jan 2024 09:11:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0e3Rk42JtixLJLTZ9zbSdmdWx+en0/sXAdE9BlCALwZ1qtT4CgPBYPMxmN3fie6hNZRJTuQ==
X-Received: by 2002:a05:6a21:61e:b0:19c:7c49:4e6 with SMTP id
 ll30-20020a056a21061e00b0019c7c4904e6mr4568322pzb.51.1706634660854; 
 Tue, 30 Jan 2024 09:11:00 -0800 (PST)
Received: from smtpclient.apple ([115.96.128.50])
 by smtp.gmail.com with ESMTPSA id
 d2-20020aa78682000000b006ddc5d8ecd7sm8002030pfo.32.2024.01.30.09.10.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Jan 2024 09:11:00 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: [PATCH v2 3/3] hw/arm: Add `\n` to hint message
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <20240130163741.145925-4-groug@kaod.org>
Date: Tue, 30 Jan 2024 22:40:45 +0530
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Song Gao <gaosong@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>
Message-Id: <93A9587D-E34E-4EB3-924D-6CDC64E1812F@redhat.com>
References: <20240130163741.145925-1-groug@kaod.org>
 <20240130163741.145925-4-groug@kaod.org>
To: Greg Kurz <groug@kaod.org>
X-Mailer: Apple Mail (2.3774.400.31)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.292,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Tue, 30 Jan 2024 17:11:14 -0000



> On 30-Jan-2024, at 22:07, Greg Kurz <groug@kaod.org> wrote:
>=20
> error_printf() doesn't add newlines.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>

Reviewed-by: Ani Sinha <anisinha@redhat.com>

> ---
> hw/arm/virt-acpi-build.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 17aeec7a6f56..48febde1ccd1 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -1008,7 +1008,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBui=
ldTables *tables)
>                     " migration may not work",
>                     tables_blob->len, ACPI_BUILD_TABLE_SIZE / 2);
>         error_printf("Try removing CPUs, NUMA nodes, memory slots"
> -                     " or PCI bridges.");
> +                     " or PCI bridges.\n");
>     }
>     acpi_align_size(tables_blob, ACPI_BUILD_TABLE_SIZE);
>=20
> --=20
> 2.43.0
>=20


