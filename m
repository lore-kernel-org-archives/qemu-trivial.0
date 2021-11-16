Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mn4vW-0003YR-Ab
	for mharc-qemu-trivial@gnu.org; Tue, 16 Nov 2021 15:19:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mn4vU-0003XY-Lu
 for qemu-trivial@nongnu.org; Tue, 16 Nov 2021 15:19:32 -0500
Received: from [2a00:1450:4864:20::432] (port=45675
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mn4vS-0001km-II
 for qemu-trivial@nongnu.org; Tue, 16 Nov 2021 15:19:32 -0500
Received: by mail-wr1-x432.google.com with SMTP id w29so66448wra.12
 for <qemu-trivial@nongnu.org>; Tue, 16 Nov 2021 12:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hMPomJZFY13K7tAKVfm9YLhauB0H1d36Rn3Wgp4Dl6M=;
 b=hUO+GaDJQMTExeq1pDunh1kWtWzfozweqYuE2gknjpDkF/ppfCfoNjkiNTS0IAMgXa
 /gzZxjoY3u4uaNDXEqEAp2g1oy4ycNYDXdG401Soed+3PEw+pyvMr83Yjmhsvp9lPDvJ
 7Qviq64fJy7sI8VDLUnxbxReYmVcAr6EkBhLPx4B0Oiw7/xJe7FDhaTycmB3q4AZBcME
 O/H1CIOoKDk8xEyRkR1JcIdzBvUAVLv3HuvMrNilIluuICF3bWtjakjf0hMQmarpuyT1
 ahYZpkMQ4CV/Mtx6tMwCgFnq6EcKa2iOYC5SjAu5su4X/cCoRhVkqmK9gEP+NB35/SIG
 VdrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hMPomJZFY13K7tAKVfm9YLhauB0H1d36Rn3Wgp4Dl6M=;
 b=zxJKSPa4H94r1tHvFQKefyQ6ZmThr2daNilLSW3afw4JDHa0fDRds2IM8iEi7YUQsW
 yqhtOVZbLU5vBay5mbPZdi8jFIKEO+VDwIuItiubrp+gb12LwJfFF5ai6ouy0vdeBo35
 /hBmNLadcvsf8phBsZ+/ybv9OwdZVyVCoadAg8oDkYaiA9CGpK1eSEPAO65fWOaeLBJC
 AKY0mHNNaecS9L0yDNjYj4iO/iTz9nRKHnUCC6y0L3gABc0CsxHfnRfbsURcnhfcD1qj
 f4Sc25XUc/fa4O8PhS9K/tcY+Ubj9yv5EIvckSoy11jrjTNZIkEa4one1mpET9vRhfPI
 uvNg==
X-Gm-Message-State: AOAM533qHhe+iZHt+B8FB6wj0yq+rZjOFzQFCE2Yn90/nU/A5OWANekQ
 ztgdym+M3w4iSycU1FvUmEBQ8g==
X-Google-Smtp-Source: ABdhPJwrid7kWuZi0Os4I48lNe2Tg9bUykZ63UCszaXLkydXpv4tCayDpavmdbyPCYcvWQSoVo550A==
X-Received: by 2002:adf:f947:: with SMTP id q7mr12558641wrr.260.1637093968902; 
 Tue, 16 Nov 2021 12:19:28 -0800 (PST)
Received: from [192.168.8.105] (145.red-37-158-173.dynamicip.rima-tde.net.
 [37.158.173.145])
 by smtp.gmail.com with ESMTPSA id t8sm3197057wmn.44.2021.11.16.12.19.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 12:19:28 -0800 (PST)
Subject: Re: [PATCH-for-7.0] target/i386/kvm: Replace use of __u32 type
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org
References: <20211116193955.2793171-1-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a2628496-ff7a-e684-ee5e-93531790e998@linaro.org>
Date: Tue, 16 Nov 2021 21:19:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211116193955.2793171-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.446,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 16 Nov 2021 20:19:32 -0000

On 11/16/21 8:39 PM, Philippe Mathieu-Daudé wrote:
> QEMU coding style mandates to not use Linux kernel internal
> types for scalars types. Replace __u32 by uint32_t.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
>   target/i386/kvm/kvm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

