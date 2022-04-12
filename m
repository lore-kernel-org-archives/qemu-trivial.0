Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1neHaX-0001on-Ln
	for mharc-qemu-trivial@gnu.org; Tue, 12 Apr 2022 10:33:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1neHaW-0001od-9R
 for qemu-trivial@nongnu.org; Tue, 12 Apr 2022 10:33:48 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:46940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1neHaU-0003wC-JO
 for qemu-trivial@nongnu.org; Tue, 12 Apr 2022 10:33:47 -0400
Received: by mail-pl1-x62b.google.com with SMTP id be5so10963273plb.13
 for <qemu-trivial@nongnu.org>; Tue, 12 Apr 2022 07:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=AsQbGBuBH6fLOVzdB9zD00+0+ML6JRYnNy2dbDI1XPg=;
 b=yfYGXppsRxOcp8r1i8ONlC9afuZUWFJW7o/FH7cd7KxksamuTmKDfMtfA2oWW0SVfj
 m7anbG0j4Z7QCX7JJQ3Q3eL7QPeqyeJoCJomhTYJJVLvs50x4nHb+ZXG8ug1/+0Ad972
 56Xb1P4oVLOEFe8u01wR207ShQybXWh5gxHj7jXiZCyx1usCIYWUBhCXCp9DzLmxFDHl
 hY/43PPGWkXPZvZR360HJywZ1T+5Wy6MsHPNWfACFF6Ra795/UbRe7Hf+5bdJreLQQEP
 viw9mh/gL6DYpjNHMIvLrilsUjFRZBr3McQEI0p4O/iceUaPUjC7RWEIvYdyjDRXwnJX
 g/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AsQbGBuBH6fLOVzdB9zD00+0+ML6JRYnNy2dbDI1XPg=;
 b=D6pLkzTF25Du9KJmZzt/KvK5n362wgGWCaPX//F4kvjE8odO0d3VUPntxaia33poBw
 xya60c32rxCCb1ZH3ScBs9O4+9+fcZKCFjptdpOnQCFVSBkx6/u40POlCY97YN2RRbFe
 ZT5u0P0m0Br34+yPPT/YNegZmBf8KMuvrnIMwq3bASVhBoCmsU60kVSCqNvg2NENu7ql
 HX+DL+6MAKA6HoJ15mJkwHcQgyDTR5giwpycnyV+wLznU+1a3DivoSkAX2dPBhbueTL+
 bny6HssSGzygq7E3ZqgqYNx4Eht4FlXgq5TwJYlLwSgKaf6949IcevlIH6gE/TY6hCyj
 5hOQ==
X-Gm-Message-State: AOAM533isBVKE9DBU5WRMEucnoXwJfKBhsOvfhDPp5OlzLYgduKY7kLc
 6JqNH3fTW3DQPbPadL/vq2DnjQ==
X-Google-Smtp-Source: ABdhPJwnRAKJT2n54RXJo7KFioL3ect56RK4hZLsYg1Ce3hBjScH1vSVtsxYOr9atKmyD0thCo/6rg==
X-Received: by 2002:a17:90a:b28c:b0:1ca:a055:12ac with SMTP id
 c12-20020a17090ab28c00b001caa05512acmr5296337pjr.215.1649774023127; 
 Tue, 12 Apr 2022 07:33:43 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 u25-20020aa78399000000b00505f75651e7sm3031273pfm.158.2022.04.12.07.33.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 07:33:42 -0700 (PDT)
Message-ID: <a958b361-6226-c5e0-8fbb-ca8ce86f323d@linaro.org>
Date: Tue, 12 Apr 2022 07:33:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.1] target/mips: Remove stale TODO file
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Cc: qemu-trivial@nongnu.org
References: <20220412113824.297108-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220412113824.297108-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Tue, 12 Apr 2022 14:33:48 -0000

On 4/12/22 04:38, Thomas Huth wrote:
> The last change to this file has been done in 2012, so it
> seems like this is not really used anymore, and the content
> is likely very out of date now.
> 
> Signed-off-by: Thomas Huth<thuth@redhat.com>
> ---
>   target/mips/TODO | 51 ------------------------------------------------
>   1 file changed, 51 deletions(-)
>   delete mode 100644 target/mips/TODO

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

