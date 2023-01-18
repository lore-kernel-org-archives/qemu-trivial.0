Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIDh7-00075U-I4
	for mharc-qemu-trivial@gnu.org; Wed, 18 Jan 2023 14:01:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIDh5-000758-WF
 for qemu-trivial@nongnu.org; Wed, 18 Jan 2023 14:01:56 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIDh3-0001hO-VL
 for qemu-trivial@nongnu.org; Wed, 18 Jan 2023 14:01:55 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 y3-20020a17090a390300b00229add7bb36so3119476pjb.4
 for <qemu-trivial@nongnu.org>; Wed, 18 Jan 2023 11:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/k89b5Z2Ac8Ya5icS0puj1BpWvgAYj/fNxfmLVTRJSo=;
 b=Qc3cWwP1QloRx+zGqPjs5C5+JazzxYfoQ0wRj9WBFE3slgWtRJJllydfN/w0cRu4dr
 SPXJDchtNxX8ZleoX+KoSkQ/BMkA8nt2gqZgvzKwaq68S6i+WuOJi1XRGxD/otCMb8mm
 7TiN8JRHKUQhw7wV6slenOK2H9irO7IoYbEnuuffDYQGkoJs61GFBc9NeT9VbFWScLXU
 s22WiDT7IS2TmjO4Y5P/iMtgTI85Mo8IfhcuhhtOQmH2aqJydrMkzMbCKhzcWWfhMRe5
 hX8DrrEX6gYZs9sxiVp4key2hUZ6gYLja5fcaBp9v5e3+0UoeAi3UQdpme+A1hILClTb
 lczA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/k89b5Z2Ac8Ya5icS0puj1BpWvgAYj/fNxfmLVTRJSo=;
 b=TF54yEquvp/iZvlAzfVeXjqTo2x8ggQyn2iMmYRBnL4tJx1am9m88Np3c2G7yQlDyu
 n6ALb6dE+fMBGrys2tkQU76gCOAyQ3ldniPD/N/NiNODTx/dpCZbtpMPjKKh5Dld1hub
 Ua1XrekyIXqYXCGGKTx2Y4Jts9pCou/gySEZTxUE4+wd4y/8wubDID9ag2lvHEKlVn71
 XXfNvhVAsbBNcpx+/CxYAK7hTfvtCeHiTr4CxD9/2xDGEQ9hXiusdXw2tA97Yqug76al
 XuB9tKlIvHip6f6j4Z7wohYimKEWYdG5+y7QO/pWnsYJuF4kDFCdBVz+HTqLOg9xdUwM
 BIbw==
X-Gm-Message-State: AFqh2kqZZlJ1Q3VEPC5BicsM9Lje7gk2xNkevEKCoGQwwja50x5JNLu/
 QdxGe3wdZyooBUe/QMSYAOiQNw==
X-Google-Smtp-Source: AMrXdXsBVqvlbHV8ix7StsPwzpQINDQP/H2bEq1IPfZ+CSmKXcvNZiCcQezrW2XAfY1vmiKehNLd+A==
X-Received: by 2002:a17:902:9688:b0:192:55ab:88fe with SMTP id
 n8-20020a170902968800b0019255ab88femr7779232plp.56.1674068512349; 
 Wed, 18 Jan 2023 11:01:52 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 j5-20020a170902758500b00192d9258512sm23458419pll.154.2023.01.18.11.01.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 11:01:51 -0800 (PST)
Message-ID: <50ed4971-3fe4-327f-932f-51c0be6acb7a@linaro.org>
Date: Wed, 18 Jan 2023 09:01:48 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2] target/tricore: Remove unused fields from
 CPUTriCoreState
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20230118093322.49307-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230118093322.49307-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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
X-List-Received-Date: Wed, 18 Jan 2023 19:01:56 -0000

On 1/17/23 23:33, Philippe Mathieu-Daudé wrote:
> Remove dead code:
> - unused fields in CPUTriCoreState
> - (unexisting) tricore_def_t structure
> - forward declaration of tricore_boot_info structure
>    (declared in "hw/tricore/tricore.h", used once in
>     hw/tricore/tricore_testboard.c).
> 
> Reviewed-by: Richard Henderson<richard.henderson@linaro.org>
> Reviewed-by: Bastian Koppelmann<kbastian@mail.uni-paderborn.de>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
> v2: Do not remove 'hflags' in case it used:
>      https://lore.kernel.org/qemu-devel/20230118090319.32n4uto7ogy3gfr6@schnipp.zuhause/

No, remove it, I don't expect it would ever be used.


r~


