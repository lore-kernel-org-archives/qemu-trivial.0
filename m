Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qt6e5-0007si-GL
	for mharc-qemu-trivial@gnu.org; Wed, 18 Oct 2023 09:31:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qt6e0-0007hw-1y
 for qemu-trivial@nongnu.org; Wed, 18 Oct 2023 09:31:31 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qt6dx-0004kI-Ie
 for qemu-trivial@nongnu.org; Wed, 18 Oct 2023 09:31:27 -0400
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-507c5249d55so1788125e87.3
 for <qemu-trivial@nongnu.org>; Wed, 18 Oct 2023 06:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697635884; x=1698240684; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fBk/AjaKXtg/3Cadooq/dQVl7/DOz/dAP5kScFSNmWc=;
 b=of69JM1oVBiO75ATbpKdHXA4eBv8VaJ0MisgGaLLOjgvy29uhJf3v3wQbLowpJ/WsY
 6/n5leuYZzvut3E3Myb+fk60/Gcb9ReYCsrSW6KS/Q20BEW/9y4EQHgBhUnkuk1eo31O
 vGu37exCPbgtoGNnVqrh684Z9IO2Z36Pu4D14o3M4Mq9PbWjG6GieIDJbj0WXrLhIx7+
 yeDa3Dv4PMptbIUj6bq3rcGP7MntbVf/wEZ31LgiRXpTbNIeRNuQpeDGu+BcHWdVspOw
 a00Y6/YkggN6wSnX5qETBhpvqXEVGOLQTKEkWpI8qFTmaJrWpIgSk1TrlawKUdR6ND0O
 MgfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697635884; x=1698240684;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fBk/AjaKXtg/3Cadooq/dQVl7/DOz/dAP5kScFSNmWc=;
 b=daT7ZFxgvY7Pjn4q1jZYF4r7nexV/wLLdcHNiFXnpIfPvMp8FsFfd4+pMfqRwB03fE
 M1dVm5ydL1mWs0jclEjtS0qD4k5/iDAqFgQsb69snwhbHSIRGh7BMhvexln+ETLvx9VC
 U7K+mqbCBkaG7Ncy8ULWDWr14ou91ZW2NnbM232/2Q90MOFViJ1Y9dlAWi+6mC4F/nun
 wqcho92qBkgW6x5VZoM4htaG78Zr52RUVhSRIiWn2TRaKCCM4+mCSkKO+TFBD5m4ajfe
 +D2hTgSCjWpN3aOrtMUBzrIvGD96nGMayMEAOkxKu03WIqM3EWMF2I7zYImEjEs/PqQ6
 n+2g==
X-Gm-Message-State: AOJu0Ywt8vJVr9aOU69fccA+n/0CZ+z3eYmMEy7D2UK9KY+Og+Oc7ExY
 Pt7+OjPVhArDb/mx+U+kXK0t3g==
X-Google-Smtp-Source: AGHT+IEjkU6WOf7I/JW3FatBUlF6eEuhf0csyBXUSIjcfWng9BiI7tYYPpRIY56LttAFzQ7ddcNbAw==
X-Received: by 2002:a05:6512:3195:b0:503:34b8:20b with SMTP id
 i21-20020a056512319500b0050334b8020bmr5379788lfe.65.1697635884004; 
 Wed, 18 Oct 2023 06:31:24 -0700 (PDT)
Received: from [192.168.69.115]
 (gyl59-h01-176-171-218-149.dsl.sta.abo.bbox.fr. [176.171.218.149])
 by smtp.gmail.com with ESMTPSA id
 f19-20020adfb613000000b003232380ffd7sm2105895wre.102.2023.10.18.06.31.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Oct 2023 06:31:23 -0700 (PDT)
Message-ID: <fc662ca4-9d74-ca37-f65b-4d852f1eb1ee@linaro.org>
Date: Wed, 18 Oct 2023 15:31:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH] MAINTAINERS: Add docs/devel/ebpf_rss.rst to the EBPF
 section
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>
Cc: qemu-trivial@nongnu.org, Andrew Melnychenko <andrew@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>
References: <20231017151740.213679-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231017151740.213679-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x136.google.com
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
X-List-Received-Date: Wed, 18 Oct 2023 13:31:32 -0000

On 17/10/23 17:17, Thomas Huth wrote:
> This doc file obviously belongs to the EBPF section.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



