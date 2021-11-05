Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mj1zy-0004WQ-Eh
	for mharc-qemu-trivial@gnu.org; Fri, 05 Nov 2021 12:23:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mj1zs-0004IH-Qg
 for qemu-trivial@nongnu.org; Fri, 05 Nov 2021 12:23:20 -0400
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:33553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mj1zr-0000sA-0Z
 for qemu-trivial@nongnu.org; Fri, 05 Nov 2021 12:23:20 -0400
Received: by mail-qt1-x82c.google.com with SMTP id s20so984227qtk.0
 for <qemu-trivial@nongnu.org>; Fri, 05 Nov 2021 09:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gWPBTb1BZTQ52BZapaNPKiLNZjhjBUhTkOKFEKL9u3M=;
 b=NHnmNEEr79n30FnX3c59a1TfnRf7By89wb+HFIhhY5WftNo3gTz8JjQeZyIbYh0oAw
 2N6s+dXdqP4WHvwINu9gKwRnWecCz3+VDKi4vAGxj/NtSQG2Ba37O1AnyA2aobCsweCs
 mkS2moxTOhM5ToZ+9lJFwnJ4MjDqTqqYwvHSIBOLz7zG0pEqNf4ahETXMDN7pOJLK0/A
 f26SQJr1ukvbhbIKR5bOHS+QyIUvdJrOGk3awiuw6Q4Kymcp7z4O68ggoTlB9BKQUpEP
 Hj/70sI6PD9rJaw6DcOgjLN1aIUuqQEPq4HkeA7Afp2kCdM0hYw5dGc4JCMROYHA9x8Q
 lRSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gWPBTb1BZTQ52BZapaNPKiLNZjhjBUhTkOKFEKL9u3M=;
 b=qlAi7CN/d3xFZnd+NVrn9KIO9IcWPERhxa/2FP5e5plqt/o+I1s6ukEtnOU3xo3Fna
 Oo5y6CcNGQ9CryVcnQqER4HlVnXDixTNBr2ddP0GW1c8g/5w63W0NxQsEOb3+Y3ePk4j
 YLeP3u58zgoferMhM3sivDnNT/cnWwRyXFRTOKALHL4TPAV8W+N+p3CcKmweDuSrUvX8
 EKaR0DH+6C7O8pOhKPn+dlY2ooAw0v7HcCgezLfpnmfI4rHtFGuEZjxF9LAiZDnfnMKs
 FhioP36GoBDAXgfEvmpxE89Y24fTL4mb1OvY2EB6wsdmYwwx9+eKjkR54ew9LnJ/s74m
 lKwQ==
X-Gm-Message-State: AOAM531lAHRVDxryw3XmcR19Vv+HljIRYABiXa3QGiMj/mpIJOu7qiGR
 n5wrsog1Qw+Wgj/mkPieGIK9MQ==
X-Google-Smtp-Source: ABdhPJxi9orajPfeR1ydVz2fxtKA33twhI/jfYMSO/ir95cg2lDSlwzOB+FjEEhSPG1qP6VWQ7A4dA==
X-Received: by 2002:a05:622a:551:: with SMTP id
 m17mr24636681qtx.80.1636129397936; 
 Fri, 05 Nov 2021 09:23:17 -0700 (PDT)
Received: from [10.200.5.34] ([38.66.81.217])
 by smtp.gmail.com with ESMTPSA id ay12sm5926648qkb.35.2021.11.05.09.23.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Nov 2021 09:23:17 -0700 (PDT)
Subject: Re: [PATCH v4 10/36] bsd-user/x86_64/target_arch_signal.h: Fill in
 mcontext_t
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Philippe Mathieu-Daude <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Kyle Evans <kevans@freebsd.org>
References: <20211105031917.87837-1-imp@bsdimp.com>
 <20211105031917.87837-11-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <066d6ab9-8a30-4ba4-efb8-022090db00f6@linaro.org>
Date: Fri, 5 Nov 2021 12:23:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211105031917.87837-11-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82c.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.093,
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
X-List-Received-Date: Fri, 05 Nov 2021 16:23:21 -0000

On 11/4/21 11:18 PM, Warner Losh wrote:
> Fill in target_mcontext match the FreeBSD mcontext_t structure. Also
> define the size correctly.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/x86_64/target_arch_signal.h | 54 ++++++++++++++++++++++++++++
>   1 file changed, 54 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

