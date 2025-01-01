Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tSu4r-0004yQ-2i
	for mharc-qemu-trivial@gnu.org; Wed, 01 Jan 2025 03:27:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu-daude@linaro.org>)
 id 1tSu4o-0004xy-NM
 for qemu-trivial@nongnu.org; Wed, 01 Jan 2025 03:27:38 -0500
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu-daude@linaro.org>)
 id 1tSu4m-0008Rw-Qo
 for qemu-trivial@nongnu.org; Wed, 01 Jan 2025 03:27:38 -0500
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-844e7bc6d84so413062239f.0
 for <qemu-trivial@nongnu.org>; Wed, 01 Jan 2025 00:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735720052; x=1736324852; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JofWtTiVqY3SaUL2gFQrvmITFhENuwDZsUsjHp+yfH4=;
 b=deBNYn9pbbOdsYLkXlI3KL0rxDJWMbY/2s4O078mZUOYlsNk8H9ceW3IqcS3y/j3b1
 SpFSv3GNiFylmoqiqPsyA7Ha1cBjLro2w3/8THfFgpsl0Mc5lHMhAoFRW5J348xD54Bn
 WoXH2E9T6oBuuof7BygiYexhThM+cn4rygthdi94A3x9CMkRAyTPu1l5gL2Db9VPrfoQ
 UR7x75nfgwHa/+P3ND2Podk3w46AUcWJu/vazyRErcnqSfEEQ5k2aGZo3gAOlDgirFcX
 J9GruCHuffezED8kBqBw8+Ad48GfmMf0QYQGfX4O0urMf5sddZxg5mMcns5/qYZlxcYZ
 leQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735720052; x=1736324852;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JofWtTiVqY3SaUL2gFQrvmITFhENuwDZsUsjHp+yfH4=;
 b=ii5UPIkCbmo8F7BzniUda4QqPj+uKC5enpvnAg7H8ridYLh8mNXKY7JKT9wC19XU1d
 eV+tfLoXvx/27BBNlmgWjzMAdAD2jQRovNZNtMF3D0b2XcCZe5hCoVyHBqirPJGfPGh2
 zcdOfR0kET8lcR0DV9OMVT0WsDpyRUKVYl5QrRqwPCANgMf8V3rGyB36sKK+UtkowG/1
 TsU7RoleRyGe97MgbEVaRnNZDiWug0+jyprBYHB/M0TUogPkkgHQI8Fj6SEciDFraSqU
 6jXtGV/yZ02MSN3Le03NUNLgW9KimPoCY1N/X7RfofQNUDPYOzW2sv0h7xJ8P0m8KUzC
 QTSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWD+yTEioh5bFKuiYZ6CDHJZSHme2Ynf2LOvRKtpQthCc75B4y+d0YiWYQt1PALvM2YpuA1ZaROe7Tfy2M=@nongnu.org
X-Gm-Message-State: AOJu0Yx5lEoEcqLtRX/zK7fdPV87rGJSl7+a283hJBd5xY8Kiiym50PT
 4zdGUuYbfuw/yxw4eZ+FBQNf5mToX3fRFg0tgQf1mGjMPSCNYXCe7KBw+HTRDQO2U5d48oo8+KV
 Bu+Kc4QxyrH7OuUdleIo8t7N5m06+brHwYqqprg==
X-Gm-Gg: ASbGncs4Jyb+Jm4NiZFZYK3tMAW5yUxW0BavmaJbdqU+feQPLX2p8r6KCrxBM5uDuQP
 xvdTQ7ydSQUyhA74SYiE7+DGEgb6sniZFvapCcQ==
X-Google-Smtp-Source: AGHT+IEX8NBHkp1Ul4rcpdZlX4/ewP9EamOj1IM9v/ngOVlq5bwo6hd3hQXpRPba3BdklP091TvKRGZzYmIeCjrApeY=
X-Received: by 2002:a5e:cb42:0:b0:835:3dfc:5ba5 with SMTP id
 ca18e2360f4ac-84988735634mr3440203839f.5.1735720052208; Wed, 01 Jan 2025
 00:27:32 -0800 (PST)
MIME-Version: 1.0
References: <20250101081555.1050736-1-anisinha@redhat.com>
In-Reply-To: <20250101081555.1050736-1-anisinha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Date: Wed, 1 Jan 2025 09:27:21 +0100
Message-ID: <CAPMQPEL=sEp-e9NR2FKU6DnnfYdYHY2Z-ymDRtyGgwj2i5Ge7g@mail.gmail.com>
Subject: Re: [PATCH] qtest/fw-cfg: remove compiled out code
To: Ani Sinha <anisinha@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=philippe.mathieu-daude@linaro.org; helo=mail-io1-xd34.google.com
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
X-List-Received-Date: Wed, 01 Jan 2025 08:27:38 -0000

On Wed, 1 Jan 2025 at 09:16, Ani Sinha <anisinha@redhat.com> wrote:
>
> Remove code that is already compiled out. This prevents confusion.
>
> CC: qemu-trivial@nongnu.org
> Signed-off-by: Ani Sinha <anisinha@redhat.com>
> ---
>  tests/qtest/fw_cfg-test.c | 6 ------
>  1 file changed, 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

