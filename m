Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tOIoH-0006YH-2B
	for mharc-qemu-trivial@gnu.org; Thu, 19 Dec 2024 10:51:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tOIgr-0005wf-GS
 for qemu-trivial@nongnu.org; Thu, 19 Dec 2024 10:43:53 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tOIgp-0005Aa-Sj
 for qemu-trivial@nongnu.org; Thu, 19 Dec 2024 10:43:53 -0500
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5d3ecae02beso1166692a12.0
 for <qemu-trivial@nongnu.org>; Thu, 19 Dec 2024 07:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734623030; x=1735227830; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1qiqib2pInmBFxhkNjD23YIedxQ2hBeSSKw4PWkkq1U=;
 b=SnQ0LGPdqpt6gH9xeMtsS+6NE8sSNDj1E2cvSgMTbiz+PN34gJxW00oOVvH9vZ8VeL
 Xz/kgZ0z2ReY1DkvJ3esjtfZ7xAeop0yZy98B7wywW/PB+y7qPV0Mp8CdF6mo8MeefbD
 NAaFfeNJfDulEazz4OIbw83v98rCTLY9WBONXYnV6MRxvXfwbRf481aGFjxAqfsgmL65
 wI4NsUoiP9R2b5AlLW0fcUoX1ngCN8+mMzheH5DPoHdt/VRTJ4ZM29huF5jH45Vednnf
 qfhc46DSrn4LZOIBFZt+CB9OKCdb31IaTDAJ9mPexEGMzhdc+sbfM5BysMinoPNQleZO
 Zl3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734623030; x=1735227830;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1qiqib2pInmBFxhkNjD23YIedxQ2hBeSSKw4PWkkq1U=;
 b=B+X9e+kDM9WZSGqOsC0jMn260Kp2ght3g2PhArG/yKrwT9AHXZo4zSFTz5kEYMbnV8
 af7zDQ+4mhYYVZ0B37+oulbKNj3yQP1YvIaf9fDKkflOcA5xDqbAahoMJuIK8hH4gPwh
 E1rx/7DXwHCSbZBVTr4I/smRWNim4auwfJiFpduB9BHVuNQLDthCjly5fgwvMFvMWNKk
 cYQ0ovmfXrOkaWOjIXbvoj2xNC/Ay8Fnnq88Qy7Hp/lk8gYlykZHu+l9b+vUNhGTAdhH
 mydhrRlgAHJTKS2mqDi875VeASj2oTM2oCM8+A0ynWookofXfFVGRBTZcsBEg44qPnNv
 jnQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzPCLnaM0MF/k4latOBPwHwhAoQuMmXGvaoMw/wgeJutL4eL99s0bLtG1h7O6BV68ozvif2aKFe4RJtZQ=@nongnu.org
X-Gm-Message-State: AOJu0YyNwzMBNDsUCgLG/HcuGndMncizDCD0cUTr1YSlFCQKh9SZk+kG
 RIdgQbfDfvqaNdOp1ejwyECTJh4Vg5Fn1JVLhYGFyvojME/RTOLiZDMT7nNr94+Fph5Xv0C1sCZ
 tO0s=
X-Gm-Gg: ASbGncs3AnOQZrsfVHh6FeFw+7H0WlqatjH40sdWKPshi9MA9vsVhUUB0DgBSYSl0LK
 9TJT/a4dw25Q5wZxa1TK+Dcqen09nFWTrAx2mGHfRWJbnl7VmTrVeA+AlVh4ACQsI5wA6rRyNhm
 ypDVJ8sVg0m/s5ZlfPJIZ8SLgB7D/R1/b8dCluDAAYWkdqCeZJwnPU5J7gOyzYQtJRRo849H2qI
 nQ9ut9tjp72eHogVA9qIZUOvm0GlZRDydBv2RFOxYyEyseabCb5mTM=
X-Google-Smtp-Source: AGHT+IHm0a72hC7tdVpAmtxZZgxWa3f9CsHi+N22jOuHrNsa1sFByqdlQ9RYoq/6Sckyp0i2pNOrNQ==
X-Received: by 2002:a05:6402:4486:b0:5d4:1c64:b322 with SMTP id
 4fb4d7f45d1cf-5d7ee3bab9emr6202558a12.13.1734623029607; 
 Thu, 19 Dec 2024 07:43:49 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d80675a41esm758400a12.1.2024.12.19.07.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 07:43:49 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 453B55F867;
 Thu, 19 Dec 2024 15:43:48 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>,  devel@lists.libvirt.org,  Laurent
 Vivier <laurent@vivier.eu>,  qemu-trivial@nongnu.org
Subject: Re: [PATCH 2/3] docs: Correct release of TCG trace-events removal
In-Reply-To: <20241219150203.55212-3-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 19 Dec 2024 16:02:02
 +0100")
References: <20241219150203.55212-1-philmd@linaro.org>
 <20241219150203.55212-3-philmd@linaro.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 19 Dec 2024 15:43:48 +0000
Message-ID: <87plln3cgb.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Thu, 19 Dec 2024 15:43:53 -0000

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> TCG trace-events were deprecated before the v6.2 release,
> and removed for v7.0.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

