Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qwJYj-0000dC-28
	for mharc-qemu-trivial@gnu.org; Fri, 27 Oct 2023 05:55:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qwJYd-0000cU-D4
 for qemu-trivial@nongnu.org; Fri, 27 Oct 2023 05:55:12 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qwJYY-0007Tq-0A
 for qemu-trivial@nongnu.org; Fri, 27 Oct 2023 05:55:11 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40859c464daso15092205e9.1
 for <qemu-trivial@nongnu.org>; Fri, 27 Oct 2023 02:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698400503; x=1699005303; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lmrx3N8BQfY5cIOwVkYnGDdfaIk0C8Bhjm/IN+yamc0=;
 b=FqYD3kb1Rk5/hUkhjBEArqvARIT01mQjcNjQY8vo+c5iH+79+ClxAHHG8mHfspvnk8
 1zM34V5AvKKBeORg6xV8ycTCn6rOQbo1mlwYwnSY0MuMvN3V3d6PwHikEychBKXkrBML
 7DkjRBVYmSDApO54jUAL2SUzsjBOunEHjKOSEU8hjjj2+mzCfB7bUXYrLRr2CJb6HeEI
 BvfdQhgbl/2knx5BQsrrbUGZiXphurNq5ATL53jCJajeXjA2XB2wlw4okxx6BAE8FxoL
 2ViABmo/OB0OaYh0WtbqwtPVnBj6PB4BHGIw3v2bidB/kz24hzQ6lJBTiW5YBKeLvp3m
 XZhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698400503; x=1699005303;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lmrx3N8BQfY5cIOwVkYnGDdfaIk0C8Bhjm/IN+yamc0=;
 b=svXk2RJ9UdKzso74CtO/Oioz8MUhLCATGKnDMnQ5pcWt+C+sOLAQuAXCy4ZIn65m7s
 5w81mRnAo9Lm6nTrugIgF6yk4HoI4atq4rXQWFSayvE6hediMQOxXJaopcD9p7U0ByAD
 EsdximQSdPJC02iLGIFNHDfElmYURRq3i3idLxDap0K4c3O03Tm+W68ub4YnCK3KrEAZ
 wUe6kR/FKNr0S7bShOZkPmOTArb+gXunTp7SWglHc8iy8ZsFsCbyjhB8mGA5Xi7Mf8UP
 IXpSVrJ105FJErme+RtwADfiNfI/Raegg9cJIoBk1aIhOYRMhzMjUurZ7t/NExTw57Nz
 4EAw==
X-Gm-Message-State: AOJu0YypSpx8Vd2hA+63iTis7jBc5ZQ25wkGx6Lmx52bkkFcJ6yPiRBN
 DfcgS2czL/R1veqqmSrdBd658A==
X-Google-Smtp-Source: AGHT+IGJYLOKle8Z13RfAI2jh8tIdAuO122bg+da/6JqPctvVFuSVTA6rKbuX/wnTkca283M6T5tyg==
X-Received: by 2002:a05:600c:3c81:b0:401:bcd9:4871 with SMTP id
 bg1-20020a05600c3c8100b00401bcd94871mr2118505wmb.21.1698400503605; 
 Fri, 27 Oct 2023 02:55:03 -0700 (PDT)
Received: from [192.168.69.115] ([176.171.220.131])
 by smtp.gmail.com with ESMTPSA id
 p21-20020a05600c431500b003fe61c33df5sm4636057wme.3.2023.10.27.02.55.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Oct 2023 02:55:03 -0700 (PDT)
Message-ID: <ea963d50-b0a6-d973-6b66-bbb58068d3f8@linaro.org>
Date: Fri, 27 Oct 2023 11:55:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH] MAINTAINERS: Add the can documenation file to the CAN
 section
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>, Vikram Garhwal <fnu.vikram@xilinx.com>
Cc: qemu-trivial@nongnu.org
References: <20231027060931.242491-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231027060931.242491-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
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
X-List-Received-Date: Fri, 27 Oct 2023 09:55:12 -0000

On 27/10/23 08:09, Thomas Huth wrote:
> Add can.rst to the corresponding section in MAINTAINERS, so that
> the maintainers get CC:-ed on corresponding patches.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)

Since I'm preparing a PR, I'm queuing this patch using
"Add the CAN documentation file to the CAN section​" as
subject.

Thanks!

