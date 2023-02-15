Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSLep-0001V7-2j
	for mharc-qemu-trivial@gnu.org; Wed, 15 Feb 2023 12:33:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pSLeo-0001Un-7T
 for qemu-trivial@nongnu.org; Wed, 15 Feb 2023 12:33:26 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pSLem-0000OI-0D
 for qemu-trivial@nongnu.org; Wed, 15 Feb 2023 12:33:25 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 m20-20020a05600c3b1400b003e1e754657aso2161477wms.2
 for <qemu-trivial@nongnu.org>; Wed, 15 Feb 2023 09:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rdXwoM4rN1Ecq8SNcp05ArQ5wGy+n+9qKC2Z2MK2rKA=;
 b=PMd0xhCML+hpv/JeQWJvZgW7dQN1Vfl+oB8YUQ0hR728VWOyIcCnN2Mw/p+pkWgvnz
 aZNJXDc6+7aI1n/yBG4Pwgs2Xkk/V8fDyVMJ8dAknZ4RjGdRYs8b1s5vtbx3g+99IVSG
 vY1t60MztC4OBHA3nyrPHdBRs/ZrqCflxaRuxEmUfUG2Qkh876KOUbYn/IOzJvQBZGAo
 WGISrveJfvsI0i+8z3LQdF9zNwaQVNUqaHWLTXuBSrqq6Pj772gi3lkNE2ZVnKS2TtHF
 qReKVBXkkiKEoH4MLG7VmXOpYQ/zS1UaCE5kTqd/lMn8rdHRirhuWO0nSr68WNu6XI4/
 xyxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rdXwoM4rN1Ecq8SNcp05ArQ5wGy+n+9qKC2Z2MK2rKA=;
 b=wWhxdQin1Hd9Ho68QXvZ01rlMoV1Ga67pAZd/LIT+b58DX+rcbsu1n4BAreTUtX+9l
 DzoQ/kjuOcMXhXye0YOHvW19A3NOZV6IFgkSP+zZNN+JV5LuNRkVNPJAM+Vfyvl3vYL3
 +qc4aTZqp9XkGoreyVSgY0/O69LAnD67lxb4nYfZrd6yo+wODxXax9IwRbK/BZ9SAktC
 n90XJgi/01J7FZF8gYnjzjPSPgEOV8SFkiymFjRwkGXNnz4zIbRTBI3u7u2CGc2DzqCP
 sny+j4lRXCsXkb9XnweMLUyW6eLvGf/glzfIf0ZergYyYphnUv5h6PfAXRiNdksvLraM
 BQYA==
X-Gm-Message-State: AO0yUKUPB+ojM5M3pLVHcKD56n7Ns4+MoO/Ly28dmXZpfrohNdeEwyPH
 BsmVfSexX0KHpNWL36J95b7VcQ==
X-Google-Smtp-Source: AK7set8XgeIzlPnRPSUPfXxOZxksN0/ZTYdsH4aXKvwBkDiW/byF0BPAF5HGV2JxnQssP4G8DuMZWA==
X-Received: by 2002:a05:600c:4d22:b0:3d9:f769:2115 with SMTP id
 u34-20020a05600c4d2200b003d9f7692115mr2514031wmp.26.1676482402064; 
 Wed, 15 Feb 2023 09:33:22 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 r19-20020a05600c459300b003dc47d458cdsm3088261wmo.15.2023.02.15.09.33.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 09:33:21 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5D4F01FFB7;
 Wed, 15 Feb 2023 17:33:21 +0000 (GMT)
References: <20230215152233.210024-1-thuth@redhat.com>
User-agent: mu4e 1.9.20; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, Beniamino
 Galvani <b.galvani@gmail.com>, Strahinja Jankovic
 <strahinja.p.jankovic@gmail.com>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] include/hw/arm/allwinner-a10.h: Remove superfluous
 includes from the header
Date: Wed, 15 Feb 2023 17:33:17 +0000
In-reply-to: <20230215152233.210024-1-thuth@redhat.com>
Message-ID: <87wn4i96la.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
X-List-Received-Date: Wed, 15 Feb 2023 17:33:26 -0000


Thomas Huth <thuth@redhat.com> writes:

> pci_device.h is not needed at all in allwinner-a10.h, and serial.h
> is only needed by the corresponding .c file.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

