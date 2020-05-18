Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jafXi-0004ks-GM
	for mharc-qemu-trivial@gnu.org; Mon, 18 May 2020 09:10:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad@adacore.com>)
 id 1jafMB-0004Tc-BO
 for qemu-trivial@nongnu.org; Mon, 18 May 2020 08:58:59 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:46153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konrad@adacore.com>)
 id 1jafM9-0000Jt-4w
 for qemu-trivial@nongnu.org; Mon, 18 May 2020 08:58:59 -0400
Received: by mail-wr1-x435.google.com with SMTP id w7so11687665wre.13
 for <qemu-trivial@nongnu.org>; Mon, 18 May 2020 05:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=l5iVednAFBcuDKXihAW3k7FwTZ6l5dBGeJLoBnfTIg0=;
 b=xjlgTkjCQYPJSarCJVAdoMPCYIPrIqH2z1OCxNS7qdzYa2BJebMB77EKTdV9HOCetF
 kavuFZ38g6374VV+wpVb21pVKgh2cgyFVunqYHmj0+cTTuKMrDGCh2CXRg5EyLGA65TW
 w35/aTMvcyGhfp61cnGybjECv9N4A2wCoadabcLBkh/fme2iTRCXPBU7P0ObMQKdkskF
 TQPXz7rf66IrQS7Oqddkks1XzK/aPQpnpy0h0CDG2fMVPGT3s0ODexIsNUCzeORG8WMa
 eUm4ElKA+7lfLoja+D3A+oSEXzgsvpX/k41G+enPnoFVEJiUzRu0TCqKPZbDv4bgAAUx
 xTzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=l5iVednAFBcuDKXihAW3k7FwTZ6l5dBGeJLoBnfTIg0=;
 b=QZTzG38ly4r9gXV86IwaKqegngpaOX7uc1fY1jOEtKGcMUPTUAEAgfwuRH4rgiqLDy
 7Nrc1X+Gfd3qx8gMAEUf1d8UEo2QJ+i6WQTOypXJ2f5dtnCzbcB9/O5GUVTpgN4cQZex
 QcqmKOv0/1uXP6/go0wG+ot01AdLcys3OuRlGSzp0Pen/c9zSQMwkLIgg9/t0KpacxiY
 uJZBRAMAZuBZScyS7PGu/vCwnMuOdiV+fwfGEbTJ2Ux7W9AXudR6F6lUq2ZlkFGYG8qh
 kFKFs7ZiqkOrKLUqLMc5vYUUOYXM2LYjw/Kd57pGSQV+/VYaaRfwkr2tusepBV6WsexK
 Jwrw==
X-Gm-Message-State: AOAM531o6MRiEYm9TEGftHyrMf5B1Q1zIty+QVr+8AypgEBs9wZloHEh
 fXxQ/ll5piyJ7Se139rSfFmcGExRzAzRyQ==
X-Google-Smtp-Source: ABdhPJx+j6dKwWVypTwqOuAkV89sdHNTMdAr1VjWdMCgjuv8OQhMbuPVEEHHNHeWrgX7//mkWEbt6Q==
X-Received: by 2002:adf:e951:: with SMTP id m17mr20177503wrn.352.1589806734964; 
 Mon, 18 May 2020 05:58:54 -0700 (PDT)
Received: from linux.home ([2a01:cb19:867e:2100:7eef:23e0:9210:3e8])
 by smtp.gmail.com with ESMTPSA id l5sm16931258wrr.72.2020.05.18.05.58.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2020 05:58:54 -0700 (PDT)
Subject: Re: [PATCH] .mailmap: Update Fred Konrad email address
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20200518103920.10699-1-f4bug@amsat.org>
From: Fred Konrad <konrad@adacore.com>
Message-ID: <165726cf-9812-5474-685c-763a53d97a4e@adacore.com>
Date: Mon, 18 May 2020 14:58:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200518103920.10699-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=konrad@adacore.com; helo=mail-wr1-x435.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 18 May 2020 09:10:53 -0400
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
X-List-Received-Date: Mon, 18 May 2020 12:58:59 -0000

I wasn't aware of this mailmap stuff.

Le 5/18/20 à 12:39 PM, Philippe Mathieu-Daudé a écrit :
> Update Fred Konrad email address to avoid emails bouncing.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   .mailmap | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/.mailmap b/.mailmap
> index 6412067bde..4c7f4b7d03 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -44,6 +44,7 @@ Aleksandar Markovic <aleksandar.qemu.devel@gmail.com> <aleksandar.markovic@imgte
>   Aleksandar Markovic <aleksandar.qemu.devel@gmail.com> <amarkovic@wavecomp.com>
>   Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com> <arikalo@wavecomp.com>
>   Anthony Liguori <anthony@codemonkey.ws> Anthony Liguori <aliguori@us.ibm.com>
> +Frederic Konrad <konrad@adacore.com> <fred.konrad@greensocs.com>
>   James Hogan <jhogan@kernel.org> <james.hogan@imgtec.com>
>   Leif Lindholm <leif@nuviainc.com> <leif.lindholm@linaro.org>
>   Paul Burton <pburton@wavecomp.com> <paul.burton@mips.com>
> 

Reviewed-by: KONRAD Frederic <frederic.konrad@adacore.com>

