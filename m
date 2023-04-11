Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmB2A-0006jX-5W
	for mharc-qemu-trivial@gnu.org; Tue, 11 Apr 2023 06:15:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmB28-0006jG-TU
 for qemu-trivial@nongnu.org; Tue, 11 Apr 2023 06:15:28 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmB27-0004Kq-0g
 for qemu-trivial@nongnu.org; Tue, 11 Apr 2023 06:15:28 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 hg25-20020a05600c539900b003f05a99a841so11896339wmb.3
 for <qemu-trivial@nongnu.org>; Tue, 11 Apr 2023 03:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681208125;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O2XlqKXTumRHX50ynRDn7fmoklyLigV/ia8Z+fh4nYY=;
 b=mjkzjaJRaaXd7P6C1FNbl7LFfeaxMMoy/mS1qbRaZxEtfd31B1c23rlDq0BCfo4WM+
 2OnRO+Ju7X8gsYPvzYGmnfy0m3vDy/RAC6hCom964WNO9E51bpKCeiI8+umtPGY+OQZK
 gquKuRMjbWUdLgRFz3KKxdXtmL4rAJvG/dUG+cbrF0CDwnBoX01dyensyudrmygIE7CZ
 2jqfxFavjHRgtNH1W1ctlg/ixR3mVFZieu39pu1UpPH1/1tsaP7T+68LK9sTCs0sLVhb
 8I0a7/0g4v1aHyPamNokdmcRfcIippVcOKkmRWlTLDqwonay47LjD04MjhmCdrY1mdUo
 r+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681208125;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O2XlqKXTumRHX50ynRDn7fmoklyLigV/ia8Z+fh4nYY=;
 b=dJDboP5CJaMzLwzJJI1uHYdNVhz1Q4ZRBsKNalm2OISMZ/fd+TsoAkXS097xvUQlte
 o3nFzHFVP3Fq5bandOIKeftqp0PtKPGJtk5luYJVWLaqzNJ8vXXK74ZokIQz+CTs530n
 Hv8TVXm6n+ic6OfoB1MWs140W2QKHPQH85mJqCFqTaLyGnDMhJjCW0CvVvUzNfDtAmCt
 htvjn/YiRiCPagWtDFLKfzhLYMcSL4WlluuKeUbAr52h/7ZQTKOBayMD03SIl90MF9OO
 /iOcQ9oi2ZQ5JgOQ6foL2nz+kTt8jTrz4Zme5QnzhtSimnu0sfU1G+iPDYB2IE5I/ocq
 lU+w==
X-Gm-Message-State: AAQBX9eqhMWADYR6on+XQ0RPV4v3gW2ioWQDyq50rKX0EzkwDoUxZPAn
 4j70n+Rj6BR6+YcKQwiK8edGGw==
X-Google-Smtp-Source: AKy350ZGUoQgg8rub+anz0Z58g/NjOTJxuwJrDQwrhurPIP1+Xlgi4eMKt/VlypjR2AnPZVQhjOayw==
X-Received: by 2002:a1c:7410:0:b0:3ea:ed4d:38f6 with SMTP id
 p16-20020a1c7410000000b003eaed4d38f6mr9044973wmc.4.1681208125441; 
 Tue, 11 Apr 2023 03:15:25 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.195.239])
 by smtp.gmail.com with ESMTPSA id
 l20-20020a7bc454000000b003ed1f111fdesm16365601wmi.20.2023.04.11.03.15.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 03:15:25 -0700 (PDT)
Message-ID: <7c306978-4236-4766-2d77-ad7008583b90@linaro.org>
Date: Tue, 11 Apr 2023 12:15:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH for-8.0] docs: Fix typo (wphx => whpx)
Content-Language: en-US
To: Stefan Weil <sw@weilnetz.de>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20230409201007.1157671-1-sw@weilnetz.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230409201007.1157671-1-sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.246,
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
X-List-Received-Date: Tue, 11 Apr 2023 10:15:29 -0000

On 9/4/23 22:10, Stefan Weil via wrote:
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1529
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> 
> I suggest to apply the patch for 8.0 because it fixes documentation.
> 
> Regards
> Stefan W.
> 
>   docs/system/introduction.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



