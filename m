Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1t0h9q-0005aC-3P
	for mharc-qemu-trivial@gnu.org; Tue, 15 Oct 2024 09:00:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1t0h9m-0005Xv-A9
 for qemu-trivial@nongnu.org; Tue, 15 Oct 2024 09:00:10 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1t0h9k-0007FL-Jm
 for qemu-trivial@nongnu.org; Tue, 15 Oct 2024 09:00:10 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43123368ea9so28264665e9.0
 for <qemu-trivial@nongnu.org>; Tue, 15 Oct 2024 06:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728997206; x=1729602006; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DY0mf9LgIKF/AWCH0RzXkvYKoekfHo8y6WDVdpvd44s=;
 b=sBqGTHPstrVYFhxsX2jKB9UvWrOtup8oXFZERXdyo53HAcfKbAzEN0Z947HyPwvX+0
 W0BnGK03Kf5Mq88QtiV93xqHOmB0eoYCW7C/jMTJ8Nm1h9y5bwturIjdgMmfo9yUnTFW
 tlrSYjN/+xkVugvlwwr8gImt2cjDVNXS5hEW2w6PfVasAa2kppwxpUj5ByE6M0JOUcHS
 MDC1NgqPfosC58su0vbvTlkOLbpdNbDALgA/5NzNA2ebcDTdXT3IYyzCnhogzhHwWylQ
 zk8aLXC46Y8woQ07BQoX302ikq+uOZyWZXzc7As7U8/mMOPRBkVtprD9t6XQVdLZFdQA
 KsDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728997206; x=1729602006;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DY0mf9LgIKF/AWCH0RzXkvYKoekfHo8y6WDVdpvd44s=;
 b=MZEz4tlAdOukiaoNQ76qbYfR/3hVftr0BtLcbP7rOoEjKunxeag+eYWs/EhsexFW0q
 LQuZ3epDWRNwVqe7YjaKaT9jOYsEffbfVf/icKlv1sEueJGJwewA5tjh9YYLyKgVMwlj
 H0MHVoFgWKA4Xsb96j53OKiZu2jEX3jtTiAcTtws3C1OZqTsSziZgfOdrMhADmU0l/w0
 6ny2hJ1EQUaCljqKvLJzTpMHPHGyDFZ8eTacaQYvTXd3o9JKQjCeHBibJHrvZqN7WfX9
 qflAQRf3+MUQQfTEsUH74kd+KeUpBW/LCBrzTuK55Wl3L4Oy3upKr5dgbrcJM8wwzew3
 81FQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvYo6eaWGTeMZ2iiZzGvsMpMtYy0CJncXZB5SMKjWY2HClpBqSwvK97Kgqew7VAXYgbwCWtUTzAiBI+Ro=@nongnu.org
X-Gm-Message-State: AOJu0YzWyaHM4334G61OkEUxfnq8SJZUL7W1BWYaPas8WkguIDYTUZVA
 WL6FyRcRQp1WdlGDQJStpEh8rJz7A0f3lrZXigaPGgI4kmFHRAfRRym4I4X+epI=
X-Google-Smtp-Source: AGHT+IEVJUWjjnHzD2ZA7HyGw+poXazcA85f2tgniV7p9hzFAnv96zEOlgYdAFnPqTpJm8kGbDW8mQ==
X-Received: by 2002:a05:600c:3b9c:b0:431:47d4:19d1 with SMTP id
 5b1f17b1804b1-43147d41c86mr7981155e9.1.1728997205576; 
 Tue, 15 Oct 2024 06:00:05 -0700 (PDT)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4313f6b1e77sm17454055e9.31.2024.10.15.06.00.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2024 06:00:05 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 49F615F8C3;
 Tue, 15 Oct 2024 14:00:04 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org,
 Brad Smith <brad@comstyle.com>,  qemu-trivial@nongnu.org,  Daniel P .
 =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Michael Tokarev
 <mjt@tls.msk.ru>
Subject: Re: [PATCH v2] ui/console-vc: Silence warning about sprintf() on
 OpenBSD
In-Reply-To: <20241015112510.412471-1-thuth@redhat.com> (Thomas Huth's message
 of "Tue, 15 Oct 2024 13:25:10 +0200")
References: <20241015112510.412471-1-thuth@redhat.com>
User-Agent: mu4e 1.12.6; emacs 29.4
Date: Tue, 15 Oct 2024 14:00:04 +0100
Message-ID: <877ca9a5d7.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
X-List-Received-Date: Tue, 15 Oct 2024 13:00:10 -0000

Thomas Huth <thuth@redhat.com> writes:

> The linker on OpenBSD complains:
>
>  ld: warning: console-vc.c:824 (../src/ui/console-vc.c:824)([...]):
>  warning: sprintf() is often misused, please use snprintf()
>
> Using g_strdup_printf() is certainly better here, so let's switch
> to that function instead.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

