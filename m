Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppUlU-0006DU-6d
	for mharc-qemu-trivial@gnu.org; Thu, 20 Apr 2023 09:56:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppUlS-0006Co-HX
 for qemu-trivial@nongnu.org; Thu, 20 Apr 2023 09:55:58 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppUlR-0004TC-25
 for qemu-trivial@nongnu.org; Thu, 20 Apr 2023 09:55:58 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f09b4a156eso4842735e9.3
 for <qemu-trivial@nongnu.org>; Thu, 20 Apr 2023 06:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681998955; x=1684590955;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QslkW15XHWwi59gvzpn1Iwdj7S4xILhuBQRasEn3xDU=;
 b=hm45BxXFVtzp1ZJiVFok37BbgP90muekG+Gs1I02FrAnSpT6w2kXyP8QzdzadhU8Xt
 AZZUQQWB5Vxj3FUsWy4Hd9Koyu7xlxuLIuWuyyBDmTetZ7M3YqEDDS5xIRQQcQBBzk1L
 LUHil37w5KrURLHyvisFTMUFc5l5odfYGye+PP4bL1PMCn4G5i2V1dsc5ngJNvfMy/bg
 Thdjwr5A9o8LC7jniXw2HR9YZt5wMIKjSwGceOj2EW2V5mpKycXeni1VoS+1wKUZKALk
 jmdh+cTY8AyeALVZJIooDmhpkFwVMy1KhNTNHNDcmB/jBUxtEeAoXIxIn+A2KUIE6nie
 EPcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681998955; x=1684590955;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QslkW15XHWwi59gvzpn1Iwdj7S4xILhuBQRasEn3xDU=;
 b=BvzNrfjlDwS2XjQ/m22c6bOLPYERpdg33wcW57KtRPfNK0V8q6eZzG2VQBLcMhQB2j
 z1Z4sw/BiZ5Fgzf2zIx08yA1nybTdq3/HcgDj7Q/VrEAeKIL0f7ylYZdDwovfPVUH1KA
 qxwcblWpg0d105tvYVKu/N4W4HIV6xh+1/3DU6a5E+xVPMa6IXastN8Hy04WD06PZcMC
 38HPLmclE5ZA0eX074N2evpmas8Cj1fwZd5tH9UGyPPFW2OX6ImSzgBqfGlv5nZy4Sq0
 6gwTQ9lAzrj5kYxrDYae18xlq4WMsZSilKWx5wU3lWS3YLkGrLQ0W2egOf1pQYw8coU2
 JFZg==
X-Gm-Message-State: AAQBX9dyRbCCzVe85EE5R6qsjuazb/hzsMfCcVsPoJnGNDONnsBhNtzB
 4/p1+BESUBLGW5vmW9neSjC0zg==
X-Google-Smtp-Source: AKy350YF69pw8OtT1ib1Uq1JKXddfdmcoEl3IBbeY5SAum/JbViA2002SNkiNZ2q/ptn/uupCxSYQw==
X-Received: by 2002:a5d:4f8e:0:b0:2fb:2567:bc1 with SMTP id
 d14-20020a5d4f8e000000b002fb25670bc1mr1537576wru.8.1681998955537; 
 Thu, 20 Apr 2023 06:55:55 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m2-20020a056000008200b002f53fa16239sm1989669wrx.103.2023.04.20.06.55.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 06:55:55 -0700 (PDT)
Message-ID: <30f1ca18-7289-5bfd-7990-37610b7a2dba@linaro.org>
Date: Thu, 20 Apr 2023 15:55:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH] hw/rdma: VMW_PVRDMA should depend on VMXNET3_PCI
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>
Cc: qemu-trivial@nongnu.org
References: <20230419111337.651673-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230419111337.651673-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.669,
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
X-List-Received-Date: Thu, 20 Apr 2023 13:55:58 -0000

On 19/4/23 13:13, Thomas Huth wrote:
> The "pvrdma" device is only usable in conjunction with the "vmxnet3"
> NIC - see the check for TYPE_VMXNET3 in pvrdma_realize().
> 
> By adding this dependency, the amount of total files that have to
> be compiled for a configuration with all targets decreases by 64
> files (!), since the rdma code is marked as target specific and thus
> got recompiled for all targets that enable PCI so far.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   hw/rdma/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


