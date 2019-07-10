Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hl6JD-0003fx-W7
	for mharc-qemu-trivial@gnu.org; Wed, 10 Jul 2019 02:42:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47761)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hl6JB-0003fb-O1
 for qemu-trivial@nongnu.org; Wed, 10 Jul 2019 02:42:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hl6J9-0007w9-T8
 for qemu-trivial@nongnu.org; Wed, 10 Jul 2019 02:42:29 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:46944)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hl6J8-0007po-3P
 for qemu-trivial@nongnu.org; Wed, 10 Jul 2019 02:42:27 -0400
Received: by mail-ot1-x343.google.com with SMTP id z23so1031377ote.13
 for <qemu-trivial@nongnu.org>; Tue, 09 Jul 2019 23:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pTCwkQwfTaoa4SWphSJQOAblwJpi5VF7yxRVP6i7yqU=;
 b=qVVMsmhHn/vWGhwsPKGNhUiWog8UvRBjF9Qm2eO450CLOO0VVzqFUPCPLgDbtceo+S
 rXGXyvob7gtJ3DurAbycFFSepyqY1s4jP+tRQpDww81UdZrLOj6IQcY8R3WPYbOetEln
 yr1OQYQzFfx4irzptzj17W/be9v82wKKlXwFZVH4IAYKnsY/RZ56fiapEug6lsrry7I1
 QltXMpzkxGrZNq8mTrhpAI5/4u+XrwSX6gk/jJoMrslWfYjFUBMZ+8gDAtN0EX+207xA
 NxohlhO6DUhTcz99v3P89fc5u/xMVlHeWR4MUM6YFd1AAeAVOrnnWgpxB3ug/d8/+hME
 wrdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pTCwkQwfTaoa4SWphSJQOAblwJpi5VF7yxRVP6i7yqU=;
 b=WxPuLPos40oV1Gn9+R5EKdHPFZzvhMMgeKFkr+91Oz0KQdS2MVOgjyV4K7gB245iFB
 5pF4BVLflUVSIC1CgiwyEqnOJsvi99S2Xz6C3dzCF+IIfGt6k9dNlRJj5WEYX4uHSN//
 gqnjXpM9a8YENHhnhWC3jWm3W0tpq3yIibqB0TFf0ZmTcck7kKgEE/ByASZj8BtnPj43
 T2NvXfmUJlHQNmVoFj7AhmG530729K9F+wl6nCYJK7U6MSCB45Gg7w9iCtxK/dA+Lxe0
 nc6hGTmwjQc8bEu/Glb14cFe9yp316WmsLAPqT5EQ4pznmVGbgQxFJViITXa0NeYYZFa
 8h+g==
X-Gm-Message-State: APjAAAVuM//If5O/eLRllmDQTX04fTRwAlsiYdt+1KnXMLtHFayqAsBz
 EEBLSnqYhPHMTdzP4gK+Awk0Pw==
X-Google-Smtp-Source: APXvYqwO+dIl32nafWlt7psuu8kpqTuOBaZQRFGBYQVeMYNZzFLxxDwxqxLCpH38tVfsHiOmzqOj5Q==
X-Received: by 2002:a9d:6e6:: with SMTP id 93mr9890331otx.273.1562740940798;
 Tue, 09 Jul 2019 23:42:20 -0700 (PDT)
Received: from [192.168.43.94] ([172.56.7.82])
 by smtp.gmail.com with ESMTPSA id w13sm459826oih.17.2019.07.09.23.42.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jul 2019 23:42:20 -0700 (PDT)
To: =?UTF-8?Q?Carlo_Marcelo_Arenas_Bel=c3=b3n?= <carenas@gmail.com>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, rth@twiddle.net
References: <20190709234330.89699-1-carenas@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <8cc72ac3-bb28-5f48-61ed-860a1740cf6f@linaro.org>
Date: Wed, 10 Jul 2019 08:42:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190709234330.89699-1-carenas@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: remove obsoleted
 $sparc_cpu variable
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
X-List-Received-Date: Wed, 10 Jul 2019 06:42:30 -0000

On 7/10/19 1:43 AM, Carlo Marcelo Arenas Belón wrote:
> 9b9c37c364 ("tcg-sparc: Assume v9 cpu always, i.e. force v8plus in
> 32-bit mode.", 2012-09-21) removed the need for this variable and
> most of the references to it, but this one.
> 
> Remove defunct code, no effect or functionality change expected.
> 
> Signed-off-by: Carlo Marcelo Arenas Belón <carenas@gmail.com>
> ---
>  configure | 3 ---
>  1 file changed, 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

