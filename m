Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ioHvb-0003hL-DB
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jan 2020 21:15:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44719)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ioHvY-0003g7-JS
 for qemu-trivial@nongnu.org; Sun, 05 Jan 2020 21:15:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ioHvX-00042r-8K
 for qemu-trivial@nongnu.org; Sun, 05 Jan 2020 21:15:32 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:45219)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ioHvX-0003y4-0V
 for qemu-trivial@nongnu.org; Sun, 05 Jan 2020 21:15:31 -0500
Received: by mail-pf1-x442.google.com with SMTP id 2so26222108pfg.12
 for <qemu-trivial@nongnu.org>; Sun, 05 Jan 2020 18:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XP2hNmKzUX3IBbM3eIgKOH1z6Rf1aNz0lhFQuUULG28=;
 b=L+5ViJE/plrN7/Mb02cYU3on+MSMjvXFum9iBNLG4cSZVc98RsAx+t0+giOH/7vxnY
 Io2ZFBtPuUSXbxkjuzrZRNncANRyBvpp0mVHnu4duv2JSIelA1qhLc/4WnbJf87Krq06
 s3iXcDm4nLInqAbd3ZK24/2jVdeYpr5X//LrhliNCvurrUr4FMiAbRpBBoCWF30uknZn
 +i4HoE7zTRx0CEUX8RmzjV7obcpImGDRiYSJp/mDh/vSnl3DOKbF9cCOn+0SS61LgUmP
 bpcuNHcNv3yLIitYkqU3BSa+ssgQSbyH7E0M9y294F9n2sJ0ONmKfTnDXXg5a42tsymM
 5DZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XP2hNmKzUX3IBbM3eIgKOH1z6Rf1aNz0lhFQuUULG28=;
 b=mAgf1WiQ72sojfEZv7iyha3BgVLvtvjLx0m2BoEAGQGkn3w9xkQs3mZ7Alb2r9dzZF
 tOYalxg0MEo0Dm56z7ACp6J65hMI9mjMqCPFKqNg6ViHDNpGevTkYYDtCNxcQYNNxRob
 a5UFsAmtwioqIqhNMCCryaomqzyBIig23nsQ3fsvwWcCPDNSEK5PW01DwR7ISBhHw57u
 O67GxMat8YQwFP929AuBGFqyGEbvu7RLvfD4f4FPOQtn1mgRzvqp5bT4LJ9ALLiUuwrL
 y7cXIp46niPP5Bq/jr3K2Ise7tLf95usED+fVMwFPUVJDE6zW/gbkAn/pL+tplZJPbbA
 U4aA==
X-Gm-Message-State: APjAAAWbKPrDDKVSBDAUPH/SrUo8UoW5GXzSGdJLpuqcX0j5KENOz7mr
 wRvDfJo3o5NUwmQPgEQ3BXSdVw==
X-Google-Smtp-Source: APXvYqzm/I8hj2u5w/XYgHGzZIr6n8dwIqvbWjJ4C8k8SWV87E9RhpMQLnIDrk/G2Bdkz5g2p6hTFw==
X-Received: by 2002:a63:5b59:: with SMTP id
 l25mr110928350pgm.382.1578276929620; 
 Sun, 05 Jan 2020 18:15:29 -0800 (PST)
Received: from ?IPv6:2001:44b8:2176:c800:f1c3:9f9c:2e9f:1ebd?
 (2001-44b8-2176-c800-f1c3-9f9c-2e9f-1ebd.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:f1c3:9f9c:2e9f:1ebd])
 by smtp.gmail.com with ESMTPSA id z6sm60618257pfa.155.2020.01.05.18.15.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Jan 2020 18:15:28 -0800 (PST)
Subject: Re: [PATCH] arm/translate-a64: fix uninitialized variable warning
To: pannengyuan@huawei.com, peter.maydell@linaro.org
Cc: zhang.zhanghailiang@huawei.com, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Euler Robot <euler.robot@huawei.com>
References: <20200106015700.52992-1-pannengyuan@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <69ee9eb1-84bf-5bcc-738c-c75dd520cbf2@linaro.org>
Date: Mon, 6 Jan 2020 12:15:22 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200106015700.52992-1-pannengyuan@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
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
X-List-Received-Date: Mon, 06 Jan 2020 02:15:33 -0000

On 1/6/20 11:57 AM, pannengyuan@huawei.com wrote:
> From: Pan Nengyuan <pannengyuan@huawei.com>
> 
> Fixes:
> target/arm/translate-a64.c: In function 'disas_crypto_three_reg_sha512':
> target/arm/translate-a64.c:13625:9: error: 'genfn' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>     genfn(tcg_rd_ptr, tcg_rn_ptr, tcg_rm_ptr);
>     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> qemu/target/arm/translate-a64.c:13609:8: error: 'feature' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>     if (!feature) {
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
> Cc: Peter Maydell <peter.maydell@linaro.org> 

Are you compiling with reduced optimization?  The compiler should be able to
prove that these variables are initialized.  It certainly does with -O2, on all
known gcc versions.

Perhaps a better fix is to add a

    default:
        g_assert_not_reached();

entry to the o == 0 switch.  Though of course opcode must be in [0-3], based on
the extraction mask, so a default label isn't actually reachable.  But that's
the only path I can see for which incomplete optimization would fail to prove
initialization.


r~

