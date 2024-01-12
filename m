Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rOJfK-00032l-Bu
	for mharc-qemu-trivial@gnu.org; Fri, 12 Jan 2024 10:41:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rOJfI-00032I-RE
 for qemu-trivial@nongnu.org; Fri, 12 Jan 2024 10:41:48 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rOJfG-0004i4-PH
 for qemu-trivial@nongnu.org; Fri, 12 Jan 2024 10:41:48 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40e5afc18f5so23859775e9.3
 for <qemu-trivial@nongnu.org>; Fri, 12 Jan 2024 07:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705074105; x=1705678905; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FkAdFARUeW02sluvd0pjbbd0wVVMZqgh09x/jMwH0uE=;
 b=LIDBlqzEkFrLFWXA1Gie6prjY0ejW8n8M0YSGuFV1a6mT9L5q3bv3jnCiK2sxWwPaK
 PTZPdWaPrMeJ0fJy286jG9DhWzWwdNNka0nJqGa+GvlM66WosHHl1TPkpvoU7tfrF6Di
 +otaizSNcFgMPLWSmysjflc9mXVkwDnsENZeptMrfPhTMEIM1OCZO6qV5uyBdhmdOgvO
 DS78em0ra9qI9N6Hz5RK0zCJDL5TwoUxWKtscuNuQT3um1nXhaUBS+C42v0fGj/LVIPe
 gJMx0pBvLV6M/ofdBa/O61K6omDmyC/0fvi7tpuySxiS+1HlnlJWDdb/sECwaA8ZAVp9
 sB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705074105; x=1705678905;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FkAdFARUeW02sluvd0pjbbd0wVVMZqgh09x/jMwH0uE=;
 b=nUWPmoqbxykOMkRA3p1/35CsKDMerJhmO+T5l1pudjEosBP0ngcNSIUAOHWPFmUs+E
 XP+orLbbHBhg8z+LLJufVvYe5fCfTqvgZ3JN8uN5V9tlZ73IFZ5ekwcD2YnN0Sq69vVm
 PJDvIGG7mvr1X+8Ui1z7QuoJuok0Yuk3CLQLMKqf93X1aBrXRFZnA+z7nSAoy+2jvUKP
 +xjQTADgYF1zGngNYBrKrXFLxbljTec9RV+1TsQV5YPHVy1PfQT9cIslLMSLrSfgIBUu
 dB2v+Hr9YgwWh8Rw6i2c/k4xcQ+0SgSGDnmTWZR/yTkasxswlKUS5B2apdowuE0pu4LM
 JSpg==
X-Gm-Message-State: AOJu0YzwUyjouT8krtP6WvQ/gyYuY+9bwTgNbPYTIpmICkGIB6akv53E
 AimdztIfGbLBSaH//F1Njf14+flljoVPDg==
X-Google-Smtp-Source: AGHT+IFyrEWZiIFVI/FRoWyeiKx7WehsBzuKskobNw7wOiSJQ+odd/CJzyXOq0jzR9FDOZrHOKyPTg==
X-Received: by 2002:a05:600c:1c0a:b0:40d:5ca1:80bc with SMTP id
 j10-20020a05600c1c0a00b0040d5ca180bcmr877119wms.107.1705074105172; 
 Fri, 12 Jan 2024 07:41:45 -0800 (PST)
Received: from [192.168.69.100] ([176.187.202.145])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a05600c469000b0040e39cbf2a4sm10220924wmo.42.2024.01.12.07.41.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jan 2024 07:41:44 -0800 (PST)
Message-ID: <ed2de2fd-7c94-4bfc-973d-7f7cba90d05b@linaro.org>
Date: Fri, 12 Jan 2024 16:41:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Update Raphael Norwitz email
Content-Language: en-US
To: Raphael Norwitz <raphael.norwitz@nutanix.com>, qemu-devel@nongnu.org,
 mst@redhat.com
Cc: raphael.s.norwitz@gmail.com, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20240111192846.111699-1-raphael.norwitz@nutanix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240111192846.111699-1-raphael.norwitz@nutanix.com>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 12 Jan 2024 15:41:49 -0000

On 11/1/24 20:28, Raphael Norwitz wrote:
> I will be leaving Nutanix so updating my email in MAINTAINERS to my
> personal email for now.
> 
> Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


