Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jEeow-0007e6-7U
	for mharc-qemu-trivial@gnu.org; Wed, 18 Mar 2020 15:57:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47877)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jEeot-0007bM-R7
 for qemu-trivial@nongnu.org; Wed, 18 Mar 2020 15:57:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jEeop-0001vB-8D
 for qemu-trivial@nongnu.org; Wed, 18 Mar 2020 15:57:39 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:52104)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jEeoo-0001gr-Sd
 for qemu-trivial@nongnu.org; Wed, 18 Mar 2020 15:57:35 -0400
Received: by mail-pj1-x1043.google.com with SMTP id hg10so1807532pjb.1
 for <qemu-trivial@nongnu.org>; Wed, 18 Mar 2020 12:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SfifZN2LfHh6ueoZ6ciAcGJnVw4PMaTiQsypNeYvvyw=;
 b=hFEpeashxxC+xsNUOpbAhFGsvfegul5e6MXizzSAIuoROx754INkdwMqbXZ4FWhEYt
 zWW/LFjFmyLf7too9SbKb9jHYsIqPWKvrglpwnwsMNOG1LvzBXll1bBiV4O/KsWVw5m3
 psenE9ULMYmfIlA4YOvSDUkkTpI5XcEyKHtD16HgOHS5nVKDg5oNusEgcMP9PkjS9Mc9
 sDpxUkG1rqJLGx9qJ7F5OUlIXiPBcJ4NpnSAvgPxdnO3ifryBwQb1QVO7zfYSa2akFBm
 CvSpFfwzwsZjNb0TfL58IiR2qoaIPHTgcBzTUrRnFSELVnchFnYxEhkv9pSPkgeqMPd3
 e6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SfifZN2LfHh6ueoZ6ciAcGJnVw4PMaTiQsypNeYvvyw=;
 b=fqdJYRh/c1ZZwcGDJ43XeM7d15g9y6ojRlYhuz7ROI81Mc0LH7TuC+EZk2OhB6sWb/
 VXP53xY+psGUF0+vq9yD2T/KyjRhB+Lur24jK8vSCrQ2LkWHHIlHM8wQGNIqohr9G/2J
 PrX3gWDV3bbRuy9oR+CcHx8EVaL8NJIOi+ViEmb/CnBR2paQqNIofomQ4a1p6w6cBLQm
 C6gVBFzDnkZe6WM0LLLgnGL3TXsZYYgJQ7HXcNhxeLSc+CXpEDerPvf8V8Mr1pYjQuAn
 9DIbYWqrWrythNbKPkgOCi78F7N7yMnRf7Vtm9/qKdHQuv6HZS+wH+HUrA8BJa3zlRIc
 o1zw==
X-Gm-Message-State: ANhLgQ3FQTdeVR0C2mJFbPF/BVeloU4xlKeuhAkHD/bJGywPo2uH1B4V
 FTgNM1K46wWkXXXkc0YDfjFSOg==
X-Google-Smtp-Source: ADFU+vsZ432fPyUOzVfMpuW9g2zC/zgI60WUbGjzoPhCVl3IC93pXpTbOneqSdKTzx+re6ePQfyh3w==
X-Received: by 2002:a17:902:9b95:: with SMTP id
 y21mr5463410plp.101.1584561453815; 
 Wed, 18 Mar 2020 12:57:33 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 d1sm7249399pfc.3.2020.03.18.12.57.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Mar 2020 12:57:33 -0700 (PDT)
Subject: Re: [PATCH v2 1/1] target/ppc: don't byte swap ELFv2 signal handler
To: Vincent Fazio <vfazio@xes-inc.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 Vincent Fazio <vfazio@gmail.com>, David Gibson <david@gibson.dropbear.id.au>
References: <20200318170116.1922-1-vfazio@xes-inc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8d76e1bf-2149-b995-3257-fd40eca6ccf9@linaro.org>
Date: Wed, 18 Mar 2020 12:57:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200318170116.1922-1-vfazio@xes-inc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1043
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
X-List-Received-Date: Wed, 18 Mar 2020 19:57:41 -0000

On 3/18/20 10:01 AM, Vincent Fazio wrote:
> From: Vincent Fazio <vfazio@gmail.com>
> 
> Previously, the signal handler would be byte swapped if the target and
> host CPU used different endianness. This would cause a SIGSEGV when
> attempting to translate the opcode pointed to by the swapped address.
> 
>  Thread 1 "qemu-ppc64" received signal SIGSEGV, Segmentation fault.
>  0x00000000600a9257 in ldl_he_p (ptr=0x4c2c061000000000) at qemu/include/qemu/bswap.h:351
>  351        __builtin_memcpy(&r, ptr, sizeof(r));
> 
>  #0  0x00000000600a9257 in ldl_he_p (ptr=0x4c2c061000000000) at qemu/include/qemu/bswap.h:351
>  #1  0x00000000600a92fe in ldl_be_p (ptr=0x4c2c061000000000) at qemu/include/qemu/bswap.h:449
>  #2  0x00000000600c0790 in translator_ldl_swap at qemu/include/exec/translator.h:201
>  #3  0x000000006011c1ab in ppc_tr_translate_insn at qemu/target/ppc/translate.c:7856
>  #4  0x000000006005ae70 in translator_loop at qemu/accel/tcg/translator.c:102
> 
> Now, no swap is performed and execution continues properly.
> 
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> ---
> Changes since v1:
> - Drop host/target endianness callouts
> - Drop unnecessary pointer cast
> - Clarify commit message

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

