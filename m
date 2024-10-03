Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1swOKc-0000Ne-D8
	for mharc-qemu-trivial@gnu.org; Thu, 03 Oct 2024 12:05:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1swOKX-0000Dq-9Z
 for qemu-trivial@nongnu.org; Thu, 03 Oct 2024 12:05:29 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1swOKV-0007Lp-KM
 for qemu-trivial@nongnu.org; Thu, 03 Oct 2024 12:05:28 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-42cafda818aso11252405e9.2
 for <qemu-trivial@nongnu.org>; Thu, 03 Oct 2024 09:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727971524; x=1728576324; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7kpPjMlJVqShFPgYpPzg3EJ1Cv/u2eVST13+yvT/bSg=;
 b=QEo1vssuHx7xvQCPAWYoqvgOIUORpSRuH2kkWnAcnGdV+b8vYB+vNo6xX+PxFRX8Z1
 O42LhPSnAjP15oflj482fU11hg/CnYnLXfQa5x0mhY9PKpzTqyouApOoO8BS//F7ySBV
 7NAlzxV69SRkM5e3Dv8Vs0AVeOx/xgMWnSWxF40vMeimmzkecHUrXtuo9xdEN3Ve09cW
 K/TPsFfhFMtsHB+OpFAHn4T/q5di7vlRoHLS4iUGHUxBTYf3j4fCyXgJMAes1REJyjYV
 YPzn74ndwYtWW8NyXz7ow4xGFEdXmTfZSDZg8dskx3msbgwZT4UvE04F3q2fIps6Cedm
 dEFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727971524; x=1728576324;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7kpPjMlJVqShFPgYpPzg3EJ1Cv/u2eVST13+yvT/bSg=;
 b=WeYdtZXXC3uHBfRr+9xDLTAMHuE0gi8ydYZy1/BToz0LdOIYyfx00z043u26Ik+9Vf
 gCLFqvQe2APMhBtZc41etVXUfI9u36BVz5ZrMHT2AzYM71x8+VCSZX7QOIADkN+d86bs
 uIX3l6fHKQmOhOR/l5hwYXpZwEdblgCCn/2rbtcTXXyj4buSxRPlTSvjPwIegHrpU1/a
 sRgERfmlp6QZn7puTdhwhRtI3QPBxn8DxDW2jSGcT62dF/Rva01BxUAn50aX+JOK6LVl
 xeBmDmkt6Ewckb1ThFShZF82xz5xXc+PJkQPddLT1MVI8Po5fMVvUz/nKFIWM/D7GdCW
 ynhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVP/+khJato3ARruQzxcxSCHiNqxlTO/UlTHgZieKeY7whYdiad44IXHILWCrrK1dfAHyJWwFWk+R603sM=@nongnu.org
X-Gm-Message-State: AOJu0YwMe/tJO6A+Yeaxur0J/TpxKL3jIQC7TqxC3/GitveIcl91vxEM
 Mz6p5NlL6x6cAx823RZ8s07VnbdzBU37LyU/qfgLGZwe5N6slOcPdoIW58MsSxj4hJtsAANF2q5
 42t4=
X-Google-Smtp-Source: AGHT+IHMCDjuShiMG0GfAe4HVg9B3Uoa4pWFEkLwlcA5DQiJq/RGmv73kn50JCbsJos4esTEKPo+iQ==
X-Received: by 2002:a05:600c:1914:b0:42c:bbd5:af60 with SMTP id
 5b1f17b1804b1-42f777ee77amr50962185e9.24.1727971524111; 
 Thu, 03 Oct 2024 09:05:24 -0700 (PDT)
Received: from [192.168.13.175] (49.red-88-29-183.dynamicip.rima-tde.net.
 [88.29.183.49]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f79ed4b3esm48326875e9.27.2024.10.03.09.05.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Oct 2024 09:05:22 -0700 (PDT)
Message-ID: <32d6b780-948a-4703-a399-67b3e64e05cd@linaro.org>
Date: Thu, 3 Oct 2024 18:05:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add myself as maintainer of e500 machines
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20240926075948.2343-1-shentey@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240926075948.2343-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
X-List-Received-Date: Thu, 03 Oct 2024 16:05:29 -0000

On 26/9/24 09:59, Bernhard Beschow wrote:
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   MAINTAINERS | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


