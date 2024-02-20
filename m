Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rcP2S-0005Ue-Mm
	for mharc-qemu-trivial@gnu.org; Tue, 20 Feb 2024 07:15:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rcP2O-0005LD-TH
 for qemu-trivial@nongnu.org; Tue, 20 Feb 2024 07:15:55 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rcP2M-0003t3-N2
 for qemu-trivial@nongnu.org; Tue, 20 Feb 2024 07:15:52 -0500
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-33d146737e6so3303843f8f.0
 for <qemu-trivial@nongnu.org>; Tue, 20 Feb 2024 04:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708431349; x=1709036149; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/lXrDV0+0Z9ohF8B0ptVCwj073MI7pv/ix0B/jvgdeg=;
 b=aRXPyW9slPGL2eIA5SAgj7oOv7BtuBP4j6soA40xjllgB1GEk37yjeYpZupXxSiElB
 HbZTP3HdY1/4Tjs8fgrUtkKDLpwaZ/s9CWPQQBbolegeFiBKrUeDO6WZoome8lbufgYF
 1ASx3i/U9RAvivf38RQ85X03W+fIfLGfhrq7SOPB7XrrglTX41TnJ2qc0mJF03Q0tZps
 IE2moGRzd8nKMmDgLtD61L28C8RhzLmIH2EFrLnKuMzW4P6kJuu2FLSjCqi1i38jROwc
 lRg6Wf61ncRqcLEmJT/JEd78Ql4lU7CSPRIOP424VBDWle62D22JCauReg0iaj9fcsYG
 p/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708431349; x=1709036149;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/lXrDV0+0Z9ohF8B0ptVCwj073MI7pv/ix0B/jvgdeg=;
 b=MQrGxVJ4L3VAzvEviRc9c5t5U1otGvQjI8yjOp7/WS5ZLLdGDHuRFM7DKuevHYZJBm
 HX2svx9gbeqHhzEfR1FaFs5Ov+ishkmM4oJHLtVe+H9gl+3B6JZs3eOa/m+lnMR0nEJ+
 7mDPm01vUtzHLDjs15T7an3a6QTcSUbhSloBqO1JsSUsL+8fxBRk634BhS/LwSqfRY6A
 j1wwunLbvuIiPRfGRCtsGuX9XrT0OCqlCL+4V41p+V86pQvQNIeG6Y6KYlzqVqJ805oo
 xwLlO36BhzIsaWAVdlPZxeUKUqLd8BM/UxfUu83JJJoavPNms4ElYqjrofuh65TuMO+5
 JG1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOyBYrfS4l3wzKdf/io1JPDmuxxeEZDUURgl0pSA0TXAKFvI5Ag3jvbjL6PCjKzh9b3tnP48X8UjTGXFWVAAM93hNFxwqiaQ==
X-Gm-Message-State: AOJu0YwDbZkoE+NFN8loHZHvtZbEsA4fKnxrb0SF6ELuss14yx2WGFlO
 efN/m6AYnsj6wMKvoXpGVjlKcjDGC/4056tjtg5e/y58ryP8EHf3xXuz7bYzqPE=
X-Google-Smtp-Source: AGHT+IFGOnO0Tdk4GiPCSz/pWDnv6//kEbECIIZIUnUfbjlN5J84vujRBdtLHPZE/oySO2ELmgtvkQ==
X-Received: by 2002:a5d:414e:0:b0:33d:1427:5274 with SMTP id
 c14-20020a5d414e000000b0033d14275274mr9881772wrq.52.1708431348879; 
 Tue, 20 Feb 2024 04:15:48 -0800 (PST)
Received: from [192.168.69.100] (mek33-h02-176-184-23-7.dsl.sta.abo.bbox.fr.
 [176.184.23.7]) by smtp.gmail.com with ESMTPSA id
 a7-20020adfeec7000000b0033b483d1abcsm13193952wrp.53.2024.02.20.04.15.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Feb 2024 04:15:48 -0800 (PST)
Message-ID: <a136a0a2-d390-4fba-ba42-3ad2746ad1ca@linaro.org>
Date: Tue, 20 Feb 2024 13:15:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/21] accel/tcg: correct typos
Content-Language: en-US
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <cover.1708419115.git.manos.pitsidianakis@linaro.org>
 <a7bdde5bf92b22255cb6d280330bab94bdb59a79.1708419115.git.manos.pitsidianakis@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <a7bdde5bf92b22255cb6d280330bab94bdb59a79.1708419115.git.manos.pitsidianakis@linaro.org>
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
X-List-Received-Date: Tue, 20 Feb 2024 12:15:55 -0000

On 20/2/24 09:52, Manos Pitsidianakis wrote:
> Correct typos automatically found with the `typos` tool
> <https://crates.io/crates/typos>
> 
> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> ---
>   accel/tcg/ldst_atomicity.c.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


