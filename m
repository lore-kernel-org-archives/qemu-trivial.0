Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rNJPe-0008IJ-UO
	for mharc-qemu-trivial@gnu.org; Tue, 09 Jan 2024 16:13:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rNJPd-0008I9-5K
 for qemu-trivial@nongnu.org; Tue, 09 Jan 2024 16:13:29 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rNJPa-0003iN-1D
 for qemu-trivial@nongnu.org; Tue, 09 Jan 2024 16:13:28 -0500
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-336746c7b6dso3066252f8f.0
 for <qemu-trivial@nongnu.org>; Tue, 09 Jan 2024 13:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704834802; x=1705439602; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k1Bs5wwGu1+Ov97vn4cnlM/nqCj2d8CdRhHsfXNJGNE=;
 b=fSbznwIKdh+BxF1KptqVjFk0ytDX0lX532cSnP/8qcGReDtQvQHLTAETg7r9Bq3xf7
 IfPdrIju3hWJ4nY5B80FjklP5ZhCKKXWjtBSFUJX/5JTPiX3Mgir1VjnLqru+KETSTFv
 SAR39+pCaV1ZXd8KOr1FpoeCAr8Yj0S2EvmcSfqTG2iifkc74F1b8fDTzGstF+8toSft
 4pCuZSP1LSVAdNvAyQQHxp+Wj/kU3Hr+5leX7psCJg5oLsp880JdX3I7c3KoeVuoWN3F
 4fgdNNzGc7U7NEdQ9p2gMRu0/lKK7AsYEfs2bSBwK0J6yjZzAtN0sX8pqCvbd92uJbZ6
 sJIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704834802; x=1705439602;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k1Bs5wwGu1+Ov97vn4cnlM/nqCj2d8CdRhHsfXNJGNE=;
 b=pzfVlXkR834rlcF7vS7YIpnHBhFdqGEa1W5j23WP3BlQrqD56El/96QL3cw+eLfPAp
 zlaIEVmxOte0shGqy1YjEadf7B0bi1tH6IihCz4Txjr36npIawZFcXfcfEZZaZOStjP0
 Z8QXwvqgTJMKpYmsvou5UchGvTUo2r6Uq2sU4FGzGknVzgqS9qvgV2qWJNvOeQ2sB8Zh
 JepOZxKreNvmWc6vIYUqvKFP+ggbtRzroeoAK7+M092AnC2iOzEIB90ZEe9+hIgD6pZF
 76HezSZ/XpD6vuPtYeLsUMwwh8V/uHqy1TSaZ8tBwfWOr+YS+eADj3i/lg8MkAMDvmUS
 8CRQ==
X-Gm-Message-State: AOJu0YxlQm3xiN9pQ1Ia3KuSGqReEY34KFmHENKZp45WhO6hu+oUmf2H
 YwDJob6fWY4HT+A8S+aC7l1ruFrKQzcJig==
X-Google-Smtp-Source: AGHT+IHuouNzmfYB241eSiPfGSdENup+BlUg23ygG0I3mTJ7bRokMhRPg9Ff8yb7FsSQrI/RFlCoiw==
X-Received: by 2002:a5d:624e:0:b0:337:20f5:22df with SMTP id
 m14-20020a5d624e000000b0033720f522dfmr921292wrv.110.1704834802387; 
 Tue, 09 Jan 2024 13:13:22 -0800 (PST)
Received: from [192.168.69.100] (rsa59-h02-176-184-32-47.dsl.sta.abo.bbox.fr.
 [176.184.32.47]) by smtp.gmail.com with ESMTPSA id
 e30-20020a5d595e000000b0033776a50472sm2318129wri.10.2024.01.09.13.13.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jan 2024 13:13:22 -0800 (PST)
Message-ID: <5317a393-b9ab-4526-8856-7087d915c9db@linaro.org>
Date: Tue, 9 Jan 2024 22:13:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/timer: fix systick trace message
Content-Language: en-US
To: Samuel Tardieu <sam@rfc1149.net>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20240109184508.3189599-1-sam@rfc1149.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240109184508.3189599-1-sam@rfc1149.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Tue, 09 Jan 2024 21:13:29 -0000

On 9/1/24 19:45, Samuel Tardieu wrote:
> Signed-off-by: Samuel Tardieu <sam@rfc1149.net>
> Fixes: ff68dacbc786 ("armv7m: Split systick out from NVIC")
> ---
>   hw/timer/trace-events | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


