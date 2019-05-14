Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hQULE-00034i-RP
	for mharc-qemu-trivial@gnu.org; Tue, 14 May 2019 06:07:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51761)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hQULC-00032S-IR
	for qemu-trivial@nongnu.org; Tue, 14 May 2019 06:07:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hQULB-0008TI-MD
	for qemu-trivial@nongnu.org; Tue, 14 May 2019 06:07:22 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:35547)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hQULB-0008SB-Gg
	for qemu-trivial@nongnu.org; Tue, 14 May 2019 06:07:21 -0400
Received: by mail-ot1-f68.google.com with SMTP id n14so7736371otk.2
	for <qemu-trivial@nongnu.org>; Tue, 14 May 2019 03:07:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=chIQv9D9N4cd7WaO9xjFgQmQm3EB1lvib6fmJ39p2nI=;
	b=Cl3uK1OUKyjHJrfL+4iOINBEspd370/q+wQzLNAjUSLJjyI7IsbEN+vRItuwyMQURE
	fKZP1pcuxlYyrq2fvGw9pfDWqX9F6w45dM3BnMurroZkHClgl1HlkL86Tp1xeaOtJU/O
	wVPD5O2NbDxCi/DkUQrgtY6Sr43robcu8p2wIxASwsjoCJMxMk2HC8gEs7OpM1CdaEjT
	uV0I+tZQVnbkmws0Y7qVofH30DT6LvyVgCwvDN75B7cWWWEbHlYPyTMfQg/fEhMF7pfJ
	+IYd0Qpd73Iu1NOg9+A569o92Cp6eiEByEV/4MfTAQsyzmOY6EvB1nMyGivpTqvPvjiT
	JmcA==
X-Gm-Message-State: APjAAAUzduI0g70TTHBNHtSBWGiZcNfqjOsbpbsXJtpIlAgkD/z3j/nP
	QVLyVXcb+OwZiZwXw1/UxhrztQ==
X-Google-Smtp-Source: APXvYqzxX1cmi9LYja9te+FqmysKN+0+jaAB9XOqF3BSvhFapDRBnKfTBOei3YPMF0wJ+3fNb90xBA==
X-Received: by 2002:a9d:64:: with SMTP id 91mr3449996ota.19.1557828440213;
	Tue, 14 May 2019 03:07:20 -0700 (PDT)
Received: from [172.20.7.146] ([12.187.203.94])
	by smtp.gmail.com with ESMTPSA id
	z20sm5532532otm.33.2019.05.14.03.07.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 May 2019 03:07:19 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-trivial@nongnu.org, philmd@redhat.com
References: <20190514100019.13263-1-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6fdd74ed-f226-1c69-6afe-6b1f2c88c59a@redhat.com>
Date: Tue, 14 May 2019 12:07:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190514100019.13263-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.210.68
Subject: Re: [Qemu-trivial] [PATCH 0/4] Kconfig switches for core / misc
 devices
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 14 May 2019 10:07:23 -0000

On 14/05/19 12:00, Thomas Huth wrote:
> Here are some more Kconfig patches that introduce proper config
> switches for some devices in the hw/core and hw/misc directories.
> 
> Thomas Huth (4):
>   hw/core: Add a config switch for the "register" device
>   hw/core: Add a config switch for the "or-irq" device
>   hw/core: Add a config switch for the "split-irq" device
>   hw/misc: Add a config switch for the "unimplemented" device
> 
>  hw/arm/Kconfig        | 12 ++++++++++++
>  hw/core/Kconfig       |  9 +++++++++
>  hw/core/Makefile.objs |  6 +++---
>  hw/dma/Kconfig        |  1 +
>  hw/microblaze/Kconfig |  1 +
>  hw/misc/Kconfig       |  3 +++
>  hw/misc/Makefile.objs |  2 +-
>  hw/pci-host/Kconfig   |  3 ++-
>  hw/sparc64/Kconfig    |  1 +
>  hw/timer/Kconfig      |  1 +
>  10 files changed, 34 insertions(+), 5 deletions(-)
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo

