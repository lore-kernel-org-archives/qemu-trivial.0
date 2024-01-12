Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rOM0A-000782-Sb
	for mharc-qemu-trivial@gnu.org; Fri, 12 Jan 2024 13:11:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rOM08-00076m-Ei
 for qemu-trivial@nongnu.org; Fri, 12 Jan 2024 13:11:28 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rOM02-00005i-Aq
 for qemu-trivial@nongnu.org; Fri, 12 Jan 2024 13:11:28 -0500
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5578485fc0eso5682940a12.1
 for <qemu-trivial@nongnu.org>; Fri, 12 Jan 2024 10:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705083079; x=1705687879; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LKtUr/7STRBwMZoeQOGBBYdccXoYytjWxVzBHAyGtAc=;
 b=DSDyKJBXRBE8A2AD70PaVMX6jQ4JpvRmBZzK+SlwwB0+wK0aFCkwxSN/QqCQZe9EKI
 xAAMW/1jGHrTtWzxLgNNoQv85YLcRSPYXNVoIFK2NBSnLgw+M1mhMWIzD4OvbZlfDoW6
 32uNa/MPo5wVIY5q4rAwskCVo0jndKAw3vct/dEgB0WZ9irLMWXve2BFMKPz/+pcTZmq
 a2XaFZBXk/XVV9h53taYDqYRcIgFcjUflaXCDEEq0mAbyZXLgVKot2COPyUgUPl/R46X
 hFW7bKfuuI7MvMhqFZm9ucSO1ZlFS0e2BnyHJVVLNjFj8UdfHe7K8h07ZKAImZAIrR4Q
 /Qhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705083079; x=1705687879;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LKtUr/7STRBwMZoeQOGBBYdccXoYytjWxVzBHAyGtAc=;
 b=Rw5/z4UOi8dDhsRfguLmKGTN/qTnEqPmXJ1B3Y4VFZ3ZFD/PGi2QKxWnJn305pW/+z
 Rzm1NaB+2gifiKfcjIDovYSxWKi1TFm6zFbNN4tafoXIdEOEMUZDvnyXIUJE5rN3X8Mw
 KZlWlW3Y2IR8q8RSBc5XZZkvazG/9x5S80VaXojISk/YifquKHv23QAgMZwsgntGAhTj
 A7SORKJr27hq1CNFKaMDfpV6n/l30psUWiGGaxUpsqfzvzOCrAYqw4BwP6WFmqRlDRnG
 ozvMHK4fJ7QheLjb2umsNhd75+kRqjLQpM23rj0CgaKrvtcgep3G7dL+Y3a491vjpuOD
 ClBg==
X-Gm-Message-State: AOJu0YyQpYyRVU0WymgHLiimnMUbPOq6B+qL3bg+P5JkjXW1wWGgTPUd
 d9PYArA7svo/6HIr+fga1Gk1q1xC4Vq0UB4J8X040IuOCVo2Ag==
X-Google-Smtp-Source: AGHT+IFAH7FzwboCnyhmmwz5FMl0PiPxymIWY74/PaXzqVPgjQJtMOY+Evw7ecTEMz8ebM4Crv0Gk9TSjOGjMgAceR8=
X-Received: by 2002:a05:6402:64d:b0:558:b930:cbf1 with SMTP id
 u13-20020a056402064d00b00558b930cbf1mr1095814edx.51.1705083079181; Fri, 12
 Jan 2024 10:11:19 -0800 (PST)
MIME-Version: 1.0
References: <20240109184508.3189599-1-sam@rfc1149.net>
In-Reply-To: <20240109184508.3189599-1-sam@rfc1149.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Jan 2024 18:11:07 +0000
Message-ID: <CAFEAcA9sw9VW7Yw-KPrM=TRy2weTNsnyDxn8E6qcWgQagUVXdA@mail.gmail.com>
Subject: Re: [PATCH] hw/timer: fix systick trace message
To: Samuel Tardieu <sam@rfc1149.net>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
X-List-Received-Date: Fri, 12 Jan 2024 18:11:28 -0000

On Tue, 9 Jan 2024 at 18:45, Samuel Tardieu <sam@rfc1149.net> wrote:
>
> Signed-off-by: Samuel Tardieu <sam@rfc1149.net>
> Fixes: ff68dacbc786 ("armv7m: Split systick out from NVIC")
> ---
>  hw/timer/trace-events | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>



Applied to target-arm.next, thanks.

-- PMM

