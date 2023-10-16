Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qsQQX-000194-BC
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2023 12:26:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qsQQV-00018A-B2
 for qemu-trivial@nongnu.org; Mon, 16 Oct 2023 12:26:43 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qsQQS-0000Ak-Uu
 for qemu-trivial@nongnu.org; Mon, 16 Oct 2023 12:26:43 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-53db3811d8fso9762218a12.1
 for <qemu-trivial@nongnu.org>; Mon, 16 Oct 2023 09:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697473599; x=1698078399; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3KXegPJz+GGOTIta3r6kQb9Lp4pQ77rh9DVgDUgNd+I=;
 b=IWbuOqwjcvxf5uHVa4v/xwBmaceMNtLHZfAR8tjWXlF7o2dh5V8pnNj9Q3JQMLKIoo
 OKV7Y6bvRhnB9VfTF7ngzROruB9hddFeihTnpVYj0Fdc8no3HDDCTdFKSAd7BWVZ+65o
 46uqz+uLcIpcqJBIBoWWKRP5f3/tH0Z19CPU2mPiTHbwpFWB8QZAMB2UJUFtGOYs/axF
 GAiQbRTD4+kL/F/HgWfwBVA9fNJtiXrnINbNVHnmmSQyLdfKgwN7HueQS9v1tq3Frl6i
 fDP8ozx6s5EmfVDwsz2JYPFJtmNxSePw8XRA04ZRm+WKwcPlTxkGBHIA3G7m38dzZ62q
 GLPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697473599; x=1698078399;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3KXegPJz+GGOTIta3r6kQb9Lp4pQ77rh9DVgDUgNd+I=;
 b=oIWIeq8ISv/vo4nT8mpKqvWbxFAHKFNEzEopmsH55ICvt9QIZCOzWfTtfBpUwtW9ys
 8dSeW/I2d1t0HnUG7oGUUA129DlmIJmXNzwVbfnBXlMsNLkQDm4StLY7FwHLTAcXJcRS
 hSI47k43CoWji5xTjFgma7rlV9TFnucNMR4hH7IVIn5tVZKAkqPwH3ul7Gi8V0X4S9mK
 Iw67JH5Jqr+v/GSAscS+UmAaYTQEiisewDKxNODPEZuFeH2ZfGljS6ccXD5Wx4n/cKFH
 8qu0brQzxUvwHQ5m2h3e7uJMmHz/fubW9BvJruPaEGj98jzRKw1bPN4es6BKqKsXQFbO
 M1+w==
X-Gm-Message-State: AOJu0YyAT805plXZTTNaaDwKqvTqrTl4pcMDdgmTXB0reYwIE3xGsx+l
 YHa5A8ngIqWmksIMgELRF/RlsRRWY4ID0ouw9V5yng==
X-Google-Smtp-Source: AGHT+IEcZyeF/QfkMhPOY6TPOOJP+ZymI5DcvWJ0JoIhJ7+VxUDNI+eeWvpcSXkMSw3omOYPXHvdFfZRXxi67nwnoQY=
X-Received: by 2002:a50:c8ca:0:b0:530:ec02:babd with SMTP id
 k10-20020a50c8ca000000b00530ec02babdmr6868429edh.9.1697473599226; Mon, 16 Oct
 2023 09:26:39 -0700 (PDT)
MIME-Version: 1.0
References: <20231012073458.860187-1-thuth@redhat.com>
In-Reply-To: <20231012073458.860187-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Oct 2023 17:26:28 +0100
Message-ID: <CAFEAcA8Kg_nAQPwvb800UbRcHB1qQ6DYogbm62SuSy=0tZC22Q@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: Move raspberrypi-fw-defs.h to the include/hw/arm/
 folder
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-arm@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 16 Oct 2023 16:26:43 -0000

On Thu, 12 Oct 2023 at 08:35, Thomas Huth <thuth@redhat.com> wrote:
>
> The file is obviously related to the raspberrypi machine, so
> it should reside in hw/arm/ instead of hw/misc/. And while we're
> at it, also adjust the wildcard in MAINTAINERS so that it covers
> this file, too.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>



Applied to target-arm.next, thanks.

-- PMM

