Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qnwoH-0007Ox-3l
	for mharc-qemu-trivial@gnu.org; Wed, 04 Oct 2023 04:00:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qnwnw-00077l-TV
 for qemu-trivial@nongnu.org; Wed, 04 Oct 2023 04:00:28 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qnwnp-0006gv-GR
 for qemu-trivial@nongnu.org; Wed, 04 Oct 2023 04:00:24 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1c877f27e8fso2174925ad.1
 for <qemu-trivial@nongnu.org>; Wed, 04 Oct 2023 01:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696406415; x=1697011215; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=P2n0Tj5uTP43siy5jIvpxrSU/McbFXiYVOrhZy/joW4=;
 b=mqcQqAmryOkAzUerc/7ijy4IN8X/yNHIKoALsQ0smOYDz1HIM2HCEKtzYn3M1D7+Ie
 BBWLSDfo9oK6fLXEN6kiN15U0Uo0/lCgCNYwJbpirBRiuQiJr5eCvNZuxpfrmapRRvBc
 YSfS7Zee4bH23umJQC0/PMWIMCx6m9Yv16V4Db10yyU0N/0jDJSAtA3WRYiP+SVLXFd1
 SRHHNvMKPGdDKjD9bpjLAuO9xHmo9JbCpacPC9jcxCClipvY5fHnL/OYckWod64BHL2a
 XzniGgY/mrMUaMdopxldex5LkR9OiWVLFCA6viyZ2QzuUGkpG2Xvi+0aOTu2/J0brdvx
 fy2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696406415; x=1697011215;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P2n0Tj5uTP43siy5jIvpxrSU/McbFXiYVOrhZy/joW4=;
 b=I6iUAFKsg2NGucdswR1XdidT86HqlnyKb1ZoO3nFB7NmNu6pSVF7VgE8s/4g4J3ANk
 sC1Wp8RhyUEC72W54TMBxAQyWpPKKtIW6uuRrR1RFe7oM7+X76bfAsdq+yIfU2GxKwsK
 Mcr6vmdnfT/lPYK9sgCboSU7/zwPGVeFre+VOhs7LqU1WHSSOFDLwZaDTTUem15UPOmu
 xcQ+5nNIA5K+gmNOTNniShL6nij72HtaCL41vEnGorg6XJx9rR9G/D7VfVpwJq5PqP+g
 szVXM18AiN1g3x1IXZUCvl6aMQxN7yQRwexSeGxh68ljiGmdwJSG3qe5R6TtM84wBeCX
 vPxQ==
X-Gm-Message-State: AOJu0YyNPjDMwjOQ2ghW30T6oJ3qcX+hYMZY8RyXuPb5sei/mL56EBL/
 s7ZN7SXUbFCJ3RKxbM433sv70Q==
X-Google-Smtp-Source: AGHT+IGMmkhA5t9W6dkhuQREkoQsqCZlhou+hPid8MCXqDvTOGZuqxZNY//g1cQWUTW7N1eJQoZQUw==
X-Received: by 2002:a17:902:ec91:b0:1bf:1367:b7fb with SMTP id
 x17-20020a170902ec9100b001bf1367b7fbmr2039583plg.46.1696406414852; 
 Wed, 04 Oct 2023 01:00:14 -0700 (PDT)
Received: from [192.168.69.115] (5ep85-h01-176-173-163-52.dslam.bbox.fr.
 [176.173.163.52]) by smtp.gmail.com with ESMTPSA id
 g11-20020a1709026b4b00b001c6092d35b9sm2977354plt.85.2023.10.04.01.00.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Oct 2023 01:00:14 -0700 (PDT)
Message-ID: <47497d62-4b4e-1226-2b4c-6e75fd8e4554@linaro.org>
Date: Wed, 4 Oct 2023 10:00:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH] hw/virtio/virtio-pci: Avoid compiler warning with -Wshadow
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-trivial@nongnu.org
References: <20231004075536.48219-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231004075536.48219-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=philmd@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 04 Oct 2023 08:00:38 -0000

On 4/10/23 09:55, Thomas Huth wrote:
> "len" is used as parameter of the function virtio_write_config()
> and as a local variable, so this causes a compiler warning
> when compiling with "-Wshadow" and can be confusing for the reader.
> Rename the local variable to "caplen" to avoid this problem.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   hw/virtio/virtio-pci.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


