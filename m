Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1t7Z5M-00045X-At
	for mharc-qemu-trivial@gnu.org; Sun, 03 Nov 2024 06:48:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t7Z5E-00044f-Sy
 for qemu-trivial@nongnu.org; Sun, 03 Nov 2024 06:47:53 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t7Z5C-0001DE-Ub
 for qemu-trivial@nongnu.org; Sun, 03 Nov 2024 06:47:52 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43158625112so28369735e9.3
 for <qemu-trivial@nongnu.org>; Sun, 03 Nov 2024 03:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730634468; x=1731239268; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/ggWF+nPqi0KPxzFSWTmSy5QIbNzYd/k43hqgNb+iww=;
 b=rTm6MpXfGM2h8hvrZ07u2HruF9YV6qxmDfcpTe3uYzwqp9vIicodh40bBUNsJ3zJKf
 YBtNfHIeU2W1YS90BOf4J+jpIv1YT7bAaN20jMjWUzBhO1I3/FIL+Hg93tIuu4qw/tnT
 rioIHZIh+S32Blah9RCps0uyoVob4GZ7sJ3rFCGV0gr5DE+usyD7tRjppSIqxM/Najhy
 J2k5ZetCl4QU/pWK55H5EtlYmsvjTYre1LLqHGzP9iD1X0lOCUNhLa4poXP5OxciowKP
 EI/Dq/hbVAlLCOrSY+d5DFNO9jATuXemvDknePLzCdWGyIvq3pusLaUqAnYjORTJ5//m
 aAhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730634468; x=1731239268;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/ggWF+nPqi0KPxzFSWTmSy5QIbNzYd/k43hqgNb+iww=;
 b=ao7MrrhwPWLA6G7leGx9m0SCLQBgFgANi1Q66iPhU4sZsyIIrJr0M1jCQDD8nOVsh2
 lof5YlZp6C0KAuC+xyKdV3Ib8mC/qidTPDPWRefEixZm+9zVJnVMdNaaoLvTIJSQg3Y5
 xQRF5mG7tPNMtSKDAlnA1PRDmIFBPC1+ctGKFtW2lB9mbPIzWsyrqhrbPk+BEiK1X05l
 jDnWLa8RLCKeNBaz1c4wnr528x48r8wDuWKtnT8Fk/ggz2b9pgCzdZSeGI09NVRmfrnu
 yeBKWStS0FO1X0iSEVTcdk5nPHSi1ZgILW/xypm/TPwQLqFFjn0W1YcYOvLMcMImKk0/
 P3og==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrDvxmZ6nJJzdvyFoh34+EKguhRwxJWOFtrBsNB+kvSsxS47FHFpvjCyhgGNqFgUah4uf59/MgPF4JnJY=@nongnu.org
X-Gm-Message-State: AOJu0YzJxtttZvGmVZc57XkPrU6dfokQZdC/eCGIWdA4fMuIQiMrOlh4
 iK6jQo8X79xTnXMI2sUf6wQFS6OWIan2pN5//lBQod1kOJrt58mekOGtWakQ2mk=
X-Google-Smtp-Source: AGHT+IE2krHXoyyw1GQoqFZs40lIc6cS5p6myEu5bmEy0y0fBwvdg8abHmOYs4nMkPExMqgjLgdz4w==
X-Received: by 2002:a05:600c:5118:b0:431:5e3c:2ff0 with SMTP id
 5b1f17b1804b1-4328324aaacmr72041675e9.8.1730634468097; 
 Sun, 03 Nov 2024 03:47:48 -0800 (PST)
Received: from [172.33.63.88] (134.pool62-36-43.static.orange.es.
 [62.36.43.134]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4327d685287sm124132045e9.35.2024.11.03.03.47.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Nov 2024 03:47:46 -0800 (PST)
Message-ID: <9d436b3b-4ff2-492b-8aea-c23bcfc2d7e7@linaro.org>
Date: Sun, 3 Nov 2024 12:47:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/pci: Add parenthesis to PCI_BUILD_BDF macro
To: Roque Arcudia Hernandez <roqueh@google.com>, nabihestefan@google.com,
 mst@redhat.com, marcel.apfelbaum@gmail.com
Cc: qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20241101215923.3399311-1-roqueh@google.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241101215923.3399311-1-roqueh@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Sun, 03 Nov 2024 11:47:53 -0000

On 1/11/24 18:59, Roque Arcudia Hernandez wrote:
> The bus parameter in the macro PCI_BUILD_BDF is not surrounded by
> parenthesis. This can create a compile error when warnings are
> treated as errors or can potentially create runtime errors due to the
> operator precedence.
> 
> For instance:
> 
>   file.c:x:32: error: suggest parentheses around '-' inside '<<'
>   [-Werror=parentheses]
>     171 | uint16_t bdf = PCI_BUILD_BDF(a - b, sdev->devfn);
>         |                              ~~^~~
>   include/hw/pci/pci.h:19:41: note: in definition of macro
>   'PCI_BUILD_BDF'
>      19 | #define PCI_BUILD_BDF(bus, devfn)     ((bus << 8) | (devfn))
>         |                                         ^~~
>   cc1: all warnings being treated as errors
> 
> Signed-off-by: Roque Arcudia Hernandez <roqueh@google.com>
> Reviewed-by: Nabih Estefan <nabihestefan@google.com>
> ---
>   include/hw/pci/pci.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index 35d4fe0bbf..1daec974da 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -16,7 +16,7 @@ extern bool pci_available;
>   #define PCI_BUS_NUM(x)          (((x) >> 8) & 0xff)
>   #define PCI_SLOT(devfn)         (((devfn) >> 3) & 0x1f)
>   #define PCI_FUNC(devfn)         ((devfn) & 0x07)
> -#define PCI_BUILD_BDF(bus, devfn)     ((bus << 8) | (devfn))
> +#define PCI_BUILD_BDF(bus, devfn)     (((bus) << 8) | (devfn))
>   #define PCI_BDF_TO_DEVFN(x)     ((x) & 0xff)
>   #define PCI_BUS_MAX             256
>   #define PCI_DEVFN_MAX           256

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


