Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kXLSv-0005PI-UO
	for mharc-qemu-trivial@gnu.org; Tue, 27 Oct 2020 05:40:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kXLSt-0005O9-Lk
 for qemu-trivial@nongnu.org; Tue, 27 Oct 2020 05:40:28 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:41143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kXLSo-0001pe-P0
 for qemu-trivial@nongnu.org; Tue, 27 Oct 2020 05:40:26 -0400
Received: by mail-wr1-x442.google.com with SMTP id s9so1075999wro.8
 for <qemu-trivial@nongnu.org>; Tue, 27 Oct 2020 02:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=F4wCHu4DUVDt6Js7s9qPe25jdZFqFJmRln+6pD6mB08=;
 b=J49vMaxCnranymOcyZR20yuf1rWiQvJf1KQh0tWMnE0x52H7F6UsE604xySqpQrwR6
 AbHkxZRb/zw+57fAqCtEHk1s21NUMOcXYq9LNStCZGWt+szjISLVfJqMycAqawqkXdgV
 PjmH2fN0UJIucKhH4VDiDpCpBqCNMGrpkrdlU7HsBFwIElGJvAG43xZOte/pHAY6OPxU
 ivsH1aMvMWIdbpwXlzLhDtr+77DxFN4yl8u/U8GGtl9kdbxJuqpIvPdrB5bfavwKlaJM
 Fawe3/GKk67do7/2SZbXGfiiknMH09l64UmVG33uVMaQmwmSVFtaOblhGIOsGOezuCrC
 n4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=F4wCHu4DUVDt6Js7s9qPe25jdZFqFJmRln+6pD6mB08=;
 b=O/a6F2J+qR2WDobV3ogOfboYx7+bCT1MFJ44J5ZvBIfDNLQFUuAi4ZDDYx1OlXlOJu
 6LBvkhKbz3TWSrDRz7u4tE83Mf/EPLNZXtsoWI9rZGBSGoXjCpFg7yckF1Jkw5w/yECm
 PIXMFjoiLfVujqg1gImoIa1WjKLZ8azfXs6aKQVenYwKqsgoSgTo3rXP6QSUs2O6JFfj
 hYZK6xg+bC60PUlQDnpLnnVIIE7j7WjfO5Ir3kwv2S0I8iYtfwOjenJQn63A70MscjGM
 RUKJW36w5PHKdO+fh33bGGtwUGBFl1Ec20W1FZZgjeaDhoOwuSW5Atq7arnciZ9Pwnib
 YAxQ==
X-Gm-Message-State: AOAM532SA6zZzCj5NK/0jqnp0HOKUYof3gUGhFqAQsGo+rJ0jJ5YFejd
 EUdHE56IWZVnnju4gCt3ApvZPQ==
X-Google-Smtp-Source: ABdhPJxeEbY/JT+He5iF73Kh39mufbEbilgI6MLIWoa179fIklEOyWqH589xxkpzqm+xcOaRA1bb+g==
X-Received: by 2002:adf:f2d1:: with SMTP id d17mr1776393wrp.122.1603791620403; 
 Tue, 27 Oct 2020 02:40:20 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c1sm1293627wru.49.2020.10.27.02.40.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 02:40:18 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D9D521FF7E;
 Tue, 27 Oct 2020 09:40:17 +0000 (GMT)
References: <20201026195131.13848-1-jsnow@redhat.com>
User-agent: mu4e 1.5.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: John Snow <jsnow@redhat.com>
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, Thomas Huth
 <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2] CHANGELOG: remove disused file
In-reply-to: <20201026195131.13848-1-jsnow@redhat.com>
Date: Tue, 27 Oct 2020 09:40:17 +0000
Message-ID: <877drcf1mm.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Oct 2020 09:40:28 -0000


John Snow <jsnow@redhat.com> writes:

> There's no reason to keep this here; the versions described are
> ancient. Everything here is still mirrored on
> https://wiki.qemu.org/ChangeLog/old if anyone is curious; otherwise, use
> the git history.
>
> Signed-off-by: John Snow <jsnow@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

