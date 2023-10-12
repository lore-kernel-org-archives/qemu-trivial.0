Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qqqWQ-0004Qu-3m
	for mharc-qemu-trivial@gnu.org; Thu, 12 Oct 2023 03:54:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qqqWO-0004Qj-QB
 for qemu-trivial@nongnu.org; Thu, 12 Oct 2023 03:54:16 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qqqWI-0000cI-8z
 for qemu-trivial@nongnu.org; Thu, 12 Oct 2023 03:54:16 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4065f29e933so8046355e9.1
 for <qemu-trivial@nongnu.org>; Thu, 12 Oct 2023 00:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697097248; x=1697702048; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YppCOcj+UZBhzyVZEnIIPpu6MA6N/eXmfJZeFBb+eyY=;
 b=iPnKTQPjB7d10bhuYQAhGbZIY8kbbhUZ1F9HIgkszybhLMizPtvYIRzf3ukS3jSeOy
 eMM1qtoeitCgWcuDVQUsBLlsN9gEUbi0+Mfz97Id8lBRT76rH5FcMDLdwZMvBKLYVhC4
 Ui20ODe+YsfdmjOgfud5Y6AExoDCuaNO1uZLX7ZUpNegrIbFevqSvRkUNDX/W4a5JOfy
 Ny9BZZIRt/huAF5boF+FekWmGBW5sHIkQygKHk2zNwyn9qE91636oIxvoHy1aky6fJss
 vgBR+XZ3t1gXPd3xwwBkrzh9AIFqq2H3LkeTuoukiSUZaReeKvJRVZYRMinLD7FqgcSX
 I0vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697097248; x=1697702048;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YppCOcj+UZBhzyVZEnIIPpu6MA6N/eXmfJZeFBb+eyY=;
 b=eHiP7vHC89TlCiegCk/OV1Dr+5VRK1cHuYyw4/usWrltC0aG6dHUlHdrVSGcAwbnuA
 y7K8sygpvoxzJUoQJzLJdMXbeF81KtoG0u+5DvvZEUnCdFZ1oUuF+juWeF0MA2v3V/Ho
 fC7V1RGWhnRJK9qypYGB6ry+TY9dKl9K5hVm+sa7MhReXRr9oHy12/rxj/kJLq01CL6C
 rWJOAiLeGy0d6DjI5ZrD6WVyPtuGyzcRqYK+0CdyL+A2m8I5BCRa51nh6TeKZparVep+
 FgdpbRpHhdvU4jJoAEfdG+WhZN29RIbSdPiPO0Pmky83qmANXeW55X8CqxAgptecEUWd
 OxTQ==
X-Gm-Message-State: AOJu0YwyBGp4LZvjC9Ujck/kGsPcWdD1hh7rDCeU+QeOaJxGhGZ4Tbhp
 Vlzq7TjY2zXO+39KCrNen+ew2g==
X-Google-Smtp-Source: AGHT+IGKvIHZ/BpRKDJUrJ+hEJ5BW6UuEujYZyxvV0Jy5HkPYo2J+11Kie4MptSk1MvVhtRB8byn6A==
X-Received: by 2002:adf:fc0a:0:b0:32d:8b1a:31a9 with SMTP id
 i10-20020adffc0a000000b0032d8b1a31a9mr1866353wrr.41.1697097248026; 
 Thu, 12 Oct 2023 00:54:08 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 k23-20020a5d5257000000b003177074f830sm17551898wrc.59.2023.10.12.00.54.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 00:54:07 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 484011FFBB;
 Thu, 12 Oct 2023 08:54:07 +0100 (BST)
References: <20231012073458.860187-1-thuth@redhat.com>
User-agent: mu4e 1.11.22; emacs 29.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH] hw/arm: Move raspberrypi-fw-defs.h to the
 include/hw/arm/ folder
Date: Thu, 12 Oct 2023 08:54:00 +0100
In-reply-to: <20231012073458.860187-1-thuth@redhat.com>
Message-ID: <875y3cnun4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 12 Oct 2023 07:54:17 -0000


Thomas Huth <thuth@redhat.com> writes:

> The file is obviously related to the raspberrypi machine, so
> it should reside in hw/arm/ instead of hw/misc/. And while we're
> at it, also adjust the wildcard in MAINTAINERS so that it covers
> this file, too.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

