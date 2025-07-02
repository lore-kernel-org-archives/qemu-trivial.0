Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uWtVs-0007xQ-Gg
	for mharc-qemu-trivial@gnu.org; Wed, 02 Jul 2025 05:12:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uWtVq-0007wX-D7
 for qemu-trivial@nongnu.org; Wed, 02 Jul 2025 05:12:18 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uWtVl-0007Pt-HQ
 for qemu-trivial@nongnu.org; Wed, 02 Jul 2025 05:12:18 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4538a2fc7ffso44077105e9.0
 for <qemu-trivial@nongnu.org>; Wed, 02 Jul 2025 02:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751447530; x=1752052330; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kFBWLajcalmmXrx/a1UaeBauyTYYBLmg9BJXhbcBxtU=;
 b=YOcmR2I9w1RGAvrFF9BcKToi5n/pWSSjzuleMVOOKnzYo7b7BLlsNGzUCRqOfjERPx
 qlHYJUsYfWYJSA/ZqIkjMVSG3ucG+aVDDgtevrZn6W+/OfLToOVhC35OjNxN8hpLJKSe
 P9Y/nOlZpbXb+2i0bzXtJ/IMnBF6EydTop5sq+Q241nTB+IlDXcPUJEkgV3Qq9FYS9U7
 Zw9ZSrtRUAgacyH37Eht8dAQoEUg1DiH0cIpBBjAqXiZDFJSErdBhQZT29vsvec5VBvu
 aDABaCt/+ZxlwqQp5lPiTm6iBg2viqcqePg/94Q4256KBJx5UV4x/BUIoNjHoTMSxBFi
 JX9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751447530; x=1752052330;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kFBWLajcalmmXrx/a1UaeBauyTYYBLmg9BJXhbcBxtU=;
 b=BlB/msCWalMTgQvKBJPYetLaJqbnfcoQwvDzXmNEzoRnIxYoD3Ia8fKuLuM8YBV/Bk
 jbYKa0oDOnQtf86u0/9z+jw731SKuh4IW62kEQEICFFqG+a7PyhH/QzgayzxDylGyR/g
 UDteEzcPy7DEi/iv4L/A8Wzb7wY5YN37HyEiRxQxyCnv9rxUkTYngBe79bbcVpdUd7Ov
 8B0EQRvtWAxoeaW1qmB2wNu+WHZsU/5IIrkOu6vYuQIb+y/Zade6BrsQdIFpr3PTk2Mv
 YlKiHZWl5QbV7uAiSNLKjWbHTMsRBJuyJl1oIk8IDWqP62kP63EH88+aCONwD28ZI11B
 4j8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWakQbPtW+hsUx8AUDQbF6cKeCv84xH9sB9m8pf5KqhbaTScJiFSRQLWTkmsMMIUiqVTaic2ZNZcw+68JQ=@nongnu.org
X-Gm-Message-State: AOJu0YwD0iTLZygfqKPe8ySE85+kH7fi+loVV/VsKhP4B3bsfdeLczkI
 wbi6ywLPlybXMzSZtd2jenOjhJfW06rHCz4EYs0aKZrPYvWsNnaw36rEzFPFkmESKeE=
X-Gm-Gg: ASbGncsv5nUi/FmdhlaQGUT4abN1xNHH8XIS+mMXga83KWmU1dvwbeX/CFbaVtZ1hL2
 wrp+JYFq3TC0qzQ5lcuXWqgEVnSH49nyVS2pkar2VIDfsE7CQ0PWkrByW3rQoGoaFljxmAxgyuu
 MazMejRedCTLkUyuAEceFhs60dDPOrXrF2sp2su1W3hk414bS4L9swKl6TrI+wsqVWliunQw10L
 4CPUHS3eWhmyYxQPYds9wSysZRsW7E5HzJtZ2nFsmdAAXuE6ksRUOrbx1X5XzZPoXAAD9NIb96I
 1c47snndA10993JV4gmwsto3ncevBILvV6ynwJBKW+qDoH4ALh47bsRHd1f5E6UwncVE+cwykMh
 Y+pglgHAZQXHQVo8J+bxbZbqhHz/39A==
X-Google-Smtp-Source: AGHT+IEvw67+QDLEMfYgM0ShPdp7SyTnTOfZX15HNJAs7ojrm9bY3KQsCgoHZ+cdrX0vfa+RxU0qCg==
X-Received: by 2002:a05:600c:1f90:b0:43b:c857:e9d7 with SMTP id
 5b1f17b1804b1-454a3c1e6d6mr18279265e9.5.1751447530288; 
 Wed, 02 Jul 2025 02:12:10 -0700 (PDT)
Received: from [192.168.69.166] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a892e52a5asm15686079f8f.54.2025.07.02.02.12.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 02:12:09 -0700 (PDT)
Message-ID: <5bc1b43d-764f-4f6b-ba1c-d929193abc50@linaro.org>
Date: Wed, 2 Jul 2025 11:12:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/system/target-i386: Remove the sentence about RHEL 7
 being supported
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
Cc: Zhao Liu <zhao1.liu@intel.com>, qemu-trivial@nongnu.org
References: <20250702082138.23109-1-thuth@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250702082138.23109-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 02 Jul 2025 09:12:19 -0000

On 2/7/25 10:21, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> According to our "Supported build platforms" policy, RHEL 7 is not
> supported anymore, so let's remove the related sentence from the x86
> documentation.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   docs/system/target-i386.rst | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


