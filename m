Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tzYsf-0007CM-3G
	for mharc-qemu-trivial@gnu.org; Tue, 01 Apr 2025 06:30:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tzYsd-0007Bl-KU
 for qemu-trivial@nongnu.org; Tue, 01 Apr 2025 06:30:03 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tzYsb-0002tV-Jj
 for qemu-trivial@nongnu.org; Tue, 01 Apr 2025 06:30:03 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43cebe06e9eso41469665e9.3
 for <qemu-trivial@nongnu.org>; Tue, 01 Apr 2025 03:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743503399; x=1744108199; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=exM0qDUXriN627sYJi8hnsjMqODQyivFPPjPhdDB09s=;
 b=Wb0VppCo60UHlRXlexvCom4lyRtc5FiZVAdywbQi3umKM6pv18xenyUUrfT+Sx/FPs
 gMr4MRkfPtqURoodju4v0rAK727d0tIYpyIBwzW2oYmM+kYdE08iePp+3Gsx2pHPCRu9
 Q3Jpj1kedkr5GWqfLcOXPOWlsW3q3WGTa53WJMxefXn4J3twnenxWWQCxtdhqHyx5fpY
 Gx7VIJPra540AmuRvqB0gGLK5db709BKbbDdRO0Xpbz7rrB7x918Uixx0ykhEXd2WLZ8
 kgVhkqm5cmiGD1cDblZ2FLuNNmk0BAmk+BXF29twVEKe3lzLiHRJXRvXrMcSCRlTVzOz
 Uz7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743503399; x=1744108199;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=exM0qDUXriN627sYJi8hnsjMqODQyivFPPjPhdDB09s=;
 b=LdwvjxMkMGlPvhupX3xl3CiH74KCJZsMQWjuMfOSLwby0UZrthHmqliayEYyJf1FXj
 iTKnqjaBlmKKrR+V/EYLGNbhSmpeZegC+WPeyVxoezKEQkF1hjL6T2HHZxn5BT1rkCZy
 ZdLSis3nvg2j6TUTUwVneta0BI+rsDGjJWhYH+/XraVB+AG1kk5+woM9+zJCAsPO5sSu
 GzsHl2kWwriRR7r1zbfFFbjS/IkwpgZIMatfh8EM0RZcnaoqTpjnq3pPdWxjaknWG1z7
 nrQP0mZ59/IcZjQvapwyhU2ccmsR4XnZk7+cZhgd+Uf7gpA/E+pzSHTMF6DyKfP+qgb5
 +5GQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLBVstVg5pIBMJQ/wAPflDpRCQ41P9duGz1d+hW8Hx9t6h+EpX16lORu4GkIoxeRXjxAyfvIgM4eggl/0=@nongnu.org
X-Gm-Message-State: AOJu0YxIWofNGIN0r15ljZetyfZOAxJyhXEWL9y3nvhYmHPzDC+oUsiQ
 aF2HdMThnUSSoqfysA7OXwAlaxPjKzT7HGUs7Qtk2O9vS5Lv+mbYNZtv78UXr7A=
X-Gm-Gg: ASbGncsrk6RdMgn3GIA5fSM/A9us9zm1Hr9KxY+Fyb70kLyyO5yFb78dzrBms1yraj/
 FzaELVhi3j1LIrkGs4j+087zA3JHORy5aXn5XJc2naWukDmdrzUEOBLSZC1saBs7INzepvwkDJC
 TtRCwyB4v2ECVlJ5tahIMq47Qm2zl3BOSlv2IYwzowYk+eeXSZgQRjN5KXPXn/5CSxFyH3Vi1FX
 kdrAqm9G0LjoBLxF70HuvuCdaY6KZCMMqEdsjOmEubSURYYh+MtcdHLFDaNX+R43qXYzoLMt0Fc
 FATB7PG0TUe8MdEQ/IhcZJoIrvWrzf6wyTStkYLtSgANCrc=
X-Google-Smtp-Source: AGHT+IHZd2gStGxa6cxCvJvgB2RYzQ2eSGI66GiYHsc/pYxwn4Q1PAczcpovJVRcNJXIx8fIFYgkyA==
X-Received: by 2002:a05:600c:46d0:b0:43d:7588:667b with SMTP id
 5b1f17b1804b1-43db62264d4mr135591365e9.10.1743503399634; 
 Tue, 01 Apr 2025 03:29:59 -0700 (PDT)
Received: from draig.lan ([185.126.160.109]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8fba4c29sm157175245e9.5.2025.04.01.03.29.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Apr 2025 03:29:59 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 3FEAC5F8B9;
 Tue,  1 Apr 2025 11:29:58 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Zhang Chen <zhangckid@gmail.com>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  Peter Maydell
 <peter.maydell@linaro.org>,  qemu-trivial@nongnu.org
Subject: Re: [PATCH] docs/arm: Add apple HVF host for supported guest CPU type
In-Reply-To: <20250401083102.72845-1-zhangckid@gmail.com> (Zhang Chen's
 message of "Tue, 1 Apr 2025 16:31:02 +0800")
References: <20250401083102.72845-1-zhangckid@gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 01 Apr 2025 11:29:58 +0100
Message-ID: <87zfh0npi1.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 01 Apr 2025 10:30:03 -0000

Zhang Chen <zhangckid@gmail.com> writes:

> In my test, latest QEMU already support Apple HVF for -cpu host and max.
>
> From guest VM lscpu:
>
> Architecture:             aarch64
>   CPU op-mode(s):         64-bit
>   Byte Order:             Little Endian
> CPU(s):                   11
>   On-line CPU(s) list:    0-10
> Vendor ID:                Apple
>   Model name:             -
>     Model:                0
>     Thread(s) per core:   1
>     Core(s) per socket:   11
>     Socket(s):            1
>     Stepping:             0x0
>     BogoMIPS:             48.00
>     Flags:                fp asimd evtstrm aes pmull sha1 sha2 crc32 atom=
ics fphp asimdhp cpuid asimdrdm jscvt fcma lrcpc dcpop sha3 asimddp sha512 =
asim
>                           dfhm dit uscat ilrcpc flagm ssbs sb paca pacg d=
cpodp flagm2 frint
>
> Signed-off-by: Zhang Chen <zhangckid@gmail.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

