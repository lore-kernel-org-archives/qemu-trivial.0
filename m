Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uJWJB-0006yl-6S
	for mharc-qemu-trivial@gnu.org; Mon, 26 May 2025 07:47:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uJWJ0-0006xF-Rp
 for qemu-trivial@nongnu.org; Mon, 26 May 2025 07:47:49 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uJWIv-0004hZ-Ef
 for qemu-trivial@nongnu.org; Mon, 26 May 2025 07:47:46 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a375d758a0so1878997f8f.0
 for <qemu-trivial@nongnu.org>; Mon, 26 May 2025 04:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748260059; x=1748864859; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=B0UJsvc1+ALrk4fF/5yuavqKWybj/ok+fhSZ+b/4LvQ=;
 b=Qt3+jvtfY4b5ox4FQBrWioOpG/vLXELDh+4PquzI349WBmRhsk5LGr5S3dpLC+RIcU
 b0bWj38467kraDVTUyRtivXTp51EHoMjH64+jENYUzoQTLPGDyjxMr03j5DFO+pzHIpT
 WxDB2ZfQzWSvQN2fmymPapsK6UoQYQSWMRpRlaQMnX12Wag832BACGLykXBJWNbBKP9w
 SbSWKnPrJdNlx2iT48/e7ftyhTaAp5aqsbeq0wvXF5l3g/85KH6K4oZJZPwBBStDk8Ig
 4XxQORKRA9znsF0xxe1BYZcgo1OcOLqio03QFiVIgjtl4n2AjHeEzGmhYTPfq1JarR6r
 mbeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748260059; x=1748864859;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B0UJsvc1+ALrk4fF/5yuavqKWybj/ok+fhSZ+b/4LvQ=;
 b=uUhHy5Ebf9pNxXsAHoIIGW45KHTMpTGtJGABMEdiI2taY35Qc2DESsCtsZFafzF89J
 FvyXPsKUWkW44r6D2brdlERR20sHIzVLoQDNrvBUuRYbygb1epx86ovPIaPnoIy3UgV5
 Zy+JGDQoOPkeQuHn1aL9/pai+TrQLvLlbvrmFCUmjzYtVcDQ5QjA/bnOt3xHCVZ8nlJn
 iL3r9o7gTyesdUnkzt70g3GsiYB/CAzf3TuhAA/EU6XxXJx+Q+or/sJeI5efaNbmYR3Q
 7CIkf0lZUoo9l2EnBY1d4UiR64N8rakJZSiznv367WtZl40fZ5P8PJ9YOU5VLDo2uEzc
 F7gw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUG1P9fMuTBDnNCuxXBkTQ+cuwDOlk9GsCWXsnghZ7WS0+yO4LJxs0qJqHame/wpELGGY1a3v+fI2mu+A0=@nongnu.org
X-Gm-Message-State: AOJu0YypujTnAsn93cBgd0aN1EfzhG65C3M7+jkNFZIHZICVoGkaIN10
 dVTq6sdkCpnfypE3zVpkLoBGZgOiECmWSLhLzHj6i2qlASWYFqOJJJLNS7JVjeEEtPindUAyl/5
 ffOYXpUVU7Q==
X-Gm-Gg: ASbGncs+ahMpdcg/D40TiddIswaEefRD48ap93QkKmTliw5893W1cmPRl/O9eqYFEUJ
 Q5Ty20FaSyo4WaEhusrPQYuz5ukWvnGAJaZGDZAuDRn0GRkySIl19E4QyRQjd52lHJK8vWt2BEL
 e8C5NTrWkDhvVOZquY1avaxjNlSXLMOTxMLTUD2KHpXaWksG53TVoM1Bgww9DocSSg5VcfWM5Lg
 oKXVdidDIjeE10yEBhLFO9CH2V1Zqq60uJY+ipJAizBxRVnVx8s6e4ffboTpON/UpOFA4LPuJWz
 QpPOn5Yw/O78+5eERrdn8cUSWtABQkHMwATsy4cHeuc6tNhBAqH90OQvyoQa/tc3x3Ms25Wz2nW
 f2SRHqHeyQJCYLijsj18DIjzn
X-Google-Smtp-Source: AGHT+IGnGw0QDlccaPAPAShxxWmZQYunDaTHRF+NvLSFNEbUYRo6vZeIRO17FHC/cxxj59Ig8awPyQ==
X-Received: by 2002:a05:6000:4027:b0:39c:1f02:5409 with SMTP id
 ffacd0b85a97d-3a4cb4619camr6103639f8f.9.1748260058842; 
 Mon, 26 May 2025 04:47:38 -0700 (PDT)
Received: from [192.168.69.138] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4c73a4284sm8779513f8f.85.2025.05.26.04.47.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 May 2025 04:47:38 -0700 (PDT)
Message-ID: <5bb32949-e72b-406b-89ea-92eb44484beb@linaro.org>
Date: Mon, 26 May 2025 13:47:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/i386/tcg/helper-tcg: fix file references in
 comments
To: Fiona Ebner <f.ebner@proxmox.com>, qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, mjt@tls.msk.ru, laurent@vivier.eu,
 pbonzini@redhat.com, richard.henderson@linaro.org, eduardo@habkost.net
References: <20250526114447.1243840-1-f.ebner@proxmox.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250526114447.1243840-1-f.ebner@proxmox.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 26 May 2025 11:47:52 -0000

On 26/5/25 13:44, Fiona Ebner wrote:
> Commit 32cad1ffb8 ("include: Rename sysemu/ -> system/") renamed
> target/i386/tcg/sysemu => target/i386/tcg/system.
> 
> Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
> ---
>   target/i386/tcg/helper-tcg.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Thanks!

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


