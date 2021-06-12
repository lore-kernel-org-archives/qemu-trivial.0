Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lsANE-00030z-PW
	for mharc-qemu-trivial@gnu.org; Sat, 12 Jun 2021 16:36:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsAND-00030r-99
 for qemu-trivial@nongnu.org; Sat, 12 Jun 2021 16:36:55 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:41822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsANB-0005LF-LY
 for qemu-trivial@nongnu.org; Sat, 12 Jun 2021 16:36:54 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 go18-20020a17090b03d2b029016e4ae973f7so6811192pjb.0
 for <qemu-trivial@nongnu.org>; Sat, 12 Jun 2021 13:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=c091v4DcQTWyzRACGSV7pOreFYYi4BKv5XxCow4pqAU=;
 b=qbu8IVFLEkkduTLFtnvfrnzanC4ZOq7vmlvOY3UyfsEIYqpNOO/+gCaUX1ty1zGII2
 cJIfYjBfXGjpHefG0hw2kJU1DHp+E9GT8X6UVrZuM+8LUfIcxKkfrI/sXw3Os3P90+s6
 faqa9LfCxf7ufrclioIW0pZIGguEaWqRDyciMpmPE2ia3/0N0RWykl5aSni9089qbETi
 btwS3XD99WXsMIunCB/HVlnnzW0e9orVXyfTLBVtq/9yr7Kg0cKr3QIJd/e2105DbMO4
 +oT1oklL6eV6ah+YoTtwpMbF5lzu/+KX1ySKUTyOwlFYFIvoXbLeo7ks9jMswwPWXN4V
 HfWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c091v4DcQTWyzRACGSV7pOreFYYi4BKv5XxCow4pqAU=;
 b=P7r9VnIDJX09QfOhiTa1BHPUjn+hCOjDFWl6MbpohEIp43UfbPfhJAqB6wtoq8Cok9
 Zr3FG1skNqoDpTW6ptISzVSHqiZYNC/zaLIP/Mb1+5FT0nhXKkM1jSy5bGcFyJsaxy2J
 ZPpy+SciRkWnHT7G0NScDRofu8ha/1A57mku9gl9ggaoYSjGobptU9g1nu5OC3z4RDVw
 x3oRVOwtQK23DqcJGAsGHN3s0HlYrs5NZokH5KMIjWSfvkAv33puUTPuZUw3b9oOshZr
 tFsDR4mAFbA4/gCFQcinrAaFooGRiZtbTOD0OWVxx6K5v4C7vHEVRuKDFvYHDv7tnuF3
 uI8Q==
X-Gm-Message-State: AOAM5331kAtUck4UcB5dogvJ5XwJDQMR++gP4PyfQxhqQ6CDG12Lcjrz
 9GTA26f6H1Tqvs4yV3eOHtxo7Q==
X-Google-Smtp-Source: ABdhPJxYSi1qWmq/i5xKI5+14k6ChlLhRwog0sZz45I41sn24qZnrjxIU7S2Vuk1WP23hckLdGJtHA==
X-Received: by 2002:a17:90b:234f:: with SMTP id
 ms15mr10686761pjb.202.1623530212028; 
 Sat, 12 Jun 2021 13:36:52 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 w7sm3930135pjy.11.2021.06.12.13.36.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Jun 2021 13:36:51 -0700 (PDT)
Subject: Re: [PATCH v2] fuzz: Display hexadecimal value with '0x' prefix
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-trivial@nongnu.org, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210612195842.1595999-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <62965e91-a492-dad5-782f-7054b0dacf9a@linaro.org>
Date: Sat, 12 Jun 2021 13:36:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210612195842.1595999-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 12 Jun 2021 20:36:55 -0000

On 6/12/21 12:58 PM, Philippe Mathieu-Daudé wrote:
> Use memory_region_size() to get the MemoryRegion size,
> and display it with the '0x' prefix.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
> v2:
> - Use PRIx64 (lvivier)
> - Use memory_region_size()
> ---
>   tests/qtest/fuzz/generic_fuzz.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

