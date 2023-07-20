Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qMTuL-0004Rg-1d
	for mharc-qemu-trivial@gnu.org; Thu, 20 Jul 2023 09:41:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qMTuI-0004R7-Tg
 for qemu-trivial@nongnu.org; Thu, 20 Jul 2023 09:41:26 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qMTuH-0008JS-EZ
 for qemu-trivial@nongnu.org; Thu, 20 Jul 2023 09:41:26 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3fbd33a57ddso6731725e9.1
 for <qemu-trivial@nongnu.org>; Thu, 20 Jul 2023 06:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689860484; x=1690465284;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ydyEtvp0jVzXHQwD30AOx8xJ0G80q847aV6xV9dGbe8=;
 b=u09L95ZVCZQhisAdZMPjMIukmCZLPf2wBhoQP9M9ARKqEsgPU91dYnd0JRV+FKa5Cs
 gxZascItDE9wNojj0r2oMPVNNbSrE/Y9vnGuSTjrDfKSckjwaTMLbRcgvofHUh5ftwc0
 FJvYV5qoNimafmJkdmDvYChTpvQqbNaeunG7ggfCfT9c1I6+wc+PvWAJJxT9chlrFfXf
 nLOKySnVAOoslcSRV4kBFClLlwN/eKptfI+rcNRwFKiv6LIRhvAAO61KqQlsW8mR91Pl
 3gCKb2HOf8GD6J/nai2qGt+7YyIxbnoPKjuYdsxtgYmmM2yJQ5pXsvjRmDkvN8m0Tfy8
 rocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689860484; x=1690465284;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ydyEtvp0jVzXHQwD30AOx8xJ0G80q847aV6xV9dGbe8=;
 b=bL5lMQqb+4urmfJ+p7W7UGven0NIqPosdedLBuiOr9QdC9tBbaH806taJeBdDqti2r
 qFXSSflTEQxAX7Ni2nhcH2AqfBGjQ5PBs7omU1xIqilDGfkTSlj7T81w9tjeQCwPpB5c
 qpnBBCw2j9E/7QkfCgqaFB8bk2KViqiHMU+wRiNLsPiqJITkZsHGBYu6DlTSGTy9J79n
 /2151EPJP/pPe9hJd/nv7J42VNXakkJoB5Lg1h3FRht+d/f5h8/2Ir0sbQlSX/Llu2Jn
 Yu5HqqRhJb6iagxar96n8O5HyQyTy/pNwyHcg8NNNqwPSf2RXphiA67ZKx7IRBqPnOin
 aKuw==
X-Gm-Message-State: ABy/qLY/vhub7gVBfjDnDEPrbu3H5Eu7THwTX0foRx5F3/7ba1bjo7nc
 WzeF1ND29GMsbgjlfPkMFfbXdA==
X-Google-Smtp-Source: APBJJlHWC/wZnd9wncWa6PTQSLIz6JfyEiI/8CP5JOgOyxofmzSKP5amkl7EhRTHnKufdwZEo1z1uw==
X-Received: by 2002:a7b:c7da:0:b0:3fa:97ad:2ba5 with SMTP id
 z26-20020a7bc7da000000b003fa97ad2ba5mr6602912wmk.31.1689860484001; 
 Thu, 20 Jul 2023 06:41:24 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.214.178])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a7bc4c9000000b003fbca05faa9sm1212457wmk.24.2023.07.20.06.41.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jul 2023 06:41:23 -0700 (PDT)
Message-ID: <7e62d4fd-a23d-8dfc-1d3b-dae63975bc53@linaro.org>
Date: Thu, 20 Jul 2023 15:41:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH 5/6] qapi: Correct "eg." to "e.g." in documentation
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: eblake@redhat.com, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20230720071610.1096458-1-armbru@redhat.com>
 <20230720071610.1096458-6-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230720071610.1096458-6-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.096,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 20 Jul 2023 13:41:27 -0000

Hi Markus,

On 20/7/23 09:16, Markus Armbruster wrote:
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   qapi/char.json | 2 +-
>   qapi/misc.json | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/qapi/char.json b/qapi/char.json
> index e413ac2b70..52aaff25eb 100644
> --- a/qapi/char.json
> +++ b/qapi/char.json
> @@ -18,7 +18,7 @@
>   # @filename: the filename of the character device
>   #
>   # @frontend-open: shows whether the frontend device attached to this
> -#     backend (eg. with the chardev=... option) is in open or closed
> +#     backend (e.g. with the chardev=... option) is in open or closed
>   #     state (since 2.1)
>   #
>   # Notes: @filename is encoded using the QEMU command line character
> diff --git a/qapi/misc.json b/qapi/misc.json
> index ff070ec828..cda2effa81 100644
> --- a/qapi/misc.json
> +++ b/qapi/misc.json
> @@ -18,7 +18,7 @@
>   # fail and the FD will be closed.
>   #
>   # @protocol: protocol name.  Valid names are "vnc", "spice",
> -#     "@dbus-display" or the name of a character device (eg. from
> +#     "@dbus-display" or the name of a character device (e.g. from
>   #     -chardev id=XXXX)
>   #
>   # @fdname: file descriptor name previously passed via 'getfd' command

$ git grep -wF 'eg.' | wc -l
       45

Why not fix all the tree?

