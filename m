Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k5urQ-0006JK-Nh
	for mharc-qemu-trivial@gnu.org; Wed, 12 Aug 2020 13:48:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k5urN-0006I7-DD
 for qemu-trivial@nongnu.org; Wed, 12 Aug 2020 13:48:21 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:44469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k5urK-0004cT-Pk
 for qemu-trivial@nongnu.org; Wed, 12 Aug 2020 13:48:21 -0400
Received: by mail-pf1-x433.google.com with SMTP id r11so1376031pfl.11
 for <qemu-trivial@nongnu.org>; Wed, 12 Aug 2020 10:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/D9CsbLRGlgR3+bpTAcYqbtG1Xp24A8kPxeMyv55O8I=;
 b=XXx1tdhiUd2M/rp4yUCaZnxIgb5m73w9u7/1yuYjF+8uMZ/9aJqHiohmLeScTWMkIF
 ajP/IlVZJyWUXDSEmsdzFUwIYaKs05p7CvywULLqcQd9P/g7O4rRnn+Di61WgIyDCxHX
 KL2ze7WpwXuvmf/is5v+WIhRs/OLDzo18ZAyaaj6TogPPdTRiFZJI2mP5CqAv6gWRG95
 rgoxYjto+miscIVxgUiflLiHRvSh12br8I2s1TXkLNBGMDaEA1OclgHVmrsU01vaGkPZ
 n5tuMMCyfI2u0haSiYeceWDf8BtM2hHBUn5SYKonejGXL52dXjHjOtzuBa0TWt1btXtY
 Nd5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/D9CsbLRGlgR3+bpTAcYqbtG1Xp24A8kPxeMyv55O8I=;
 b=iWJvAtFeS+8wF0TqUQeGnkWA+T4HOO5c6LnGvcTX/RWwAV7/x0bDm6L6ticPeDiST0
 EguvOl4C0SF9QhHZiOHvLWj/CKj/3QP31XqCet0XPiif0Jpk7d0snRerwrGtKmGvFR3f
 C6GnIKKZJ2GO5cMUmA5SiEYGL9TSTZCr3kf9EZKsdSjL1rcAYR/AEVxDXrlFPkyI07bi
 /YzppG8hT+V5//gr01Ti6inmR/6CSsuhWdQvNyq1sYouyXb8MnfD7FR5u9Bkf2U21tpY
 Fv9oERi9s6gKjRFdKH16SjeKSLhY0+doSP8SpE4uzC7rsin9fUmEBrU99Vyr/1gN3G9a
 bqeQ==
X-Gm-Message-State: AOAM533LbFAloUCZ1R7B9vVYhk8kHTlo2C3d4ML3sn2+m67QiJIeA1Lt
 MucxgYh4hVK0Xit5Lox7k0QUWQ==
X-Google-Smtp-Source: ABdhPJz+tccEDGK3D0wrHhXAc37zroiS/qZCLPVTj7AJRXQGxTcpoVRqEdBgU/mHWdpt81lcNGpl+g==
X-Received: by 2002:a63:d612:: with SMTP id q18mr267547pgg.292.1597254497416; 
 Wed, 12 Aug 2020 10:48:17 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id gz7sm2686482pjb.45.2020.08.12.10.48.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2020 10:48:16 -0700 (PDT)
Subject: Re: [PATCH-for-5.2 2/2] hw/core/sysbus: Assert memory region index is
 in range
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20200806130945.21629-1-f4bug@amsat.org>
 <20200806130945.21629-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e3bdbabe-dada-9e7a-14d3-8fbe80cbe823@linaro.org>
Date: Wed, 12 Aug 2020 10:48:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200806130945.21629-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
X-List-Received-Date: Wed, 12 Aug 2020 17:48:21 -0000

On 8/6/20 6:09 AM, Philippe Mathieu-Daudé wrote:
> Devices incorrectly modelled might use invalid index while
> calling sysbus_mmio_get_region(), leading to OOB access.
> Help developers by asserting the index is in range.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/core/sysbus.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

