Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1s3skc-0004T5-8C
	for mharc-qemu-trivial@gnu.org; Mon, 06 May 2024 03:27:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s3ska-0004Sq-F4
 for qemu-trivial@nongnu.org; Mon, 06 May 2024 03:27:04 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s3skR-00058S-QM
 for qemu-trivial@nongnu.org; Mon, 06 May 2024 03:27:04 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-41dc9f98e8dso21444265e9.1
 for <qemu-trivial@nongnu.org>; Mon, 06 May 2024 00:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714980413; x=1715585213; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=R2iZSo2OZ5TU+QCPEHkJIeNkbXqV81wBC0Jjzr20pA4=;
 b=FikLF/jYzapsNrp3x4K09jNBzuK8SXkRr196sHz79HxY+lxQkOsTRGpMyqGoL+d7Jx
 cpp6u8vPOY0mg/+mxs2eGqUm2jWdWyORE1Ktf61yuFtiRkthapdyq3CG2c6Q+/wBkdn8
 xh1we+EyxPX3b2eE6vFzCHpUYsTaAw+LWo/nOxEPdZLkB1xLSfsoGbvbdqrfiUZBKTaY
 crIJc2N9ND2b+q2YFjMR9/15GH5+RzCXCwJ+HnL8aOPy5/FM1O2R+OVAkDvLZQK5yeBh
 p68/q2JOCQ1DQSVrYZjXiUdp0mrNiuimtcMFAutuS3oG3je6jelLPMRZgeFKDOIpZy+/
 lLfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714980413; x=1715585213;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R2iZSo2OZ5TU+QCPEHkJIeNkbXqV81wBC0Jjzr20pA4=;
 b=jqKgQAnI0zYxghthOW2EemSK97j2zZIOfgfjvEm/pXHJkCASJcY90tpow/S5Nr4xM8
 1gXzhPTQo7qvDI8Ne8pilf/jWULD5v/UugukxO3Zuwc7NllUrU4AO285RA8UPQkhGixz
 coMF0Wpsb6MHlL385XSdaL30/SSQEkkUkM9dAXe9CWTFZN96Gjftj0vMQMSPGhwiV6CO
 vyAjDxm9i7El8QwONb+FVea9arP3JJrlMvCDLyVPuuoTC9mzknnKqgMVr044MJA+k+6u
 EvdUO/gGvvTv4RnHdqlqd7fH7+38rlwiwhQDGObHrJ82Q2z4c0hTmeP04tqiJNo91PTE
 OdKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPm0D5boGBJph1MNcuyKJgdoIyYTWgRjuSEf+HGhqTZUZgTCHRSwCLtmOQuN0j7EbxV/4zVT0dIV54TpFANKr52zvm8RUwbg==
X-Gm-Message-State: AOJu0YyApGxCq1lYt5ZjuMUoN854AmFNT4cpeO78xx+6+mHUB8EBZPIL
 9ipd5U/GGLDZIsX0wNWG63oAdw4vcuTMr/d5MIoVN32APOU0fBOvzKohxiM/RFmU6ZP4r/u/is0
 d
X-Google-Smtp-Source: AGHT+IEMRFFRIi8vVQ9vhp+ydBguevZUIz72fmVm8JM/nBWL17wc9x1JIJo9v2NqxtukfPPJPRXL8Q==
X-Received: by 2002:a05:600c:3b99:b0:418:bdcd:e59b with SMTP id
 n25-20020a05600c3b9900b00418bdcde59bmr10961862wms.7.1714980413262; 
 Mon, 06 May 2024 00:26:53 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.211.4])
 by smtp.gmail.com with ESMTPSA id
 je8-20020a05600c1f8800b0041bf28aa11dsm14993283wmb.42.2024.05.06.00.26.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 00:26:52 -0700 (PDT)
Message-ID: <c9eb8dda-b716-4409-965d-4d43edfb29d5@linaro.org>
Date: Mon, 6 May 2024 09:26:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] include/exec/cpu-common.h: Rename PAGE_BITS macro to
 PAGE_RWX
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20240505121008.44A0D4E602D@zero.eik.bme.hu>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240505121008.44A0D4E602D@zero.eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 06 May 2024 07:27:04 -0000

On 5/5/24 14:10, BALATON Zoltan wrote:
> This macro can be used to abbreviate PAGE_READ | PAGE_WRITE | PAGE_EXEC
> for which PAGE_RWX is a better name and renaming it also shows it is
> not related to TARGET_PAGE_BITS.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   accel/tcg/user-exec.c      | 2 +-
>   bsd-user/mmap.c            | 6 +++---
>   include/exec/cpu-common.h  | 2 +-
>   linux-user/elfload.c       | 2 +-
>   linux-user/mmap.c          | 2 +-
>   target/cris/mmu.c          | 4 ++--
>   target/microblaze/helper.c | 2 +-
>   7 files changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

and patch queued, thanks!


