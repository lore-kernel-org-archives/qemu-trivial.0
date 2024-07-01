Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sO68u-0006FM-6d
	for mharc-qemu-trivial@gnu.org; Sun, 30 Jun 2024 21:47:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sO68t-0006F0-4P
 for qemu-trivial@nongnu.org; Sun, 30 Jun 2024 21:47:43 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sO68r-0000LQ-HV
 for qemu-trivial@nongnu.org; Sun, 30 Jun 2024 21:47:42 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1faad2f1967so25618695ad.0
 for <qemu-trivial@nongnu.org>; Sun, 30 Jun 2024 18:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719798459; x=1720403259; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8A4N96JWGU+Pwkk3HELouHyrDYwU6OMknPgSSnQNsXA=;
 b=r1kZW+VoDcdLjAOEHYfnY7rYLuFGe0rk7vHXFGqDyK7aoZh9mtSt1JhPIx8l9lcY9/
 QczupiWNY2QJxy7JfatSznTqFGqo/tYcNLIolnDZUGFfFzYBuFA0Tnm7D7R+TKz2Qj9S
 KG8zTWmh+qrTyKGel1MDtNweYD0272aCvhtXv3z5GKxBIdEcoUEGGzCJUpsLRRsMWJMD
 uAPfYNP0UpC75flx5+oNpJepbby5+0c8DitX/wnSz4yVaapocVln9EVKFlS1+iRzneH3
 5vIH7msxxoK0MpvPk9UpWZ5ufSOeWclh1r4dEBln563iD6HB6ZyWZzZkQF3GteZ1AEsZ
 l7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719798459; x=1720403259;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8A4N96JWGU+Pwkk3HELouHyrDYwU6OMknPgSSnQNsXA=;
 b=xIFOX/2uJylU8dT+95JgWCkCE/tkzZXBdDq8sqPvKm04W81YXqhA0sbuogOswXf/jx
 Y5bTBTnatMUdf1YhMtVr0+mt/xnL7yM1viyCXT8yzWF1W8va01mpdRcKWLbXLD2foCIX
 hfNsbszAxD0g4sveifmqnOkTbsRBQ/FobIaTJh128zdiA4QJKO+iuOIaXdQjM5DejLNz
 c2OQtgABi4yDLppJXWfKxQrx4GWiKOYfQcNze2mmLJol4ha2l4W4sntLDSAb/uDs8rwf
 yqfOYDmaWbsg9+DQH/JDmfgOaziynMT2coJyzdvDmE4Yf3GPjIW2+Ps52rXx3fib0/Z0
 x40w==
X-Gm-Message-State: AOJu0YxMh2hlL6rQ9jTukxHLSoUkyeqFneesKRMaTdtlRxp2ayc6Ke9I
 ZqPb4h+BN7sGCirXi4vzbcfCtQZWfRKqBYB7eifKK+H6Mf6fabQz9oRUXA12DuY=
X-Google-Smtp-Source: AGHT+IHExSgWAR1XJooSkaj8WlSWwzgb0EsuCnrTUKvToCm9wyxqzY6cFk9+f+Deua3ErVwjWcuKEg==
X-Received: by 2002:a17:903:22c3:b0:1fa:df6:63a2 with SMTP id
 d9443c01a7336-1fac7eec962mr121158825ad.23.1719798458747; 
 Sun, 30 Jun 2024 18:47:38 -0700 (PDT)
Received: from [192.168.0.4] (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac1578a3bsm52172195ad.233.2024.06.30.18.47.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jun 2024 18:47:38 -0700 (PDT)
Message-ID: <4bc735a4-c2f7-458c-b72a-92253974bc2e@linaro.org>
Date: Sun, 30 Jun 2024 18:47:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 00/16] Trivial patches for 2024-06-30
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20240630165327.38153-1-mjt@tls.msk.ru>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240630165327.38153-1-mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
X-List-Received-Date: Mon, 01 Jul 2024 01:47:43 -0000

On 6/30/24 09:53, Michael Tokarev wrote:
> The following changes since commit 3665dd6bb9043bef181c91e2dce9e1efff47ed51:
> 
>    Merge tag 'for-upstream' ofhttps://gitlab.com/bonzini/qemu  into staging (2024-06-28 16:09:38 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/mjt0k/qemu.git  tags/pull-trivial-patches
> 
> for you to fetch changes up to f22855dffdbc2906f744b5bcfea869cbb66b8fb2:
> 
>    hw/core/loader: gunzip(): fix memory leak on error path (2024-06-30 19:51:44 +0300)
> 
> ----------------------------------------------------------------
> trivial patches for 2024-06-30

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/9.1 as appropriate.


r~


