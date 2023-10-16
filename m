Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qsJjh-00051e-74
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2023 05:18:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qsJjf-00050K-L7
 for qemu-trivial@nongnu.org; Mon, 16 Oct 2023 05:18:03 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qsJje-0006N6-1A
 for qemu-trivial@nongnu.org; Mon, 16 Oct 2023 05:18:03 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-313e742a787so2554524f8f.1
 for <qemu-trivial@nongnu.org>; Mon, 16 Oct 2023 02:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697447880; x=1698052680; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J8HBoxwSOZi2fwOpU7PzOzC4cbtiKQcsj4DLLMwgC3Q=;
 b=Vmz+wPDSe3SKf4dCyV/BFN2Jv9xUwBcew63hkoxACtXZAYPPWvAEISfcIgwz+qaKUB
 dpuhv7P31hkRCkYkVMqo+fkTX2HLCJF3BIVX7zCshG7aLKIdO9A2FjdkBijn3k1AZxnS
 HkpKLguvi9Tx1iGk8GvUeLh9psgWHf5MyWKvjwA08L8/sC0Mz86K1bHi3B77YiiUulpX
 ttkD4lDdjokoe/ibal6gnaMd0069Vetq12rVKaLlv/ODRDa8AiNr2gfMDX5n7OKlfOXl
 l7fwZXXYcobcN8fJgQNdRszF9OlLWBIJvqg+Bi0BgweI45cK30yl9bWCpRTILtmG06Ou
 9qZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697447880; x=1698052680;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J8HBoxwSOZi2fwOpU7PzOzC4cbtiKQcsj4DLLMwgC3Q=;
 b=rod6naEty7rd+bGgRm9IQGbNJCLykT2kguvXYgR9eqs9WIKLhOetprDqLPLGK9EQ5t
 hV1zeEdohBk77V3GuIcv4rso1OR/F99nJbVkaoChIh2Ru98JW1yqRtb/rUv7BFaRP+uY
 viHaK1SFwVMwIZJ4nak2gZViuEf3ZpIJ+FWq5Ay8ce9eePYLdVdETh1nDr7L/3iUDrzX
 gfBk1OS6D23S4rc4cEXS0V6aswWKVUSE2IZ0Ya9fPb+VT4gv2VqcnqJDVsVy3cxPdmcY
 CkXn6J3wNqDEu+/OjoyRtbsSURpHwZKyqCHNgJKxfO8EABZuLL9ms+GH6ZC/wVZGXmq9
 HBmg==
X-Gm-Message-State: AOJu0Yw240ci5S1VpwZsIiJkd9hfYRNjk9lUFMrkMH2B8l8/fcpJyCo9
 HRz23/wzlg1S2DcqTI0A33OqeRZI3Jpp3J81TqY=
X-Google-Smtp-Source: AGHT+IGYq5OTKWzaumcL2JmwbMiHJEbe0pmucPJB0hu30X9ZN4XCNuR7IyPnpgkBCX+AsCzbNi0Tmw==
X-Received: by 2002:a05:6000:1c16:b0:32d:846a:e987 with SMTP id
 ba22-20020a0560001c1600b0032d846ae987mr5537672wrb.6.1697447880522; 
 Mon, 16 Oct 2023 02:18:00 -0700 (PDT)
Received: from [192.168.69.115]
 (9r679-h01-176-171-216-136.dsl.sta.abo.bbox.fr. [176.171.216.136])
 by smtp.gmail.com with ESMTPSA id
 w4-20020a5d5444000000b0032da87e32e2sm4330991wrv.4.2023.10.16.02.17.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Oct 2023 02:18:00 -0700 (PDT)
Message-ID: <bdac37d1-cd6a-d2da-3aca-9a4a8e46254f@linaro.org>
Date: Mon, 16 Oct 2023 11:17:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH v2] MAINTANERS: Split vt82c686 out of fuloong2e
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20231015141517.219317456A7@zero.eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231015141517.219317456A7@zero.eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
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
X-List-Received-Date: Mon, 16 Oct 2023 09:18:04 -0000

On 15/10/23 16:15, BALATON Zoltan wrote:
> The VIA south bridgges are now mostly used by other machines not just
> fuloong2e so split off into a separate section and take maintanership.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---


> @@ -2491,6 +2488,15 @@ S: Maintained
>   F: hw/isa/piix4.c
>   F: include/hw/southbridge/piix.h
>   
> +VIA South Bridges (VT82C686B, VT8231)
> +M: BALATON Zoltan <balaton@eik.bme.hu>
> +S: Maintained
> +R: Philippe Mathieu-Daudé <philmd@linaro.org>

Thanks, queued to mips-next, keeping a 'M:' tag here
and fixing typos in subject / bridge.

