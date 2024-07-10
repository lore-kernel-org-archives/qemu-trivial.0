Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sRZCC-0008MQ-TQ
	for mharc-qemu-trivial@gnu.org; Wed, 10 Jul 2024 11:25:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1sRZC9-0008GS-BH
 for qemu-trivial@nongnu.org; Wed, 10 Jul 2024 11:25:26 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1sRZC7-0000SW-Nr
 for qemu-trivial@nongnu.org; Wed, 10 Jul 2024 11:25:25 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a77cc73d35fso183942066b.0
 for <qemu-trivial@nongnu.org>; Wed, 10 Jul 2024 08:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720625119; x=1721229919; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EQcXXOjSPU2L2AmoCxFymt6j88iRIYAXTxqv8JQnQ3Y=;
 b=Yn3WHtiC0XptgUVZKZNvz56VbzP+Q4yMU4Df4QN5j+DCcTgj9m05FQDpchHRjbOexB
 d/kNrRZp346/foi94D/GEDtnggkDi243h0dBz2d81QU06E1l6iFvMvBcYYNGmDWqyQ4a
 qae90cSc0kB+PG9a17XDki9G5hIxUrXFCn46ZLrQ/o7BcxP1671Oihsb6kQCLvs5TCZq
 aJ8yFpXq4fugVA9yRw1bQC7fTHqJkaG3Dsdt07dKwsrN1b/K5J+hNlZFjapWy9wvKore
 bd7BSoNu40ZXG5XBlWkxXbpBLZsAkkJno7i2W1vkjnDaHbeH/m2qK0U9+fTiQY+vypia
 ZXWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720625119; x=1721229919;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EQcXXOjSPU2L2AmoCxFymt6j88iRIYAXTxqv8JQnQ3Y=;
 b=etZq6Hb30iEEQ09ic7zFqTvvJFT0CYhn7OOs5GrlZVCHJ9aO2mSII+jmDITjMmKH4Z
 KVsvOrEwW+JO2Jx3eB3GCXjCeFzDyzKH8uBLlK0+cl2UyjBIfye3i7lVOLoz1maPZB/S
 yragglJucRrQjzySiNMEDuvhISfkBXDEdxKj1a6Hy68IwYzDsEF3oO0pJDeFsYEJJCAF
 025cVG1j8SsX/Dgd/IOPlHPfdJzEyyBby4BiTMhiBsRpN91Q+RRAgHlkpe0KnAQb5g3d
 g+mC9iyKP0kQrWfpsaxq3KAFWewRXq7/pcH6RJ2qxRp5NsYx+uUV8hD4ed8IEQcgpJ/O
 dljg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU56wAASWXXrDPxNU2uTgSX81pnnV0dq1UzYu8jcKOfMWq+2ah7aKhXx+pbFvLyowNb5vhcKZf6cQg8Uk0f9YUbUE2lh9RfyA==
X-Gm-Message-State: AOJu0YxCaFLoHfL3OKOJG35pLb1J3s4gjzKW40nagMJNdZZjIn5yL41R
 TiGL3PGPUNpt1RNO9U6y6bVoQ36ZNBX+5ZIItehULcVUwO9AXSQzWdIX4cm5uFo=
X-Google-Smtp-Source: AGHT+IEG1KcV9Pqk46FPhDhJJTJm5aq4tnEpcVOJu4e3Yd2dCSoqdgPFbmUAHw0vB6I+KFnhrhExPw==
X-Received: by 2002:a17:906:2b52:b0:a77:d4e1:f66e with SMTP id
 a640c23a62f3a-a780d2673f2mr376394766b.20.1720625118758; 
 Wed, 10 Jul 2024 08:25:18 -0700 (PDT)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a797e158f5csm53242666b.218.2024.07.10.08.25.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jul 2024 08:25:18 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 47D0C5F937;
 Wed, 10 Jul 2024 16:25:17 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Subject: Re: [PATCH] tests/avocado: Remove non-working sparc leon3 test
In-Reply-To: <20240710111755.60584-1-thuth@redhat.com> (Thomas Huth's message
 of "Wed, 10 Jul 2024 13:17:49 +0200")
References: <20240710111755.60584-1-thuth@redhat.com>
Date: Wed, 10 Jul 2024 16:25:17 +0100
Message-ID: <87o775qnfm.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x632.google.com
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
X-List-Received-Date: Wed, 10 Jul 2024 15:25:26 -0000

Thomas Huth <thuth@redhat.com> writes:

> The test has been marked as broken more than 4 years ago, and
> so far nobody ever cared to fix it. Thus let's simply remove it
> now ... if somebody ever needs it again, they can restore the
> file from an older version of QEMU.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

