Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rT35N-00055o-V9
	for mharc-qemu-trivial@gnu.org; Thu, 25 Jan 2024 12:00:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rT35A-0004yP-Mn
 for qemu-trivial@nongnu.org; Thu, 25 Jan 2024 12:00:08 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rT358-0001mD-NE
 for qemu-trivial@nongnu.org; Thu, 25 Jan 2024 12:00:04 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3394b892691so602982f8f.1
 for <qemu-trivial@nongnu.org>; Thu, 25 Jan 2024 09:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706202001; x=1706806801; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Cr9JpdXU3GbCm6fwA2ztxGaC1b4yyAlZq+7euk6iCHg=;
 b=Ch1vbQpehsXiS5friEmWB3ADyZ1HyfB/dFXBpbwJvHnXcNFpd2/Y499S0YANJYfewN
 yRzPtfmoAqV0i7nH7ale6/Ei8BfgsOe6xHQPonkaBv7HfODXYAT60hN62rLrECa1zRv/
 o1uLuZ2eEJepDX9OcZy/3ShYQ206L8ldgj3kzimPXLjkJUI8my+iYbH8cEwBtE1hqsmN
 nPAtdNTHuSwJ+tCBeJZrWEjzDLfRYqTY0gDD9QjrlCyVVFrUEgzYWytIupp1E8WNoElk
 1PetBgud67DXfkgIk/1ynkcdPRXR9G9NCp4RX32zG4k0wEiCWl+Tu3l2/uwWIHuDxKG8
 Wd5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706202001; x=1706806801;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Cr9JpdXU3GbCm6fwA2ztxGaC1b4yyAlZq+7euk6iCHg=;
 b=r+BfpyeYfRwpHWEWpqzvA8RNuoEXsThSKxnpyqAQmQcJ7SDF7/Rw+uMWE/OodJ5nKc
 TyUnCN0JGJeFl64DnBuF0KkwwiL/jW59CxPsV9XiO5BeeW41Yo+Kh/3Dwu6P2twaLTXH
 eFhiWh0Dm0/1TVfsDE+y9qpB/6T5Id+zwNNdl7LCaCk+vyUY5/vwUQzRLzTLo3M1AkAM
 OmUhq/pqZvy6lQYyyfCcwvWZfGV4ReQQRs0umyyInlQl+P0+JRSyYTkyhYQKVDxbqHm7
 fv18As1gPkdTdew74AsnPhAkxY9tB4j6cfvrGPuXRlPyQHerFQ1xNdBMNJOSt7VM3oM4
 AX2w==
X-Gm-Message-State: AOJu0YxuhS4O4814yLeXD9Zip2t5wurVUOyJYFRrJFoIpF72qrbxOd8t
 OxJ6FAb08iovOuEsmx9jKDpO8A7WerituCzZqhwUC8UVvG8/eyUfGIYxLfllQzE=
X-Google-Smtp-Source: AGHT+IHS2nU/Hq61hgpg0vZhykkkrbdBlvMdxKedfwpe5PVK/sAWstY6jAzMltFjGZuSLGy+0Is5iA==
X-Received: by 2002:a5d:684a:0:b0:337:507a:5c59 with SMTP id
 o10-20020a5d684a000000b00337507a5c59mr60840wrw.12.1706202001063; 
 Thu, 25 Jan 2024 09:00:01 -0800 (PST)
Received: from [192.168.69.100] (lec62-h02-176-184-19-125.dsl.sta.abo.bbox.fr.
 [176.184.19.125]) by smtp.gmail.com with ESMTPSA id
 l8-20020a5d5608000000b003392bcd6c48sm12913879wrv.79.2024.01.25.09.00.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jan 2024 09:00:00 -0800 (PST)
Message-ID: <494f1d72-661a-4ba6-8e90-13b2d4043fc2@linaro.org>
Date: Thu, 25 Jan 2024 18:00:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] m68k: Clean up includes
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20240125163408.1595135-1-peter.maydell@linaro.org>
 <20240125163408.1595135-7-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240125163408.1595135-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 25 Jan 2024 17:00:12 -0000

On 25/1/24 17:34, Peter Maydell wrote:
> This commit was created with scripts/clean-includes:
> ./scripts/clean-includes --git m68k include/hw/audio/asc.h include/hw/m68k/*.h
> 
> All .c should include qemu/osdep.h first.  The script performs three
> related cleanups:
> 
> * Ensure .c files include qemu/osdep.h first.
> * Including it in a .h is redundant, since the .c  already includes
>    it.  Drop such inclusions.
> * Likewise, including headers qemu/osdep.h includes is redundant.
>    Drop these, too.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/audio/asc.h      | 1 -
>   include/hw/m68k/q800-glue.h | 1 -
>   2 files changed, 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


