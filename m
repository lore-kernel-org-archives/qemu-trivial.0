Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMv6U-00058l-3P
	for mharc-qemu-trivial@gnu.org; Tue, 31 Jan 2023 13:11:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMv6Q-00053y-OL
 for qemu-trivial@nongnu.org; Tue, 31 Jan 2023 13:11:32 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMv6O-0002qu-TD
 for qemu-trivial@nongnu.org; Tue, 31 Jan 2023 13:11:30 -0500
Received: by mail-pf1-x42e.google.com with SMTP id 144so10811900pfv.11
 for <qemu-trivial@nongnu.org>; Tue, 31 Jan 2023 10:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s4Vqs0iClb6pKF8sIxy5oGledBd/RI6obklhjA91XmQ=;
 b=MImVhWkQL4Cn7Hj8ZlK3JQLovoVIrBr7QROWwvENWZ0Sm3lwojMp9tptPOif2vHBLv
 vb62yy2PdtvCDc1Rw0VXBjlQHYDZqkrVTYBJLSBsZZdXhxEo2hPFHRRBjYeEU5nF7vz7
 gWnMTtZVgtrTRpRnzmZ7RrXByAypZmobS5e2aGh3JrWEFruy/DxxA2C1ifOnvb+R8l8K
 t53JtBMhlei4wz938c7UYdlfKgbFrTeg0Ml8peC+R7OHZThhiBk9CruAFuKPaQgcHXnm
 Woax/MKWZupYGd3SCATmzgybSlCpYs+vtjJSs7mWblTmlG7PwBS2AXk3UJIbb02hyVNG
 qJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s4Vqs0iClb6pKF8sIxy5oGledBd/RI6obklhjA91XmQ=;
 b=QUkx7qpf0+dmY/kNfRCQcaTtpaFTBaFirojhd62TMAutOMIHddjF9Clz+4wypy0H6+
 i35rkgsf+76nClO4dCvwwexpJTM2bH0Ci2WNKt1f5KF7kQj8Usygh+3ShGGRw40s5OKc
 XQkR8V8MZTw433Bu5X0Z2KyI4X8knIGzE+fh12b82ygIk53oRqPuVDf+3yDIYzQrib8X
 yf91Ai1iCIhzTwkd6Gl6l0bVQOlLf9r+1vHozTM+PaJgS2bW3XSHN+exyUDbvlpc6a29
 pWJmqwGT+n+5HCzoSE5IEUF75EN3Ii2ZXBfwveBANRxdEq82UTLAnKIqXdOy2J8CjGxS
 shIg==
X-Gm-Message-State: AO0yUKWFv4ECcdtx0UYkCV8rsibXIs2DAcM04l94hGu52IMDELJsoEn9
 STwhHHwLVfRbBtQrQ6Z+tZ0rbg==
X-Google-Smtp-Source: AK7set9pLAOmV+jm0DG2ctnPkdSaWrtcJ+IAvo5+6OyPEUbr+mov35XUR0pzH2MPiFCYbWDFObEwZQ==
X-Received: by 2002:a05:6a00:b94:b0:593:e84a:deda with SMTP id
 g20-20020a056a000b9400b00593e84adedamr5117287pfj.7.1675188687089; 
 Tue, 31 Jan 2023 10:11:27 -0800 (PST)
Received: from [192.168.50.50] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 u2-20020aa78482000000b0058e12bbb560sm5798367pfn.15.2023.01.31.10.11.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 10:11:26 -0800 (PST)
Message-ID: <13702cf4-bc17-0ccf-96d6-040c3a221f7f@linaro.org>
Date: Tue, 31 Jan 2023 08:11:22 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] configure: Bump minimum Clang version to 10.0
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
Cc: qemu-trivial@nongnu.org, anthony.perard@citrix.com, berrange@redhat.com
References: <20230131180239.1582302-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230131180239.1582302-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-List-Received-Date: Tue, 31 Jan 2023 18:11:32 -0000

On 1/31/23 08:02, Thomas Huth wrote:
> Anthony Perard recently reported some problems with Clang v6.0 from
> Ubuntu Bionic (with regards to the -Wmissing-braces configure test).
> Since we're not officially supporting that version of Ubuntu anymore,
> we should better bump our minimum version check in the configure script
> instead of using our time to fix problems of unsupported compilers.
> According to repology.org, our supported distros ship these versions
> of Clang (looking at the highest version only):
> 
>                Fedora 36: 14.0.5
>        CentOS 8 (RHEL-8): 12.0.1
>                Debian 11: 13.0.1
>       OpenSUSE Leap 15.4: 13.0.1
>         Ubuntu LTS 20.04: 12.0.0
>            FreeBSD Ports: 15.0.7
>            NetBSD pkgsrc: 15.0.7
>                 Homebrew: 15.0.7
>              MSYS2 mingw: 15.0.7
>              Haiku ports: 12.0.1
> 
> While it seems like we could update to v12.0.0 from that point of view,
> the default version on Ubuntu 20.04 is still v10.0, and we use that for
> our CI tests based via the tests/docker/dockerfiles/ubuntu2004.docker
> file.
> 
> Thus let's make v10.0 our minimum version now (which corresponds to
> Apple Clang version v12.0). The -Wmissing-braces check can then be
> removed, too, since both our minimum GCC and our minimum Clang version
> now handle this correctly.
> 
> Signed-off-by: Thomas Huth<thuth@redhat.com>
> ---
>   configure | 25 ++++++-------------------
>   1 file changed, 6 insertions(+), 19 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

