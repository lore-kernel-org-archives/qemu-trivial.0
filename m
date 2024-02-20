Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rcOzm-0003Hd-Gj
	for mharc-qemu-trivial@gnu.org; Tue, 20 Feb 2024 07:13:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rcOzl-0003HE-DZ
 for qemu-trivial@nongnu.org; Tue, 20 Feb 2024 07:13:09 -0500
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rcOzj-00037Y-T2
 for qemu-trivial@nongnu.org; Tue, 20 Feb 2024 07:13:09 -0500
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-512bc0e8ce1so2103923e87.0
 for <qemu-trivial@nongnu.org>; Tue, 20 Feb 2024 04:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708431185; x=1709035985; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Fz3rhuMyIR5IIsO7/TNcMXjTgsSoaEjkhP7dkLH7cWw=;
 b=Jhmau/Nqoet6NwnHa05uG7dTCee2hKfr5xPsL0JZskZPfJ4+S+tSUHZIvAEuWqqtQq
 M6VGIXaTinJke2v3BM3d/O+PnkoRB/dEP4nqZFEbOncC3tC31P+tGR3TSGCU0xfVxy8N
 tnU3EztSd0BAY0oPkd2qObyYEx451ctuO2ilntLBlafNcl/pqevpzObkqUemki47NVtp
 aUrftrVdx6cIuYJeWdL2hX91TT67nAhyI8bcSP5jFZd5eXgOSiemnBXE2f468E85Dn7O
 BW/yP8aQPHOfz0mqgfkwSF0roOQThnqB+tg0BfKGecSuxAYbTQvhj/9faZDIrf7y/jGv
 TRPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708431185; x=1709035985;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Fz3rhuMyIR5IIsO7/TNcMXjTgsSoaEjkhP7dkLH7cWw=;
 b=qefoPqfI3MCyH810fS+XBj30jpKo+dr7pd6RiBAkRYQu/PxjLDhi5f+/de2zxUJZMo
 4hTwIxwjyJUXKnGKZt3FB/muqA3X9YaPxn2amOSwnkb7Slw+tXxaBwLcYnzIx29oDO3f
 oq5tzB11PyrdE3BI27lU6FWflfWWb8uSppm1glcfnZT8GQcZY/t38K2Mc/QifAar9lIZ
 PEBf8ZWsDjPULlU89E33hKZXGnMOl+mLVKeKcg46NWuF5ka3OZeONOghR1Hsf6z42mVr
 1DFV/2TzodiUn8O5kBgQyGdcSfamC40td4RbtvTX41gL/Ztcrm0zX6RD2n4YiZ5CNmrr
 MuHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkMZvHxeRHN7bjl9AuECKR+Jaf5uUAIOvgAPZuoON8B/QX7MSDdgcV+f1qzD7azjF4aujZaurPjlCGbc/mJDdJ+EWM/lnsow==
X-Gm-Message-State: AOJu0YzZnYOu39ljmNDxy0N2YFAWOOWTj/jQ++QfUfoEtUsvHZJqZb9x
 uw7R2CJ+1d60yFO8j0nFyd8g+OyFVYOOWZnJQbk6nTUTuyEuRjTs3vUi5WR0S/M=
X-Google-Smtp-Source: AGHT+IH+EXFyNV7jWsEV9f5xkqv8o3Y3/P646twrfUOYqq7Fu+tCJlKQOi0OycRhl8mlnY4wyPx58w==
X-Received: by 2002:a19:655d:0:b0:512:ab03:f4 with SMTP id
 c29-20020a19655d000000b00512ab0300f4mr5101336lfj.37.1708431185189; 
 Tue, 20 Feb 2024 04:13:05 -0800 (PST)
Received: from [192.168.69.100] (mek33-h02-176-184-23-7.dsl.sta.abo.bbox.fr.
 [176.184.23.7]) by smtp.gmail.com with ESMTPSA id
 l8-20020a056402028800b00564427855b5sm2711413edv.44.2024.02.20.04.13.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Feb 2024 04:13:04 -0800 (PST)
Message-ID: <ccfe5f39-7c49-4778-b0eb-a3e9c0c97a7e@linaro.org>
Date: Tue, 20 Feb 2024 13:13:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/21] include/exec/memory.h: correct typos
Content-Language: en-US
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>
References: <cover.1708419115.git.manos.pitsidianakis@linaro.org>
 <16e84fbb3dec43ee349a8ea5dd945c9630630bb3.1708419115.git.manos.pitsidianakis@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <16e84fbb3dec43ee349a8ea5dd945c9630630bb3.1708419115.git.manos.pitsidianakis@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Tue, 20 Feb 2024 12:13:09 -0000

On 20/2/24 09:52, Manos Pitsidianakis wrote:
> Correct typos automatically found with the `typos` tool
> <https://crates.io/crates/typos>
> 
> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> ---
>   include/exec/memory.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


