Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nUC5E-0002ja-VQ
	for mharc-qemu-trivial@gnu.org; Tue, 15 Mar 2022 14:39:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUC5C-0002gE-A7
 for qemu-trivial@nongnu.org; Tue, 15 Mar 2022 14:39:46 -0400
Received: from [2607:f8b0:4864:20::436] (port=42927
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUC5A-0004sc-Qu
 for qemu-trivial@nongnu.org; Tue, 15 Mar 2022 14:39:45 -0400
Received: by mail-pf1-x436.google.com with SMTP id g19so345439pfc.9
 for <qemu-trivial@nongnu.org>; Tue, 15 Mar 2022 11:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=IvtTbkd2W6N4Yl1iox0fIsOdMoPF04bGp//N20X+lAA=;
 b=J8Z3mz6roKJX1myApqOVcsIN5B1XkZ3Pz2sambs1KGgp6P9nanNaC5yiLhAjytIvJr
 Lj6qry1wZBwbxVHuZS/L0piYJBLI8nyON5X0rJ6ciVcds0lc41G1NNMxPyP6ptfcSDtD
 dI+VOaaO3OyUnYR3KpWwiSUD1oeoDMFN5EqDFPyo4ZBSTXn2xjIaS7y9sa/73AqRxAon
 VX7DR/5aRr6IDiVtGE8N986w1FlV4KIRPUdXXSOZzLh0ps1c+S+qQc+WiPnXoQ8y05ET
 yFM1HSXtmxmmZYYN6sUBjneV3BZwyDPXiZJB4gF1CFv/tKwS3BW91/UHfDVmScMLGrZm
 E9qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IvtTbkd2W6N4Yl1iox0fIsOdMoPF04bGp//N20X+lAA=;
 b=mPZv0TWl8Yh2T5twUR71Nq/voKdqeYw3s0wEIa6Qv+eDCqoIpws4I9VzjjUHiBcE51
 t3IHQN6WWbln75omKncVsoJyQYQbEninQnW9vyTnKO6nFm18XG2LxFlOIKC4+eVh0/od
 fKGh4IAWL5Q+mnMljBlw/BVn75B0AGrKiEplzc6Gr9sUj/kNEt3wnIjlde84oCYDChrW
 cGS7RNJbznLvZmBWGdW4gGyt9NACHZsiBdpGYm2oRqLHx/xBH675MSaxLqT0JebLsqBD
 1nTvuLhhh1N9M4Ny24COCoz82ij1QRH6nxdnHr5S+Qit0wyllCxku391Vs54twi4R7CF
 0Faw==
X-Gm-Message-State: AOAM532S5Il7So1JNqietODOzzH3tkULowoKMQBOJP5MQkTi4m9LHDiu
 U8toIGVpo5M1POIsOLtumZBHAQ==
X-Google-Smtp-Source: ABdhPJyAXJB1UkJq5WKH4EftL0jm6WytsPArLXl7ZsN9/jKljqxTBav5fv3vfIujajcttYimasZy/g==
X-Received: by 2002:a63:82c3:0:b0:37c:7976:4dc2 with SMTP id
 w186-20020a6382c3000000b0037c79764dc2mr25645658pgd.477.1647369582695; 
 Tue, 15 Mar 2022 11:39:42 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 d16-20020a056a00245000b004f7728a4346sm21497756pfj.79.2022.03.15.11.39.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 11:39:42 -0700 (PDT)
Message-ID: <819d817e-8278-00cd-e609-b6cc2b64c873@linaro.org>
Date: Tue, 15 Mar 2022 11:39:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] Don't include sysemu/tcg.h if it is not necessary
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>
References: <20220315144107.1012530-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220315144107.1012530-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 15 Mar 2022 18:39:47 -0000

On 3/15/22 07:41, Thomas Huth wrote:
> This header only defines the tcg_allowed variable and the tcg_enabled()
> function - which are not required in many files that include this
> header. Drop the #include statement there.
> 
> Signed-off-by: Thomas Huth<thuth@redhat.com>
> ---
>   accel/tcg/hmp.c                  | 1 -
>   accel/tcg/tcg-accel-ops-icount.c | 1 -
>   bsd-user/main.c                  | 1 -
>   hw/virtio/vhost.c                | 1 -
>   linux-user/main.c                | 1 -
>   monitor/misc.c                   | 1 -
>   target/arm/helper.c              | 1 -
>   target/s390x/cpu_models_sysemu.c | 1 -
>   target/s390x/helper.c            | 1 -
>   9 files changed, 9 deletions(-)

Thanks.  Queued to tcg-next.


r~

