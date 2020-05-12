Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jYZtL-0003Mu-6Z
	for mharc-qemu-trivial@gnu.org; Tue, 12 May 2020 14:44:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jYZtJ-0003Ix-Oo
 for qemu-trivial@nongnu.org; Tue, 12 May 2020 14:44:33 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:55289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jYZtI-0004UG-DT
 for qemu-trivial@nongnu.org; Tue, 12 May 2020 14:44:33 -0400
Received: by mail-wm1-x343.google.com with SMTP id h4so23211935wmb.4
 for <qemu-trivial@nongnu.org>; Tue, 12 May 2020 11:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=6hv6Z+ErM2Tx/RhfYkWQgackaDiVa+y6R62kWHd6a3E=;
 b=Oyts7iMKxXCUpW8TOcnr46fA2W7ESqPP+TnbbmjHpsRwPKktxl59fSzgYpXDg9snsF
 3j6LZml20RuocZyHMjvQBFIjqZgIANAgZeAh2Pgg6tXOfCDAMvJ3HzSxc95AfFMWaTnK
 ueSKux0mPha6dXHChKrKR3+LUhAkf37FVv9pqk/s0kTb9880FtLEWOZMzlLsENAF1plo
 4xX6EGgm6DNIAOBpVeRONblrrM5U5NM/1QgFH3f7cVAYiwa6QCHXV5PLF+Tte4DWUtRp
 EFkeFc9RrEm8n2t86JCaIb4/PhbBk/fQQiM43rVq7ZarUHp8Wz4+1A/SkmSyxW6SScjP
 93aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=6hv6Z+ErM2Tx/RhfYkWQgackaDiVa+y6R62kWHd6a3E=;
 b=HCOBBYkZOwq/j4flLAUw+uERBlstGOjm5xi0NaR61mRDpi0T8i8xWdSPJu0T4AFvQv
 AEhhYsyGVVtFtWBm1DciItgS3GzM6KSaJjeIqS4Xcxbw2SeVrVs6xRXFKuoWtrvZXLCj
 ZBbsnSw5WwNLXCnobmC901rHyddvo9ZQHTnxbnVail6hcp27jXVZXDC0o9MDGx67J7Iy
 vUnUxXY5SBUFYrSJMAmhmnsZMWJlx4kw1tMBHfTjb8UyLqMTvoeiV9UYWVgfR1o+ci+U
 epbcdYig3GTtoIgEUY0NzRODc8DANHAy/SunWduKX9tp7GLRpHUUuKJ4QiReT6FOJD2+
 gUyQ==
X-Gm-Message-State: AGi0PuY+HLBzjPlQE7cqFJJ6dsqx/a7RheArH0TE1uSk5WbewsFxcUDE
 H6TPak6JY7aQ3YV8geaE0Wv5Rw==
X-Google-Smtp-Source: APiQypLp/8L+AA8czA0tacaHBGBGuCJxTJm/ORum0IC7FEMfm6hukYhIAtc9t+goSHvbozJJU/6ryg==
X-Received: by 2002:a1c:7c10:: with SMTP id x16mr37492346wmc.74.1589309070722; 
 Tue, 12 May 2020 11:44:30 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l13sm7617836wrm.55.2020.05.12.11.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 11:44:29 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 898C61FF7E;
 Tue, 12 May 2020 19:44:28 +0100 (BST)
References: <20200510171119.20827-1-f4bug@amsat.org>
User-agent: mu4e 1.4.5; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, "Emilio G . Cota" <cota@braap.org>,
 qemu-trivial@nongnu.org
Subject: Re: [PATCH 0/3] plugins: Move declarations around and rename
 'hwaddr' argument
In-reply-to: <20200510171119.20827-1-f4bug@amsat.org>
Date: Tue, 12 May 2020 19:44:28 +0100
Message-ID: <875zd1f0xf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Tue, 12 May 2020 18:44:34 -0000


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Rename qemu_plugin_hwaddr_is_io() 'hwaddr' argument to later
> allow declaration of the 'hwaddr' type to be poisoned (see [*]).
>
> [*] https://lists.gnu.org/archive/html/qemu-devel/2020-05/msg02254.html
>     "exec/cpu: Poison 'hwaddr' type in user-mode emulation"


Queued to plugins/next, thanks.

>
> Philippe Mathieu-Daud=C3=A9 (3):
>   qemu/plugin: Trivial code movement
>   qemu/plugin: Move !CONFIG_PLUGIN stubs altogether
>   qemu/qemu-plugin: Make qemu_plugin_hwaddr_is_io() hwaddr argument
>     const
>
>  include/qemu/plugin.h      | 65 ++++++++++++++++++--------------------
>  include/qemu/qemu-plugin.h |  2 +-
>  plugins/api.c              |  4 +--
>  3 files changed, 34 insertions(+), 37 deletions(-)


--=20
Alex Benn=C3=A9e

