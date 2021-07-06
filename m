Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m0sIU-0005Es-Dm
	for mharc-qemu-trivial@gnu.org; Tue, 06 Jul 2021 17:08:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0sIS-0005Dy-SF
 for qemu-trivial@nongnu.org; Tue, 06 Jul 2021 17:08:00 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:38880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0sIQ-0003ve-84
 for qemu-trivial@nongnu.org; Tue, 06 Jul 2021 17:08:00 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 cs1-20020a17090af501b0290170856e1a8aso2324821pjb.3
 for <qemu-trivial@nongnu.org>; Tue, 06 Jul 2021 14:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=j5OBbxWOrF8tsAXoQJGHCUG7CDEzsPpQL0jc33nwa2M=;
 b=pK50yUh/HCxW4xrjqjUawchiqnYvlUULgGSaEClmYVkvjAf0SYF8peZrkowOTH9sNb
 tHK7vb2nanAZLAmuQBfGB/xrWeCPFHMygSXwWk1Ne9kl314XOboVnY1dx1laiM3mnsHC
 MmYKAiyURsGVjv9T6DXyJHa3EJJkfv9PBbnklrxAZIvj2r3fQvpu1i5nmAsiMP4Xn1XU
 6aKEfD091f4vuDWnnjq/SWrUOSXcdNCmAHiWTIhJZto73f72FJPBGQWCM8eb5+Se/GPx
 8sTpAD5k9VpM2SX82um/oIWDEAFck/oJkzPsFghLrT0gcvt9H4SMjzfu2MQzY93BS3wg
 73Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j5OBbxWOrF8tsAXoQJGHCUG7CDEzsPpQL0jc33nwa2M=;
 b=r43NEo0vA6ycIZk2OrbrP7IvSiIrQts+R/xtaQiFvLfhBq6EPzTxo52DmA1BVMx/sW
 ThZzITDRfVaVwObbDUbc9om/kZ56EulbYrn1zofnvWMWv8YsLdcCOg7Jj7A9+P8yxwdY
 9p/5KxDj2OAc2wLr/nxUC94aBLxaspG7yJMny+pK1oK2wcJ/Dd17pN997vsbrJD5fqS7
 i9Qp+XPhtCPTdevoCYObTXFKEdimJnyNl2Xi4ufICgfv7p8hrty8GcFZgHmjoZp+bteN
 whNZGLqc1QYnHnlNfL0QDfN1lq8O354IIPU/wUcq8HJSiys663JsryJUkCmm1ie4rm42
 fHsg==
X-Gm-Message-State: AOAM533Rt4EW1R2R7eLKPesN+jhh6dOmLgK5DqAaPRj+kLOOFtoPQP21
 KLKQ4p3Od//nMacSlmV2zSo2OA==
X-Google-Smtp-Source: ABdhPJzSdVB+bXA6xV/N12Af0cFu2hfKwBl17gcP4NMwf6dg0gznUZ0dQaOZ6xZHAENHy++Dkh7obQ==
X-Received: by 2002:a17:90b:792:: with SMTP id
 l18mr2315352pjz.55.1625605676493; 
 Tue, 06 Jul 2021 14:07:56 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id cx5sm4190634pjb.1.2021.07.06.14.07.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 14:07:56 -0700 (PDT)
Subject: Re: [PATCH] target/xtensa/xtensa-semi: Fix compilation problem on
 Haiku
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>
Cc: qemu-trivial@nongnu.org, Richard Zak <richard.j.zak@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20210706081822.1316551-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <49554e07-d56d-51ad-e86a-63126ae6ebdc@linaro.org>
Date: Tue, 6 Jul 2021 14:07:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706081822.1316551-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
X-List-Received-Date: Tue, 06 Jul 2021 21:08:01 -0000

On 7/6/21 1:18 AM, Thomas Huth wrote:
> The errno numbers are very large on Haiku, so the linking currently
> fails there with a "final link failed: memory exhausted" error
> message. We should not use the errno number as array indexes here,
> thus convert the code to a switch-case statement instead. A clever
> compiler should be able to optimize this code in a similar way
> anway.
> 
> Reported-by: Richard Zak<richard.j.zak@gmail.com>
> Signed-off-by: Thomas Huth<thuth@redhat.com>
> ---
>   target/xtensa/xtensa-semi.c | 84 +++++++++++++++++--------------------
>   1 file changed, 39 insertions(+), 45 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

