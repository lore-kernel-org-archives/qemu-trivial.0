Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p84V4-0006El-5o
	for mharc-qemu-trivial@gnu.org; Wed, 21 Dec 2022 14:11:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p84V2-0006EN-IZ
 for qemu-trivial@nongnu.org; Wed, 21 Dec 2022 14:11:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p84Uy-0007i5-Jx
 for qemu-trivial@nongnu.org; Wed, 21 Dec 2022 14:11:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671649886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cEHsqGTXrdhxFzohH/hp1wF2YEq1tR3zNZ9G+QjfAts=;
 b=O7ydEbbsJjIXJ9o5MGLqVJHuUDBGU/04NnuFwljjurraT4PGq1cC7rm9vR4P5fijbTqwMw
 MBxdDB+y9oSIBEfnIIt7DqIXeVQ/ME6HwvZFakkAP7H3f3oxfffCrGl0LF5Iey4zud68aC
 5i8DNoHf0LiylQjbDvZhn/rpN3NpvPY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-563-QnB70PlZOIKSbX0hi0bqFw-1; Wed, 21 Dec 2022 14:11:25 -0500
X-MC-Unique: QnB70PlZOIKSbX0hi0bqFw-1
Received: by mail-ej1-f70.google.com with SMTP id
 xj11-20020a170906db0b00b0077b6ecb23fcso11181803ejb.5
 for <qemu-trivial@nongnu.org>; Wed, 21 Dec 2022 11:11:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cEHsqGTXrdhxFzohH/hp1wF2YEq1tR3zNZ9G+QjfAts=;
 b=ik0WO/VYqooE3iffxuGgBG7barbZz1kbtPnCfrUbxiWVX7SQk7Hyk1pqr7hhLs4YXk
 AAj4504VoUfMyMr08nd+wQ72HA7xjQJKt+KSEqtJWtzBfRmiYJJSTitKD9ilSp7iHFhl
 xPZ516xuU8/emdYRD4SsXWtqbXW8iCS4rw/lN6+7uPw0pdyjN6lo93PLjG3OPvuTbaEr
 S6zRgK1ErbKhDJ8P4tjgAopsIkUsJq5vK6vkzM7n0tGcv2qZQ04InI4GyGKmNhlo1moo
 k5f6c+h035BnBUYX0CuC096KqveHNlrz4K2GZl7OuSufxTDQotRafl8t1cyF2pY8tjG8
 Ckqg==
X-Gm-Message-State: AFqh2krGjkjC8aUEPsG6gRgurMs2jW4yxNpnf0liFhc2SsGrqXPewbyR
 9PRgFESj62q6DhfyPtP1TCbws5ZCatsHPg5ZNRZbypoAyZIhvNY9xXWKBvqotqECFKn/0BSxDTm
 Mxe6kmkULy/VsD6KPSA==
X-Received: by 2002:a17:906:eb8f:b0:7ae:7e6:3a87 with SMTP id
 mh15-20020a170906eb8f00b007ae07e63a87mr2119109ejb.41.1671649884168; 
 Wed, 21 Dec 2022 11:11:24 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu0w7dzjIqANHWBhZkQb4x3MQJLeK4xpX6llnApMzeIMMuzI6bW8ULsfYzqx0iUGhGKR8yC2A==
X-Received: by 2002:a17:906:eb8f:b0:7ae:7e6:3a87 with SMTP id
 mh15-20020a170906eb8f00b007ae07e63a87mr2119091ejb.41.1671649883900; 
 Wed, 21 Dec 2022 11:11:23 -0800 (PST)
Received: from redhat.com ([2.55.175.215]) by smtp.gmail.com with ESMTPSA id
 u18-20020a1709061db200b0083f91a32131sm856890ejh.0.2022.12.21.11.11.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 11:11:23 -0800 (PST)
Date: Wed, 21 Dec 2022 14:11:19 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-trivial@nongnu.org,
 Ani Sinha <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH v2 0/7] Clean up dependencies of ACPI controllers
Message-ID: <20221221141110-mutt-send-email-mst@kernel.org>
References: <20221216130355.41667-1-shentey@gmail.com>
 <1D3E3781-4A9C-41DE-BC98-06C44894A5D0@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1D3E3781-4A9C-41DE-BC98-06C44894A5D0@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
X-List-Received-Date: Wed, 21 Dec 2022 19:11:32 -0000

On Wed, Dec 21, 2022 at 05:56:56PM +0000, Bernhard Beschow wrote:
> 
> 
> Am 16. Dezember 2022 13:03:48 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
> >This small series establishes consistency between ICH9, PIIX4 and VT82C686 ACPI
> >
> >controllers to select ACPI, ACPI_SMBUS and APM since they are provided by the
> >
> >device models.
> >
> >
> >
> >Due to the PIIX4 PM cleanup PEGASOS2's dependency can be reduced to just ACPI,
> >
> >eliminating 9 dependencies from the softmmu-ppc build.
> >
> 
> Ping
> 
> Looks like all patches are reviewed, i.e. ready to be queued.
> 
> Best regards,
> Bernhard


Sure, next pull.

> >
> >
> >v2:
> >
> >- Turn "depends on ACPI" into "select ACPI" (Phil)
> >
> >- Remove "select ACPI" from PEGASOS2 (Phil)
> >
> >- Move already reviewed patches to bottom
> >
> >- Split some patches into "add missing dependencies" and "remove redundant
> >
> >  dependencies" for ease of review
> >
> >
> >
> >Bernhard Beschow (7):
> >
> >  hw/acpi/Kconfig: Rename ACPI_X86_ICH to ACPI_ICH9
> >
> >  hw/acpi/Kconfig: Add missing dependencies to ACPI_ICH9
> >
> >  hw/acpi/Kconfig: Do not needlessly build TYPE_PIIX4_PM in non-PC/Malta
> >
> >    machines
> >
> >  hw/acpi/Kconfig: Add missing dependencies to ACPI_PIIX4
> >
> >  hw/isa/Kconfig: Add missing dependency to VT82C686
> >
> >  i386, mips: Resolve redundant ACPI and APM dependencies
> >
> >  hw/ppc/Kconfig: Remove unused dependencies from PEGASOS2
> >
> >
> >
> > configs/devices/mips-softmmu/common.mak | 3 ---
> >
> > hw/acpi/Kconfig                         | 9 ++++++---
> >
> > hw/acpi/meson.build                     | 2 +-
> >
> > hw/i2c/meson.build                      | 2 +-
> >
> > hw/i386/Kconfig                         | 3 +--
> >
> > hw/isa/Kconfig                          | 4 ++--
> >
> > hw/ppc/Kconfig                          | 2 --
> >
> > 7 files changed, 11 insertions(+), 14 deletions(-)
> >
> >
> >
> >-- >
> >2.39.0
> >
> >
> >


