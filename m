Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rWzdG-00062C-UB
	for mharc-qemu-trivial@gnu.org; Mon, 05 Feb 2024 09:07:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rWzdF-00060P-53
 for qemu-trivial@nongnu.org; Mon, 05 Feb 2024 09:07:33 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rWzdB-0002Il-V8
 for qemu-trivial@nongnu.org; Mon, 05 Feb 2024 09:07:32 -0500
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a37f3443843so40672966b.2
 for <qemu-trivial@nongnu.org>; Mon, 05 Feb 2024 06:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707142048; x=1707746848; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XL4FkiVzcCb6jLsEkH2g910NS2diJajmiayka3Qf6Zc=;
 b=Zz7qBipBxX4kpMFtyZql7atst6/wLCSlcAEU7Uo4AVDVAcXBmAy/o9ZhDC+8H33/7T
 RDHFKwNlekxlfPMHYRFV4xO+Al4a+o8j5y0jLODsHQb0D96rCrXyEDc+7VfKOWOq+CFL
 bXPolS2FtaJBxTuEqlXtbvJFaeD6kgH1Vp9HBauBW7PuZPXRGE/OTeBRlXOWT5yD/Fyj
 KkawP1c4Zg4X2OzkkI1lSIg2yOZx8MFVInKURUN5lbWV8TFfOUo3i2UwtDXPLo2MJvxy
 4Y6v+Kt0gn+IDEsjiT2dFcb5PEJ8xaOCzUVn9JxXULl/z1KjWsimmwu47hIKKL0wbiJA
 FBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707142048; x=1707746848;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XL4FkiVzcCb6jLsEkH2g910NS2diJajmiayka3Qf6Zc=;
 b=NAc22WYldszHkhZIYKkfIsjn5qgPLuUo+YRrGR5ffKzgea6zOmj97Tj9spaJIQvyw5
 BMWYRuP1J0d2EtsE2tRcCJRIbInMQueHY3WDUSPFp+jWTLnbNok+vFwlao7Dkh/iUA03
 F0RvoE2if7p78EUFmBXPdZzdFS0Cmy7qQS4xbdpabD6hDVctHbNGXax8ZGpIRer2rPfa
 DwVFViiIlkR0uDgw3KdHnsTn/vUeOXYxdgGzxVBN1y7Mgiyrl6i7CXkg3u4ldR77BuSt
 a08kfW75Fxr2l8eZsHJpGvWwlckiPYiYIYXGHi9IrcWEP0WsltjfGOG5APB6omzUP4rK
 Y7Xw==
X-Gm-Message-State: AOJu0YySLiKBdIw/tQfqnisS2NU+8jhRrLQ+uDaAYEy1uSFyEmZh3BUi
 jazwH7BI+dT8KXvv2tTemsVkhIJmpDG3J6CPsSTNTZybx0bxJHzCeVM6DUe/dZY=
X-Google-Smtp-Source: AGHT+IH2WRk3dIbcWuG2R/psWBVL94SWtuvkG11KcRG1rwkrEEaeuRzubEiuNiZJdIdUyJ/VCKTmTw==
X-Received: by 2002:a17:906:3bca:b0:a35:aa64:7348 with SMTP id
 v10-20020a1709063bca00b00a35aa647348mr6876198ejf.59.1707142047875; 
 Mon, 05 Feb 2024 06:07:27 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUjGfqYJX2rtO443LDCpTwpXIel2LFP+L14C1fMwgfIznf3JPLaKNkg8eoj0vQ+EvzV/hU8L+7JusMYeZcmpsuyp9iELb4=
Received: from [192.168.197.175] ([92.88.170.125])
 by smtp.gmail.com with ESMTPSA id
 gx23-20020a1709068a5700b00a354bb5f69csm4361595ejc.220.2024.02.05.06.07.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 06:07:26 -0800 (PST)
Message-ID: <d2cfe472-ebbc-442a-861d-8a0e2a04c51b@linaro.org>
Date: Mon, 5 Feb 2024 15:07:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] MAINTAINERS: Cover qapi/ better
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20240205084747.3623569-1-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240205084747.3623569-1-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x630.google.com
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
X-List-Received-Date: Mon, 05 Feb 2024 14:07:33 -0000

On 5/2/24 09:47, Markus Armbruster wrote:
> Markus Armbruster (2):
>    MAINTAINERS: Cover qapi/cxl.json
>    MAINTAINERS: Cover qapi/stats.json

Series:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



