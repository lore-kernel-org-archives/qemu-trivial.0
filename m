Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1racSw-00009z-DF
	for mharc-qemu-trivial@gnu.org; Thu, 15 Feb 2024 09:11:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1racSu-00009Y-MR
 for qemu-trivial@nongnu.org; Thu, 15 Feb 2024 09:11:52 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1racSt-0006iS-4t
 for qemu-trivial@nongnu.org; Thu, 15 Feb 2024 09:11:52 -0500
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-55ad2a47b7aso1280589a12.3
 for <qemu-trivial@nongnu.org>; Thu, 15 Feb 2024 06:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708006309; x=1708611109; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a0u+e37cggCORrx6LlAXbJ+0LxvkIGLaj9c5/4Ego+Q=;
 b=JfRESuF5alJeIDjQD7RxFgbCHJcdES1/bGXHN103H95xRpOPd65+A6+tWmk68uvvc4
 N55PzO0+m3QJj4ZB+9YvO+1DX0OJ3FqoTzQ+ZM1y+OlNnDmfhn34mpEM2sWKu6nCpRld
 xdHzyHIPBzb7EpIIpYZirZq+zYZAgTwY40DIa1rsiXiqn80BhFHnCYLUiy4/IVcZpVHN
 hyUqOLuYYe4unFWLQl+zoZBd7LvtIPBwWxA3XKJAqyCueinBAdIfb+IlrbLpsAsuw1uW
 emddo6rSVADyAZbvcLTPwX0cIxBJMI5VhR79IwMsnWp4EDDE/Sol7WFirD/18F/VDAaZ
 IVSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708006309; x=1708611109;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a0u+e37cggCORrx6LlAXbJ+0LxvkIGLaj9c5/4Ego+Q=;
 b=UCojRVYvvtw1tbbmdFrpX5P06Wtktmq9ekXYE9Vl1ZCZr0EVF6w/f484aY8YXaBssN
 IvGCyregSY2xtWgNat1eMysmoZs8nMDIQfR+fimwojN8Bmt7Jj+jJuySyPwFhjX5I73q
 8uDzVy4ceagFbbhvIFSjFEzsOE1KZ+bB1lUANf4ts71hRw6yAcL0iFG7kTHYc9TTClZg
 fg5tUex6xmzl8UQzLU7eAROxXaCWOpfQ6QeNwt//Lx86L98YX4J4JtaCzUZgkbN43Mq9
 /1SNd6BJRHqC6tlyYXcBrPlQo92idLwFkhe3+QK0udESEFJaAZwXGJyRjHcIeT7vAOkc
 EV/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRXGS9F/6IGIW501M28emSLNhMOPFpv/GoedblzrEHsapUgoXj4kg+fVijBAuht6hNljyw+cuqLO1iSF5Pc5h2TACWX0Fe0w==
X-Gm-Message-State: AOJu0Yzl84NhUuIv5LesM8VRONkfvCzUZsnWU/NPxLLStyMYXPxlLmx8
 cPnHghokIy2WogSdB/lXp/gy1CP523aDfe/HcpEOUliYltnbkagbEGsHZqi+S7LLHmiByuLc2ML
 MUWYaYtD7Sjv5YnQwaZoR1J0wCZ12G+lkLjB8hg==
X-Google-Smtp-Source: AGHT+IFjaxAhDTvbxLGMy7MtefUiiLBCzbjIDPoVqlXXjU8OazVLrj+t9Icvwn0shvrbgbn6PuP8JzumWcqqF/ABThM=
X-Received: by 2002:aa7:c90e:0:b0:561:199a:3304 with SMTP id
 b14-20020aa7c90e000000b00561199a3304mr1307197edt.39.1708006309531; Thu, 15
 Feb 2024 06:11:49 -0800 (PST)
MIME-Version: 1.0
References: <20240215132824.67363-1-philmd@linaro.org>
 <20240215132824.67363-2-philmd@linaro.org>
In-Reply-To: <20240215132824.67363-2-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Feb 2024 14:11:38 +0000
Message-ID: <CAFEAcA-m3d2HSi3NU6V4hfZ-jw=3Mnj-3Hv_1sSr+FhXR_DpAw@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/sparc/leon3: Remove unused 'env' argument of
 write_bootloader()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>, 
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Michael Tokarev <mjt@tls.msk.ru>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Frederic Konrad <konrad.frederic@yahoo.fr>, 
 =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>, qemu-trivial@nongnu.org, 
 Fabien Chouteau <chouteau@adacore.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Thu, 15 Feb 2024 14:11:52 -0000

On Thu, 15 Feb 2024 at 13:29, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> 'CPUSPARCState *env' argument is unused, remove it.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/sparc/leon3.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

