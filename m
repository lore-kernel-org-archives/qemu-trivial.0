Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lv3ot-00072m-P3
	for mharc-qemu-trivial@gnu.org; Sun, 20 Jun 2021 16:13:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv3os-00072G-A6
 for qemu-trivial@nongnu.org; Sun, 20 Jun 2021 16:13:26 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:39484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv3oq-0007sC-Ik
 for qemu-trivial@nongnu.org; Sun, 20 Jun 2021 16:13:25 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 c7-20020a17090ad907b029016faeeab0ccso411568pjv.4
 for <qemu-trivial@nongnu.org>; Sun, 20 Jun 2021 13:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4CvaUv8lFZmF1sxTUqvV33ndo+jDG5szRdpRqRM7UqM=;
 b=aXHc/6SkDfVP80k8/XN9luGP0dLEL42Ybual8wUdTVJNoanidiaunUxGltlSCD6ALJ
 +hJCkoGeUzqf0KcryRKldypWw8QLifADq/ZQMJ45g+vVRkmvOwbqXha2KR+v5QXvDnTc
 /Q5BXp6r9t2qnJyQtk7dp42RHu1+OzUsvIvrXFmGhLvmjAumZ5m0zek+Aub/2s5pqk94
 6+EILla1TJyEaap6LA6o/HqeqGNZWFtDOp1xYbiMXrqFfGZ3N091yJKD2aD87AodSWPB
 3Hj+6FLu6Mt0S644jWODG/mzP+10ODDqwQ7znI6/FTE+8X//KW2B6eylSCtOoEZuWy36
 VXmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4CvaUv8lFZmF1sxTUqvV33ndo+jDG5szRdpRqRM7UqM=;
 b=GMaimy0yHFScV0sK9NCOu28xlKOCdzlZZ1PKaC/h/X3XY/AYt1OdqqDoINKt7MYwvW
 kcJP/KhKWe0KYYWnr3lZhgRMfGjp6yVmwf2km25Pz2kr5+EHCL0bjltgYW70b//nJHtw
 S250KcO8HB7rURP3UEbASI6YO0M6Yb5b5O47EAkYpjgyNlDZZYTgw2nJltp1rN3BGZ9h
 eYwaKNf1QL5Lz5JCmcX/Ms4mNXHM1IlAZoDZRow5lsO8cr08bB2CZvV8o9SQgXgHFfCa
 5QLZQ5Tf6zP7Ynu7Xd1JHRRhdzIS2qwCmVaH+NMpYcCYuX9y+5l69ntJhUMeczTttNfi
 2VwQ==
X-Gm-Message-State: AOAM532VGPn/NycG5q2nfNI1zT/6hMmJdQvLbVTRRHKwQeLOlcsqx7R7
 l/fMVW20ESnqc5Ge+tyVq5W5zql7DYreHg==
X-Google-Smtp-Source: ABdhPJwTZBZk3BgE0bt4fyAXlHSygjis/L0J0c8Om0FugOHE3lG7N+zXSD26FX9zsEL4GGyvO/D30Q==
X-Received: by 2002:a17:90b:2405:: with SMTP id
 nr5mr22258886pjb.184.1624220002298; 
 Sun, 20 Jun 2021 13:13:22 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id h24sm13577509pfn.180.2021.06.20.13.13.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Jun 2021 13:13:22 -0700 (PDT)
Subject: Re: [PATCH] ppc: Replace TAB indentations with spaces
To: Ahmed Abouzied <email@aabouzied.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20210620180410.10837-1-email@aabouzied.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c3db1705-06fb-91a9-58ae-df0472cfda21@linaro.org>
Date: Sun, 20 Jun 2021 13:13:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210620180410.10837-1-email@aabouzied.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
X-List-Received-Date: Sun, 20 Jun 2021 20:13:26 -0000

On 6/20/21 11:04 AM, Ahmed Abouzied wrote:
> +#define IH_CPU_INVALID        0    /* Invalid CPU    */
> +#define IH_CPU_ALPHA        1    /* Alpha    */
> +#define IH_CPU_ARM        2    /* ARM        */
> +#define IH_CPU_I386        3    /* Intel x86    */
> +#define IH_CPU_IA64        4    /* IA64        */
> +#define IH_CPU_MIPS        5    /* MIPS        */
> +#define IH_CPU_MIPS64        6    /* MIPS     64 Bit */

You're doing it wrong. These should still line up after tabs are replaced.

There are tools for this sort of thing, sometimes built into your editor, often called 
"untabify".


r~

