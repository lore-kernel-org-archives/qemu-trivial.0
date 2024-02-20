Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rcP7Z-0001wf-BY
	for mharc-qemu-trivial@gnu.org; Tue, 20 Feb 2024 07:21:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rcP7X-0001sF-Dr
 for qemu-trivial@nongnu.org; Tue, 20 Feb 2024 07:21:11 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rcP7V-0005DO-No
 for qemu-trivial@nongnu.org; Tue, 20 Feb 2024 07:21:11 -0500
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-33aeb088324so2839397f8f.2
 for <qemu-trivial@nongnu.org>; Tue, 20 Feb 2024 04:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708431667; x=1709036467; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=u4SXhPaxCqhhzvj4514yLQwGYEcdEL/FALu205hZf0s=;
 b=QMv8oYBqrYEzkWLFulrJe2qZV2OF2rgHPEPVrKCeNMaE0PMvbw+/lnbliWSr4vkOKY
 mU6cBCnlT5rM6vAWs7k10JB6BIo/Jcs/gqZ4xUBOVf44nzrNE5yT3kqSUZXhboRG7ObA
 2NNmcbibvTF5S2meUVkm5kDjWh5Aa7tsMd+rvDKzkyaTgjENUH/0Qh4qwDypkyHM2rIk
 4fkOGshmz/VFvEAxapJ+8m9LRde+fl9cRPU0BkdVX53sutgRXCK2iUrU5691A+OqM3Ss
 q1uWrST91mzAVeXN8LGpO5yF31nHn0LOA/mfuEeyndR6ZC1HzqLUrZ8gZb9ozvULM59a
 QEnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708431667; x=1709036467;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u4SXhPaxCqhhzvj4514yLQwGYEcdEL/FALu205hZf0s=;
 b=uLM6lMUGThhQRq8fj7pqM7e2ax5Uy4WU7PaFm7m+Fm8gUJylbIFL9TuT6PT7gptvb7
 L+nj5WKFsqjEr+RyuUgj0fQydE+tkgamREjQQTDx/EMhqaYIwyRRXuOIHQsRWvut+jRR
 XQkXm5CFCAvhnLqfRYJOyBmk3ex3943Faoo2Pa9DajCbA1J6x1JBeJDPGO9yaDzPVELL
 TA/RZpsx+776qBBnajyXIIYS4Lnw6nZzmaoHDS7+6wFaher+Bh+PndX5Aqe1I9M6/KpF
 H4M82SF9HLmyPtDyUklA3eCDPPR9H3HNroGv7sgJFTT4DTWp01zE2wbgVB6QadTyk7uC
 ZQdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/ucgyYvyOxuRtWg/LC7uCKZz6TwXmh55VKOgYFkdNYhVI4bGnjXTUp88S6FwwkB0e1HWapIW+WpQfWZvYuJ/aHpC3q1vzTQ==
X-Gm-Message-State: AOJu0YyWk5/P9nNzQa0+O7a6y9TK9AdVXBd932O3JBm3bwUFl62hrHUF
 lUxo/ZPquaB5PW+33CCAZucyHcXX/kSZA4pqFpE0/4hQazTyq0PIvWkBZR9sOVQ=
X-Google-Smtp-Source: AGHT+IHKP2F266HeebbqbcuPAAqNpwl6AhU7BiQB6VJzK1qLv7+tdhPloX02LwYxVwwSoAN6gbvg9Q==
X-Received: by 2002:a5d:5443:0:b0:33d:1a0b:3a04 with SMTP id
 w3-20020a5d5443000000b0033d1a0b3a04mr7899474wrv.63.1708431667486; 
 Tue, 20 Feb 2024 04:21:07 -0800 (PST)
Received: from [192.168.69.100] (mek33-h02-176-184-23-7.dsl.sta.abo.bbox.fr.
 [176.184.23.7]) by smtp.gmail.com with ESMTPSA id
 a7-20020adfeec7000000b0033b483d1abcsm13193952wrp.53.2024.02.20.04.21.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Feb 2024 04:21:07 -0800 (PST)
Message-ID: <529a81a2-792f-4739-965e-6eecffa919b6@linaro.org>
Date: Tue, 20 Feb 2024 13:21:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 18/21] hexagon: correct typos
Content-Language: en-US
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Alessandro Di Federico <ale@rev.ng>, Anton Johansson <anjo@rev.ng>
References: <cover.1708419115.git.manos.pitsidianakis@linaro.org>
 <10db19d340ac3f275900f315661904d1aa004949.1708419115.git.manos.pitsidianakis@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <10db19d340ac3f275900f315661904d1aa004949.1708419115.git.manos.pitsidianakis@linaro.org>
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
X-List-Received-Date: Tue, 20 Feb 2024 12:21:11 -0000

On 20/2/24 09:52, Manos Pitsidianakis wrote:
> Correct typos automatically found with the `typos` tool
> <https://crates.io/crates/typos>
> 
> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> ---
>   target/hexagon/idef-parser/macros.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



