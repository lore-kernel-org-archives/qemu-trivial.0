Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADBFBC87FC9
	for <qemu-trivial@archiver.kernel.org>; Mon, 28 Jul 2025 13:34:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1ugNzP-0004O4-PH; Mon, 28 Jul 2025 09:34:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ugNqn-0008AD-Dy
 for qemu-trivial@nongnu.org; Mon, 28 Jul 2025 09:25:15 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ugNql-0002CK-62
 for qemu-trivial@nongnu.org; Mon, 28 Jul 2025 09:25:09 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3b7886bee77so1061254f8f.0
 for <qemu-trivial@nongnu.org>; Mon, 28 Jul 2025 06:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753709103; x=1754313903; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4SIfWPYbShImsqT7HrwVgY0YOYtxv8A2n2sHfqFMaLM=;
 b=RCS97ccPf8AQpiWDrymZ4TjmjJG8DLY0iUg5yLcwEapXsXBSj4MM/vy56ht9B17PU2
 cmvdVyaxXW5dHdJlF+N81r1bbR0Yx8FjbcTQUbiJeESHyGvI2w7FYbbxXYeCZLnNO6w+
 PGv4Wn+ftFV9vXdIEW/lA23+UiOyXUvmua9gOD3SHAxfdF3euiI1rf1JeWw0FQ0n17yC
 pJ3dBcmEP4L3DkDXkOj5fmKdadhmnjoeNBN8jcxJ5jZrT3078m36mVNYf6lO5KvgU0oh
 w+qLShFfqI910btB90Z6qGHLuniMwGwTSRGT6VhXYtEKiW+sffgxp8NMSw3/3moG4RAt
 ZkuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753709103; x=1754313903;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4SIfWPYbShImsqT7HrwVgY0YOYtxv8A2n2sHfqFMaLM=;
 b=up9i+L69qVhgtWQN8qpIwVRz9y3Z3uNnQmJqEVo3bofJYZPdCWM0QJcJVP0KHvKPDR
 W2ruInfVePFR+uVBKVh5m6VXpPSkIRTcXgD+0zoKe+64niAJIooBs8MlytY+b7SREKAl
 kiq18dYU7go2Tx9vH1bcg0g7QexVX2dkucyDlBwNMBDau2o+7BqmbZD66aIcSBAkKpkI
 9VVFUrCSPLwcuFZwTCNg+47Q8c47Oe2YyayO7nygwkWKEhTe3+d+DvDMJsvxfpqK6ozz
 ZgjGjNWN0Ns3XDZ95vS2F78T3q1JgaTyIO8CxuDKbc+S8Psn7CvrQ0MSQjpsZ/8CrIy/
 yKbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUj4AVc+3mU29n6sSnhyvKETI0Zc/gewI8FF8NtlB7Ou3DFPEfU+SVuVYyjsffn70XwAosoCdo4NOc76SU=@nongnu.org
X-Gm-Message-State: AOJu0Yzy4DoGNQLVenxpmx79Oc7VuP5psnHcxc1GTBKMAGyCUCo8rTTv
 IV61pHL+2dXLeivawCZVE/AA0pKO3u6hm/C/PT7paScyBE4m9Tincsm1ccII6/xvQCo=
X-Gm-Gg: ASbGncvq+R7/e6kYCsDuFN2oo/O5ZeatrdNsQvhDQHUsei1t6Oj87FmFqa0SEKZpazF
 k+To2OMngww38V6Jpf0LVPUHPFlvCIja42FqNjNBH9QVk8XZOlk/L6poYlPnfYiVkb5o4pdKM+8
 xXqJQksCNK1t+SqasvSf5NRfXIlM2nv5ziFjwLHkkSDGrZIhVz9hHvcVCAvJJfytegQXqehMMNH
 ycu35qOL1XZqIUiMtr/TWhI7rg3fZRefYDUjoQswXal4uC3DjfT9+Y6+PsB2doVRBqWh2nA2XBP
 igPsXfDJ1Tclvy1FAMYTII/lNAcTwyvt6lQXuzyvVQHWXZFUiubKUv7HKfw/Q/SHeUmRUDkSvdC
 2gPkYqeZouEQNWidk9R8CZabQfQtqqjYF3f4YtbO/dCVPCrwTaEJqrNP7J38CuSwCdlqiCzGO7L
 k8
X-Google-Smtp-Source: AGHT+IFlBp8rlNK7Bj+3/EiMxH3Bflfvy8LEFfd13yfKvnTmNrh4Miv8S6o1a+zDrQbRNgdSk3KSGw==
X-Received: by 2002:a05:6000:1a88:b0:3b7:664a:8416 with SMTP id
 ffacd0b85a97d-3b7765f4e98mr7465589f8f.23.1753709103031; 
 Mon, 28 Jul 2025 06:25:03 -0700 (PDT)
Received: from [192.168.69.209] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458705d42b0sm154634045e9.33.2025.07.28.06.25.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 06:25:02 -0700 (PDT)
Message-ID: <43b37539-e4eb-465c-85e8-b7c83324910f@linaro.org>
Date: Mon, 28 Jul 2025 15:25:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/mips/malta: Silence warning from ubsan
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-trivial@nongnu.org
References: <20250728115152.187728-1-thuth@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250728115152.187728-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

Hi Thomas,

On 28/7/25 13:51, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> When compiling QEMU with --enable-ubsan there is a undefined behavior
> warning when using the malta machine:
> 
>   hw/mips/malta.c:1200:32: runtime error: addition of unsigned offset
>    to 0x7fb620600000 overflowed to 0x7fb6205fffff
>   SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior hw/mips/malta.c:1200:32
> 
> To fix the issue, check the bios_size whether we really loaded the
> firmware before trying to byte-swap the instructions here.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   hw/mips/malta.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/mips/malta.c b/hw/mips/malta.c
> index cbdbb210568..47dd4016cfd 100644
> --- a/hw/mips/malta.c
> +++ b/hw/mips/malta.c
> @@ -1190,7 +1190,7 @@ void mips_malta_init(MachineState *machine)
>            * In little endian mode the 32bit words in the bios are swapped,
>            * a neat trick which allows bi-endian firmware.
>            */
> -        if (!TARGET_BIG_ENDIAN) {
> +        if (!TARGET_BIG_ENDIAN && bios_size > 0) {
>               uint32_t *end, *addr;
>               const size_t swapsize = MIN(bios_size, 0x3e0000);
>               addr = rom_ptr(FLASH_ADDRESS, swapsize);

What about:

-- >8 --
@@ -1180,7 +1180,7 @@ void mips_malta_init(MachineState *machine)
              } else {
                  bios_size = -1;
              }
-            if ((bios_size < 0 || bios_size > BIOS_SIZE) &&
+            if ((bios_size <= 0 || bios_size > BIOS_SIZE) &&
                  machine->firmware && !qtest_enabled()) {
                  error_report("Could not load MIPS bios '%s'", 
machine->firmware);
                  exit(1);
---

?

