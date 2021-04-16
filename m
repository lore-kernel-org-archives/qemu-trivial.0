Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lXSf0-00053g-FK
	for mharc-qemu-trivial@gnu.org; Fri, 16 Apr 2021 13:53:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lXSew-00051j-Ob
 for qemu-trivial@nongnu.org; Fri, 16 Apr 2021 13:53:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lXSem-0007X4-Bt
 for qemu-trivial@nongnu.org; Fri, 16 Apr 2021 13:53:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618595606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pclVr/KY8UOuGrZFXxg2lMxcKH0Z+oPHoROLoY2WHuk=;
 b=c1ETC2tIkJ/UQ0BmeSC8l0SBXheFmbuPtUmhFK86GQh4oG5KG9PiUNhzxatJc7CzAmHihZ
 2SYxVjHIbx8Yu81P4rzjw2gVx2RSBMJtVDgdIMQmNRBOnQ8c3gqXa5wgpiqUfsJR3WOuXN
 ePI9hHRN/8Hh6eh4anSglhmH+C0g6eQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-25YOzlV1NUyJowxjzsRfgQ-1; Fri, 16 Apr 2021 13:53:24 -0400
X-MC-Unique: 25YOzlV1NUyJowxjzsRfgQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 k1-20020adfd2210000b02901040d1dbcaeso4779097wrh.17
 for <qemu-trivial@nongnu.org>; Fri, 16 Apr 2021 10:53:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pclVr/KY8UOuGrZFXxg2lMxcKH0Z+oPHoROLoY2WHuk=;
 b=FP+9e08cd583Ig2YHgWOGcuHJ2HLQKsyvmgxcu0M8h9QPGX0/x7icXrLK26Jg336oo
 F1ynXxepC2Y1j1CvIge3gfxzUULBirb1v4dYcHytcYWE+UBK2xIUx1jCkiSWWqVR9WTM
 zMTOqI3zWepHkF5QG9wXMZw88lb/EsPxChWWbTjjgQ8+7L9PB6ABuuxys/1MYfbENYLA
 kC9aRloRnCOXQB4zqMsDwWIAsMK1KGV5vMYC3kazpyt7lWn/g+OfQc4k6sjypWqPRTmJ
 cqZIlbkCoH48Nj9gR9MFwQhseg0g4Sc7BHpSxQLHbHT/QRVh0m97UmF3NHxOjXT7kyi6
 hjQA==
X-Gm-Message-State: AOAM532bWPQDvOaQIXSjLwRvbSCXZc58N3lxo9nDzI2qN8nBQaM7J8/v
 ZabFVedX4t5XuaY5wzelWnFLa3yatmX0LSv4+E7fMMOlYG4Kl1iJ2c7URsuuU9pxZjDFKohIBQn
 8hHqkti5PzJFjHqux1zm0lFxHC8yyav4xqq5iE/qomvlX9kbyGnos+eXVGX9j9LhbtdQ=
X-Received: by 2002:a05:600c:379a:: with SMTP id
 o26mr9040005wmr.66.1618595603483; 
 Fri, 16 Apr 2021 10:53:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxv05Qhenq9HB6mu9/d/wTK0ZrWskNWyiToF8GWUmoCCwZWIsLe58qzIdvR201ip0HwBNRZKg==
X-Received: by 2002:a05:600c:379a:: with SMTP id
 o26mr9039987wmr.66.1618595603181; 
 Fri, 16 Apr 2021 10:53:23 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id v3sm10289421wmj.25.2021.04.16.10.53.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Apr 2021 10:53:22 -0700 (PDT)
Subject: Re: [PATCH 2/4] Do not include hw/boards.h if it's not really
 necessary
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20210416171314.2074665-1-thuth@redhat.com>
 <20210416171314.2074665-3-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e55a2cf6-2994-5318-0fa5-9a9057457e84@redhat.com>
Date: Fri, 16 Apr 2021 19:53:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210416171314.2074665-3-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Apr 2021 17:53:40 -0000

Hi Thomas,

On 4/16/21 7:13 PM, Thomas Huth wrote:
> Stop including hw/boards.h in files that don't need it.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  accel/tcg/tcg-accel-ops-icount.c | 1 -
>  accel/tcg/tcg-accel-ops-rr.c     | 1 -
>  accel/tcg/tcg-accel-ops.c        | 1 -
>  hw/acpi/cpu.c                    | 1 -
>  hw/acpi/memory_hotplug.c         | 1 -
>  hw/alpha/typhoon.c               | 1 -
>  hw/arm/aspeed.c                  | 1 -

It requires the macros declared by:

OBJECT_DECLARE_TYPE(MachineState, MachineClass, MACHINE)

>  hw/arm/omap1.c                   | 1 -
>  hw/arm/omap2.c                   | 1 -
>  hw/arm/strongarm.c               | 1 -
>  hw/arm/virt.c                    | 1 -

Ditto.

>  hw/avr/arduino.c                 | 1 -

Ditto.

>  hw/avr/atmega.c                  | 1 -
>  hw/display/next-fb.c             | 1 -
>  hw/hppa/machine.c                | 1 -

Ditto.

>  hw/i386/acpi-build.c             | 1 -
>  hw/i386/acpi-microvm.c           | 1 -
>  hw/i386/intel_iommu.c            | 1 -
>  hw/i386/pc.c                     | 1 -

Ditto (MACHINE_CLASS macro).

>  hw/i386/x86-iommu.c              | 1 -
>  hw/intc/sifive_plic.c            | 1 -
>  hw/mips/loongson3_virt.c         | 1 -

Ditto.

(skipping the rest).

>  hw/ppc/e500.c                    | 1 -
>  hw/ppc/mac_newworld.c            | 1 -
>  hw/ppc/mac_oldworld.c            | 1 -
>  hw/ppc/pnv.c                     | 1 -
>  hw/ppc/ppc4xx_devs.c             | 1 -
>  hw/ppc/rs6000_mc.c               | 1 -
>  hw/ppc/spapr.c                   | 1 -
>  hw/ppc/spapr_rtas.c              | 1 -
>  hw/remote/iohub.c                | 1 -
>  hw/s390x/s390-virtio-ccw.c       | 2 --
>  hw/tricore/tc27x_soc.c           | 1 -
>  hw/tricore/triboard.c            | 1 -
>  softmmu/vl.c                     | 1 -
>  35 files changed, 36 deletions(-)


