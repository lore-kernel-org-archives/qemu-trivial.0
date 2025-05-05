Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uBq81-0003DG-FO
	for mharc-qemu-trivial@gnu.org; Mon, 05 May 2025 03:20:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uBq7z-0003D1-TB
 for qemu-trivial@nongnu.org; Mon, 05 May 2025 03:20:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uBq7x-0003eU-Sp
 for qemu-trivial@nongnu.org; Mon, 05 May 2025 03:20:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746429636;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b//fbySjHm3bLNfXSHOGOw1La097DJfwWu5YGhpcH0o=;
 b=gUuoNsmUSv+1ZtnOWVFMfetX5s6xdtQA5b2M9ZWZSULIlENVnPLvqM658YB9VnK0R+k9Tv
 uor3iLZjjua6OJS4qbF3e6C8pFG2DODKDUFX05b2DLNvd27FE/O/oKtsWzkg+hv33L+/4+
 +XoAPDH4Ejx7s7nRSj5raiVZPYdCMME=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-3-j8tMjA9_NUyl0zufSQ8_oQ-1; Mon, 05 May 2025 03:20:35 -0400
X-MC-Unique: j8tMjA9_NUyl0zufSQ8_oQ-1
X-Mimecast-MFC-AGG-ID: j8tMjA9_NUyl0zufSQ8_oQ_1746429634
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-ac28a2c7c48so370684966b.3
 for <qemu-trivial@nongnu.org>; Mon, 05 May 2025 00:20:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746429633; x=1747034433;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b//fbySjHm3bLNfXSHOGOw1La097DJfwWu5YGhpcH0o=;
 b=NRm6rPPFQNBAicGOO9o+hP31+Al+sZ5MDyCCXIpSxT4V/1o0jvyZe6PACrmVtaKmee
 U+baJq6UtoIx8UKRI1e0dmPGZHJ9Wwufl4cQ7QTHKJ3/DokL19tx3Qk0oruT13RvWy8R
 cgX1vPYD9vCEGlm7B5aoQsVNmg1hBP/PUObVIf0psAZRCcc3Zw32nHoIbVOO1mNuwquc
 4TOICjB3NpMfEdwJeWqjQWmfFS5xHbmpcxnkwaG2V1gTAhQYg+oPZhpxqTW9JGLbii0S
 IM7AMAqNaCmuB+pG1lZv38uIOmAV4KYFlAx2Lrf4B0Lj+ekp3hVp9nSYuewfZLgmwHn/
 kxFw==
X-Gm-Message-State: AOJu0Yy5YFctSQ5Ty9Mu/R/QGiG9E+o4zDf7EPUtZJzVom9p9IIp73QA
 +jy6XSs2slPuTYw/48bb+m7UmXdKfP5mvkpOaJuKVUJSVr4eMFR54525f75jC6WedrrofKOyho0
 VqQhjdsaz8ucZ1dUTtdIXqejab5hA2O0bcU4Jq3oV1ZbJSGZMtJHW6TIctGcPvs0=
X-Gm-Gg: ASbGncuN75LLbir9EX5AEYnxXr/EoruLa2spT38VrOMrQqyxEY+yETsA3c4F5/BFCwp
 9ispsWF1QhTYbnBAlrE2CegAdOw7o3Y3itAKpGSxDvxIjcSsFzP7gPZkRygNyNmHTBwZJ9WbHzW
 k+lRkwmAbbzjugRIsfTOoiiITqfQCFZ76ZiWLvU85gzRj6XSbwSZuysq0+8u3SmkuiMrS1kBbDK
 qGBChfHTAPkNbrmu1WiOQi6tutIfSQtn9AnglqNnXGw42VyoBpmiC8xFuiT0VI/+uxLzSBJhgmU
 M/JB7lqP2UTCoS7c2jp0I1x/N24GUa+3IiKldGEzrQK4gRlQFYfXdgIj5sU=
X-Received: by 2002:a17:907:7248:b0:ace:bf94:2d2e with SMTP id
 a640c23a62f3a-ad1a4b0fbbfmr572977666b.51.1746429633131; 
 Mon, 05 May 2025 00:20:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+OWmoDyFCF7MXWeB95vy1Sv1AFrs62hh705IW+Nh6PIBIwDP//xCnZpU4nohTUtdkg6ESxA==
X-Received: by 2002:a05:600c:1914:b0:43d:47e:3205 with SMTP id
 5b1f17b1804b1-441c48bca55mr37301895e9.11.1746429231369; 
 Mon, 05 May 2025 00:13:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441bc264e2dsm101857215e9.12.2025.05.05.00.13.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 May 2025 00:13:49 -0700 (PDT)
