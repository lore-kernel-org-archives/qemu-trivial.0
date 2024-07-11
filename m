Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sRu9U-0008T3-L4
	for mharc-qemu-trivial@gnu.org; Thu, 11 Jul 2024 09:48:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1sRu9Q-0008De-LM
 for qemu-trivial@nongnu.org; Thu, 11 Jul 2024 09:48:01 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1sRu9B-0000B8-0o
 for qemu-trivial@nongnu.org; Thu, 11 Jul 2024 09:48:00 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a77c9d3e593so97836266b.0
 for <qemu-trivial@nongnu.org>; Thu, 11 Jul 2024 06:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720705663; x=1721310463; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kUrSSPRlly26tyRho86q2Z88VFLS7LA7muzi/OiTP5E=;
 b=uCq74hQb4aWgy9WPDvLtKpJd7xaCdALGpfx/pfSUYhUYIvKsh5jSgvqylcN1Eel1Wk
 Er2tMDQ6Vmw14+iLwdEFQavkw5nJUkGOEf0n7rQRFLgQHyiuyFex6I1ffBBMIGbSwy/g
 4t7+CQEdHVm8JFyqhZwY/QhSu2A0P01uMv6pJOSI11e33yN2i4octHSMqXT9SDchy3iH
 AvoSQRRlEM72Zv38Pp2FLqcyen+qeTZCr+X+roL/nBUcdwDq+OPbUAskS7Vvbqo5f9us
 906lkt9XBqOeFBa4wjzgrMVn/4gprrPgVyY1S2mRx8rJl1srtex+FrpVdRIrns8Ygg3Z
 SBJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720705663; x=1721310463;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kUrSSPRlly26tyRho86q2Z88VFLS7LA7muzi/OiTP5E=;
 b=BfxXs8TEy+jiQ04yHeFGTRDvID+2yBg9kT7A/X41/uktz/tA2rF9feLtaJ1D+4RJfl
 nSmKpkbHQERxsoyoQiMTkKR/4N1lpE1ed75JQ96UJA0aHOIQmGXUzgfPvg0Kb1fb4aAc
 nwSuvZ8/kKtNUekJQQRGfioaYh1+5rmzKxKotwZumwzP/aQcEBs0Su5JFGFduoYLr7rZ
 WGE1x0fSib2+lDnZLowEYfgvu283vy0V+tV3PLd+GdddgJq/1qeKzumMa7wNWKTDlmml
 hviYWvWmyp0QiBSQObL5NjSDkHBKyGWiTgLnOkRk/nky7iVjHdev8ONAkLsMOXdz6MqV
 aFjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXY0UmkL985wh6ivALs15+pAu9vkJZtRBgrRH4GNRN+MlXNRlHR57YPF2zAe+9wa+v4p7QIt7lMLRwOJ3Pzaxfok1PWxIKbA==
X-Gm-Message-State: AOJu0YyuHp+7oRN9BwMth8cXkWsY1uGTyYT6bGo0DvfZLqQbhupgP1cR
 SvQdl/b32VNq96VKxNbyaVfX6hHxjvtk8/YaJ2/ZBXKkgRvwR3f+kEMNK8UUvIAZ7FogKaiuvT7
 E
X-Google-Smtp-Source: AGHT+IFMpqSyVesc23BvgOk3++QP5kSHZ4FVF/On67VZbK8Nde/HdIpOkexnk2d8c1NQDssEh9iA4g==
X-Received: by 2002:a17:906:5ad9:b0:a77:cf09:9c5f with SMTP id
 a640c23a62f3a-a780b6fe88emr602436566b.37.1720705662772; 
 Thu, 11 Jul 2024 06:47:42 -0700 (PDT)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a6bc57csm255255166b.1.2024.07.11.06.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 06:47:42 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 642775F79A;
 Thu, 11 Jul 2024 14:47:41 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Subject: Re: [PATCH] tests/avocado: Remove non-working sparc leon3 test
In-Reply-To: <20240710111755.60584-1-thuth@redhat.com> (Thomas Huth's message
 of "Wed, 10 Jul 2024 13:17:49 +0200")
References: <20240710111755.60584-1-thuth@redhat.com>
Date: Thu, 11 Jul 2024 14:47:41 +0100
Message-ID: <87bk34qbuq.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 11 Jul 2024 13:48:02 -0000

Thomas Huth <thuth@redhat.com> writes:

> The test has been marked as broken more than 4 years ago, and
> so far nobody ever cared to fix it. Thus let's simply remove it
> now ... if somebody ever needs it again, they can restore the
> file from an older version of QEMU.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

