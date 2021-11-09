Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mkMeo-0007bi-4l
	for mharc-qemu-trivial@gnu.org; Tue, 09 Nov 2021 03:39:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkMem-0007bM-VL
 for qemu-trivial@nongnu.org; Tue, 09 Nov 2021 03:39:05 -0500
Received: from [2a00:1450:4864:20::430] (port=37849
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkMek-0002SD-Jo
 for qemu-trivial@nongnu.org; Tue, 09 Nov 2021 03:39:04 -0500
Received: by mail-wr1-x430.google.com with SMTP id b12so31593090wrh.4
 for <qemu-trivial@nongnu.org>; Tue, 09 Nov 2021 00:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tTn1h8lNZ2d9Ljs8KC2HZM9o8dyVAyYsNoLf+P++P0g=;
 b=RDx//z7WiiVHmRsLqzHZAU01NnQODICzIP53mLJiQ+/gMKwkWN7F4D/KbL6297oZEj
 eilJzwAjLzXvXoz1si1rXIGeeE3o0VNNxb0FTsnJ+Gzm9/1FS4GVoL8PA27kMK02ZFg+
 g/4Ev8egPykhNrIuSQMiim7cjPSSnWwhVy3sR05yeeLIlvR9Wnos7KXuK2E0Uwr0CpeW
 1RpATDqN0tWt8IyIoll/UPtOEBsl90BfKHaB0UvCkSpJmJXHRSkS2fmg5wLwvK+UscbX
 NggWC5/q9vs66NAxcLFVbuw2lC2YmJOtIm4KEOf+qeQfQSSJFKR7TKZozzFJMnAmrW/d
 q6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tTn1h8lNZ2d9Ljs8KC2HZM9o8dyVAyYsNoLf+P++P0g=;
 b=Z4/G7LEio2Penx8i1JZfrPkdWAolR2vP1q80m44oOC5cWsqJF9fPAWzES1wDZKBZ67
 qf9E19jrERKaTZvGWlflOv12zp52Y6mDa6Cp40kjUesZI7dhEADx/qt7kXqmjLHxoA9k
 4rDS5I9dlQiVvyIczGhqczVdrwd//Q43Qm4vCPPXR0ir2MMVMJ/2Pd+J3yw6A4+dZmai
 cdGTmpFHk2zJm30TmH6OlfA5IxY0yiy1oBH2HC9ZIQdmDRR1PueawWvnotbbGNnhB+ve
 8+CUYx4tGdMqUgwIi45fdKARidmOi5z/ZAK3HIu6pSawYIDpSgmOFJ7lnmXZ5KR6NSbx
 aMag==
X-Gm-Message-State: AOAM5339uwuoD5LmyiUyTaPAS5qSC8nYptz9n9Bac9LexoNR0dnUbTjQ
 xMZAkodFdq0cB14kXckK5WxA0g==
X-Google-Smtp-Source: ABdhPJy4R2izCbVFK06uw5cLcqxNiDdkCCPgMKWs3IcnbqDlhkCNfq49J/EOvlGwqkT26dOJF8L+UA==
X-Received: by 2002:a5d:59ae:: with SMTP id p14mr7256562wrr.365.1636447141119; 
 Tue, 09 Nov 2021 00:39:01 -0800 (PST)
Received: from [192.168.8.106] (169.red-37-158-143.dynamicip.rima-tde.net.
 [37.158.143.169])
 by smtp.gmail.com with ESMTPSA id z8sm20014802wrh.54.2021.11.09.00.38.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 00:39:00 -0800 (PST)
Subject: Re: [PATCH] device_tree: Fix compiler error
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20211108200756.1302697-1-sw@weilnetz.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c99a3838-7cbd-e6aa-742a-b943d3e460a5@linaro.org>
Date: Tue, 9 Nov 2021 09:38:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211108200756.1302697-1-sw@weilnetz.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.364,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 09 Nov 2021 08:39:05 -0000

On 11/8/21 9:07 PM, Stefan Weil wrote:
> A build with gcc (Debian 10.2.1-6) 10.2.1 20210110 fails:
> 
> ../../../softmmu/device_tree.c: In function ‘qemu_fdt_add_path’:
> ../../../softmmu/device_tree.c:560:18: error: ‘retval’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>    560 |     int namelen, retval;
>        |                  ^~~~~~
> 
> This is not a real error, but the compiler can be satisfied with a small change.
> 
> Fixes: b863f0b75852 ("device_tree: Add qemu_fdt_add_path")
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Though I think there's a good deal that could be cleaned up about this function:

(1a) Remove the unused return value?
      The single use does not check the return.

(1b) Don't attempt to return a node, merely a success/failure code.
      Certainly the local documentation here could be improved...

(1c) Return parent; make retval local to the loop.

(2) Merge p and path; there's no point retaining the unmodified parameter.

(3) Move name and namelen inside the loop.


r~

