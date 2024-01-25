Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rSzAu-00089G-LU
	for mharc-qemu-trivial@gnu.org; Thu, 25 Jan 2024 07:49:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rSzAr-00088p-0K
 for qemu-trivial@nongnu.org; Thu, 25 Jan 2024 07:49:41 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rSzAn-0000aZ-OD
 for qemu-trivial@nongnu.org; Thu, 25 Jan 2024 07:49:40 -0500
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-55c1ac8d2f2so5823846a12.2
 for <qemu-trivial@nongnu.org>; Thu, 25 Jan 2024 04:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706186973; x=1706791773; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MGRoQROCc47nZ6NgFMBEtB+Bm2iE7zSPMm7VFK+t52k=;
 b=rjewQg29m3K+A2d816jZ8F1FykJ1Odo3LJTrPyNNcMfaWKorSm8dnND2MaBekB3p3Z
 9KUVaGBxLZ0MoHQKMmme+rYPP/7F4lDRC48k+KZL0bULdwQsUNOCIZORa5XHiwowG32l
 ROt6U3otYIWmKBClrKr9EBMowU669LUDZpqCduiAKZQGPyC5Y2evLwZBg5BrLmilfkOW
 Q2A0X5XF3YSXP+UBmMTzhc+q38eUmj/vkrXbFrWRiX9M3ABLbr36y6nzoYZ4tmSgsE5g
 I+JvxVOogTSrq9KsDOiCdrmzUinttjsKKkOQX8NwHb28brD8iWIcGIQxPZzUWw0UEefb
 AiSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706186973; x=1706791773;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MGRoQROCc47nZ6NgFMBEtB+Bm2iE7zSPMm7VFK+t52k=;
 b=cLe2lYkNLW63sMNvp6HNcwIrec0H12074iCRU3sgaViqAswUwiAtGG1KgrGgMzJBKq
 29ToZE+e48SKtm1kgZJvkFI0h9I6cZSQ1aoQO2aMn7IJQbxdPxaVJ+RG4Z7LaQhaJt2f
 zYksbPDFRWW9SZU4omMfV+SQbVe3lriOrA7w80pZFHGFrydGJ2wC0Gj6VqLSLV1okdc7
 1V6j5jwT5vhVGW33iG2MTOU/n4Vorrlu3oqlp/gh2KUonXICDqZ3wTTIAKmVl0p1LcvM
 mLlKSX45e8KNORD5algAdrTVe/zw/46/xmqP6ZRWiFUrEz42CWc0nB+SCXKalV8DGcWB
 iobQ==
X-Gm-Message-State: AOJu0YxEXJp4drtsa5aiWxUGB2oejbfKkh0HCmNx9HW6/3oZK3gPL1dc
 xCUjyTIncp2/1Lnm9LYAyKxzEGlpbxlkgO6HFJ2Uv0I66UfzI0UzbSmCF7Ud2cWLCStm6oK8M/E
 6hUvire7MlUW1CGnYYVx2OGy0zl/4NSNprnr2Tw==
X-Google-Smtp-Source: AGHT+IFxSmxrU+wV2epbWdcy9Glp2j+O/LjX2T5JPTh6clIyVn64vBckcuqd+IhT1PzdS7q5ae0zLO5gJrvJA4NgTaY=
X-Received: by 2002:a50:ab52:0:b0:55c:6283:3a95 with SMTP id
 t18-20020a50ab52000000b0055c62833a95mr643354edc.64.1706186972699; Thu, 25 Jan
 2024 04:49:32 -0800 (PST)
MIME-Version: 1.0
References: <20240122211215.95073-1-gustavo.romero@linaro.org>
In-Reply-To: <20240122211215.95073-1-gustavo.romero@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jan 2024 12:49:21 +0000
Message-ID: <CAFEAcA_-tW7god6zhhBW3J_CmBpFARgnysphM7yi5h=9S4a4HA@mail.gmail.com>
Subject: Re: [PATCH v2] docs/system/arm/virt.rst: Add note on CPU features off
 by default
To: Gustavo Romero <gustavo.romero@linaro.org>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, philmd@linaro.org, 
 alex.bennee@linaro.org, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
X-List-Received-Date: Thu, 25 Jan 2024 12:49:41 -0000

On Mon, 22 Jan 2024 at 21:12, Gustavo Romero <gustavo.romero@linaro.org> wrote:
>
> Add a note on CPU features that are off by default in `virt` machines.
> Some CPU features will remain off even if a CPU-capable CPU (e.g.,
> `-cpu max`) is selected because they require support in both the CPU
> itself and in the wider system. Therefore, the user, besides selecting a
> CPU that supports such features, must also turn on the feature using a
> machine option.
>
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>

Applied to target-arm.next, thanks.

-- PMM

