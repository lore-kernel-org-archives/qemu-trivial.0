Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rVDlH-0000zj-7I
	for mharc-qemu-trivial@gnu.org; Wed, 31 Jan 2024 11:48:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rVDlF-0000xc-4o
 for qemu-trivial@nongnu.org; Wed, 31 Jan 2024 11:48:29 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rVDlD-00061W-Er
 for qemu-trivial@nongnu.org; Wed, 31 Jan 2024 11:48:28 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-33ae74e5394so2271747f8f.3
 for <qemu-trivial@nongnu.org>; Wed, 31 Jan 2024 08:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706719705; x=1707324505; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2nskXqNEhHmqlavcpzvsqzEMsIbp8GhJhLyco9Hf2mw=;
 b=LV6dEifbJ3kpILt0lAniQBr8OlCYPRzK9qSnczlmPtjIWqJw5WyTJ8DXj+SDFSpKYm
 m0NsGaL+MGo3enBt1SLZb7dm8eKvifW5F9yA7P6eVU/SynvltOSSDf06uMFmC9uyjaS5
 a119PdMKUL3N9VlL3Ysg6nv5uXDlMkN0eGUKQkLxES3Ug87gjmtxQbCLI/ktLiaach2I
 xPfBgBVZ7FVyVrDWjWncDGGeDulYFwHYFR7mhoFR1xE80ZvDdK2bC5m5XFFMX4+2aau8
 SVwqW1Wz+1PfbT/t9k0z9okOSkObWTqFu0zSVppt+QNKA7v0Ef0gL2Uo6gQwNMi/FnKL
 muEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706719705; x=1707324505;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2nskXqNEhHmqlavcpzvsqzEMsIbp8GhJhLyco9Hf2mw=;
 b=F6PO3wjzPixT1SvdHodcb9kNOcldXEF3FYMv6aHjwK5HyhhDuatQTLc9HCjEvo0IqQ
 UsBE85VDLnmDRU1ChVBcSxlcBW90UVO0igts9wvVbiYofmWxcm7kxMAIqwNJGDnJym8W
 4AMb37MqvIN/KZk6CYAA+5qcc8rfSTi75lDI5e6vn5aRkVfARhuCm+IHd8CzEMhl9eFX
 l/WU+9Kt2BCB6PK/CJayHf8QGUDyIvtHCppd/WUjC4d2L7k1Ab1DhBYbkyZy0rqREk0a
 RROENrkjbEK3md/5givr9tqbjKDSw7HcAyWSeelgaxP774pkyLkg3nJAKnVkHLRFd8cA
 qPXQ==
X-Gm-Message-State: AOJu0Yy3tX/baZF9hHARMWRL+e/NPIGhtcZCM87wbjZDzuNrOwLFsYtN
 gL1xE7A8Z514Em4bt94mapeWm2eUBMcJ9aocqpcqv1j5O7tlLOWV6Ss9tCH8U7E=
X-Google-Smtp-Source: AGHT+IF1rDD1wo5oBXNMDXWo6HAk5B7W2cSITYBdYTiO1F1oUhyLqqma2YnftaCXwomnEu/YgvMgCQ==
X-Received: by 2002:adf:ef44:0:b0:33a:e4de:9afd with SMTP id
 c4-20020adfef44000000b0033ae4de9afdmr1384917wrp.29.1706719705520; 
 Wed, 31 Jan 2024 08:48:25 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUUiyzCIXjjnggOZJBxU7e7STV2QPgwJW4NkJ+OE4QlQrvR5aviG+/boZELmd2pTFtpFOMK9rHiYgj3VaKCjMQWhIaQF51w9njwtHCmflM/HpXJS8OWi/9E8RrCqtK2ecqTOPhjeK3XXhmmHcOMfqq8L1wRtg1Z4MJ3wrwjC6PRO7cURpnM1ByVEhf1UyqGlq8Rlsl4
Received: from [10.228.24.192] ([84.55.155.224])
 by smtp.gmail.com with ESMTPSA id
 w6-20020a5d4046000000b0033b0d049c71sm664013wrp.54.2024.01.31.08.48.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jan 2024 08:48:24 -0800 (PST)
Message-ID: <cdb1c6cd-0095-4787-a740-17b42e061548@linaro.org>
Date: Wed, 31 Jan 2024 17:48:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/intc: Handle the error of IOAPICCommonClass.realize()
Content-Language: en-US
To: Zhao Liu <zhao1.liu@linux.intel.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>, Markus Armbruster <armbru@redhat.com>
References: <20240131142902.115964-1-zhao1.liu@linux.intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240131142902.115964-1-zhao1.liu@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 31 Jan 2024 16:48:29 -0000

Hi Zhao,

On 31/1/24 15:29, Zhao Liu wrote:
> From: Zhao Liu <zhao1.liu@intel.com>
> 
> IOAPICCommonClass implements its own private realize(), and this private
> realize() allows error.
> 
> Therefore, return directly if IOAPICCommonClass.realize() meets error.
> 
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>   hw/intc/ioapic_common.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/hw/intc/ioapic_common.c b/hw/intc/ioapic_common.c
> index cb9bf6214608..3772863377c2 100644
> --- a/hw/intc/ioapic_common.c
> +++ b/hw/intc/ioapic_common.c
> @@ -162,6 +162,9 @@ static void ioapic_common_realize(DeviceState *dev, Error **errp)
>   
>       info = IOAPIC_COMMON_GET_CLASS(s);
>       info->realize(dev, errp);
> +    if (*errp) {
> +        return;
> +    }

Could be clearer to deviate from DeviceRealize and let the
handler return a boolean:

-- >8 --
diff --git a/hw/intc/ioapic_internal.h b/hw/intc/ioapic_internal.h
index 37b8565539..9664bb3e00 100644
--- a/hw/intc/ioapic_internal.h
+++ b/hw/intc/ioapic_internal.h
@@ -92,3 +92,3 @@ struct IOAPICCommonClass {

-    DeviceRealize realize;
+    bool (*realize)(DeviceState *dev, Error **errp);
      DeviceUnrealize unrealize;
diff --git a/hw/i386/kvm/ioapic.c b/hw/i386/kvm/ioapic.c
index 409d0c8c76..96747ef2b8 100644
--- a/hw/i386/kvm/ioapic.c
+++ b/hw/i386/kvm/ioapic.c
@@ -121,3 +121,3 @@ static void kvm_ioapic_set_irq(void *opaque, int 
irq, int level)

-static void kvm_ioapic_realize(DeviceState *dev, Error **errp)
+static bool kvm_ioapic_realize(DeviceState *dev, Error **errp)
  {
@@ -133,2 +133,4 @@ static void kvm_ioapic_realize(DeviceState *dev, 
Error **errp)
      qdev_init_gpio_in(dev, kvm_ioapic_set_irq, IOAPIC_NUM_PINS);
+
+    return true;
  }
diff --git a/hw/intc/ioapic_common.c b/hw/intc/ioapic_common.c
index cb9bf62146..beab65be04 100644
--- a/hw/intc/ioapic_common.c
+++ b/hw/intc/ioapic_common.c
@@ -163,3 +163,5 @@ static void ioapic_common_realize(DeviceState *dev, 
Error **errp)
      info = IOAPIC_COMMON_GET_CLASS(s);
-    info->realize(dev, errp);
+    if (!info->realize(dev, errp)) {
+        return;
+    }

---

What do you think?

