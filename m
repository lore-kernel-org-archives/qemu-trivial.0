Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rS9fo-0008Eu-Hz
	for mharc-qemu-trivial@gnu.org; Tue, 23 Jan 2024 00:50:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rS9fn-0008EV-2h
 for qemu-trivial@nongnu.org; Tue, 23 Jan 2024 00:50:11 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rS9fk-0000MC-20
 for qemu-trivial@nongnu.org; Tue, 23 Jan 2024 00:50:10 -0500
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a277339dcf4so425907166b.2
 for <qemu-trivial@nongnu.org>; Mon, 22 Jan 2024 21:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705989006; x=1706593806; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ppChUoIFvo8a+f8Bqe3rqtKEWQsMJcEIWzXIQbJm984=;
 b=Jqjf9d7WevloQpe94PRvDl9A40G0hjXRPH2KTQzSRbXx6PmSOFw17/k1myL+5qaR7d
 n1tEpdpUv3umCzPSGN0O60AVFqMqxQFOH+MHZshTXMHhHCbo6dRN6zMCJATkgeZp9MNa
 iWUQ4GwkpoHedjhg9puktD3Fr0kdmEpk0gZGbIw2J5hi9dCxDyRm69nJ7CEtNwgZHS7l
 GfLtO8/Jy14foOQ9VMrwOz0nfB2LFP0noz9iiZqKwwSMyiDWCQ4q7ZZSmJw++/MX9Ujo
 0mnhm0tosR8MjoZd0o/eP4/3wh/DRL5i508mUDupvK797J1b5KdNhA+Rvx51u+/8IUJV
 ks1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705989006; x=1706593806;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ppChUoIFvo8a+f8Bqe3rqtKEWQsMJcEIWzXIQbJm984=;
 b=kZDHRtV9BQnNnc319y4Ci0zpz0Vh8cm7rma/BmHra/SSzaFcbcxJXONmo7WBojwwAu
 eGbvimlKDo6sVWHI0l63+sg34nRQLYdry3QKXKpHuZTh1OmtCDgk3ucujBkob2cBt4de
 vrlnfgZmysD404WXl8M5vWgjBfwRgy2rCcaO7voyoHt0ANxsVdVch24oefERv/jh+kwM
 b+XCCT+KybK6oY6CMkAvx44TeOE19FOebcxxtWSShZEMLGxcs17HBytRKNcTsgPVutWM
 Dq2MbOTqCc/BtrONjtySolh7YNKH0zHUylqZ8F8PG592Bgv2ktoLzQJZO/+P2RTjrUSJ
 YYWA==
X-Gm-Message-State: AOJu0YxXIPdWylefW0W7GEf08h1VL66zUXQALzKLb1JGogsnSVQStSQW
 ioM9ekEVLPPeoAIsnbRGY/i+z4y8cumdAZTpx8KTYSdMOrOPwIbWdLod9uRRXjA=
X-Google-Smtp-Source: AGHT+IG+6b89cpImxJmrOaW3MVd6rnk2CHr3D6NgKu6BSXm1UL0OTRD6ED9+t9IyEaeYbLmjH6fNCA==
X-Received: by 2002:a17:907:7008:b0:a29:51ca:9df with SMTP id
 wr8-20020a170907700800b00a2951ca09dfmr2170014ejb.148.1705989006144; 
 Mon, 22 Jan 2024 21:50:06 -0800 (PST)
Received: from [192.168.69.100] ([176.187.194.78])
 by smtp.gmail.com with ESMTPSA id
 th7-20020a1709078e0700b00a2fd84bc421sm3224500ejc.83.2024.01.22.21.50.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jan 2024 21:50:05 -0800 (PST)
Message-ID: <17bd56cb-8e29-47e8-939e-af5dfca55138@linaro.org>
Date: Tue, 23 Jan 2024 06:50:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] util/uri: Remove unused macros ISA_RESERVED() and
 ISA_GEN_DELIM()
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Stefan Weil <sw@weilnetz.de>, qemu-trivial@nongnu.org
References: <20240122191753.103118-1-thuth@redhat.com>
 <20240122191753.103118-6-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240122191753.103118-6-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 23 Jan 2024 05:50:11 -0000

On 22/1/24 20:17, Thomas Huth wrote:
> They are not used anywhere, so there's no need to keep them around.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   util/uri.c | 13 -------------
>   1 file changed, 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

(could be reordered as patch 1 to clarify it is not
  an effect of the uri_string_foo() cleanups)