Message-ID: <b0faa0cf-8c68-4385-923c-e761b6582cc0@redhat.com>
Date: Mon, 5 May 2025 09:13:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH] hw/acpi/pcihp: Fix typo in function name
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, philmd@linaro.org, alex.bennee@linaro.org
References: <20250504215639.54860-10-gustavo.romero@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250504215639.54860-10-gustavo.romero@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xQtIwvnmp6AqVbZaYnX6TaUozZQ4VpC6T-28a6D7gdA_1746429634
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.411,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 05 May 2025 07:20:40 -0000



On 5/4/25 11:56 PM, Gustavo Romero wrote:
> Fix typo in QEMU's ACPI PCI hotplug API function name that checks
> whether a given bus is hotplug-capable.
>
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

For awareness, there is a similar typo in pci-port.
see
https://lore.kernel.org/all/20250428102628.378046-2-eric.auger@redhat.com/

another trivial indentation fix in generic_event_device.c
https://lore.kernel.org/all/20250428102628.378046-3-eric.auger@redhat.com/

Eric




> ---
>  hw/acpi/acpi-pci-hotplug-stub.c | 2 +-
>  hw/acpi/ich9.c                  | 2 +-
>  hw/acpi/pcihp.c                 | 2 +-
>  hw/acpi/piix4.c                 | 2 +-
>  include/hw/acpi/pcihp.h         | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/hw/acpi/acpi-pci-hotplug-stub.c b/hw/acpi/acpi-pci-hotplug-stub.c
> index b67b4a92da..b7bc6e40a1 100644
> --- a/hw/acpi/acpi-pci-hotplug-stub.c
> +++ b/hw/acpi/acpi-pci-hotplug-stub.c
> @@ -34,7 +34,7 @@ void acpi_pcihp_reset(AcpiPciHpState *s)
>  {
>  }
>  
> -bool acpi_pcihp_is_hotpluggbale_bus(AcpiPciHpState *s, BusState *bus)
> +bool acpi_pcihp_is_hotpluggable_bus(AcpiPciHpState *s, BusState *bus)
>  {
>      return true;
>  }
> diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
> index c7a735bf64..a07c9d115b 100644
> --- a/hw/acpi/ich9.c
> +++ b/hw/acpi/ich9.c
> @@ -570,7 +570,7 @@ void ich9_pm_device_unplug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
>  bool ich9_pm_is_hotpluggable_bus(HotplugHandler *hotplug_dev, BusState *bus)
>  {
>      ICH9LPCState *lpc = ICH9_LPC_DEVICE(hotplug_dev);
> -    return acpi_pcihp_is_hotpluggbale_bus(&lpc->pm.acpi_pci_hotplug, bus);
> +    return acpi_pcihp_is_hotpluggable_bus(&lpc->pm.acpi_pci_hotplug, bus);
>  }
>  
>  void ich9_pm_ospm_status(AcpiDeviceIf *adev, ACPIOSTInfoList ***list)
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index 5f79c9016b..aac90013d4 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -371,7 +371,7 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
>      acpi_send_event(DEVICE(hotplug_dev), ACPI_PCI_HOTPLUG_STATUS);
>  }
>  
> -bool acpi_pcihp_is_hotpluggbale_bus(AcpiPciHpState *s, BusState *bus)
> +bool acpi_pcihp_is_hotpluggable_bus(AcpiPciHpState *s, BusState *bus)
>  {
>      Object *o = OBJECT(bus->parent);
>  
> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> index b16d45f03e..d98b80df6d 100644
> --- a/hw/acpi/piix4.c
> +++ b/hw/acpi/piix4.c
> @@ -406,7 +406,7 @@ static bool piix4_is_hotpluggable_bus(HotplugHandler *hotplug_dev,
>                                        BusState *bus)
>  {
>      PIIX4PMState *s = PIIX4_PM(hotplug_dev);
> -    return acpi_pcihp_is_hotpluggbale_bus(&s->acpi_pci_hotplug, bus);
> +    return acpi_pcihp_is_hotpluggable_bus(&s->acpi_pci_hotplug, bus);
>  }
>  
>  static void piix4_pm_machine_ready(Notifier *n, void *opaque)
> diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
> index ac21a95913..a97904bada 100644
> --- a/include/hw/acpi/pcihp.h
> +++ b/include/hw/acpi/pcihp.h
> @@ -58,7 +58,7 @@ typedef struct AcpiPciHpState {
>  void acpi_pcihp_init(Object *owner, AcpiPciHpState *, PCIBus *root,
>                       MemoryRegion *io, uint16_t io_base);
>  
> -bool acpi_pcihp_is_hotpluggbale_bus(AcpiPciHpState *s, BusState *bus);
> +bool acpi_pcihp_is_hotpluggable_bus(AcpiPciHpState *s, BusState *bus);
>  void acpi_pcihp_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>                                     DeviceState *dev, Error **errp);
>  void acpi_pcihp_device_plug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,


