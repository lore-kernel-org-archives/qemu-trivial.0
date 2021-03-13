Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lLAEh-0004di-Ls
	for mharc-qemu-trivial@gnu.org; Sat, 13 Mar 2021 14:47:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLAEh-0004cx-3t
 for qemu-trivial@nongnu.org; Sat, 13 Mar 2021 14:47:43 -0500
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:37946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLAEe-0006OT-Ej
 for qemu-trivial@nongnu.org; Sat, 13 Mar 2021 14:47:42 -0500
Received: by mail-qk1-x72f.google.com with SMTP id f124so27940807qkj.5
 for <qemu-trivial@nongnu.org>; Sat, 13 Mar 2021 11:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pgqlVMFohaF7iRRtOqmZSpltiWSkM5vINFATy7vMnzA=;
 b=Adho7pXl8fZJ3UYAUlXfkxLk5bx7fMf1X3SHJGmCQUR80TninQGrhVbhIG0A2m4C/j
 Aci8IODGUJvg41YBqsa/UEXcZ3DyFRnbL7wIUo9E5Rf9TiGxxrNSDm0TUrTv+Ox56yNa
 ON6u70PvzixGWg5zO8ktpe40p6tsR1x0TWwC8M0IgFoyRF97BuWUBObFRSTKsW2cJ6zw
 F//8s514zvylJMfTiOyrj3iUh1ogSRTMtL8VB2XCTYEZ9JvmMvmQlCVO1GYmpnlzBT16
 ZNTg007iUS9S0lHy0nSfxTXmngxKZDtufPeZOuBj3ocvA9ts1PcPhm2QkikuTguGSM/6
 aeGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pgqlVMFohaF7iRRtOqmZSpltiWSkM5vINFATy7vMnzA=;
 b=HS/3jzEmZESb/i1t/9oeClCxxxFG/gzcpWRtZmjPO9cpfAhHIv5BdCmeHrnsN539pX
 n38DDhIcd13kfrZE3DWjoo2sI5F7rA4DwKW1VQgSf3XE9WxXLDG2KYJZYE2aVgzLKsu1
 XqjQwXBPZauLK1NO9/N6+qEByuEZNKpu3SP1U0KJeUy6FH2/Wvfgvuw4Ksy0NN2V+MtB
 gOzsw18TDoZwuJdnSJbD0yXYqLFHyYtHnEkKsvASCs01s10JOOszEoY3lQ3LqJFGdiHB
 Gxpmequl+mZGyq0H4Tg2m/kTudaQqN/U8nePHpSZCSy/xWSWgc5pMSdTADfNaukM/sKv
 4YwQ==
X-Gm-Message-State: AOAM533h4YkimLGxeE76PivM8eKsfzsw5pn/wSkpVrMKToYw+sep9hqa
 BpZepSnAciWE3MuIm4OMnPP+Cw==
X-Google-Smtp-Source: ABdhPJyd7KtXiNcYPZE8IpDGrJJS9WZZnEVeYyrBAsLYwWEnr+AvuBquHS9rRtDtbvGRSDUSdH8ucw==
X-Received: by 2002:a37:7ac3:: with SMTP id
 v186mr18006763qkc.211.1615664859501; 
 Sat, 13 Mar 2021 11:47:39 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id z196sm7478507qka.70.2021.03.13.11.47.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 11:47:39 -0800 (PST)
Subject: Re: [PATCH] hw/display/bcm2835_fb: Remove DeviceReset() call in
 DeviceRealize()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Andrew Baumann <Andrew.Baumann@microsoft.com>
References: <20210313170131.2116837-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <895860ad-914d-c10f-73c7-7ae2bd356d8b@linaro.org>
Date: Sat, 13 Mar 2021 13:47:29 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210313170131.2116837-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sat, 13 Mar 2021 19:47:43 -0000

On 3/13/21 11:01 AM, Philippe Mathieu-Daudé wrote:
> When QDev objects have their DeviceReset handler set, they
> shouldn't worry about calling it at realization stage (it
> is handled by hw/core/qdev.c::device_set_realized).
> 
> Remove the pointless/confusing bcm2835_fb_reset() call.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

