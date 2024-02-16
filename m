Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1raznO-0002gX-Pk
	for mharc-qemu-trivial@gnu.org; Fri, 16 Feb 2024 10:06:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1raznN-0002gE-7P
 for qemu-trivial@nongnu.org; Fri, 16 Feb 2024 10:06:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1raznL-0001Ce-Fr
 for qemu-trivial@nongnu.org; Fri, 16 Feb 2024 10:06:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708095989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CPBTdysDYpPiACBe5cKL5ETdbaaMEMrm03T0DAO6ASg=;
 b=DIreeWh0Y2xeNPhO13/qom3iQkp+sl2284J8lHWlFYhQwbGrxm3RpgoIVq8E9k0EmJ02V4
 r8Gn7TG8PIanx/bMMIMW+AUVj1HubqItPzLiax05Dx7AfE+gO68CDYh5NqUqFalrVndxkT
 tt9ESR7Lo9X9Car7buRAAWGRNCvnpRE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-210-9FAmaj-4NMS8fmFhKZlsQA-1; Fri, 16 Feb 2024 10:06:28 -0500
X-MC-Unique: 9FAmaj-4NMS8fmFhKZlsQA-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-33b51ae1c9dso966728f8f.3
 for <qemu-trivial@nongnu.org>; Fri, 16 Feb 2024 07:06:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708095987; x=1708700787;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CPBTdysDYpPiACBe5cKL5ETdbaaMEMrm03T0DAO6ASg=;
 b=hGd8J1zGKr72m3rGq430dB5XrI5AbIDLUjO/Om1fHwCEM3AMPQmecotYLNkDciqAlN
 l8kHF7b1GOSe8RtdpkSHWS/zfEuJpJj7cYDctkeulIDr7j9zAl3pOEi5eLzmJIdorkJL
 k+mWcz695GySFEtsXvkZzvm9hEpADHQTElfy3hnrBFt4rPaxXjYg3/trnpCJFv1H/Q8W
 SZKnvSuQTyEDv1ssIvOgWlgIu5wdXW7LmGyraXPZa0zQcJGR3rKHTK+KVfcfPzh1PfKQ
 LL7qYsyGA94rShRU0YVS40NYmKizzdXQynsc+aSIvHP728NhmdP7+mgOr+EWE5/mgJsz
 yPUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQ4Sh/+pRpbFJXhbZm84he0Mhaq/rAOL6GS8sha/sY9qemNlmrxvtj+hj2Mj/yjyrtKdk6nqJX/kY3kO/zVcyr5gU1vJ8DzQ==
X-Gm-Message-State: AOJu0YzXUYcowj2kT0hzvtzoEGBimOl3786UgtRUf2YoXuYaleX82i7e
 w0ipPKG/DChWluW6ThumoziFSoZbLzX+qqmT9MybkJgt4UUZqLyJ9GZ3+s++n2moelQz1eZ4AYY
 TKTlN7ShVhC7fbm9/QpYE/AJ1A0gJwJs3o8BLvHwddVr1Xq4HvbEavLqsUeBKNcR0WFcViPyVS2
 9z/0WxKY9Y2KRnArRFCJe7XfE4F5o2Fg==
X-Received: by 2002:adf:a30e:0:b0:33d:1f21:2dd with SMTP id
 c14-20020adfa30e000000b0033d1f2102ddmr1385084wrb.40.1708095986568; 
 Fri, 16 Feb 2024 07:06:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF6nb+V5JIUApGsbqtuvHC1+amCjLEW74NDgmopjTNFkQqUwUy/KpRDF9zaSew+lpAWDcwhzXC54uzrYLovztI=
X-Received: by 2002:adf:a30e:0:b0:33d:1f21:2dd with SMTP id
 c14-20020adfa30e000000b0033d1f2102ddmr1385068wrb.40.1708095986202; Fri, 16
 Feb 2024 07:06:26 -0800 (PST)
MIME-Version: 1.0
References: <20240216091621.32989-1-thuth@redhat.com>
In-Reply-To: <20240216091621.32989-1-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 16 Feb 2024 16:06:00 +0100
Message-ID: <CABgObfYf7Yy3sfDSfU7v+RFLsa5VShC9FSiNCd0CkJyun6vkbA@mail.gmail.com>
Subject: Re: [PATCH v2] hw/hppa/Kconfig: Fix building with "configure
 --without-default-devices"
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Helge Deller <deller@gmx.de>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-trivial@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.364,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Fri, 16 Feb 2024 15:06:33 -0000

On Fri, Feb 16, 2024 at 10:16=E2=80=AFAM Thomas Huth <thuth@redhat.com> wro=
te:
>
> When running "configure" with "--without-default-devices", building
> of qemu-system-hppa currently fails with:
>
>  /usr/bin/ld: libqemu-hppa-softmmu.fa.p/hw_hppa_machine.c.o: in function =
`machine_HP_common_init_tail':
>  hw/hppa/machine.c:399: undefined reference to `usb_bus_find'
>  /usr/bin/ld: hw/hppa/machine.c:399: undefined reference to `usb_create_s=
imple'
>  /usr/bin/ld: hw/hppa/machine.c:400: undefined reference to `usb_bus_find=
'
>  /usr/bin/ld: hw/hppa/machine.c:400: undefined reference to `usb_create_s=
imple'
>  collect2: error: ld returned 1 exit status
>  ninja: build stopped: subcommand failed.
>  make: *** [Makefile:162: run-ninja] Error 1
>
> And after fixing this, the qemu-system-hppa binary refuses to run
> due to the missing 'pci-ohci' and 'pci-serial' devices. Let's add
> the right config switches to fix these problems.

USB_OHCI_PCI is something similar to what was going on with the
Loongsoon virt machine, and Philippe asked me to look at removing
usb_bus_find() everywhere. But I have no objection to having this
patch committed in the meanwhile.

Paolo

> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v2: Keep "select SERIAL" instead of replacing it
>
>  hw/hppa/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/hppa/Kconfig b/hw/hppa/Kconfig
> index ff8528aaa8..dff5df7f72 100644
> --- a/hw/hppa/Kconfig
> +++ b/hw/hppa/Kconfig
> @@ -7,6 +7,7 @@ config HPPA_B160L
>      select DINO
>      select LASI
>      select SERIAL
> +    select SERIAL_PCI
>      select ISA_BUS
>      select I8259
>      select IDE_CMD646
> @@ -16,3 +17,4 @@ config HPPA_B160L
>      select LASIPS2
>      select PARALLEL
>      select ARTIST
> +    select USB_OHCI_PCI
> --
> 2.43.0
>


