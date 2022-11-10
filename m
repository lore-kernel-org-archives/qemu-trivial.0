Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1otDsc-0003n7-GG
	for mharc-qemu-trivial@gnu.org; Thu, 10 Nov 2022 15:10:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1otDsa-0003mo-EE
 for qemu-trivial@nongnu.org; Thu, 10 Nov 2022 15:10:28 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1otDsY-0005lt-TC
 for qemu-trivial@nongnu.org; Thu, 10 Nov 2022 15:10:28 -0500
Received: by mail-pl1-x62e.google.com with SMTP id 4so2494297pli.0
 for <qemu-trivial@nongnu.org>; Thu, 10 Nov 2022 12:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=e9Bbc/iSAY67W6rSQDZkn+dZyTYNCJX7t5ReSKaZbtw=;
 b=LFPrLMFep+cHR26OrbRU/4/YoliCZ8key5BsvmqFlBjPsO3kzGEMSujTUpf3sxsfXl
 LTbhnyh2zKvTaAsCF6dtQPbdkrabS7p01cEhxkXcwECj0MTbLx+RvBihKTBZxoslquqs
 kcRzDq90+k4Uxv0m2IEF/lOkVvNyTaI+D/nNEunHCeouY2faZTQzmrOCqD1s8QLma8eL
 voeSCQ2YRB3qiFHq+qWOT6X6POfYAVE7RXRXIVRVq81g8jQ6tcAMN8DjOGeX1lvXvTON
 6BIGm1i+Yq6AejYYf3s195Ah7ndnPtrhZXFbl22lJS8Sq1/HqyG62aX1g9Qk8Yul9Y0z
 7s2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e9Bbc/iSAY67W6rSQDZkn+dZyTYNCJX7t5ReSKaZbtw=;
 b=rhxMXgtSi3y6N30QNInIbuWS0XstDuLsSR48TOzioNMIgTTjv9uveWqKrBW66KedDP
 nK1xdGxSFiCPXyJclaAxzBYecdnuuDkG5UCmYaUp3ISTwqx/bYFXFRPLM54OLrn3KyfP
 XEkXfK3zrcUwe82YeSn2KYueMw/YTZZNNgpBl0ja+XiYQrpQzNjPJ6j4n9HsUA35dbB2
 fucM1fo5PbXRHnhy+p3mpIzlnEJGVq8KSI07WID3SNsMOj5iTx5ALWgiAx2D4tteUuVJ
 J4PIk219TCN0i8IoG4BO2QLNM7K8LW7jNCnxcHro4gZ5uOX56Egi/TFOIbX7XwI8pirt
 7BpA==
X-Gm-Message-State: ACrzQf1kwMzsUca4YARe3jCRTbxmhybwFRIipY/ifqcdzV0WfG6HKubr
 dCrP5fOjdbhSdeJUIV+Wn3EEVaLm1p8sf2HTyZL6Jg==
X-Google-Smtp-Source: AMsMyM6h7AbmWDtrf3iS3n9CqEhPTgrNgxb9u5uZRBFcLDFkaZkoGhkvpeOx7W6x22jKIIbuuo/o4OC8CW+Q1v17QR8=
X-Received: by 2002:a17:903:495:b0:186:9295:2012 with SMTP id
 jj21-20020a170903049500b0018692952012mr1844761plb.19.1668111025486; Thu, 10
 Nov 2022 12:10:25 -0800 (PST)
MIME-Version: 1.0
References: <20221110190825.879620-1-sw@weilnetz.de>
In-Reply-To: <20221110190825.879620-1-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Nov 2022 20:10:13 +0000
Message-ID: <CAFEAcA_BC8yK8LSPkJ=whtg3K6-zgSCxjOgkwhFMAVdk04Pv2w@mail.gmail.com>
Subject: Re: [PATCH for-7.2] Fix several typos in documentation (found by
 codespell)
To: Stefan Weil <sw@weilnetz.de>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, 
 Ani Sinha <ani@anisinha.ca>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 "Michael S . Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 10 Nov 2022 20:10:28 -0000

On Thu, 10 Nov 2022 at 19:09, Stefan Weil via <qemu-devel@nongnu.org> wrote:
>
> Those typos are in files which are used to generate the QEMU manual.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>
> I did not fix memory_region_init_resizeable_ram. That might be done after 7.2.
>
> Stefan
>
>  docs/devel/acpi-bits.rst       | 2 +-
>  docs/system/devices/can.rst    | 2 +-
>  hw/scsi/esp.c                  | 6 +++---
>  include/exec/memory.h          | 6 +++---
>  qapi/virtio.json               | 4 ++--
>  qemu-options.hx                | 6 +++---
>  tests/qtest/libqos/qgraph.h    | 2 +-
>  tests/qtest/libqos/virtio-9p.c | 2 +-
>  8 files changed, 15 insertions(+), 15 deletions(-)
>
> diff --git a/docs/devel/acpi-bits.rst b/docs/devel/acpi-bits.rst
> index c9564d871a..5e22be8ef6 100644
> --- a/docs/devel/acpi-bits.rst
> +++ b/docs/devel/acpi-bits.rst
> @@ -132,7 +132,7 @@ Under ``tests/avocado/`` as the root we have:
>
>     (a) They are python2.7 based scripts and not python 3 scripts.
>     (b) They are run from within the bios bits VM and is not subjected to QEMU
> -       build/test python script maintainance and dependency resolutions.
> +       build/test python script maintenance and dependency resolutions.
>     (c) They need not be loaded by avocado framework when running tests.
>
>
> diff --git a/docs/system/devices/can.rst b/docs/system/devices/can.rst
> index fe37af8223..24b0d4cf41 100644
> --- a/docs/system/devices/can.rst
> +++ b/docs/system/devices/can.rst
> @@ -169,7 +169,7 @@ and with bitrate switch::
>
>    cangen can0 -b
>
> -The test can be run viceversa, generate messages in the guest system and capture them
> +The test can be run vice-versa, generate messages in the guest system and capture them
>  in the host one and much more combinations.

This isn't a grammatical use of vice-versa, so if we're touching it
then I think the sentence should be recast, eg:
"The test can also be run the other way around, generating
messages in the guest system and capturing them in the host system.
Other combinations are also possible."

(In fact the whole file could do with a proof-reading pass.)

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

