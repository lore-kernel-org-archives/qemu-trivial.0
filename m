Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mi75d-0002Oq-6x
	for mharc-qemu-trivial@gnu.org; Tue, 02 Nov 2021 23:37:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi75Y-0002OC-Tp
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 23:37:25 -0400
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d]:36810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi75X-0000cI-D1
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 23:37:24 -0400
Received: by mail-qv1-xf2d.google.com with SMTP id d6so1430945qvb.3
 for <qemu-trivial@nongnu.org>; Tue, 02 Nov 2021 20:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vqQyj3CJ7mF31+uKoFql/2mn0tOKMJ1bJMz8Zx/Njy4=;
 b=sAUMClE6L7JQznC+DjqgMxU+1JokKcnbM4Dlns2IhzL8ifZrSWpyTvFGi9//yUELLA
 1/qKB+tgcp9BUrLGJj++FsD/0Buap+2dCpWfzQSku8FdIuoXy0CGQ59xvdNEDJzjMjhg
 rOtR/GPBFW6I8WJMOjoOeWfz+l8cVsTMLI8DsUqwcWODa8mp+mXotzdw4CjjZwDJYnFH
 0FGdHrVnEQqmnAhKO7U7YgxJx5iuTSX0YJHvOebjT14cW2s1RXrYTEJKLPeo9F0N6q6R
 r+5mzdzFwlstpk46djyQYIAdDLQX+YTIAuKllzMPxrToN6rPXtnxP1nNyFcprt5tPxhX
 ZYXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vqQyj3CJ7mF31+uKoFql/2mn0tOKMJ1bJMz8Zx/Njy4=;
 b=M4ia1tz2bwc5yhnlUS1HXfDdCXZ7NTl1Zsi8tp6FKyr6ZBCL8veHJkGQ6v2bz07/2a
 xLbLdyqS8OzD/zQbnkoDOCD5gopNs8xlfjPEhJdn7v9fRQ84LwQ2Em83tPCAdA8w69hY
 8Jey1iGnlnzNKnhwtlWRCdVWjURo4RCztbyIjCk0s9SLClConUfo87nKubKQzXU1RYFC
 kCXeGSI3E4T37qUlKr3Q2g/TWKz7KxtL7xJU1fiu9StrncepIF3oZuam0U0VIGSkcBZP
 JDVnunLSoAVD1plY7oBaSBmxIUebwO7Qx+1+kPJ6uC1uJsOpEN2eAt3e+Dz2+20WI8iQ
 4HDQ==
X-Gm-Message-State: AOAM530Hs3uanQc3StRux4nIjGdgYgNB0guFF+GqdLeR/mw19ndC0Hzp
 eF+4Eu/KAPHE3eS48rF4Gl7gWg==
X-Google-Smtp-Source: ABdhPJwWumPA/+lixIlJgGkiLuIiwsP7hXqaorgMWs1ss/p4PURWF8TdiBQS+TDEUU8HeXwOrEnJdg==
X-Received: by 2002:a05:6214:caf:: with SMTP id
 s15mr22972331qvs.33.1635910641795; 
 Tue, 02 Nov 2021 20:37:21 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id l3sm650558qkj.110.2021.11.02.20.37.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 20:37:21 -0700 (PDT)
Subject: Re: [PATCH v2 22/30] bsd-user/arm/target_arch_signal.h: arm
 set_sigtramp_args
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Kyle Evans <kevans@freebsd.org>,
 Laurent Vivier <laurent@vivier.eu>, Stacey Son <sson@FreeBSD.org>
References: <20211102225248.52999-1-imp@bsdimp.com>
 <20211102225248.52999-23-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <27eae3b8-156b-540b-e88b-0d8c3097ee7e@linaro.org>
Date: Tue, 2 Nov 2021 23:37:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211102225248.52999-23-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2d.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
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
X-List-Received-Date: Wed, 03 Nov 2021 03:37:25 -0000

On 11/2/21 6:52 PM, Warner Losh wrote:
> +    /*
> +     * Low bit indicates whether or not we're entering thumb mode.
> +     */
> +    cpsr = cpsr_read(env);
> +    if (ka->_sa_handler & 1) {
> +        cpsr |= CPSR_T;
> +    } else {
> +        cpsr &= ~CPSR_T;
> +    }
> +    cpsr_write(env, cpsr, CPSR_T, CPSRWriteByInstr);

Like I said before, you don't need the cpsr_read, because the mask ensures that only 
CPSR_T will change:

   cpsr_write(env, (ka->_sa_handler & 1) * CPSR_T, CPSR_T, CPSRWriteByInstr);


Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

