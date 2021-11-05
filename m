Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mj2Lr-0004Mk-0F
	for mharc-qemu-trivial@gnu.org; Fri, 05 Nov 2021 12:46:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mj2Lk-0004JQ-28
 for qemu-trivial@nongnu.org; Fri, 05 Nov 2021 12:45:57 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:43708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mj2Lh-0005GE-Bs
 for qemu-trivial@nongnu.org; Fri, 05 Nov 2021 12:45:55 -0400
Received: by mail-qk1-x735.google.com with SMTP id p138so2790180qke.10
 for <qemu-trivial@nongnu.org>; Fri, 05 Nov 2021 09:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1RKwRpMno+J4/al8vMXV3aeu/XaPUoZkipk4agJk2vo=;
 b=cY1iw3JWaLVFpZZuaidItMU6YxoKEztqvUBYMRFIbDMFSgBVcYc5CEXj8/K3Cv3F15
 rgJZICmTpBgJr2GAG+lSkT+AJiBgw4YyxwEt9JA9Iydtvzp/HRjwAYWnNgLcg+jVDuk0
 X6Nlzz7ZmgiwlJMIJMVpsAPMDoWNCScZEBfEdZKqrftb2Cxwve/qJKYBcrNFhifABuVw
 eH8pKp5OljVh+ynZUWh75u027VVcyDCY3bEdYXOmrbEgyIJYrsFvhWaISxptDMtXVSxt
 sylwkARJ09UPM7N0mVwQJZvhegh9YM+AtBfU9H5HK4Zk+24BaTa69DFXZEkTg79pnEu9
 9BUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1RKwRpMno+J4/al8vMXV3aeu/XaPUoZkipk4agJk2vo=;
 b=kuqQ+zYPtodkmZes20qfyR0TNrcRxW2U/pswQA4DoNNiLclG2uLes/HzAHndaG7k/6
 uvVBRgQuOhOJ2ds0ik1kgcfhsg2teCn0sJyryMVHJYJO0tYERRNyqzQMVYYOQ9a0hQJl
 eYRcyshCD7GUbU604SQpQR5ydn6Cmv7C+s+pT4S9rxXxWVnGhgIcE3NA5X/9gTbTYY5S
 OrbDGLL5x8tbU4c2ZaRynd4aXFj3iig6OfDralcYbexnjSrG2sxfD3E+J2XUUiOMF3P/
 sKXj6FxBDW5fWbKV/44VWlrdhJzt4ciCnMn1jlpk4Pefbyn7uM917adDhJ42hUKXhXXW
 pHFA==
X-Gm-Message-State: AOAM5306KxKkVrb0lg4mgS0oUNUsbDzU3HNK7odEw2IgB2oSraQbJkQO
 9QVIKk5vwknoyST1jstAHP+xDg==
X-Google-Smtp-Source: ABdhPJznIS/H39rjYvqUtHgFS1cLMYbvIVJ4zm/pWLYhCyEgOudYqvwD9J9BN9ldZfYxPEPVRhb0Dw==
X-Received: by 2002:a05:620a:248f:: with SMTP id
 i15mr21029179qkn.23.1636130752283; 
 Fri, 05 Nov 2021 09:45:52 -0700 (PDT)
Received: from [10.200.5.34] ([38.66.81.217])
 by smtp.gmail.com with ESMTPSA id x8sm6252694qtw.84.2021.11.05.09.45.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Nov 2021 09:45:52 -0700 (PDT)
Subject: Re: [PATCH v4 35/36] bsd-user/freebsd/target_os_ucontext.h: Require
 TARGET_*CONTEXT_SIZE
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Philippe Mathieu-Daude <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Kyle Evans <kevans@freebsd.org>
References: <20211105031917.87837-1-imp@bsdimp.com>
 <20211105031917.87837-36-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <90c72414-1695-fba8-6dcb-191f7faa54ff@linaro.org>
Date: Fri, 5 Nov 2021 12:45:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211105031917.87837-36-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x735.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.093,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 05 Nov 2021 16:45:57 -0000

On 11/4/21 11:19 PM, Warner Losh wrote:
> Now that all architecutres define TARGET_[MU]CONTEXT_SIZE, enforce
> requiring them and always check the sizeof target_{u,m}context_t
> sizes.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/freebsd/target_os_ucontext.h | 2 --
>   1 file changed, 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

