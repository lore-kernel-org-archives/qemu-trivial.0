Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pHScH-0004YG-8W
	for mharc-qemu-trivial@gnu.org; Mon, 16 Jan 2023 11:45:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pHScC-0004Nj-QG
 for qemu-trivial@nongnu.org; Mon, 16 Jan 2023 11:45:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pHScA-0004iQ-Q3
 for qemu-trivial@nongnu.org; Mon, 16 Jan 2023 11:45:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673887540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AJHPTUqOm06iuk5CQ3eyuo7SM6vCmzGcotUi5cguy1Q=;
 b=A29F8t2fNO7jeN6BTLb3lySi7IpH6aDIesqcZU9pUwxQpD4N9j9qL5odwDSMKSLMBt/mvO
 6KFnU1mjRvkiBodSlWiUEKMpw2AnT+v2ZWG4n1AMOom451bGZONLKR+9FZ/Wme/siEiqmH
 XldhPYG97Tib1U3O27F2v2lTD3AY2E4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-189-DThTR2zKOwatT1zCr2uKyg-1; Mon, 16 Jan 2023 11:45:39 -0500
X-MC-Unique: DThTR2zKOwatT1zCr2uKyg-1
Received: by mail-ed1-f72.google.com with SMTP id
 z20-20020a05640240d400b0049e1b5f6175so1738931edb.8
 for <qemu-trivial@nongnu.org>; Mon, 16 Jan 2023 08:45:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AJHPTUqOm06iuk5CQ3eyuo7SM6vCmzGcotUi5cguy1Q=;
 b=JHurBB8eiYyh1/Bs/pIGLB7Rh6CESPZmm3VKVYHs2yddtVkW9ykH842zicv9JEyZK6
 ioDJr4nvDMtYR/FenA2AOHMM1aOLjcEo9q9vEArrNDJ91LiE8PxIOEQ8pOBcPY32v4uK
 xbxAf30e3OSCvK5RT+ixvpb4TzEvQyF3Nn83EWEGsNQ0kfR8x36k0PpsrCYKq57fY0nS
 O2S5UI3RAIi7pTLd3u7uLC1EUr3p2QJVKLi1cm2Ue5mMLrzRjBPAYEhoMe2usm1QH1+t
 OgPqPw9FHMDyypGCDAtM4iYmneS4mwJOy4+OEEh0DG4HOnY5a2z7HfqXCPmrY1FaSRQi
 jNVg==
X-Gm-Message-State: AFqh2krBrolPXvbDyMtJXNs+P2sRiWoSwNoehzsgnQbDEzJKgeVhUVLv
 sP52CNLIqCkv2GmV2y5eu4pHCV78CwPpdY1VrT9JNS1yWGVyzhg88VJxMmWGepOHGbmbHwONsbD
 nb45BQ3c6stOKH9/Pqw==
X-Received: by 2002:a05:6402:d55:b0:499:c294:77b6 with SMTP id
 ec21-20020a0564020d5500b00499c29477b6mr22961871edb.9.1673887538052; 
 Mon, 16 Jan 2023 08:45:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsCazXPP0HauozXCEt2CwHd8Z+/34G6TSrL38/C75Z+zuyYXDO4r0hoJI3UW8Tp4Se8Fyb99Q==
X-Received: by 2002:a05:6402:d55:b0:499:c294:77b6 with SMTP id
 ec21-20020a0564020d5500b00499c29477b6mr22961853edb.9.1673887537869; 
 Mon, 16 Jan 2023 08:45:37 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 s1-20020aa7d781000000b0048ecd372fc9sm11704919edq.2.2023.01.16.08.45.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 08:45:36 -0800 (PST)
Date: Mon, 16 Jan 2023 17:45:35 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, Richard Henderson
 <richard.henderson@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Markus
 Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Aurelien Jarno
 <aurelien@aurel32.net>
Subject: Re: [PATCH v3 5/7] hw/i386/acpi-build: Remove unused attributes
Message-ID: <20230116174535.197cd4e2@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230116152908.147275-6-shentey@gmail.com>
References: <20230116152908.147275-1-shentey@gmail.com>
 <20230116152908.147275-6-shentey@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
X-List-Received-Date: Mon, 16 Jan 2023 16:45:47 -0000

On Mon, 16 Jan 2023 16:29:06 +0100
Bernhard Beschow <shentey@gmail.com> wrote:

> Ammends commit 3db119da7915 'pc: acpi: switch to AML API composed DSDT'.
>=20
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/i386/acpi-build.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 0be3960a37..428328dc2d 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -117,8 +117,6 @@ typedef struct AcpiMiscInfo {
>  #ifdef CONFIG_TPM
>      TPMVersion tpm_version;
>  #endif
> -    const unsigned char *dsdt_code;
> -    unsigned dsdt_size;
>  } AcpiMiscInfo;
> =20
>  typedef struct FwCfgTPMConfig {


