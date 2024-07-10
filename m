Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sRagt-0006li-B1
	for mharc-qemu-trivial@gnu.org; Wed, 10 Jul 2024 13:01:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sRagr-0006kB-Rb
 for qemu-trivial@nongnu.org; Wed, 10 Jul 2024 13:01:13 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sRago-0000wR-9V
 for qemu-trivial@nongnu.org; Wed, 10 Jul 2024 13:01:13 -0400
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-52ea2ce7abaso7893e87.0
 for <qemu-trivial@nongnu.org>; Wed, 10 Jul 2024 10:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720630868; x=1721235668; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UHvCF5ZAfORjZUyVNW7xSfrgqWEkec0E+j+d5vIKzDA=;
 b=YwHsJXyxWqVHRFBz/E/R+7/kdhi75C1V3ZixoiT7YDDjT461mmVriNhHdBE3P0NJLk
 aYPxE3Ro195O11Ce5fJTb6xFidIPKqd31Ywns9T68RFtqMkwiWuvJDK7JHqdnIAPoOEX
 nJ/kA2L+K8qSE727QpO4Y1Ef0ON4EO3UT5W32pAZ36Fc4fHOgp3ayoMKhaAgDUBci3N0
 MQrGE9Qdgtn3wVIIZ0VMIVeRcf38h5TAeQk4FA8h0u1Yat3z04/XQDzbAtOFUXrb4a7r
 w0UAgUQgO8zpV+dmn5BSnB/MMeWaFvkOC0zbVG3cneuVwKB3iwfy2wEJWh8MI7+sgJow
 kLsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720630868; x=1721235668;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UHvCF5ZAfORjZUyVNW7xSfrgqWEkec0E+j+d5vIKzDA=;
 b=WMeV8FOfIgTparKBc5Ues/d2lskESIPJiSB75ElJFtU+yYrB9LETEcL8q0vSmZxtHj
 O4kNNzjRh05H7ae6CepfRzGifnHFc+nneujBPOdgxho1XE/Vtfngtf22eLLQe134r2CE
 zfxQ2kDhAiMcwD5t5gusp+UhXx18mfuZ0pqPRdPc/CYSpfTqfF9p0p6gGVaF/SrvFipf
 AEutCv7FuwBVeXeKKzWw9vAj+8kTqqHC8SRAeSSMD3+WEo+CTDw88MMxLBtbP4jfduGa
 CxmqM9liogqeQ1ltFzIecLyRp2u91Yu8CSoJemmWkEA/JZKMlROHV6dHhne2TlM7eask
 03zQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQbMVqlPSpweeE7SwoOXwUtRdYSuXaS1crym1ijzlzd4nv29rDdtZ0OBlypsGE4ljn135Ak6ENKM1KX3iJAB94Sj/+9nfVLQ==
X-Gm-Message-State: AOJu0Yy8yXtTauObayrLcjsoquHguLqXkB2f1hNUpP/IIWkVxWObZpw/
 zyShHRVAOah6BCtaNTHOjm5kDgNQzszTwnBncsYNwW/KyHZrsrnCWFepXrDo438=
X-Google-Smtp-Source: AGHT+IFF+UOgVusCJI/g7Gz9jfFf9h35d86zrOllFGGNQzMpUI2zXESejrRs1qsP4Lg/MjP92u/ohg==
X-Received: by 2002:a05:6512:3e0a:b0:52c:d70d:5ff8 with SMTP id
 2adb3069b0e04-52eb9990b81mr4836625e87.1.1720630867563; 
 Wed, 10 Jul 2024 10:01:07 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.167.117])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279554cae1sm30801625e9.8.2024.07.10.10.01.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jul 2024 10:01:06 -0700 (PDT)
Message-ID: <2c8e6a22-e2b7-4e7a-a811-2dec5ac6cd55@linaro.org>
Date: Wed, 10 Jul 2024 19:01:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/avocado: Remove non-working sparc leon3 test
To: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>,
 Frederic Konrad <konrad.frederic@yahoo.fr>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
References: <20240710111755.60584-1-thuth@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240710111755.60584-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12e.google.com
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
X-List-Received-Date: Wed, 10 Jul 2024 17:01:14 -0000

+ Clément & Frederic as Leon3 maintainers and SPARC team

On 10/7/24 13:17, Thomas Huth wrote:
> The test has been marked as broken more than 4 years ago, and
> so far nobody ever cared to fix it. Thus let's simply remove it
> now ... if somebody ever needs it again, they can restore the
> file from an older version of QEMU.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/avocado/machine_sparc_leon3.py | 37 ----------------------------
>   1 file changed, 37 deletions(-)
>   delete mode 100644 tests/avocado/machine_sparc_leon3.py
> 
> diff --git a/tests/avocado/machine_sparc_leon3.py b/tests/avocado/machine_sparc_leon3.py
> deleted file mode 100644
> index e61b223185..0000000000
> --- a/tests/avocado/machine_sparc_leon3.py
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -# Functional test that boots a Leon3 machine and checks its serial console.
> -#
> -# Copyright (c) Philippe Mathieu-Daudé <f4bug@amsat.org>
> -#
> -# This work is licensed under the terms of the GNU GPL, version 2 or
> -# later. See the COPYING file in the top-level directory.
> -
> -from avocado_qemu import QemuSystemTest
> -from avocado_qemu import wait_for_console_pattern
> -from avocado import skip
> -
> -
> -class Leon3Machine(QemuSystemTest):
> -
> -    timeout = 60
> -
> -    @skip("Test currently broken")
> -    # A Window Underflow exception occurs before booting the kernel,
> -    # and QEMU exit calling cpu_abort(), which makes this test to fail.

       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

> -    def test_leon3_helenos_uimage(self):
> -        """
> -        :avocado: tags=arch:sparc
> -        :avocado: tags=machine:leon3_generic
> -        :avocado: tags=binfmt:uimage
> -        """
> -        kernel_url = ('http://www.helenos.org/releases/'
> -                      'HelenOS-0.6.0-sparc32-leon3.bin')
> -        kernel_hash = 'a88c9cfdb8430c66650e5290a08765f9bf049a30'
> -        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
> -
> -        self.vm.set_console()
> -        self.vm.add_args('-kernel', kernel_path)
> -
> -        self.vm.launch()
> -
> -        wait_for_console_pattern(self, 'Copyright (c) 2001-2014 HelenOS project')
> -        wait_for_console_pattern(self, 'Booting the kernel ...')


