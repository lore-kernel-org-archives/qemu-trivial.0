Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZyeP-0002aS-8r
	for mharc-qemu-trivial@gnu.org; Thu, 31 Mar 2022 13:32:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZyeN-0002Z5-Dt
 for qemu-trivial@nongnu.org; Thu, 31 Mar 2022 13:31:59 -0400
Received: from [2001:4860:4864:20::35] (port=34835
 helo=mail-oa1-x35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZyeL-00087d-O6
 for qemu-trivial@nongnu.org; Thu, 31 Mar 2022 13:31:58 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-de48295467so22301fac.2
 for <qemu-trivial@nongnu.org>; Thu, 31 Mar 2022 10:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=8JJVrsCtPuTJCiA8fgleeOmzbLHZdT25VYhxaiJtCdk=;
 b=eBwG/q3VEOtZJDgIWiGwHmNpBq+xtlf4mMCdeBhpu6tGhBH230HiDA9HmTHF6L1qRq
 nMZTqgeoK53wNfuNjCkBMslm3259kCHYs3ciCg1PiGR5m/ZW4bzfVK3+wfdP4ODn36L4
 z5fKaXB1vt9frkpBog5UUJOFkeQzZiPfKdPOu+yDXDGUko85Am3blJvhUBkzoiFmKEGi
 6smwH73FN4LbCGq82YNOj2WbGz7pj6WQw2+k22WOSFu4TjtM62x+VKo5Y3Q5LWX6QJaL
 zy5j/5u+VBmsnBZhV9kihZyXOSOLKOuRRaL4ms9/JL21XLDRE04SyRa8kBE5B16i8Y+2
 BsKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8JJVrsCtPuTJCiA8fgleeOmzbLHZdT25VYhxaiJtCdk=;
 b=b4GlSKhbshMgxeC3fS1gsnmLjeWzjV2VVZoysu0r979tzvx2x/KzVc1p0uDhMVq+3H
 f/yIopsLYD3SWRaU20QUEyt8ICMjdNi7JOXB0Pve2JEkwI4wykwsHQ0P6dnfcuqG5IBN
 hGuS9hDsb4lZDmNRq2VZXhUGD/s7B0kWpwhpye/ab/Vl36Ca8bvp5qGMmzJJ5/zGJ1+F
 Vb3RgV+4N39b3oIKHolr/f0Z4n4WHmsanPaTMZEFHl0Nr8gDONtxN/96bZwHO0cCGATh
 H8IMQ54tPWlJkZy0A0KoOO9ZGC5l/DopA6h1UHyFuabsrh+0K+foRzCsxvxbnzVN0bPX
 Eehg==
X-Gm-Message-State: AOAM532iJnCwhsjAQh4Ycnd9WR+1zj5MXkVPBEQuS//b2TpANkFhr2/7
 iynsZ5MKw6YlRYadX1Uxc8EOXg==
X-Google-Smtp-Source: ABdhPJwCgc5bKfLJ/pdr2ti8oHoAGMXa3SeAYnamiFydXekOMwVjcfeE48HnNjHqstN8Xmtv6hi6kw==
X-Received: by 2002:a05:6870:17a1:b0:da:b3f:3258 with SMTP id
 r33-20020a05687017a100b000da0b3f3258mr3243115oae.264.1648747916409; 
 Thu, 31 Mar 2022 10:31:56 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 n128-20020a4a4086000000b0032118eda64bsm20369ooa.38.2022.03.31.10.31.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 10:31:55 -0700 (PDT)
Message-ID: <25aa0bce-1153-6448-720a-5420385603b1@linaro.org>
Date: Thu, 31 Mar 2022 11:31:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] linux-user/sh4/termbits: Silence warning about
 TIOCSER_TEMT double definition
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Magnus Damm <magnus.damm@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
References: <20220330134302.979686-1-thuth@redhat.com>
 <ee4c5717-37fb-6053-497d-06925eed8fcc@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <ee4c5717-37fb-6053-497d-06925eed8fcc@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::35
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x35.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 31 Mar 2022 17:31:59 -0000

On 3/31/22 10:22, Laurent Vivier wrote:
> Le 30/03/2022 à 15:43, Thomas Huth a écrit :
>> Seen while compiling on Alpine:
>>
>>   In file included from ../linux-user/strace.c:17:
>>   In file included from ../linux-user/qemu.h:11:
>>   In file included from ../linux-user/syscall_defs.h:1247:
>>   ../linux-user/sh4/termbits.h:276:10: warning: 'TIOCSER_TEMT' macro redefined
>>    [-Wmacro-redefined]
>>   # define TIOCSER_TEMT    0x01   /* Transmitter physically empty */
>>            ^
>>   /usr/include/sys/ioctl.h:50:9: note: previous definition is here
>>   #define TIOCSER_TEMT 1
>>           ^
>>   1 warning generated.
>>
>> Add the TARGET_ prefix here, too, like we do it on the other architectures.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   linux-user/sh4/termbits.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Thomas,
> 
> do you think it can wait 7.1?

It fixes a build problem, so I'd suggest putting it in for 7.0.


r~

