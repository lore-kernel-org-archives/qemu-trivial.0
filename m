Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p6gWp-0003l5-R6
	for mharc-qemu-trivial@gnu.org; Sat, 17 Dec 2022 18:23:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6gWo-0003kn-HA
 for qemu-trivial@nongnu.org; Sat, 17 Dec 2022 18:23:38 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6gWk-0002dC-S7
 for qemu-trivial@nongnu.org; Sat, 17 Dec 2022 18:23:38 -0500
Received: by mail-ej1-x630.google.com with SMTP id ud5so13961717ejc.4
 for <qemu-trivial@nongnu.org>; Sat, 17 Dec 2022 15:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HfXav//8T82iCnQiklTOmg8jHsb0owctZLmTtuC27f8=;
 b=OYU0AnogR9HbbI7515BfgaqEQMLWxR55bDmY0cNa+sMCxbK7S+NtRb2IwZmehs1nqJ
 OjDYvBcYiG93/9pmVsmY/g9dnTCytnJm+qvKEGxX5GK8/ayVR1daU9VUL60PJL2bpvFn
 yW1XiMmtomFnFp/yHOL6lEO61+wXJD9YKqk733ZXoSUKqRfNVUVBgl4AGOvdriXlrFKh
 DWjXC2Sz+ePH7LRe2QTWDDhBrrA1l2CLET5YFI/UeMgdlDGNPEXnmc3jRgZg1ZmSNu+q
 o0A+lIWD4GnXN9SA9wC7zs6bFKBAs7rrYI0Bh8QrQ0aMhYubF5QL/0LLehNjunWuOx/4
 lYzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HfXav//8T82iCnQiklTOmg8jHsb0owctZLmTtuC27f8=;
 b=W3vjrcBpoYXwaLb38D/KUosHWnbScMICOcJes8npMOArOqEDyLfB2nxeqh/MCeJgkX
 l2QYs7DzMtcWttkFgLK8Xe2cuBdW+wnelD6VtFAhM299CQGI5WCCFiVmnGT96mUaB/7E
 nXin8ORyZdX/txo6fGic1hdK2wHP5zpDxJDi3bmh+ZkrxDZ6S8fcD4Z40RvjsAw9sXeS
 OAu1LDYZXLxrGMUGEpu1Jzyci+EE+ChnhB2FQKhHa/nbyai1xEl2F4mL89UskJ2NgDHG
 1z50gwgTh8a3UosG5Ycu9W3UUpapjoM9OODZVQrIx5SSIHQdpK9yee2Sn6p74NdILKW6
 KBnw==
X-Gm-Message-State: ANoB5pmj9LwMHSPeJaY6awG5xXf94r6NoXRUVU55Nq8zmnu8CEXrrziq
 OGrvW1sVtZV6huu39jljInX22g==
X-Google-Smtp-Source: AA0mqf5o0xVjshIrEY3F8ADCm2FYU+vpQV9Dp6wMXS+vE4FM+wmghqBozXXe9I/M1VHRWTLejiO2Pg==
X-Received: by 2002:a17:906:5e07:b0:7c1:22a6:818e with SMTP id
 n7-20020a1709065e0700b007c122a6818emr29987536eju.24.1671319411471; 
 Sat, 17 Dec 2022 15:23:31 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 mc1-20020a170906eb4100b007c4f9bb250fsm2488204ejb.74.2022.12.17.15.23.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Dec 2022 15:23:30 -0800 (PST)
Message-ID: <5bd06de0-f136-edcb-c978-d27e97c0d6c2@linaro.org>
Date: Sun, 18 Dec 2022 00:23:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v2 4/7] hw/acpi/Kconfig: Add missing dependencies to
 ACPI_PIIX4
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-trivial@nongnu.org,
 Ani Sinha <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20221216130355.41667-1-shentey@gmail.com>
 <20221216130355.41667-5-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221216130355.41667-5-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Sat, 17 Dec 2022 23:23:38 -0000

On 16/12/22 14:03, Bernhard Beschow wrote:
> piix4_pm_realize() uses apm_init() and pm_smbus_init(), so both APM and
> ACPI_SMBUS are provided by the device model managed by ACPI_PIIX4.
> 
> The ACPIREGS are also provided by ACPI_PIIX4, so needs to select ACPI.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/acpi/Kconfig | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


