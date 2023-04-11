Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm2Wl-0005lL-Nr
	for mharc-qemu-trivial@gnu.org; Mon, 10 Apr 2023 21:10:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Wg-0005Dn-Km
 for qemu-trivial@nongnu.org; Mon, 10 Apr 2023 21:10:26 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Wa-0001vl-3J
 for qemu-trivial@nongnu.org; Mon, 10 Apr 2023 21:10:26 -0400
Received: by mail-pl1-x630.google.com with SMTP id e13so5961983plc.12
 for <qemu-trivial@nongnu.org>; Mon, 10 Apr 2023 18:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175419;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pXtetf33qyfhbssVaDswQlius4X/x22Nwb3Q2Sf+vIo=;
 b=YaWnjSUjF1FF8bqodXG16+9rAz257K0x2UdD240WM05I3A749rYNZtjnaGHBairwEZ
 hPIRGMV/yVXnIV6aM9gXo2bqsDJ5zubf6gsOu7uOObtV6//pTZ2s3W6VhrrUp31j8W16
 6r2wrztNT5xRBFx8kWpU2mQOIVqOT/t8LHMBoFXxKQO2ugFIqdGXy/zPawux3tM4wr/z
 nXXqjx1IEWRNl0mDW7IrtrXYfQIzxbaGHJROHm7jbcE+JOjxxss5MVzOQocHv7CNThPr
 tgxP8spL20crCx/BAC5t9jhfcZLUc08bTcPDVujElyL/6kcv0bWP2a718hn1D4QuCHI6
 vXQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175419;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pXtetf33qyfhbssVaDswQlius4X/x22Nwb3Q2Sf+vIo=;
 b=XPiKbIsUmsLVmDu48jU5M7uZKvsCLdM94aafOdqWrVML/kZi/XQlu6zq5WGJQAw9a/
 nw+jjFlUuyJzEJj2iAasHLDq3q4xJ8Pqmshg+K2yPBycbZVPBODZZdTpvDznYxyLtMCH
 yZQvvu2v6jrQDOSuiUOXJSXgyaN8MaajeCJFnOW2dryza3eouAAgi/3UK3TGqJ3+qx8Z
 lKa+lczf4xddi5G4IGkUTJSWjivi/KYs/rtMj06/SBGReZmC5fuUbSOMV1Vb9vSE/8bE
 MSUi0ADiMrtsvd8X8tRZjf1zxG61/U8snI4m3cfXbmUKAK2BSWlTm+AjjMtlR/g4tOAA
 giuw==
X-Gm-Message-State: AAQBX9fyJgtLeaReenepCe1u7Y5eqrm289SVDiXoLAUlqCMVShQk51G3
 NzPSe1dlhfQsB0fGshicJUhqHw==
X-Google-Smtp-Source: AKy350agRDpF+7xO7PsiTUwcDzg48hnUXPwlE66DxITRVT9JFcnWH/oIsM8v5PN884x3lsy5upSIpA==
X-Received: by 2002:a05:6a20:ba8a:b0:ea:eb3f:4c48 with SMTP id
 fb10-20020a056a20ba8a00b000eaeb3f4c48mr1469730pzb.37.1681175418901; 
 Mon, 10 Apr 2023 18:10:18 -0700 (PDT)
Received: from [10.1.0.142] (h146.238.133.40.static.ip.windstream.net.
 [40.133.238.146]) by smtp.gmail.com with ESMTPSA id
 q24-20020a63d618000000b00502e20b4777sm7474906pgg.9.2023.04.10.18.10.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Apr 2023 18:10:18 -0700 (PDT)
Message-ID: <033a3059-221b-a963-4501-0ce0fdf8706f@linaro.org>
Date: Mon, 10 Apr 2023 18:10:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH for-8.0] docs: Fix typo (wphx => whpx)
To: Stefan Weil <sw@weilnetz.de>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Thomas Huth <thuth@redhat.com>
References: <20230409201007.1157671-1-sw@weilnetz.de>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230409201007.1157671-1-sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
X-List-Received-Date: Tue, 11 Apr 2023 01:10:27 -0000

On 4/9/23 13:10, Stefan Weil wrote:
> Resolves:https://gitlab.com/qemu-project/qemu/-/issues/1529
> Signed-off-by: Stefan Weil<sw@weilnetz.de>
> ---
> 
> I suggest to apply the patch for 8.0 because it fixes documentation.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

