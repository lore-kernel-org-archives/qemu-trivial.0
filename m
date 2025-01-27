Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tcQVy-0008QI-DJ
	for mharc-qemu-trivial@gnu.org; Mon, 27 Jan 2025 09:55:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tcQVw-0008Oz-E7
 for qemu-trivial@nongnu.org; Mon, 27 Jan 2025 09:55:00 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tcQVt-0007mi-M8
 for qemu-trivial@nongnu.org; Mon, 27 Jan 2025 09:55:00 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43618283d48so32142895e9.1
 for <qemu-trivial@nongnu.org>; Mon, 27 Jan 2025 06:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737989695; x=1738594495; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9TWdd0QxdeY2OeyZBUdXqsmxJKK6cy4HHzaxyvCkSNQ=;
 b=Nl558sur4ZYjVZ4/l4eVfnJqmlrosZMIZuGe8VWGM7uTXdOvGTmS+uCsROYEQooHGx
 jFYoBgTBrzr5fq3jw4UM/gQTOtTs344A2ZpKsxcP34J0ZNKNaOzvMMUGwitXV5ldJkkd
 8LOJOkVm34JV8vTvBoIL5sSkM0TdquYvrUkyZnOPFN8otc+js08cYThlKSYVBG9wroMz
 nwxclcru5ptdvc+TQP9mc1AaDubOiOA/9J2SJd5PcZhbGYem5qAf5O2TXODZdPOzXojy
 ooI6ozHbIcV02v2qiXRe+s4+8/03VLsPiGbTEKRtFFbi/6fbjjXciErftfuKDNRdgK8h
 sXOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737989695; x=1738594495;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9TWdd0QxdeY2OeyZBUdXqsmxJKK6cy4HHzaxyvCkSNQ=;
 b=nFA2hc8Q+Or+bzjxpJ0unqyp4ul7Rg+i92+zUoMYOQJNSsfgOBUHGD8v0oycEPcwMc
 of4PInRFwhWoe1CNsw0qCZXvR2oeS18lRF0wzaH5+5ymlUXVe3lHLLJhG5n9ood+O3Tb
 8ggJv0A8xI0Dv5groSqgjJuN5QonMUDuKrppBdsgatMPeDC5Uc0Dtgw4IaTbmySTGC2G
 T5jrlnQoGDkRSaOj/CpYYMxS4kLOBpzzJQU3YUMbPhP6JjeIhOd6XKhmbSRFhiUnBVIg
 JMvw6pt+YZ+BM8UTM669eeXO74Sao0RrQXB/stw11gaw7NSL1HYFFs/PICXxp9hoYzjc
 6xjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLgQmALGcetYlhkTHwNYzLdL0FEnKFkjA+KtzOoWQMtFTYfRFCey37Cgn/mP6toBHjKt4Cw9sKtz2OJ90=@nongnu.org
X-Gm-Message-State: AOJu0YyaR/pAkn1cT18p8k1IOhALmXjvrHCX6gP15yAwtYrQsZcfl8Tf
 7YsBU6WT4BSk49T8sDeqVPqwo0B4eVOQ/Iay8ASpn7x/c6rt8Ua+J43l7uxCeAE=
X-Gm-Gg: ASbGnctSXcYMDm7D74qtLaw0bx/T7UQuYOZC0nTa5jdZdMk1wnoKhlpqo5UHmdL0qTi
 e6QKw/Rzbu+zI3VTgHrAlj7Q9t/pQeimrVE/dXprhTt+VZ9O4sAly4LDla0sXIRfC8Q5ZTrQG2t
 uYPmx9OOXzc5k1Y++4A6X5IWRGqxXYbuKqIKErllKfGL5XVLbT9lOrp4W/jS7XZ7AtM4sdn9E7X
 zTlX4BtNBzZUo5fD40RgdMV4KWphKt5tq74QZOlcqs2uigHcWl2Hy/Y910tzyL9BzRYlb7eXary
 StnZ/YV2CvOz2ueq1B+G/uNoQz/WMcSPkKRtdYqNVkNIOH1j
X-Google-Smtp-Source: AGHT+IFdbb6gbhrsAsHM0qZ+TYzIF/wzFIRkSuvxmggXVsLAMdH77a6gUsgdyZmhH4RsOTjRsRwF+Q==
X-Received: by 2002:a05:600c:3b94:b0:434:9934:575 with SMTP id
 5b1f17b1804b1-438913e02f8mr458008365e9.16.1737989694755; 
 Mon, 27 Jan 2025 06:54:54 -0800 (PST)
Received: from [192.168.69.181] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47f25csm133506235e9.1.2025.01.27.06.54.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 06:54:54 -0800 (PST)
Message-ID: <f1d4a5f8-bc0d-46df-802b-a1c5b62e9854@linaro.org>
Date: Mon, 27 Jan 2025 15:54:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] licenses: Remove SPDX tags not being license identifier
 for Linaro
To: qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
Cc: Radoslaw Biernacki <rad@semihalf.com>, Laurent Vivier
 <laurent@vivier.eu>, Cleber Rosa <crosa@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, mzamazal@redhat.com,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>, John Snow
 <jsnow@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-arm@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250102160510.61894-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250102160510.61894-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
X-List-Received-Date: Mon, 27 Jan 2025 14:55:00 -0000

Cc'ing qemu-trivial@ (patch reviewed)

On 2/1/25 17:05, Philippe Mathieu-Daudé wrote:
> Per [*]:
> 
>    "we're only interested in adopting SPDX for recording the
>    licensing info, [not] any other SPDX metadata."
> 
> Replace the 'SPDX-FileCopyrightText' and 'SPDX-FileContributor'
> tags added by Linaro by 'Copyright (c)' and 'Authors' words
> respectively.
> 
> [*] https://lore.kernel.org/qemu-devel/20241007154548.1144961-4-berrange@redhat.com/
> 
> Inspired-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   accel/tcg/vcpu-state.h                           | 9 +++++++--
>   include/hw/misc/ivshmem-flat.h                   | 5 +++--
>   hw/misc/ivshmem-flat.c                           | 5 +++--
>   target/m68k/semihosting-stub.c                   | 7 +++++--
>   target/mips/tcg/system/semihosting-stub.c        | 5 +++--
>   tests/qtest/libqos/virtio-scmi.c                 | 2 +-
>   scripts/qom-cast-macro-clean-cocci-gen.py        | 7 +++++--
>   tests/functional/test_aarch64_sbsaref.py         | 8 +++++---
>   tests/functional/test_aarch64_sbsaref_alpine.py  | 8 +++++---
>   tests/functional/test_aarch64_sbsaref_freebsd.py | 8 +++++---
>   10 files changed, 42 insertions(+), 22 deletions(-)


