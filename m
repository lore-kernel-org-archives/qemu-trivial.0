Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mj2Cr-0000yU-0S
	for mharc-qemu-trivial@gnu.org; Fri, 05 Nov 2021 12:36:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mj2Cn-0000uo-AL
 for qemu-trivial@nongnu.org; Fri, 05 Nov 2021 12:36:42 -0400
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33]:44906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mj2Ck-0003S6-3a
 for qemu-trivial@nongnu.org; Fri, 05 Nov 2021 12:36:39 -0400
Received: by mail-qv1-xf33.google.com with SMTP id v2so7661271qve.11
 for <qemu-trivial@nongnu.org>; Fri, 05 Nov 2021 09:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6Qam+7JXlOsa+PO4v8HKHgYfyuF0Upm4o5LqGhrPgHY=;
 b=eOD9zGSN/x89meWZkqt+DVuZi6je3zjj8sFdLm+rk8YopTkTLru6vIW5Cbh+tt6toA
 Q77Ki8JjvmC1l+tUnx7iluiLEfCQsQTkKqwarPkJndlNuoxFsz3eU3O4UTEKzwLCW2bh
 LSM9QpYUsBhgGYoPxgau7SRRfL9vh+ca5TsnHRhotVwZhLxoPy4ZQE45q2btdDarCkEB
 Nw2r2XFDOuaV7NvSPT74Mnh8F7CAi7ITT39gYXnoOae/xG2OOF2YSdgCD/ky4KdPQ+YG
 W3iHK4JYD6wCqABa9KvUWimZT8h5hNVSNwJ+6mbhHpjSoiUT/uor5X1d2yVEVHgnfIWV
 F8Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6Qam+7JXlOsa+PO4v8HKHgYfyuF0Upm4o5LqGhrPgHY=;
 b=gL3Jx97IagW2k1EefQK8h7Qi9Osgn/+MjojB7LTe6ELZEo8WptKl6FDIW+DAK00Bsh
 LRJQw0dg7G7yuQumVoTbGLUk2w/jB/3Au64UY4ZCE3Fv6Pr/HMv6OgZ18yhf6LNn+WLG
 0cyf1+KTYxmKXUyFunPXXAGwUJOrsacyYQlH/Q49w/TYgdhuqNqCi4GiL3ogqh8+9Udr
 fl69VyRVM7OotrufLTGOsMSOdhN0txii8eEL3BuaTrIUYtnjqTA3S+8+ekXU9i6Q7N33
 y3QcKupzKLvrptrsd9m4SOcW3DgmZdcMRep4Nf/eKMe5E2FSAChigkJL66nVABZCIJSJ
 WgQA==
X-Gm-Message-State: AOAM533oEEFLfixOSpWqGDwtjHi7NDrpMukghOYIh5QY5rDpqP1ciSCG
 /7EjnpPxOWro4ANbxGSKiWV9+A==
X-Google-Smtp-Source: ABdhPJz08vapQGMESoIZ5eRnDdEU3VAFcAJSK+Q1VL2IDB+YEZHO7THBxnu3I93eA8CSObrRjCdNcg==
X-Received: by 2002:a05:6214:cc7:: with SMTP id
 7mr48904045qvx.55.1636130197119; 
 Fri, 05 Nov 2021 09:36:37 -0700 (PDT)
Received: from [10.200.5.34] ([38.66.81.217])
 by smtp.gmail.com with ESMTPSA id w11sm6617113qta.50.2021.11.05.09.36.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Nov 2021 09:36:36 -0700 (PDT)
Subject: Re: [PATCH v4 32/36] bsd-user/arm/target_arch_signal.c: arm
 get_mcontext
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Philippe Mathieu-Daude <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>
References: <20211105031917.87837-1-imp@bsdimp.com>
 <20211105031917.87837-33-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bf75d119-8239-40df-3010-14a3a71bf569@linaro.org>
Date: Fri, 5 Nov 2021 12:36:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211105031917.87837-33-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf33.google.com
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
X-List-Received-Date: Fri, 05 Nov 2021 16:36:43 -0000

On 11/4/21 11:19 PM, Warner Losh wrote:
> Get the machine context from the CPU state.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Kyle Evans<kevans@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/arm/signal.c             | 51 +++++++++++++++++++++++++++++++
>   bsd-user/arm/target_arch_signal.h |  1 +
>   2 files changed, 52 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

