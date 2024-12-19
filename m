Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tOIs0-0006tt-CJ
	for mharc-qemu-trivial@gnu.org; Thu, 19 Dec 2024 10:55:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tOIjB-00069f-0y
 for qemu-trivial@nongnu.org; Thu, 19 Dec 2024 10:46:17 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tOIj9-0005jZ-FU
 for qemu-trivial@nongnu.org; Thu, 19 Dec 2024 10:46:16 -0500
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-aa5f1909d6fso152119566b.3
 for <qemu-trivial@nongnu.org>; Thu, 19 Dec 2024 07:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734623174; x=1735227974; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zf24Vjtzavfp3NiDUW6ymoY9HR1UpY01Xz0vftfudo4=;
 b=fcctyQTRCEKHKDaUO3Q4rV6SpnOxgMREFmT1mEMLWJd79FPrdmclp7Wt97eHFOzacK
 8pU6oatOtPrfYx9ZcM45K5Tex7isoxhJT8y4DtnduATy/eHjdfaW4RyD7jJDV+zfs3l+
 dVEfSTpdqwRTgUsX/5ece3mfONPdOxpCHf8miSqrn0iSdTfAKwEeEItcabDhsneei28/
 UFrI5kvf15AipcI3hSE6vlXMcWsjYez2hZKxIEx21rUX475+58AZsaX5mp0PLZgo9D7v
 5fpPYRKbsJVUR9jAQCtTlmaZNCmT2Uq70YH+tiziU51AO1VYKHupM1bI3dNdJQs0O1uZ
 trSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734623174; x=1735227974;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zf24Vjtzavfp3NiDUW6ymoY9HR1UpY01Xz0vftfudo4=;
 b=OoDye9gUVb3vb0sWuuZF6eMm+D2GOpXMnhzkODV3M0V5YpCpBgblKfkXP4mFuhcZhn
 zE8QASHR4jF1F44kMZblP/kpZGm3aRW/DN/meDms0pdnPSgYi110dCyiV/s6wy0OBUgb
 QpAKBSEk9lIqbuluzS4+JgCkzHZYFvvg902pwO22hOecjre4eTHu/TwMdfL9FYctFTb7
 yIBHO2mI6/+gXtexc4PHFXVEl7p+l7IeZLfxAARam47NJFKOdx3tyQe+DEHIn6QVmIFy
 LDIsfHco3dCOMitXawS2dd59NjeOMOtPyD0LRePZaVsMuxvLT+t1O7St0oyurHzMYjlu
 NNnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwhWzTXDLsmYe0rdlxFXM9RdA+IZpTlMCgIi4eiBD6XIJk/wlvGSDB1XQi1x8/6vZiwxt1Q5ENyc7Q3NE=@nongnu.org
X-Gm-Message-State: AOJu0YzkNjFNeL3/d6e8gg8ckcsLnj89nzmcbZM2I/IWfx2HC95Cu5gB
 jy0U6I8P0j3CQnREFyv2CFz01pSq1esP6tzAHWQvsPlOjhDAILDnwshqKFZ29Cg=
X-Gm-Gg: ASbGncuk+h8rYOUwHYD3xOsv2Zt2T1Tqf9uDtcX80db4H6kvxlnEDOOFOykE0EAxd//
 1PrOx3yprwglGQNpd0o8YBqmMRSq85peBJjuqubPGPZnAr4P9udXL7JYbPW9jbNrKQTHapOj4QG
 isdw9gDLqv0K4o6vK6JEKXCcW9T/Gql99HT6p0uqLh8TpnWQti31Pp/lg4r73TdOsUjfb1yKz4n
 f+wR0u6aWCTEhN6zcTMoP9Tli4lHTGnJPCfI6938mDRdieNYa7b/iE=
X-Google-Smtp-Source: AGHT+IEzh+m7Vj0uxSk7uiGtg6T6XaLX4H4/WNZuACsZopxToAdLjkoIO9FauMj2DHATb0FQBZgvBw==
X-Received: by 2002:a17:907:d87:b0:aa6:86d1:c3f8 with SMTP id
 a640c23a62f3a-aabf48c67dfmr715644066b.39.1734623173834; 
 Thu, 19 Dec 2024 07:46:13 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0e82eb8fsm78357866b.35.2024.12.19.07.46.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 07:46:13 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B2C0B5F867;
 Thu, 19 Dec 2024 15:46:12 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>,  devel@lists.libvirt.org,  Laurent
 Vivier <laurent@vivier.eu>,  qemu-trivial@nongnu.org
Subject: Re: [PATCH 1/3] docs: Correct '-runas' and '-fsdev/-virtfs proxy'
 indentation
In-Reply-To: <20241219150203.55212-2-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 19 Dec 2024 16:02:01
 +0100")
References: <20241219150203.55212-1-philmd@linaro.org>
 <20241219150203.55212-2-philmd@linaro.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 19 Dec 2024 15:46:12 +0000
Message-ID: <87jzbv3ccb.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62d.google.com
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
X-List-Received-Date: Thu, 19 Dec 2024 15:46:17 -0000

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Use the same style for deprecated / removed commands.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

