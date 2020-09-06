Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kEkCj-0001FB-5V
	for mharc-qemu-trivial@gnu.org; Sat, 05 Sep 2020 22:14:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kEkCh-0001Es-Uv
 for qemu-trivial@nongnu.org; Sat, 05 Sep 2020 22:14:51 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:42403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kEkCg-00032M-C8
 for qemu-trivial@nongnu.org; Sat, 05 Sep 2020 22:14:51 -0400
Received: by mail-pl1-x644.google.com with SMTP id y6so428497plt.9
 for <qemu-trivial@nongnu.org>; Sat, 05 Sep 2020 19:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rnqKeYjT1gCh07zTwKxNFwiWzunpvcDckfNSKQmPOY4=;
 b=WvhnfVrAWGpO5YTZa8vTdwwo3vDGFUJ4Bz/6ejCfuascmI5lugPsAd2KdCEdK+rZpc
 W2d3k8GZaUAJMHpfvJBzagl5LGAiAoBWaKerVOo3WVz2sCp/K8o+X9liJQWgJu347JYC
 ypnCADbshTYxd5KaG/DIrfN7WQj5+7Vne+yapgICQemn+kQewOfQ4kpK+ewKfLgQpF2a
 w+432JJKx5ZCQcJsk4ievLkaiwzYQoKdqfQ/FsNJBSU98r7AI3DK811m7TMzmfezMR+S
 U41trQEVX/JQXl4O+wAJo8FYdT+zauuLxfh83HWg/INvu7VXQ3Mn+2IldRYGhOGh9YHD
 cK1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rnqKeYjT1gCh07zTwKxNFwiWzunpvcDckfNSKQmPOY4=;
 b=MqlmqpF+CbHXt8QPRMX2E2sjWDI8Sj3ZWqmGANwcuGAcTBSeyRRoV6z+rGALBPdBBQ
 H0odRVMpP+s1KmgmZ0IWZT0hfwJqWIkPyFsA/ut3Cxg22Fht72mkgbDC7wOC8I4AG9PU
 yOtTb0SHNIbzah+x8+NnYpaTvOlgjvDlizYbzTyjkgjRAaORLQ4RdMSO2ZoRpd9MAg/Y
 vS6cXJH3v8VdBM2ncVlbs6EOZcbgtzmCHmx9YpSERKZkwsDNFPOI7MKPq7lR7bN72um4
 2tWO5AIn6SSeeF8Ytiee7m3g7YstVhkhXWamMau0zRZoVMQBkYmx/9ppu8AboV3AF6DS
 t3pg==
X-Gm-Message-State: AOAM531kfz2ddUOH2r9zU0waioPVdYeVZLpGgLnAicgzkFARjkA/fyIR
 vkq3t7EfB1n/0CADB4oepfjmTg==
X-Google-Smtp-Source: ABdhPJxnQicC9/9sXGfEWdOzMd5HfEWMxdxOrLXEN4TGKOo8fioo1QFh2SfcKoGimyiepEvtbQqKAA==
X-Received: by 2002:a17:902:56a:: with SMTP id
 97mr14845116plf.130.1599358488564; 
 Sat, 05 Sep 2020 19:14:48 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id 64sm3846510pfz.204.2020.09.05.19.14.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Sep 2020 19:14:47 -0700 (PDT)
Subject: Re: [PATCH] tests: Fixes building test-util-filemonitor.c on
 msys2/mingw
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 "Daniel P . Berrange" <berrange@redhat.com>
References: <20200905203425.1470-1-luoyonggang@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f0a88f9e-b4a9-9ef1-ee47-6054a1cbbc5e@linaro.org>
Date: Sat, 5 Sep 2020 19:14:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200905203425.1470-1-luoyonggang@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.107,
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
X-List-Received-Date: Sun, 06 Sep 2020 02:14:52 -0000

On 9/5/20 1:34 PM, Yonggang Luo wrote:
> Fixes the following compiling error:
> ../tests/test-util-filemonitor.c: In function 'test_file_monitor_events':
> ../tests/test-util-filemonitor.c:620:17: error: too many arguments to function 'mkdir'
>   620 |             if (mkdir(pathsrc, 0700) < 0) {
>       |                 ^~~~~
> In file included from C:/CI-Tools/msys64/mingw64/x86_64-w64-mingw32/include/unistd.h:10,
>                  from C:/work/xemu/qemu/include/qemu/osdep.h:93,
>                  from ../tests/test-util-filemonitor.c:21:
> C:/CI-Tools/msys64/mingw64/x86_64-w64-mingw32/include/io.h:282:15: note: declared here
>   282 |   int __cdecl mkdir (const char *) __MINGW_ATTRIB_DEPRECATED_MSVC2005;
>       |               ^~~~~
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>  tests/test-util-filemonitor.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

