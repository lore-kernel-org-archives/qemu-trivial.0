Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qnxfF-0004k1-Bn
	for mharc-qemu-trivial@gnu.org; Wed, 04 Oct 2023 04:55:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qnxfB-0004f0-CY
 for qemu-trivial@nongnu.org; Wed, 04 Oct 2023 04:55:26 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qnxf9-0001uj-Dt
 for qemu-trivial@nongnu.org; Wed, 04 Oct 2023 04:55:24 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-406402933edso17605775e9.2
 for <qemu-trivial@nongnu.org>; Wed, 04 Oct 2023 01:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696409722; x=1697014522; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FiCvpEEyOTffHwW13ToQOIh4DwJnaN//d1fVHgrp/7A=;
 b=y2BKwDp+gAPMf3caUjQ5SU10TjLUeemSxvSF5x15ovIlu7CFbsagVt+oKdaw/M/gBt
 M6YJ0hY74V36WGj1Bq02LqV1CvJVdiGh6exD1eLimSBDW/wIsy5Lxni16+VdN4I08fuH
 +yENFEKF1iVbWGzEm0uoWqcRNdI9iJgOUhzlVt7awMMwNw6pMGCN6ksOkqZuL8cNypRH
 YTDalmiZbAASE6at6XxxPZPFzMIA1jJ9X8HSYTo2I5oGMeOTgLOI2xNJKrjJTRVqmsrc
 GfXIgPri6N2c0y5Uc4ui4ELQr1hPTng/rR4s3rnOntAtUdhC4cXjhrJyYO9x+7K3EgzF
 bZ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696409722; x=1697014522;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FiCvpEEyOTffHwW13ToQOIh4DwJnaN//d1fVHgrp/7A=;
 b=DnBOCeFxWdcFDEdyfsodpfi+V0R/0R7yFSwqNwEkKiW5AA2Kdzj5rjsxLm5quV5Yt3
 /MZh79x1PiSe55N2NFGkqqp3zfQ9teuZrVcAYzwzbK0FT2ZyYpv2TdxsmPHPROZaki24
 CThB5p3WGNJ/QAS1ZyA8SkFGJjCrPRaSDHAr5D9MjGP1EGFZtI0gGA25klkSD4GhPZ15
 4dhUbgDvlDLSBPzjEz+nUjQQr5MHhhwP+9x7/nB+qznhVRH2qqLEiLB7Z7FExsTW6eHA
 LeDZ74qU3Ycu74uOS/YF52IKjFFlfUul2YyUrGV6QZQTzP5jMP5HZB+15ipc6gfiCBY7
 UG1w==
X-Gm-Message-State: AOJu0Yy4IOtcHJhiDkdQnpUhE6TEF3Nlor0BMIMxEXzi2Nr3Xxkld/FK
 uhAYWBbFlcgzJE/UktxEEkg2kg==
X-Google-Smtp-Source: AGHT+IHQK0tbCyDpbZqqPHBYN4VeegAXf2YwFpabMBgh5KHsYZDPE6fiPwoGy7kyX1r6VHk4AgKFvQ==
X-Received: by 2002:a7b:c858:0:b0:404:737a:17d with SMTP id
 c24-20020a7bc858000000b00404737a017dmr1466047wml.9.1696409721801; 
 Wed, 04 Oct 2023 01:55:21 -0700 (PDT)
Received: from [192.168.69.115] (5ep85-h01-176-173-163-52.dslam.bbox.fr.
 [176.173.163.52]) by smtp.gmail.com with ESMTPSA id
 hn32-20020a05600ca3a000b004053e9276easm959833wmb.32.2023.10.04.01.55.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Oct 2023 01:55:21 -0700 (PDT)
Message-ID: <8dfca186-50ea-611d-b833-a4326efc5ae7@linaro.org>
Date: Wed, 4 Oct 2023 10:55:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH] audio/ossaudio: Fix compiler warning with -Wshadow
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-trivial@nongnu.org
References: <20231004083900.95856-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231004083900.95856-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.09,
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
X-List-Received-Date: Wed, 04 Oct 2023 08:55:27 -0000

On 4/10/23 10:39, Thomas Huth wrote:
> The "err" variable is only used twice in this code, in a very
> local fashion of first assigning it and then checking it in the
> next line. So there is no need to declare this variable a second
> time in the innermost block, we can re-use the variable that is
> declared at the beginning of the function. This fixes the compiler
> warning that occurs with "-Wshadow".
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   audio/ossaudio.c | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


