Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kG2nd-0005is-S8
	for mharc-qemu-trivial@gnu.org; Wed, 09 Sep 2020 12:18:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kG2nc-0005f8-4a
 for qemu-trivial@nongnu.org; Wed, 09 Sep 2020 12:18:20 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:36003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kG2na-0006z3-E1
 for qemu-trivial@nongnu.org; Wed, 09 Sep 2020 12:18:19 -0400
Received: by mail-pf1-x444.google.com with SMTP id d9so2600506pfd.3
 for <qemu-trivial@nongnu.org>; Wed, 09 Sep 2020 09:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=99UZ288H5ij2iEAl6q76lCUPqn1VoDCLJI1C3EIgH/g=;
 b=OvbV2zVBsqF8cQWEGp2fl+MU1DvQuZ6EiRE+ExORl9/282fShzgwkO4ZV03wm1LY2w
 ijAIjsSXgoI2n0DzoLp9+4Xya5OpR2YfomW6BONbraubfCL3/ktcHf0HDmvx4V4CLxmo
 S06GqzR7147l8ok9IrCy3YKklO4ai9nGrBS0oAFKqBeiddkM21Fmi70C9gTtF+OfDTdS
 MTs+0GLvPKH3bdbBDnGs01duUO9mKVzPBA5wTZEGmQJo/kz7b0jzQPbic1/Hc/dmjsRO
 QGR/X5vokK8QRbB0+mOVW0ExELn1JTawHRVyrkNqH08AGlk1iFs4B5wAS5dASXO73XEL
 0a8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=99UZ288H5ij2iEAl6q76lCUPqn1VoDCLJI1C3EIgH/g=;
 b=PWanvftyImxq1svLUuRpqy6NXqiDiAwg973Wp9MwqeWxXjAQhJA7hBC9XYA/ApbGRD
 jp6gIw4e0P/vHAmcYwFXQaWXP/70cNxATd4cEf8iHAINQOLVAOBZuj9HdehYRkmCwnXK
 9uWNVT3iVKsI0HKi1E32ywZP0K+YO5nQRhR0Mi4ppUiUumyl6jGONhESB4dP4agEDUt7
 h1t/JR93mxOpLbDJ+7Wx3exLZjVnirNHjFXC8cZXydg/CPmFf9NCgSN2IyR9odiZzgcj
 EN15lrLD8p2lwMJBbh/77sIs+VKUWaYUqz7wbnt1WN02Ds+ebAJJkicCRcUu2FdkgrJL
 EPkA==
X-Gm-Message-State: AOAM532VGjB396vD/eFhXqdhwdkcQQnMMd4IzmCb4vyUNsWHdzwHeNeF
 7m9o1nTzx0RH9FnJRUFENQw0gw==
X-Google-Smtp-Source: ABdhPJw7zmLYBci0+yhisFi2NSLwYjdshwai+ECZRO/NumecFg/c6zL7hLPbdz/4QCLsFf0LjyreQQ==
X-Received: by 2002:a63:4559:: with SMTP id u25mr1131732pgk.162.1599668296857; 
 Wed, 09 Sep 2020 09:18:16 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id a1sm3199142pfr.12.2020.09.09.09.18.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2020 09:18:15 -0700 (PDT)
Subject: Re: [PATCH v5 2/2] hw: hyperv: vmbus: Fix 32bit compilation
To: Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Jon Doron <arilou@gmail.com>, qemu-devel@nongnu.org
Cc: mail@maciej.szmigiero.name, QEMU Trivial <qemu-trivial@nongnu.org>,
 rvkagan@yandex-team.ru, pbonzini@redhat.com, imammedo@redhat.com,
 vkuznets@redhat.com
References: <20200715084326.678715-1-arilou@gmail.com>
 <20200715084326.678715-3-arilou@gmail.com>
 <87028ae2-f31e-a6ee-a4ba-c147837fc52d@amsat.org>
 <fb8f1744-4c28-4171-2ffb-61d3ad39be88@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <05bf1564-636a-5022-357b-73725a754e59@linaro.org>
Date: Wed, 9 Sep 2020 09:18:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <fb8f1744-4c28-4171-2ffb-61d3ad39be88@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.576,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 09 Sep 2020 16:18:20 -0000

On 9/9/20 6:56 AM, Laurent Vivier wrote:
> Le 06/09/2020 à 12:14, Philippe Mathieu-Daudé a écrit :
>> Cc'ing qemu-trivial@
>>
>> Can we add the commit description Richard wrote?
> 
> I have no message from Richard regarding this patch.

https://lists.nongnu.org/archive/html/qemu-devel/2020-09/msg02283.html

Different thread, same problem.


r~

