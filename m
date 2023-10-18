Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qt6Ez-0001u0-Qo
	for mharc-qemu-trivial@gnu.org; Wed, 18 Oct 2023 09:05:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qt6Eq-0001no-Q4
 for qemu-trivial@nongnu.org; Wed, 18 Oct 2023 09:05:36 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qt6Ep-0007eA-2q
 for qemu-trivial@nongnu.org; Wed, 18 Oct 2023 09:05:28 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9ae2cc4d17eso1102323266b.1
 for <qemu-trivial@nongnu.org>; Wed, 18 Oct 2023 06:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697634324; x=1698239124; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qJJBz23ZKLaNGx5toSeISCczR8yY7igwrYHbxAA2MSM=;
 b=d5EEGEjIR2jMu3U5GWlOLnbKyo1nyHlji0WdHomjNXSmulDwJPAn4RCIStJa9GzHDu
 NP/HEV6oUfJmICJ21g9RPFsJgG2sgv1hQ3C6o36KfoACm6mWu7FdwAYBYXqBHULur7uZ
 dwa2rvs26JO5giqT1A1ysBH9rXNw5F0rgLOoSy/q6ZwLku/ndelFkIL1c5/ICUaBynat
 xM8hxxNSp6qrOG0OBu8D5B6rZjt9f1C7ksbfLiORgTqpYG+wHv9w9sx4NW0vO/2UbkO2
 K2vS6wkMO6EGNyfkzy4kTn64d1F2QYGoEGUIhBAY4EUfE0GFpGEw0xXOp7vQolAgKQ0R
 EYFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697634324; x=1698239124;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qJJBz23ZKLaNGx5toSeISCczR8yY7igwrYHbxAA2MSM=;
 b=VXA2r8CY3odL3ZmROJU5dRskYoE6/hdUcrhtecNhMQopToX1nSzSwnCWRxXvNhoQkn
 nGS1tA+CExIY3lx3Expv9RUgY5xaP+XP9rhEk3PqfOXO7R0B6OYSZwzWcb83P5fO8lGk
 zhMOY0FV4g7jZNZ5gBGYdydRf1hQgBgUMgHkt3R3b/ULH8NV2jINzw32RO43FttHBjKx
 aapRpFgVusS/seEV0Cxh6so0vHbIXAbtjL1xflsV+JA3bZx60EqemR1pf3ehUXG87NUo
 AylHHBUn7nGyBKEQKF1+IJEYrbgNXEB1gBkK1nq0ok0w4jMHa1ojnjt5FwcqieMqw3p+
 GMGg==
X-Gm-Message-State: AOJu0Yw8KceG5vwaGCrAmngalO4TSkMkCYEHgQScOdbzqu5tzcaLi1Qs
 6//MiWn5G6BQQ3o7/mD8L5fbdA==
X-Google-Smtp-Source: AGHT+IHghcbF56wUGCZ8FKx7R395n68DgaRn8qQwngyRQeLq9k2LoKgY1QS0a61oFjAVTI9Qmvmt5A==
X-Received: by 2002:a17:907:26cc:b0:9c4:4b20:44a4 with SMTP id
 bp12-20020a17090726cc00b009c44b2044a4mr4161997ejc.48.1697634324392; 
 Wed, 18 Oct 2023 06:05:24 -0700 (PDT)
Received: from [192.168.69.115]
 (gyl59-h01-176-171-218-149.dsl.sta.abo.bbox.fr. [176.171.218.149])
 by smtp.gmail.com with ESMTPSA id
 i27-20020a170906115b00b009b2ba067b37sm1588733eja.202.2023.10.18.06.05.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Oct 2023 06:05:23 -0700 (PDT)
Message-ID: <231e91da-5db6-33dd-cfd4-4b11b06089cf@linaro.org>
Date: Wed, 18 Oct 2023 15:05:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH] MAINTAINERS: Add include/hw/intc/loongson_liointc.h to
 the Loongson-3 virt section
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Huacai Chen <chenhuacai@kernel.org>
Cc: qemu-trivial@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Song Gao <gaosong@loongson.cn>
References: <20231017153345.233807-1-thuth@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231017153345.233807-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
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
X-List-Received-Date: Wed, 18 Oct 2023 13:05:36 -0000

On 17/10/23 17:33, Thomas Huth wrote:
> The corresponding .c file is already listed here, so we should
> mention the header here, too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


