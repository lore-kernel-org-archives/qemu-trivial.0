Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rZv7v-0005Xk-Kv
	for mharc-qemu-trivial@gnu.org; Tue, 13 Feb 2024 10:55:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1rZv7u-0005XK-6s
 for qemu-trivial@nongnu.org; Tue, 13 Feb 2024 10:55:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1rZv7s-0006Im-Um
 for qemu-trivial@nongnu.org; Tue, 13 Feb 2024 10:55:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707839716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QsAXGkXDi+oY9NLImlm176exbBrLXg78m/3+njz50Zg=;
 b=GswawXpqIJr+nmHp4eEigIgnmOgBApBsUQ1o809Bv5EoUynFfI8e5zoDBuOWBpGl1XGsbH
 FaFQYHZnyqGQyNCZsVjPg3lKJaS1OWkqYjpTcyQ0Vnbl64XqG1vStJ91Aaar1jkBriaZGc
 Jo7xrkIOmqjE4oEcyNOEoLZqxQdhsIQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-117-jknh0xwONxSVn9_XTkA53w-1; Tue, 13 Feb 2024 10:55:14 -0500
X-MC-Unique: jknh0xwONxSVn9_XTkA53w-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-33b2badbb4eso1746425f8f.1
 for <qemu-trivial@nongnu.org>; Tue, 13 Feb 2024 07:55:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707839714; x=1708444514;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QsAXGkXDi+oY9NLImlm176exbBrLXg78m/3+njz50Zg=;
 b=PwMXB99ypyc84+qgf5/aBnHSOAw7934MqkOwF/QiXn+/3BTDoMlX8rl+MCBD39wT9I
 vQIv7ZIHd/kAJAFsfWdpZhkGr1h+fRKShsNZvIe99GW0n/FWR/OcUqiZu7ey/aDzHEvL
 8VeLK+YIBaX95TEYQRDlwdbAz7QsnIPPD8Y0pnyWB3OdmtZlG97zh/QP15s4tz4aGDBJ
 m4j5DKUcaZa0w7TA53se9IHCkRBgdUBg2u/3jKUIL6PRZLUTotW5gjAV0QzXE8Ynd7Kd
 Pme2cdPamHstH9vTld7Ya9o6nylJl5J1YmuvEmkzbBbagzjQB0jTBTqEzTPMC/UTQnWu
 jT+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNiFqBYLp2EZhCK04iG0dc0tZIL0pSA3dfY3XYJodNBomGk66nrKsQ6z3btDRsLeCjPRlPkFWOB/lsi+HPKzI44ieoqanNHw==
X-Gm-Message-State: AOJu0YzEHuPMmnWkOo3df187DMreaJ7XPoYFW2tl+BSu/F7UxRsssO91
 A2aDu6SZhJY4RVDCji4XpemsCo4H3HxryaQtSZvZ2f+atkSyJOycCyCMrpDKvMLaXdISJpsyJnZ
 Vr5LrLgfGyTvW1NoFmV0eLQ5hHQww3TzmqmpUQhPIqzaAcQ5l/JAvH2s=
X-Received: by 2002:a5d:424c:0:b0:33b:2633:b527 with SMTP id
 s12-20020a5d424c000000b0033b2633b527mr6038629wrr.20.1707839713866; 
 Tue, 13 Feb 2024 07:55:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDy2hj53AooYKQgzg1Sv8HoYOae53M+/PgSmRddO2uo0RJ+Ohmja860yDyEAqUJUKI04ONxA==
X-Received: by 2002:a5d:424c:0:b0:33b:2633:b527 with SMTP id
 s12-20020a5d424c000000b0033b2633b527mr6038613wrr.20.1707839713501; 
 Tue, 13 Feb 2024 07:55:13 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV1mAEgrxf/w3x7cznMX6wPE7D8W8uLER8gt7TmY0FYO24g4KC/rhn34TjlCvkz32159YRZ+VNkmx8WTv0eKxLFJ7X98mfAsHyGYhPPPX6keKRA5qSnpN4WJ1AB/j4sDc0zLGXrmR8Fk10OtIlskUMIXX+3xuy3o7X3/OxVrsYhhnCHEjjw3FSOtbo18z3bRg5/1PspsYcBuAKeqmJ1+W02N+sYJp6JDUokaAPjGAp3TmM+1t7+9+NunOac4VFa5ZLhKti66SPzPjfCQ3pFGXrGDpAN9bCo+Wt0egrqqhYTZIWK8l0mduN4
Received: from redhat.com ([2.52.26.67]) by smtp.gmail.com with ESMTPSA id
 bq14-20020a5d5a0e000000b0033ce3311805sm278668wrb.10.2024.02.13.07.55.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 07:55:12 -0800 (PST)
Date: Tue, 13 Feb 2024 10:55:09 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Ani Sinha <anisinha@redhat.com>, qemu-trivial@nongnu.org
Subject: Re: [PATCH 0/7] hw/i386: Cleanups around 'hw/i386/pc.h'
Message-ID: <20240213105455-mutt-send-email-mst@kernel.org>
References: <20240213120153.90930-1-philmd@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20240213120153.90930-1-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.504,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 13 Feb 2024 15:55:18 -0000

On Tue, Feb 13, 2024 at 01:01:45PM +0100, Philippe Mathieu-Daudé wrote:
> Trivial patches removing uses of "hw/i386/pc.h".

How did you test that it's indeed unused?

> Philippe Mathieu-Daudé (7):
>   target/i386/monitor: Remove unused 'hw/i386/pc.h' header
>   hw/timer: Move HPET_INTCAP definition to "hpet.h"
>   hw/isa/lpc_ich9: Remove unused 'hw/i386/pc.h'
>   hw/i386/acpi: Declare pc_madt_cpu_entry() in 'acpi-common.h'
>   hw/i386/port92: Add missing 'hw/isa/isa.h' header
>   hw/acpi/cpu_hotplug: Include 'pci_device.h' instead of 'pci.h'
>   hw/acpi/cpu_hotplug: Include 'x86.h' instead of 'pc.h'
> 
>  hw/i386/acpi-common.h   | 3 +++
>  include/hw/i386/pc.h    | 6 ------
>  include/hw/timer/hpet.h | 2 ++
>  hw/acpi/cpu_hotplug.c   | 4 ++--
>  hw/i386/acpi-common.c   | 1 -
>  hw/i386/port92.c        | 1 +
>  hw/isa/lpc_ich9.c       | 1 -
>  hw/timer/hpet.c         | 1 -
>  target/i386/monitor.c   | 1 -
>  9 files changed, 8 insertions(+), 12 deletions(-)
> 
> -- 
> 2.41.0


