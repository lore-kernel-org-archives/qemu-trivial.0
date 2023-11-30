Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1r8lOX-0000zx-1V
	for mharc-qemu-trivial@gnu.org; Thu, 30 Nov 2023 13:04:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1r8lOP-0000zK-NR
 for qemu-trivial@nongnu.org; Thu, 30 Nov 2023 13:04:06 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1r8lON-0006Hr-PR
 for qemu-trivial@nongnu.org; Thu, 30 Nov 2023 13:04:05 -0500
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a08e4352992so176898766b.1
 for <qemu-trivial@nongnu.org>; Thu, 30 Nov 2023 10:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701367441; x=1701972241; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P5jaemYcRn4/pBqbCndudYBCVOJZzXayR/s1I9ImqWI=;
 b=VkwXUhoTyAS0wisd+WFWvfUGm+eoFbfo/lfVOqxyHRK92xfl2af/4Hf2gm08re8gf9
 nYhovfrAVNB3MewFFit1HcY8RBMXo2wJCrc/xbxjNwmw1LC0hNsuICQCNwTjGLzeubNn
 /5VZlxMy5bsq63yCb+ikuI+xCpO4Ds1bfZqkqPMSFagh3E/QcnqPmOGbw8qdM6Aes+qb
 yovQVcaeUw/KBg9E4ZcBToNr2DPvGUizGNbz55PJDRD7SVzh+ZUl3n2o31FGr4xyptAL
 4p3u5AL4OyFnljEb39zQ4dAnUea6nvWqCN9enwJ77zmc+VGu2BpLwF+lMC9FXCiay5Jh
 Ey5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701367441; x=1701972241;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=P5jaemYcRn4/pBqbCndudYBCVOJZzXayR/s1I9ImqWI=;
 b=I4ot6mQkoyZDC1KEySiwVXuJ+VAu8k5MIkGYjm8l02Q4f+FQrybZN/opi4+/rmcabC
 UbuKQuT6duWpJIjq2uvKGWWK/r5LTmUldUdO5KD1hAaRhAk7k0JgUoKDYIVctfXBGPCR
 ZhS12X52pdwkHzcn4XjGD9UJmQjH5kNGwcEGGftuLWMs+gXDSgbbbzND4XpPhlB59j0W
 xy0KgrIxeYizgbqoGFICp6jVO08CycqjDBBhx2YKyuXZ52EU75bb4anMyEz9IcpQQB8h
 7r9RJyF/4/2APA+eTbmcKDn2DpL580VGYl61//UKBvKMU+eb1U2PgA0fUTdaxvo3Pf0a
 /7lg==
X-Gm-Message-State: AOJu0YzzFer5SjgZFI3eb8jJsxLLm8cedOlYLcr8dBZXuVotNPFDNeiT
 p9r6OGpYlCuywK0z0myHkpe6/KoHrVlEAKKTsOjLWQ==
X-Google-Smtp-Source: AGHT+IE9ty0p0UFHQ60xwF1xqod6ikGojEPRwLv7UnPjH484UgrUEbS+Q5i85MYlpHGnIw2TFDrO2g==
X-Received: by 2002:a05:6512:2310:b0:50b:ae1f:ff24 with SMTP id
 o16-20020a056512231000b0050bae1fff24mr113872lfu.31.1701364275748; 
 Thu, 30 Nov 2023 09:11:15 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 h9-20020a05600c314900b0040b3d8907fesm2621507wmo.29.2023.11.30.09.11.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 09:11:15 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 0C7795FB51;
 Thu, 30 Nov 2023 17:11:15 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jai Arora <arorajai2798@gmail.com>
Cc: qemu-devel@nongnu.org,  qemu-trivial@nongnu.org,  pbonzini@redhat.com,
 peter.maydell@linaro.org
Subject: Re: [PATCH v3] accel/kvm: Turn DPRINTF macro use into tracepoints
In-Reply-To: <20231130155058.237850-1-arorajai2798@gmail.com> (Jai Arora's
 message of "Thu, 30 Nov 2023 21:20:58 +0530")
References: <20231130155058.237850-1-arorajai2798@gmail.com>
User-Agent: mu4e 1.11.25; emacs 29.1
Date: Thu, 30 Nov 2023 17:11:15 +0000
Message-ID: <87edg76ua4.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62c.google.com
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
X-List-Received-Date: Thu, 30 Nov 2023 18:04:06 -0000

Jai Arora <arorajai2798@gmail.com> writes:

> Patch removes DRPINTF macro and adds multiple tracepoints
> to capture different kvm events.

maybe add "We drop the DPRINTFs that don't add any additional
information than trace_kvm_run_exit already does."

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

p.s.

It is helpful to add a mini-changelog bellow the --- line so reviewers
can see what changes have already been made to the patch. The git
tooling will strip this log when the maintainer applies the patches.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

