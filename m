Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12054D3B7EA
	for <qemu-trivial@archiver.kernel.org>; Tue,  9 Dec 2025 14:18:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vSyXo-0002uZ-Ni; Tue, 09 Dec 2025 09:18:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vSyXm-0002tw-57
 for qemu-trivial@nongnu.org; Tue, 09 Dec 2025 09:18:22 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vSyXk-0008KW-L5
 for qemu-trivial@nongnu.org; Tue, 09 Dec 2025 09:18:21 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-477632d9326so38436015e9.1
 for <qemu-trivial@nongnu.org>; Tue, 09 Dec 2025 06:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765289899; x=1765894699; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SyPmRId3qhYF3UPzWmUM6JtecJdpjzXHLPKaIlUY0c8=;
 b=G475k1eus6g8lnhA31ouPEoBeiqH6SEivo8xI3TWv4+eshA1LoR4NiJM7K9+e5M3dJ
 bc3iqckRLtKzwxvyR/pwLDNbhsrnLdDjTLWyIsonB3vjfNeMPhd8tKUqIbQkKscpqvBR
 T492LVkNybGWDCN5FA0hApH5EwXaaRrzX2LIIFIAZiOlXOS8IJ3g/c5774zn2TmAYYes
 rcryWsPcSo9DJ3AAuRkA3XztIldZlE3Nj1GVPHbPUWOIxUFTBzlo/qFrnUAl41N/W0Yz
 9qp/59LArEVe+CS2NNe/u8ZaJL0lVgJGGIOj+pauBolut656DQsYG8OWd5AWu3aDYlLu
 oAOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765289899; x=1765894699;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SyPmRId3qhYF3UPzWmUM6JtecJdpjzXHLPKaIlUY0c8=;
 b=QwjlSPEeg5jGFQwsiZe0CaaClSekN43yUZuhK6x3aW+sHub7P9UJrevIca5kNKF6Je
 1buQzDZp3ZrZ0yWZovvgu5ZBFZK48fhBqbmqh9l9Hdp+B+L1Y7lfwB4sNFg3KdWfB94D
 x/wtTvC0uTcbQ65TxC1NhxX/fLJuSapM/wJ/5ioFMUHd3LyybH4KKvsUCB4vwtClZtg8
 97mAY7glDF9CyYacSk1hY3IIQOQQzNMccas0LRhA8KjuIYqpSuPo7HbdkwZoboDjRhxB
 52utxqtEwRAXbOCK0W22/v8dyXyMs1Yh+LdC7mxIR/0eaxxomt7uHv3IzmXLHWDZPjEj
 thnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7NJu/iYdhBW3rVMlDZqcJIQdV30iCK97fwldGr6gSCEj0l2hgBBZwOTGoo9nrbY1nQZiwUyfGmevNmmc=@nongnu.org
X-Gm-Message-State: AOJu0YyXRNFjW6nnq4KQbIDG8hMT0kECChr/py7HWZ7EJOFa+2Vfvq18
 EtwRXlXWys0G4rgJoJMkCllJ/WAC0v8UbTSUPsCTHgWLtP7F8Z+feEHQEGUDHPVupVk=
X-Gm-Gg: ASbGnct7OEvF8hpSsA2NTUEEro0HtRGvrUN3TtHMSTCNzIirswItk/rTSAf21YCeJpE
 Qea3HKlYIdivJrbVzF/uyVexPj0+18u61n3qMIRsSuur6OS85y4ZOtpuPya9esNFLrA3r7ykRL6
 UMkl+oidVPM/KlG5cO96D4edkEYHEEyMQGcCXgD7HatWmgMLdTD7jA8gBUWYhwgz5F+mSBkY5dk
 Vm/pCNv4j5osRpfB1eCVvoed2DPP8c9uSPncz933C81ib7+F6DauE8QjbNnvzdgaHaAzMq9FuSt
 nS+QHg7tohRd0/uBapQ95WinkhCoXh8IARe/nzMn+p5TkA/vTDmgyOF1UAT5yx75tVGEnLlOMTL
 raaL6TsfPzaHjmay6S1g9fx01ViUmuQNvEyWOqVGhQWOZpB5guM4npPRq5tbKfr5kk246WJ/DQB
 73YWnunzhwsHy/P74qZxdVncYtpcDrkQ/uEayU9G3dt6CDru8yjxZONw==
X-Google-Smtp-Source: AGHT+IEVJ66h8sA0DSE5mPcMDVbC9P6X52MV2/icOqJzIuccfw8tTcdQfa/dmKokLpKzmw32QSZIrg==
X-Received: by 2002:a05:600c:4691:b0:477:63b5:7148 with SMTP id
 5b1f17b1804b1-47939df150cmr110192165e9.6.1765289899004; 
 Tue, 09 Dec 2025 06:18:19 -0800 (PST)
Received: from [192.168.69.213] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a7d810c49sm39156115e9.15.2025.12.09.06.18.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Dec 2025 06:18:18 -0800 (PST)
Message-ID: <e78e151f-c318-4916-8cc4-f554fe360ae7@linaro.org>
Date: Tue, 9 Dec 2025 15:18:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.2] scripts/nsis.py: Tell makensis that WoA is 64 bit
Content-Language: en-US
To: Stefan Weil <sw@weilnetz.de>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20251209130212.764443-1-sw@weilnetz.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251209130212.764443-1-sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

On 9/12/25 14:02, Stefan Weil via wrote:
> This fixes some settings like the default installation path
> for the QEMU installation on Windows on ARM (WoA).
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>   scripts/nsis.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/nsis.py b/scripts/nsis.py
> index 8f469634eb..33069f4a86 100644
> --- a/scripts/nsis.py
> +++ b/scripts/nsis.py
> @@ -114,7 +114,7 @@ def main():
>               "-DSRCDIR=" + args.srcdir,
>               "-DBINDIR=" + destdir + prefix,
>           ]
> -        if args.cpu == "x86_64":
> +        if args.cpu == "aarch64" or args.cpu == "x86_64":
>               makensis += ["-DW64"]
>           makensis += ["-DDLLDIR=" + dlldir]
>   

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


