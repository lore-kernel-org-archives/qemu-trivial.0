Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ravK0-0007ex-21
	for mharc-qemu-trivial@gnu.org; Fri, 16 Feb 2024 05:19:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ravJz-0007eb-8H
 for qemu-trivial@nongnu.org; Fri, 16 Feb 2024 05:19:55 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ravJx-0000kF-Nz
 for qemu-trivial@nongnu.org; Fri, 16 Feb 2024 05:19:54 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-41223e0777dso11005195e9.2
 for <qemu-trivial@nongnu.org>; Fri, 16 Feb 2024 02:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708078792; x=1708683592; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Dfjzs7lUQ6pj9EbFLIycFa/Gecwa2zxP0/rG7S2nwls=;
 b=tfcMFDEFm8VHMNiHEsJJ1IlLo7QO81hxZKXmX0u2S0Us6k8szG6brEgfJh451PktBE
 7tbRlpZwIrkTQXPzsEkpJUgoZlCBBMZ1BATjbUMIMBwF/7xv3zJufbdpW3TOtzsqe9kO
 oeRG19/DydsApPz/TpBM7m8bdbnw0rRRGP907FHCyH0qFaHlMghNdmKF6Ygl+nzl+llB
 Z3u55628JXeZuJ0M1J6rWe0QEgOXLaxotmApmSrHHyVX8fnvwjIxG5QcyBF8pEYMTau6
 Jpx/oX/s/Md0jHVaHfFRgu+7ruYMqslBZCYgITwF7QdEeL/+udiVEGqyWS9UyMQTn2lA
 JD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708078792; x=1708683592;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Dfjzs7lUQ6pj9EbFLIycFa/Gecwa2zxP0/rG7S2nwls=;
 b=lgpsmfdrciUZoVtfQ+tOTMiY1sGpQHYvW3DXmlplNqPnlYIShtSHCIyQ6f2e86/Jh3
 lOCScoCtpRQCsLtedWnWcVief5o769HhruCw+ZB8ye3DPVL0mdeZ2jJ8qDF/liRwMgiC
 d+L60B678Rey9JGoK1xXVjbpUbTAdYIbIYPauOGCrr25CdFmoCr8xLZF1Nj78Md8fAFH
 YrLKXN0ERnjo3C/2C3fjz4e9otycP0aL6IoE4RGHzWhsJXfoGyTlkbGw3CqMkNkVq7FF
 1nRnW9jr8NaRP6T7OGHjAkd8iyU9bqxo4xCyEtl9UN4RyPD57xSf46cT4vOfEVU/7T+k
 T8uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAIj/R3KVm5e4wS74e33XowNYbP2Q7BKlwtSP95uWfFEcXnUKmfbcOgq2a91hKHMg0b2vnoxxNMLuN9+HHTaGlfEMGrfhP1g==
X-Gm-Message-State: AOJu0YzRvOLpsZFw4w2fdTk1cpUQlRc7fNGFcs4JwKiGstbWnUhN3eyF
 gZm3sEemb4OatCTS1KHrDtjQUiPe6npb6kh+SfiDy2tNS6yxGPwWuNJEsaJutwo=
X-Google-Smtp-Source: AGHT+IGZ5HrsPZTgDb8j1lcZOu631LRNvyzg654+pKaz7NL80OHMmxT6VuzfNlye/ZsiZUZJZhQVSQ==
X-Received: by 2002:adf:f8d1:0:b0:33b:2100:3a44 with SMTP id
 f17-20020adff8d1000000b0033b21003a44mr3741785wrq.39.1708078791672; 
 Fri, 16 Feb 2024 02:19:51 -0800 (PST)
Received: from [192.168.69.100] ([176.187.210.246])
 by smtp.gmail.com with ESMTPSA id
 k18-20020a5d66d2000000b0033940016d6esm1756251wrw.93.2024.02.16.02.19.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Feb 2024 02:19:51 -0800 (PST)
Message-ID: <2b236cac-b940-4570-8a2e-2d7bf9828feb@linaro.org>
Date: Fri, 16 Feb 2024 11:19:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hw/hppa/Kconfig: Fix building with "configure
 --without-default-devices"
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Helge Deller <deller@gmx.de>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org
References: <20240216091621.32989-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240216091621.32989-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Fri, 16 Feb 2024 10:19:55 -0000

On 16/2/24 10:16, Thomas Huth wrote:
> When running "configure" with "--without-default-devices", building
> of qemu-system-hppa currently fails with:
> 
>   /usr/bin/ld: libqemu-hppa-softmmu.fa.p/hw_hppa_machine.c.o: in function `machine_HP_common_init_tail':
>   hw/hppa/machine.c:399: undefined reference to `usb_bus_find'
>   /usr/bin/ld: hw/hppa/machine.c:399: undefined reference to `usb_create_simple'
>   /usr/bin/ld: hw/hppa/machine.c:400: undefined reference to `usb_bus_find'
>   /usr/bin/ld: hw/hppa/machine.c:400: undefined reference to `usb_create_simple'
>   collect2: error: ld returned 1 exit status
>   ninja: build stopped: subcommand failed.
>   make: *** [Makefile:162: run-ninja] Error 1
> 
> And after fixing this, the qemu-system-hppa binary refuses to run
> due to the missing 'pci-ohci' and 'pci-serial' devices. Let's add
> the right config switches to fix these problems.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   v2: Keep "select SERIAL" instead of replacing it

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


