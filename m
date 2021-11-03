Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mi7Fr-0000PD-JF
	for mharc-qemu-trivial@gnu.org; Tue, 02 Nov 2021 23:48:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi7Fq-0000MR-Dx
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 23:48:02 -0400
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35]:35757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi7Fo-0005IG-BF
 for qemu-trivial@nongnu.org; Tue, 02 Nov 2021 23:48:02 -0400
Received: by mail-qv1-xf35.google.com with SMTP id u25so1459046qve.2
 for <qemu-trivial@nongnu.org>; Tue, 02 Nov 2021 20:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=L6yk3KZ08G/sRG+koWjB+g9wd4JkMZ8rKwv/Q4dfkJw=;
 b=B4aAzasBMLAAMBge0xFxJ7Y7aeHwdoMnWpRtEwlR6Tgyr3wltYVFJk4bQ0LT5HnnFL
 Iao+A2JU+oZgCYzRsMF3kqmq2Ih/VGlwZobJjEY7yXjpprlEUJzlHkdhnxtgWIcC7aZ9
 1BZDeUSXxC7mK9t1wunawUjzmGcNj0ogfRqxMPPVc0qLscfj9exiU22ncEDwRsYnlqny
 bId0PQwbsqNIPPKaDShCHRQUEJdm8UfP0VXKlqByk1CyruILDBhMCzXae2vU7CYV/qin
 vY/8wyx0he8GOXIOxx04xlk10Giccdz6n155wwvAn5N4jZJTqBP6tE6TBQqvbsMngt4A
 QgQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L6yk3KZ08G/sRG+koWjB+g9wd4JkMZ8rKwv/Q4dfkJw=;
 b=e6wlhUcDstBx3WXz5xLKu5D/4mJLL2R8OP0sKhXyNoWieCZ57mKeP+9Jjer6ctjymZ
 efiaEuUXopOx2Waph4dfPyKuvZ62nXd+Vblaq/PHPlYD9x/a51ifSFNsgkkYK2a2yjs9
 jEfNSCXJ3o7Sqqzq3kYyUvcNKUVE7d2VTcGL/mQ6G/n+ReBvO+oVTBO7HsHai/Uun27P
 ceXXBOeZ0cACEd6pl5DFai4mDSGDFxq0+EQ3P+rw2rWQWff5kR+8g5pfymWdx1UaiL6W
 JVNEqOSoXsY1mAaE/htSdWwsW7E527189zRHwd6Twva0SKmAhwOE0KaITeBbzR2bsPST
 48KQ==
X-Gm-Message-State: AOAM533Id8e7X2EBymA8EosV0AE5cTxcLrguT5aFRq/1RsBQBwnEti10
 UgGUWw4LQ5WfeD0SA6rFKH+IsA==
X-Google-Smtp-Source: ABdhPJxvZQ9gjr6ei9yolqtV7QqRSPAO7ucZfzdV7/+tT0E17ssFYlRGUF7TayGcgQQoVe7HeJBXuA==
X-Received: by 2002:a05:6214:c6f:: with SMTP id
 t15mr7146513qvj.6.1635911279520; 
 Tue, 02 Nov 2021 20:47:59 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id u18sm737851qki.69.2021.11.02.20.47.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 20:47:59 -0700 (PDT)
Subject: Re: [PATCH v2 26/30] bsd-user: add arm target build
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Kyle Evans <kevans@freebsd.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>
References: <20211102225248.52999-1-imp@bsdimp.com>
 <20211102225248.52999-27-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fc347f04-cf78-0b30-b0c4-911e3281e6d1@linaro.org>
Date: Tue, 2 Nov 2021 23:47:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211102225248.52999-27-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf35.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
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
X-List-Received-Date: Wed, 03 Nov 2021 03:48:02 -0000

On 11/2/21 6:52 PM, Warner Losh wrote:
> CC: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> Acked-by: Kyle Evans <kevans@FreeBSD.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   configs/targets/arm-bsd-user.mak | 2 ++
>   1 file changed, 2 insertions(+)
>   create mode 100644 configs/targets/arm-bsd-user.mak
> 
> diff --git a/configs/targets/arm-bsd-user.mak b/configs/targets/arm-bsd-user.mak
> new file mode 100644
> index 0000000000..90b6533195
> --- /dev/null
> +++ b/configs/targets/arm-bsd-user.mak
> @@ -0,0 +1,2 @@
> +TARGET_ARCH=arm
> +TARGET_XML_FILES= gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-vfp-sysregs.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml
> 

Note that we just added one more xml file for m-profile mve.


r~

