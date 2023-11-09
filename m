Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1r1AV4-0004Tt-0Z
	for mharc-qemu-trivial@gnu.org; Thu, 09 Nov 2023 14:15:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r1AV2-0004Os-E8
 for qemu-trivial@nongnu.org; Thu, 09 Nov 2023 14:15:32 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r1AV0-0002in-RN
 for qemu-trivial@nongnu.org; Thu, 09 Nov 2023 14:15:32 -0500
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5431614d90eso1961775a12.1
 for <qemu-trivial@nongnu.org>; Thu, 09 Nov 2023 11:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699557329; x=1700162129; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VtnShdIIpSWeTV7LQyH2ProJzswg83OfEbm1H/Bze3g=;
 b=jCYdwN2hvPXw3V+Wjp6VudrXuimIOBQGr8btG0CQOHlTMydw+BawmSV27la9RcNLnt
 S/SDUXEIDx+9TvCo0INeRz0liGF8KK2YHFIX25b5jEC7RMWdvsK0q27BB3t4AaPfxtU5
 bOa5pBn2A1JuWQLFcyY40MDDewR8PztuNhT3eqKQmvo64P58U5JZJ7MgpvBsw8EziqDb
 O8z4x0TjYLSoOeTGz/TtANKddHFViRzxWKQOyLVpQnikkj3eDlPna6MSGtKlfsLDregy
 u+Y4aTwEAYx4eMQv+TwncQebNlnaiV7l1nGHupsFTEsDus1eiB3Omdup2Ycj7dEymcvw
 iDtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699557329; x=1700162129;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VtnShdIIpSWeTV7LQyH2ProJzswg83OfEbm1H/Bze3g=;
 b=WyFH8w9cMSCG6ML1U20gcS9ekpeJcG3KUWG7+w0rtrlDweEndQP8vSeShZ2PYfpfDn
 9fJFaypefNWTmf6zgqUqRagOi68nKm32JAMcW3UswTKaSEBuREzP6qWZuR9inwDKvxCg
 a1DnGnkpPBJrbRVULzxKQGi7eiRaNlBJxeOOp2bcyIM2/h6Lk49E+tpK1yeqpO4kBya9
 ueKL1ZebzcJwgQrHZjbyz7JGsTmoqI6yJqT64LtWoPLU4WNvclxQfcOzADnYFt34bflc
 B1lSWWMMijHXehEWGeW2bn7u47gW8RDvcWJDafI+EP4XsdCsjdDIPiHKLJBMWMnlTD3U
 ngAg==
X-Gm-Message-State: AOJu0Yytt6DfAligEKhLxIvTRNA6aOh7ocsFqVCYy8Y42A/GmJ2fQ952
 vbKep+CzH6PcxmiAhiRxg+xQ3Q==
X-Google-Smtp-Source: AGHT+IFv6MBJbvHODwNPBnEGO4aJViTzKPZIE04DVa9kCYGJ+8f42Jo4F2er38Ncq6lalTX/OYxoEA==
X-Received: by 2002:a50:9b0a:0:b0:540:3c85:14b3 with SMTP id
 o10-20020a509b0a000000b005403c8514b3mr5337337edi.36.1699557329146; 
 Thu, 09 Nov 2023 11:15:29 -0800 (PST)
Received: from [192.168.69.115] ([176.187.199.161])
 by smtp.gmail.com with ESMTPSA id
 d4-20020a056402516400b0052febc781bfsm166756ede.36.2023.11.09.11.15.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Nov 2023 11:15:28 -0800 (PST)
Message-ID: <29a93950-9479-4895-b1ce-8006c3e4c7c4@linaro.org>
Date: Thu, 9 Nov 2023 20:15:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/tsan: Rename the file with the entries that should
 be ignored
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20231109174720.375873-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231109174720.375873-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x531.google.com
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
X-List-Received-Date: Thu, 09 Nov 2023 19:15:32 -0000

On 9/11/23 18:47, Thomas Huth wrote:
> Let's use a better file name here.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   docs/devel/testing.rst                     | 4 ++--
>   tests/tsan/{blacklist.tsan => ignore.tsan} | 6 +++---
>   2 files changed, 5 insertions(+), 5 deletions(-)
>   rename tests/tsan/{blacklist.tsan => ignore.tsan} (57%)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


