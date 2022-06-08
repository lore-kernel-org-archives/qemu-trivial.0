Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nywAW-0006JW-PL
	for mharc-qemu-trivial@gnu.org; Wed, 08 Jun 2022 09:56:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nywAU-0006Ey-Rs
 for qemu-trivial@nongnu.org; Wed, 08 Jun 2022 09:56:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nywAK-0004xQ-RO
 for qemu-trivial@nongnu.org; Wed, 08 Jun 2022 09:56:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654696568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y3GTIcrik+pI4w5E2pRnRXAdLJA1m8WfGOgWT57e8sg=;
 b=A9NUKx+1lj+bFzh0ET4VCGA9BtFtw8tOx7NgH8VGCjI0iJYNUgR3LGITMVzwh7qCoB9SLJ
 kTLIIQg0eGGfVbNnSgAkH/0ThJ3SQlMmEMrZZM/tiRvgY7ArPjcFsKI2dkE704i3sZYgYD
 fLjnIKt0V98grR4NLldBkFSqvQrcTDU=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-567-VxH69eNdOkyhQk9jyf1EFA-1; Wed, 08 Jun 2022 09:56:05 -0400
X-MC-Unique: VxH69eNdOkyhQk9jyf1EFA-1
Received: by mail-oi1-f200.google.com with SMTP id
 j5-20020acab905000000b0032ed8d00e92so590635oif.5
 for <qemu-trivial@nongnu.org>; Wed, 08 Jun 2022 06:56:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=y3GTIcrik+pI4w5E2pRnRXAdLJA1m8WfGOgWT57e8sg=;
 b=IjMHbVzBvXmyd6p2hxAfdxylPgEBLrGQZFOHItdbJp0UXXuV0bA9Afz81HliXeypfn
 J3mzrlVkJvmXweuMKDWKUwE7hgJ2aBJQysBlzCHeJgoHfvKVyEBak9pzMYRQ41XNyQdv
 V+ENg9STK6mgzOQAnpJtOcpXeS3RQ4ZzCiquVCHMgn8RpC0zPDScVCcSnbOjkxIF3g2B
 OhS/VwxtYQSZUXl5LY3LdZa/xqk3k3Krh2AhNAir1z5eGEihPx1eFb6Fc8U/E3+JZ7q9
 yLWmKqWkCszG+iZ4vkOv1OViJsvCKQTRt62ak7yrl+CiRcS1DtoapxhSTO6T+sm68yFv
 /DpA==
X-Gm-Message-State: AOAM532ZfqaTYOCVgYCuNz1NOp8UuXPXOvAdCGH4C5uBQZ0C/2ZA9pPW
 NUw2kS6dsRbqJ/VclZGB7vIIYj4hhHjBtkNWvd2Nn5/MW0N2HtR6PCFD0y1jnw3QK1RKErrzdoC
 6wxIfrsj6GAZ/FbFm5HeH/xhrE+SLRx5iVQ==
X-Received: by 2002:a9d:19aa:0:b0:60b:d2ce:2eed with SMTP id
 k39-20020a9d19aa000000b0060bd2ce2eedmr11447588otk.38.1654696564032; 
 Wed, 08 Jun 2022 06:56:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxiw03wQJgkWT2p3OX39HP4vvdtn2idE12KzmNeUxg3oOdnmDQ/f8nKwGRv0RfZWgoCMYIwMmkE0gDrFTnyqK4=
X-Received: by 2002:a9d:19aa:0:b0:60b:d2ce:2eed with SMTP id
 k39-20020a9d19aa000000b0060bd2ce2eedmr11447580otk.38.1654696563776; Wed, 08
 Jun 2022 06:56:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220608113311.2144610-1-stefanb@linux.ibm.com>
In-Reply-To: <20220608113311.2144610-1-stefanb@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 8 Jun 2022 17:55:52 +0400
Message-ID: <CAMxuvaw-+E3mYe1OOmbaV5GKJuYW_jm5D9kUaYPMq6qQ5sFq2w@mail.gmail.com>
Subject: Re: [PATCH] edk2: Use TPM2_ENABLE and TPM2_CONFIG_ENABLE for newer
 edk2
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-trivial <qemu-trivial@nongnu.org>,
 Gerd Hoffmann <gerd@kraxel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Wed, 08 Jun 2022 13:56:19 -0000

Hi

On Wed, Jun 8, 2022 at 3:33 PM Stefan Berger <stefanb@linux.ibm.com> wrote:
>
> Recent changes to edk2 switched the x86_64 build from using TPM_ENABLE

You can quote the relevant change: commit 4de8d61bcec ("OvmfPkg:
rework TPM configuration")

> to TPM2_ENABLE and TPM1_ENABLE to be similar to the ARM build. Adapt
> the QEMU edk2 Makefile to build with TPM2_ENABLE. QEMU v7.0.0 had lost
> the TPM 2 support in edk2 and this restores it.
>
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  roms/Makefile.edk2 | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/roms/Makefile.edk2 b/roms/Makefile.edk2
> index 485f2244b1..a6eb14f215 100644
> --- a/roms/Makefile.edk2
> +++ b/roms/Makefile.edk2
> @@ -101,8 +101,7 @@ submodules:
>                 -D NETWORK_IP6_ENABLE \
>                 -D NETWORK_HTTP_BOOT_ENABLE \
>                 -D NETWORK_TLS_ENABLE \
> -               -D TPM_ENABLE \
> -               -D TPM_CONFIG_ENABLE
> +               -D TPM2_ENABLE
>         cp edk2/Build/OvmfIa32/$(target)_$(call toolchain,i386)/FV/OVMF_C=
ODE.fd $@
>
>  ../pc-bios/edk2-i386-secure-code.fd: submodules
> @@ -113,8 +112,7 @@ submodules:
>                 -D NETWORK_IP6_ENABLE \
>                 -D NETWORK_HTTP_BOOT_ENABLE \
>                 -D NETWORK_TLS_ENABLE \
> -               -D TPM_ENABLE \
> -               -D TPM_CONFIG_ENABLE \
> +               -D TPM2_ENABLE \
>                 -D SECURE_BOOT_ENABLE \
>                 -D SMM_REQUIRE
>         cp edk2/Build/OvmfIa32/$(target)_$(call toolchain,i386)/FV/OVMF_C=
ODE.fd $@
> @@ -127,8 +125,7 @@ submodules:
>                 -D NETWORK_IP6_ENABLE \
>                 -D NETWORK_HTTP_BOOT_ENABLE \
>                 -D NETWORK_TLS_ENABLE \
> -               -D TPM_ENABLE \
> -               -D TPM_CONFIG_ENABLE
> +               -D TPM2_ENABLE
>         cp edk2/Build/OvmfX64/$(target)_$(call toolchain,x86_64)/FV/OVMF_=
CODE.fd $@
>
>  ../pc-bios/edk2-x86_64-secure-code.fd: submodules
> @@ -140,8 +137,7 @@ submodules:
>                 -D NETWORK_IP6_ENABLE \
>                 -D NETWORK_HTTP_BOOT_ENABLE \
>                 -D NETWORK_TLS_ENABLE \
> -               -D TPM_ENABLE \
> -               -D TPM_CONFIG_ENABLE \
> +               -D TPM2_ENABLE \
>                 -D SECURE_BOOT_ENABLE \
>                 -D SMM_REQUIRE
>         cp edk2/Build/Ovmf3264/$(target)_$(call toolchain,x86_64)/FV/OVMF=
_CODE.fd $@
> --
> 2.35.3
>


