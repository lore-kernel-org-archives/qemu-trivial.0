Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sPJ52-0007uU-L6
	for mharc-qemu-trivial@gnu.org; Thu, 04 Jul 2024 05:48:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1sPJ50-0007tP-Cs
 for qemu-trivial@nongnu.org; Thu, 04 Jul 2024 05:48:42 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1sPJ4y-0003CV-Vh
 for qemu-trivial@nongnu.org; Thu, 04 Jul 2024 05:48:42 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-58c947a6692so581634a12.0
 for <qemu-trivial@nongnu.org>; Thu, 04 Jul 2024 02:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720086515; x=1720691315; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9nrxiYqOM/tgdI2tLaphlfwbBJmqVphhYrModIZQSTI=;
 b=N48K5IDaZWLr6A7NLlRfuagwNU9tGZfU5dCRFWc730eXfCoViDnmnpnToHB/Xgihth
 b1bMEVT5vYR70Gih0wiBp/6OtnJ2JvovQzNnEjBKeBHORSHzprVDF19Cnu8iOnQbap1o
 fIkrOqjrbamRgRODXyPIrnYEoPl3za8W+v5vm2Qqta/M+QjJqCvf0sFcYYGxJ1x2Qymv
 DKUAYrgu76MuMqHe6KiDClmeHg0tQ4TajH+0vW709m+MvT5Av7rRqjhjgXJ1ekf/7aji
 d4fd9axkACS1MzICasdpdEO6FIp97Hp4+ErJLXMrf+ddLD08hI/cCWh1+p12OPZ0EpQa
 IPFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720086515; x=1720691315;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9nrxiYqOM/tgdI2tLaphlfwbBJmqVphhYrModIZQSTI=;
 b=Q0p4i3sWU4Kj54+J+/gEP+TaV1q5+KG0ZYsRScKtSmDroKsaYg6bMvjiGbEMqwBvPY
 1jEEyofuOT310N5KMfqI3HSHxx+4WAbrZoRJCDDqM3axzY//T6lPDcsg2fAERxC47jIq
 xhcuKkmHqwu98StMODBBHdS3T6rtz7Gc9dCQUp399htEUmWI4j1zqppwfAFoiQ7bf/uS
 y+jV519aQlG+bJXdWpcetFY7ExeJMQF1J78HYnCAqFDByMgo9oYvWakjil9OzZ3XxOZn
 zftpiva/2DD8XVnviC2S/5h1hrIg8ic5e6kA8XO71qJlnQ6tYuPAlGW4TQGxFqJwffYD
 5kHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4f1KuhdH6Zrjka32UFRSyct9ChKgS50xGdJ5P8Xel2gnYfkznDexvfqxERc7ndjR/H3KPGVSg6mP1ZTg2qVfRgt+LJ3MuYg==
X-Gm-Message-State: AOJu0Yz7xks+oCP/q8upnMlQsv2FoxNHwnW2nl94b1N4xGcBgTqmMtWK
 NhqiW8iNDJ7tEVXeCRRm6jZ/cpL5ac6XPkY1tx+1XpBzbxUYNeXS0655aa8mmnM=
X-Google-Smtp-Source: AGHT+IHoYAzvqyvgPbNaI9+ZdJxemRu0rnP30rYZ3Xj6CPUUj/qxt6cwfE/D8lB6NYAre+DcgiZW/A==
X-Received: by 2002:a05:6402:4312:b0:58d:ebf9:4e2d with SMTP id
 4fb4d7f45d1cf-58e5a8e72a0mr800584a12.2.1720086514780; 
 Thu, 04 Jul 2024 02:48:34 -0700 (PDT)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5861324f0a3sm8256159a12.35.2024.07.04.02.48.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jul 2024 02:48:34 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id AD0005F839;
 Thu,  4 Jul 2024 10:48:33 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Michael Tokarev <mjt@tls.msk.ru>,  Laurent Vivier <laurent@vivier.eu>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org,  Brian Cain <bcain@quicinc.com>
Subject: Re: [PATCH 4/4] target/hexagon/imported/mmvec: Fix superfluous
 trailing semicolon
In-Reply-To: <20240704084759.1824420-5-zhao1.liu@intel.com> (Zhao Liu's
 message of "Thu, 4 Jul 2024 16:47:59 +0800")
References: <20240704084759.1824420-1-zhao1.liu@intel.com>
 <20240704084759.1824420-5-zhao1.liu@intel.com>
Date: Thu, 04 Jul 2024 10:48:33 +0100
Message-ID: <87zfqxo5ce.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x535.google.com
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
X-List-Received-Date: Thu, 04 Jul 2024 09:48:42 -0000

Zhao Liu <zhao1.liu@intel.com> writes:

> Fix the superfluous trailing semicolon in target/hexagon/imported/mmvec/
> ext.idef.
>
> Cc: Brian Cain <bcain@quicinc.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

