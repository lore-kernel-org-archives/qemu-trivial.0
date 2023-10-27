Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qwMCm-0007Ee-Er
	for mharc-qemu-trivial@gnu.org; Fri, 27 Oct 2023 08:44:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qwGDY-0004jH-Mt
 for qemu-trivial@nongnu.org; Fri, 27 Oct 2023 02:21:12 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qwGDX-0004kB-54
 for qemu-trivial@nongnu.org; Fri, 27 Oct 2023 02:21:12 -0400
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-508126afb9bso2378360e87.0
 for <qemu-trivial@nongnu.org>; Thu, 26 Oct 2023 23:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698387668; x=1698992468; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=fWiot1xxhS30niO6atC+EfWIbbTfv5hFa4dJhCJq2rs=;
 b=E13SNPQfCbhwBWuCwkyXjBHBkSo2UZ0i1+8QdnQtWEIWHtanIeqyirxx0auZR+PfRB
 P2kp1aKHmzuXFM72bVu/hA2hEwxTlIG4XvMZL7KRQE2JO1GjIyzffChtv6LkQkmPuSTT
 7huZod/w9xYBFszWOIERvKcv54tEQQuKBKtfmtFvIxdAq4j8C2u/xKcHcy0bTCBbxNzo
 eFa0pw4iCOJZV9ADOT/5eKrYAPAv7xgdr9NBjrMDRbOYQZMNa5Flm3PukHN9M73eo4AE
 Axf91XDtyEm9jO7DTPUfyYk7OM5vj/ks/wEW6W83IlJLMaeTWtA3ccm/ovmidx/LfC39
 B8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698387668; x=1698992468;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fWiot1xxhS30niO6atC+EfWIbbTfv5hFa4dJhCJq2rs=;
 b=ryfjkZUCP7t/fD2zKO8YfZq9ABn06Z6yY7Sh7JbdhmzwM8ZL1QwXYnON9AE45l7XjP
 mzdMQGFUaKzy8iv19yRJS3ciiduGWQZJNc/IitcEHbIri1pa5AJwuEB1SjBL78Q+oJE1
 eSo1nDr3lmaT1p9QcNRN3iAMttPtIaL6ucm8MFIa2HUS8jrzjbaXm8OoBW4X8ufI7Gkp
 lNWTPD8D6EveOs+nyTiF9u/s9Y7aQ3TorRyP+Sk9Z5tYQBAWl4Fy+4Lf+gHmYuG9dGgq
 KC4B4e+k7KQsPRbHGHB6mxybnWOD25fj53YtWq87QeLEPDdc5ZtN/EnovJgCEpVRLkgE
 fu1w==
X-Gm-Message-State: AOJu0YxLMV6K8V3wXa6zpHgTCkVuwkcMRD9aOfolaMiHyi6jnb7bNuJD
 CHyHwn61NNGCRicsgKAOlDLjzQ==
X-Google-Smtp-Source: AGHT+IHAJe2ua7nhLWFRobxwuxA5Ea9jKVaWBpC0EOc6jpmifbw021zviHsn8lkN3Vbr5qsFENpxrg==
X-Received: by 2002:ac2:4ac1:0:b0:507:a58f:79b0 with SMTP id
 m1-20020ac24ac1000000b00507a58f79b0mr935937lfp.9.1698387668144; 
 Thu, 26 Oct 2023 23:21:08 -0700 (PDT)
Received: from meli.delivery (adsl-141.37.6.2.tellas.gr. [37.6.2.141])
 by smtp.gmail.com with ESMTPSA id
 z9-20020a5d44c9000000b0032d9caeab0fsm1013790wrr.77.2023.10.26.23.21.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 26 Oct 2023 23:21:07 -0700 (PDT)
Date: Fri, 27 Oct 2023 09:20:36 +0300
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-trivial@nongnu.org
Bcc: 
Subject: Re: [PATCH] MAINTAINERS: Add the virtio-gpu documentation to the
 corresponding section
User-Agent: meli 0.8.2
References: <20231027060808.242442-1-thuth@redhat.com>
In-Reply-To: <20231027060808.242442-1-thuth@redhat.com>
Message-ID: <36cb5.zjk9zvxmauvb@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 27 Oct 2023 08:44:46 -0400
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
X-List-Received-Date: Fri, 27 Oct 2023 06:21:12 -0000

On Fri, 27 Oct 2023 09:08, Thomas Huth <thuth@redhat.com> wrote:
>Add virtio-gpu.rst to the corresponding section in MAINTAINERS, so that
>the maintainers gets CC:-ed on corresponding patches.
>
>Signed-off-by: Thomas Huth <thuth@redhat.com>
>---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

