Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uFFOA-0007XT-JA
	for mharc-qemu-trivial@gnu.org; Wed, 14 May 2025 12:55:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uFFO8-0007WV-2e
 for qemu-trivial@nongnu.org; Wed, 14 May 2025 12:55:24 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uFFO5-0006Lh-Rg
 for qemu-trivial@nongnu.org; Wed, 14 May 2025 12:55:23 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43cf848528aso271175e9.2
 for <qemu-trivial@nongnu.org>; Wed, 14 May 2025 09:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747241719; x=1747846519; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5YmH83DL5qCu2KgAqq3e5Mot8qF1ZcGRJ0pxxN+rW0Y=;
 b=Cf8j+fxpdgPDcSLD48/qoR8ntiGmF+8zRbsmtbBmTjhAVeAuK7/6cunGJVpmW0JvL/
 oxsFkbikRTE7eJyBaYsBPNxGrsLvtXUwrzGDl2+TXDqiPkvMbS7g7L4j1j5fy+nD/0JL
 WOx55VLtKAHqsfIiIR7ibTjTHmW9frL/WcCjp4dOjX4PlpCc4c4sbmvJqKZTXx2eS/y1
 mw7eLkCcBJVk7lx/f46m6Y7DViwBUvuOkxRj8k72dL6dIavSOaDJCoTO35QpTMSsXNtu
 Sy3ZtupYnqXbPMgy9WDWBg/6d5x7wdDCcsmIeo6RIlaKD3kOmCzXJB+LFTBg5UTws3WI
 Q5wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747241719; x=1747846519;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5YmH83DL5qCu2KgAqq3e5Mot8qF1ZcGRJ0pxxN+rW0Y=;
 b=IfQcauMjkgpa2RqgBanS5+XxcPgCedOkj2tRRaNK+orAUictANEcOLknrx0nbgyQ5o
 f/SMqbNhF1mX+uzdbPbriuPajoGuQMWtmTNns+MV7w9fLyJJbbUl0ZNwSU3FvIdBrn+I
 9ymFmj/XzV9mEKT6/NxL97mhQUFb/weF131YdkQDy6HXwh5Rp2LjlK/XZgo7mmtOqZ7C
 qdP2P1cf6/uZ9XnhBvTb/TJZM6AIk/MMC7RykGHWE3HbL50BXBGqKxLFVNw6Ec8XeGSw
 k+Pll0GNU9GYwo+w8D9zLeKrV64HOSogdqFxlEel7LbbAkKh0qdibpYoXSTYjpdlD+uO
 JrFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVm4P2CVmS11EGUEqlGRPaXI937Ux4uToa6Mfybdy0xdb2URT1G1oTJOwVKUGXUU2MEgJ9uFqV5Kfo+/ic=@nongnu.org
X-Gm-Message-State: AOJu0Yw7sYGQd6o3j4P9GzuoTWtI02uAeVay10Vou7YyXiSJOUvMQaej
 B7zjilGRSIp5qO92apaFg1Av0fj+ox5QWWI+Nj0C01Nz0XNhsThGQPio3uKhwn0=
X-Gm-Gg: ASbGncvyqW925kZBV+2PCTccQMFc4S9b14Xe2cKNRj9obd9yWUBVSloO3aUTHXKlgAB
 VQflVOmQjF8PK0AMwWfTB/r8XlldvE8WQ8ikhMZ3S8Iq5PEyHpawIkwxUcgds8W83dD8DdtbRSY
 E1BJU4hPReD6xl48o+DAh3a2+RbNn12bLMidjKNQOAr6n6QiMeYniPqPPnx4zAsdlQTBnDRYsIr
 stv4NRSeL7WKqIgTs0KdVG4laYRaVrIxv3wrG+YGFV4RO3ixsTHF8Hvd6jX/SgW+jevjgMbPj8N
 BbGUYLgSdWDKjcqNEz/Sf2+bSoYbhk3WcIEARYnd8ZvHUdjQiiC4vO+yT/XI0gSF4zxnxp9VDR3
 y+aAGE8KEw+VjIVCIV3kuWWMCY16A
X-Google-Smtp-Source: AGHT+IFGTmOgrNZAMcWEtFGHGlA0YOqV/sL0anwCJgY5gjRcMmrErrxpuCAIcvrXcG2hbHEWuycqVA==
X-Received: by 2002:a05:600c:a42:b0:442:cd13:f15d with SMTP id
 5b1f17b1804b1-442f217a65fmr35862965e9.29.1747241719502; 
 Wed, 14 May 2025 09:55:19 -0700 (PDT)
Received: from [10.61.1.248] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f3369138sm40081985e9.8.2025.05.14.09.55.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 May 2025 09:55:19 -0700 (PDT)
Message-ID: <bb021456-83d4-4a7b-96fe-0ddc1c0fac7a@linaro.org>
Date: Wed, 14 May 2025 17:55:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] ui/console-vc: Consolidate OBJECT_DEFINE_SIMPLE_TYPE
To: Zhao Liu <zhao1.liu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
References: <20250514084957.2221975-1-zhao1.liu@intel.com>
 <20250514084957.2221975-10-zhao1.liu@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250514084957.2221975-10-zhao1.liu@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
X-List-Received-Date: Wed, 14 May 2025 16:55:24 -0000

On 14/5/25 10:49, Zhao Liu wrote:
> The QOM types of QemuTextConsole and QemuFixedTextConsole are declared
> by OBJECT_DECLARE_SIMPLE_TYPE, which means they don't need the class!
> 
> Therefore, use OBJECT_DEFINE_SIMPLE_TYPE to implement the type, then
> there's no need for class definition.
> 
> Cc: "Marc-André Lureau" <marcandre.lureau@redhat.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>   ui/console-vc.c | 14 ++++++++------
>   1 file changed, 8 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


