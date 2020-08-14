Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k6d2Q-0004aB-SC
	for mharc-qemu-trivial@gnu.org; Fri, 14 Aug 2020 12:58:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6d2P-0004XU-9R
 for qemu-trivial@nongnu.org; Fri, 14 Aug 2020 12:58:41 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:41766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6d2N-0004gO-1W
 for qemu-trivial@nongnu.org; Fri, 14 Aug 2020 12:58:40 -0400
Received: by mail-pl1-x643.google.com with SMTP id f10so4432157plj.8
 for <qemu-trivial@nongnu.org>; Fri, 14 Aug 2020 09:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=I7csp+wRcOV9GeM/9pMtxs0mZ9h6QkOeuP5M3384jFk=;
 b=rf5tESexPryclzKwJSBFMkNpQdDYmMN54e/t1f23oq0fiSe4lTlGZPHs+xhrh7lNLn
 aStMMlrk96TyBgfrkb2irjvahAbELXZ489dsdFStE+4jlcS5ZGa0DyOnLz/BzO+IujR2
 1jfWdP4o62GMSlunn372PFR7VpV1PQOiV3OSXGS9CFfoH1ROTedBpxMt9GTA13xKApAs
 +92F98ZTeZpsVL56WZ0ike+/jQpfBYUEYCNXt5Plzgh3nKUwQpulBQZ8YScspjplP1qF
 mPBVESCl1Co0k87XF8xNFaZlmRS9C/s/kHw4mA8nxWUPKLlo9DZzFOXt6QEo41vXueEG
 Zc0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I7csp+wRcOV9GeM/9pMtxs0mZ9h6QkOeuP5M3384jFk=;
 b=mJyL6W+6Xc/k1tG8zLIw+wXmwKuHMrhY5OPrEi2M0Uksm+9BpOFBPk5oKtkvzwPc0c
 GIJdAkFDDdistjGFQab2W784cKZd8q2YeFVcOnS2KKseox7CegAm8mPGt/Klyw2aomF7
 pt+ddIvqb8vImxKECVTB7lSyvIDJr7Flv2VR804jY9DqltYrry9+dujbEzWUGZr/Rwfn
 P8RGIS7p3PTDmuWP0IVFbportRt2IequKrBIHOr2MWvVFgW1t4Btj2WgRlEzuKL+2B2c
 dXqk9zzisS5Iju5ufVipvvIdECFO1S6oAhG8mMhbJ1tzvTuzERqMqzFmPHnNArGC91+x
 yJCA==
X-Gm-Message-State: AOAM530eH7Bqx1Fq9tkY5kzaQFkKaoBZ6u5yJUihVn/BAPDoZ02+rQMb
 CMcEgiC+vkA8PYf9ijWgGLtj5Q==
X-Google-Smtp-Source: ABdhPJx/jX6GMbHBi9Jt4bcWQd3wf3BDwl2L2ufMzmTg0PCtSt1zNH0C6LYtP75MuXpplf4C3EHDoA==
X-Received: by 2002:a17:90a:f2d7:: with SMTP id
 gt23mr3104186pjb.0.1597424317670; 
 Fri, 14 Aug 2020 09:58:37 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id x9sm9886898pff.145.2020.08.14.09.58.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2020 09:58:36 -0700 (PDT)
Subject: Re: [PATCH 2/7] hw/ide/core: Trivial typo fix
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20200814082841.27000-1-f4bug@amsat.org>
 <20200814082841.27000-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6d95e086-4979-c585-cfc2-d3f162b576fc@linaro.org>
Date: Fri, 14 Aug 2020 09:58:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200814082841.27000-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Aug 2020 16:58:41 -0000

On 8/14/20 1:28 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/ide/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


