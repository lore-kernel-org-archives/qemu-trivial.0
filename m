Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sUn1D-0000mE-Fq
	for mharc-qemu-trivial@gnu.org; Fri, 19 Jul 2024 08:47:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sUn1C-0000lG-PT
 for qemu-trivial@nongnu.org; Fri, 19 Jul 2024 08:47:26 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sUn1B-0003Tc-4d
 for qemu-trivial@nongnu.org; Fri, 19 Jul 2024 08:47:26 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4267300145eso13177205e9.3
 for <qemu-trivial@nongnu.org>; Fri, 19 Jul 2024 05:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721393242; x=1721998042; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QOVaz4Bw6+iiquXfzRFSlJaUUp3cP5kRK6mUCdf7T7s=;
 b=S9obLNfsPu7rrZ0Xy7dGzW0eRr3XxhhyQqaOfhyxOaFnnRBFzqG5pVH7DD5D/x6JR0
 8z9X2oOpKiCzdXbJBjtjTAjK82AWYS8K1eOHf99kfxk/kmfhcKihTz0kGF8zOUno4nKr
 vZ7eCpsaC9d9OBEGYu0+3x7W95RTCX+EvUvYd8rhmywVJgMSzkSSfwo242/mTU5rwkec
 sunThBj119Jzqxo9xCDQkZKX5NNMVKvy16/mJcBvGB1qMvFitCVrmSE/KCGu0tWW4mIf
 dkNjhCYxrOePbszD5/fyiHAVG5WPKnzt68hZMtqVh8xMRZ7zF/y76cpZxCOLEJEI9/Zi
 8ARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721393242; x=1721998042;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QOVaz4Bw6+iiquXfzRFSlJaUUp3cP5kRK6mUCdf7T7s=;
 b=nBWo1ei1Apxm8IzpgwvxU8fbkyc7VbYdV+h3FV3E7pWxbEivhWzYUG1BOHZLHq7qFF
 31StEX+/8p5rwvHHV97+1dMa7WL228tF4qBwFMzkRSEHmKRWvrLD72fnPPuzPq/NXWTB
 l2+7ImcFUWWgBZmKA4fTOME6TElwtZx7kM0VNAG+/glylEu5OZL5ddXm67Gy74820VtK
 yXPA1UFeKTypYHRwPHadQTvXMk3o89+WdueE7mDmSs7nHUWwl+rF990JVdficklKyjl3
 qUkZoAjr6+lglR56PfNEvp8XlVEFGIRnmEOtnNaVHQ4UnCy3GpSNIwOalxSiKPfLPuHr
 UlMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+WfyE6c8JYkjPL1iiFXkfSCtuw8VJvkkAJ/AH884UQMDqeg/U/ZvVyJdN+LKH2yGWuXN19avziMqY6gX2Dl3xl/RWz/kHpw==
X-Gm-Message-State: AOJu0YywdK06QwVGWLH7W2koXttZ+it3WQgcykGSn3+FWPpZ05l3vqRw
 amgWJjoeEuegPyOs5JJvHta189zEwrmRvCoIuVmhyns1pYI/QAit2n3hR/A/ofM=
X-Google-Smtp-Source: AGHT+IHVXLJysIls5jKuc+ButAzpUAaigGb7e3vadN/D72DBDpC8iifHjP1EcrZhllQrfVvxNnxusQ==
X-Received: by 2002:a05:600c:1d8d:b0:426:640a:9de7 with SMTP id
 5b1f17b1804b1-427c2d13b7amr66276795e9.39.1721393242366; 
 Fri, 19 Jul 2024 05:47:22 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.209.227])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d6929976sm23555695e9.29.2024.07.19.05.47.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jul 2024 05:47:21 -0700 (PDT)
Message-ID: <1a37fd6c-3aed-47b3-ade7-35f2b40f5a3b@linaro.org>
Date: Fri, 19 Jul 2024 14:47:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/avocado/mem-addr-space-check: Remove unused "import
 signal"
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-trivial@nongnu.org
References: <20240719095408.33298-1-thuth@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240719095408.33298-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
X-List-Received-Date: Fri, 19 Jul 2024 12:47:27 -0000

On 19/7/24 11:54, Thomas Huth wrote:
> The "signal" module is not used here, so we can remove this import
> statement.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/avocado/mem-addr-space-check.py | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



