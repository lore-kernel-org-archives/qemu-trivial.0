Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kGsCM-00057z-2l
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2020 19:11:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kGsCK-00056I-GP
 for qemu-trivial@nongnu.org; Fri, 11 Sep 2020 19:11:16 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:36993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kGsCI-0003Pd-Vy
 for qemu-trivial@nongnu.org; Fri, 11 Sep 2020 19:11:16 -0400
Received: by mail-pj1-x1044.google.com with SMTP id kk9so2381148pjb.2
 for <qemu-trivial@nongnu.org>; Fri, 11 Sep 2020 16:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dpK9AoKJ2suv9yl/2HoHjmNCcdsx0/cMNHnvymyu6v8=;
 b=R2X8RRrzLkyUR19BYKntm/0IZCdZLY1OMpRff82fJvt95/JDXjzjW+DHB2nC2RoE5C
 IU6oZelEmtsNryHGxyAe5ms24l7tdz3wkPBle7axbyt9lEVIokn2wmXUHthSQwDwTlOG
 SiFtyokilygrP8uqL1G510CkatO+k1oOyOfYlpBUNCoOaQSkE7T79mNzyyxhdjZaSysy
 SqHqvpqGC0xQg/0LxaMtp2NXLIZQdxm7FgpnlyFk9iRgOFbSNfBsl1NbuDGq+tRXvIPp
 pa3T2TqYaCdGt4B17vMHDSbMPHKPcCrp5Vl17G8Cm4lu4m7etMUApKTTRUmGpltLCwQA
 IPKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dpK9AoKJ2suv9yl/2HoHjmNCcdsx0/cMNHnvymyu6v8=;
 b=BRFpVBJ9gZzzUyHzvO7WkQmWzzVd3fQucaeafDe2kbdqOvMIJGjKiWA5By0YCI1ntC
 1SvDD6x1e5+6IPPj7HdYpE7S+pcsjN0VWBvXLR6WYZKQk1BXVSxRp2LRO8p2Elao7iTG
 J21mw2xMmcrfXcmyr4PwNck3DbmlNfnmUOlDWL7fBBPWFqb1jMnN/IfQKA3LJQQ6hyQw
 QidBzmo9mC3tHNQnlBXbsC2nqku9tZXNJp2Qq8z8Z3DfyxeI/pq5i5uGd0H1IWWaW0Y9
 fYOKLlWf/yhdI6Jpg4iGXPHEH0JG2V2+ji6f50AXQGdujdo6wgnU8U6AlIaRrAw7l1NB
 xoWQ==
X-Gm-Message-State: AOAM532+8nO33rZ2cyF+n1n9OQLKrmRwk9h8HPPaiqwnLQ2+vsnrIuPy
 3GjbQRI4p+euXp5Z3cXB+vz+cg==
X-Google-Smtp-Source: ABdhPJzJhxyo5Pwv4MAddpsvsNnHWi8+BnTb+n5ykCJ6x8GYG7kOG4DKjSMASoOdac+T48xwEr6gUw==
X-Received: by 2002:a17:90a:ad48:: with SMTP id
 w8mr4201855pjv.179.1599865873617; 
 Fri, 11 Sep 2020 16:11:13 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id p190sm3394180pfp.9.2020.09.11.16.11.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2020 16:11:12 -0700 (PDT)
Subject: Re: [PATCH 6/7] hw/char/serial-isa: Alias QDEV properties from
 generic serial object
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20200907015535.827885-1-f4bug@amsat.org>
 <20200907015535.827885-7-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dbd702de-6f44-7bfb-3877-2b99d2e4194c@linaro.org>
Date: Fri, 11 Sep 2020 16:11:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200907015535.827885-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.469,
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
X-List-Received-Date: Fri, 11 Sep 2020 23:11:16 -0000

On 9/6/20 6:55 PM, Philippe Mathieu-Daudé wrote:
> Instead of overwritting the properties of the generic 'state'
> object, alias them.
> Note we can now propagate the "baudbase" property.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/char/serial-isa.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


