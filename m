Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kVHI0-0001Me-RV
	for mharc-qemu-trivial@gnu.org; Wed, 21 Oct 2020 12:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kVHHz-0001Ki-9r
 for qemu-trivial@nongnu.org; Wed, 21 Oct 2020 12:48:39 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:38646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kVHHw-0007qt-Pw
 for qemu-trivial@nongnu.org; Wed, 21 Oct 2020 12:48:39 -0400
Received: by mail-pf1-x441.google.com with SMTP id 10so1815927pfp.5
 for <qemu-trivial@nongnu.org>; Wed, 21 Oct 2020 09:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aZmbdTrIy8uAUv/JfJpmNUclpbvjmokm2StOBbnlNMs=;
 b=pYdM5dhbwkJGoCSEDv/7BeeJ9CM6GdrgZFLlXJrDYY6IU/nPvtpHFY4QWDdmjZ4YQA
 7FscVjxt+XhmZp+ftVvgd+rokWPXy6emTxd0KC02jRMTZsVdwmag09Qo36VS0CWKRB5F
 j+IpyS3PHXXITz1viAiE5k8y5O9PDdnmoi6D88oExGl4bfJNYyBIuOluxvNE4U82+Cel
 aVKCfRi6TPRL6WQ7hJyFVSXA3Xeufbr3TFZXeyrVbtB8nlSEnTrcrkG8Bkn5702ZBGc2
 vhAu0coNKZpjIkMvSW0rSX4aMHjbaMXfiDtkStae2wE9j/FO2uqAIdWAEdzWfHX/KRgs
 iRAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aZmbdTrIy8uAUv/JfJpmNUclpbvjmokm2StOBbnlNMs=;
 b=DlOm8T0jN+I8zLm30A9pGNaaHmdIDVSeyz4L/2erBYaXSCDSJqyQ2M4/LeYHtkjIWi
 KMEgCUO+j3eJYH6Z2A1FhOQzgnJa3nP4NkYz4MNHLll/Rsvg55krlJcPBZOoBACSvGpf
 4X2sBModKYWkg1XZi62yksResoKX/k8rzacllU3ArcUcVa6bi/Am5sp3nFjh0R9lKsKa
 FetkrvTECPhqffNdQZ5ojktp3wuhWxx2OR5XL8hDzh0HeZLC/qwg55oBVbWJwK1QkrlS
 98zboC7S+zilshR9x/BbY/68zVh4JQSQb6U7hW9j0kbsHhTgsqab24M5U1nKDhaN5w17
 ysPg==
X-Gm-Message-State: AOAM533uWexvsWWzidubO/dgIUDAV+9G3eFj9zZQY0tq9XhRjUwMAPbI
 l3HgzqmzT4ZcG0GOcoVOBe8jZw==
X-Google-Smtp-Source: ABdhPJztufMvQX8vkDQhBS2XHgUnIB/Ijp30gbCEJUDOHy8acP2fMjvsDq8I2xitAA2RuFL/XlDDzA==
X-Received: by 2002:a62:3815:0:b029:152:80d4:2a6f with SMTP id
 f21-20020a6238150000b029015280d42a6fmr4188337pfa.72.1603298915268; 
 Wed, 21 Oct 2020 09:48:35 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id m34sm2965886pgl.94.2020.10.21.09.48.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Oct 2020 09:48:34 -0700 (PDT)
Subject: Re: [PATCH 0/3] sh4: Trivial clean-ups for sh_timer.c
To: Thomas Huth <thuth@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Magnus Damm <magnus.damm@gmail.com>
References: <20201020153935.54315-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d2c757c1-6cf9-7332-6fd6-b53579df6308@linaro.org>
Date: Wed, 21 Oct 2020 09:48:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201020153935.54315-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Wed, 21 Oct 2020 16:48:39 -0000

On 10/20/20 8:39 AM, Thomas Huth wrote:
> Thomas Huth (3):
>   hw/timer/sh_timer: Coding style clean-up
>   hw/timer/sh_timer: Silence warnings about missing fallthrough
>     statements
>   hw/timer/sh_timer: Remove superfluous "break" statements

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

