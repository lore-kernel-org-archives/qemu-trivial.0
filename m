Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qIo9f-000753-NR
	for mharc-qemu-trivial@gnu.org; Mon, 10 Jul 2023 06:30:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qIo9d-00074n-Va
 for qemu-trivial@nongnu.org; Mon, 10 Jul 2023 06:30:06 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qIo9c-000351-6i
 for qemu-trivial@nongnu.org; Mon, 10 Jul 2023 06:30:05 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3090d3e9c92so5108852f8f.2
 for <qemu-trivial@nongnu.org>; Mon, 10 Jul 2023 03:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688985001; x=1691577001;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Ju58M6RIg840o2sMmJkivNvtXUXH4POnMnZDHHgGwk=;
 b=Iu2VngPyDYsH8Fiat1j+E2GTzKWM35ddh9y9/DLgpj3TTSQelONkonhWbNP1eRKFgX
 2HQapWVE6uU1/ULuMoRydzgA7Z+Hc+dZPNmY5J/HcCWvRo+otWB/EK3yJpGHw1ygfczH
 VqozL0TyS4EK2jHLkkzyGXvaOdQ0z+p5V59MPfJU1Q0OvjI8YmiWEr/P1btd5sL7q6oc
 uMJNkPF0qHBhrDSaVj6ErbPslqcsbLIM7+UJ4eD1uAZ4RwkQi+fomWeEKK146ygh18zF
 YUbzUYUNzr3qiy9q4mgqPw9daBN4mP92T451ovDA1qdzkftdTEvUrkgvIPnmuI7oOmlP
 AfYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688985001; x=1691577001;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=1Ju58M6RIg840o2sMmJkivNvtXUXH4POnMnZDHHgGwk=;
 b=ERv73NWwITnYi0zTfnw6iomrSr5FiScKeJ3QUOPGYvqeAgpT5NZyyXMqmwy+Ow96RQ
 7lreWFa00Vjzb7Cns+fJxfxpGJNdJmP3ZmNVDSZIVcGhOvMYEuwNaims22KHgvxONk5j
 hhFb+4hKz66FjIk1CVLsH91TEHx4jjCANw0XaXZTYq7zeAafXf5TZ8WBSITbgm2EMtoq
 JHSaAl6pi2ywLK+uRXrylWOh2kTry+5VDxKduVNGkcqBoKHgsELHPtDqv1sd8ZMoNWWb
 g7odXsxZPnxsnnTJmRfY8hwtZm5qwHRSCDN2pEgYEeu8LpggHoLRxbK5byijfuCF6/RY
 IN7w==
X-Gm-Message-State: ABy/qLY57zr97aZraL0VLuG2+RoMoHAQP1Q0CiXI8dNrKkfe1tciiLyS
 k+C1eeIEV0V2FI2QCu2o9zwbzg==
X-Google-Smtp-Source: APBJJlEYOo7o4Si4zHnw3PmaWAEJFXPxiDCd6RFOj6V5iT2j8BDvJGdv1eyAa5A5dRN+jRCB4es/XQ==
X-Received: by 2002:adf:ec50:0:b0:315:9993:1caa with SMTP id
 w16-20020adfec50000000b0031599931caamr4293999wrn.12.1688985001697; 
 Mon, 10 Jul 2023 03:30:01 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a5d65c7000000b003159d2dabbasm1595581wrw.94.2023.07.10.03.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 03:30:01 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D3D941FFBB;
 Mon, 10 Jul 2023 11:30:00 +0100 (BST)
References: <20230710092638.161625-1-thuth@redhat.com>
User-agent: mu4e 1.11.9; emacs 29.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
 qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Juan Quintela
 <quintela@redhat.com>, Konstantin Kostiuk <kkostiuk@redhat.com>
Subject: Re: [PATCH] docs/devel: Fix coding style in style.rst
Date: Mon, 10 Jul 2023 11:29:53 +0100
In-reply-to: <20230710092638.161625-1-thuth@redhat.com>
Message-ID: <87wmz8hxef.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 10 Jul 2023 10:30:06 -0000


Thomas Huth <thuth@redhat.com> writes:

> As defined earlier in this file, the opening curly brace of
> functions should be placed on a separate line. So we should
> do it in the examples here, too.
>
> Reported-by: Konstantin Kostiuk <kkostiuk@redhat.com>
> Fixes: 821f296756 ("docs: document use of automatic cleanup functions in =
glib")
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

