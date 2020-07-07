Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jsiVV-00008Z-Lr
	for mharc-qemu-trivial@gnu.org; Tue, 07 Jul 2020 03:59:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jsiVT-00006S-PQ
 for qemu-trivial@nongnu.org; Tue, 07 Jul 2020 03:59:11 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:33789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jsiVD-0003W6-Vj
 for qemu-trivial@nongnu.org; Tue, 07 Jul 2020 03:59:11 -0400
Received: by mail-wm1-x344.google.com with SMTP id a6so1157052wmm.0
 for <qemu-trivial@nongnu.org>; Tue, 07 Jul 2020 00:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=jvLidYTk3Gwk+8RiJSnhs2zD4i65Sr1+CzDXLCD0Iuw=;
 b=e/NaAKLgASeagYNbsRUxfqFMmbFFxUkHfgwH7Wzx0jtqYahcwYXZBmS9gZ8SMbZpfr
 6NHHlFjyZgd0DU4nPgG+o5CCVBbdOQQrpA1H0m2fo4LAJJLnwJtuW9vZee6jOtPvaIPP
 72TI7zFCeq3mIQyfFndbYwTm8j877mG9wp0nOuwsFQRQpmHlCjy9dSxQMgNUKZRXmgQn
 xyBYjg0vIpu3n9I1D/6a2YkzJy7+yphCLH255EbaCs7O1eppDt9087I2StmsNpBOUqgu
 3hiNFW4SZXPJ/VQYj2OQD8DvB0+r99ZY4Xuu22ct5XS86PRoCvNWMj8MBch1O+LIPLih
 EXGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=jvLidYTk3Gwk+8RiJSnhs2zD4i65Sr1+CzDXLCD0Iuw=;
 b=E6/3AsrtIqi6Qrl+22SOUlcysiQ+x/pzZOEyyYYBw2qzWcAwTTR54XVP7+aSiYFHI9
 xOXsxlifBFR1ClLB8JTUqr59teiDRU9e3QtYEtlnXHxOvfsLwbQZ+5ouK4SrgTHiSvvW
 p4+Er3VzywRnu+l8e2BOxPPGOZj2j89p6K5SBTJw8pm6g9qTcHFPduD2Njvsly5Gdgft
 aIPgAizk7qDAJNRphM3rXBJq/IhfZdk6awLQ49GfKL1kNhHaaru1jImokuKIuqE93BZG
 qCJx2PsExoeaWFzNCf403rFwaNdHqiVspL9tGs9VyM7nUnnT9NPzoEoA4n5QIx4oaN55
 A7kg==
X-Gm-Message-State: AOAM5336A3vjMREQc/8hV9NzCqPi9co2JgCYw/kvp++8BIcRyJ4crbVH
 v4S5wJkjIgSw3nFhe9NAmoimow==
X-Google-Smtp-Source: ABdhPJwUf05BWVZzcEaK7gfjY0YSZFrV14V1pOsZH9K4oyBR8phLwfcu66PjErfnaZwnAK3pcswi+A==
X-Received: by 2002:a7b:cbcb:: with SMTP id n11mr2673332wmi.99.1594108733976; 
 Tue, 07 Jul 2020 00:58:53 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u20sm2219170wmm.15.2020.07.07.00.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 00:58:53 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5EE921FF7E;
 Tue,  7 Jul 2020 08:58:52 +0100 (BST)
References: <20200601171609.1665397-1-arilou@gmail.com>
User-agent: mu4e 1.5.4; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jon Doron <arilou@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, peter.maydell@linaro.org
Subject: Re: [v1] docs: Add to gdbstub documentation the PhyMemMode
In-reply-to: <20200601171609.1665397-1-arilou@gmail.com>
Date: Tue, 07 Jul 2020 08:58:52 +0100
Message-ID: <87fta3pxhf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Tue, 07 Jul 2020 07:59:12 -0000


Jon Doron <arilou@gmail.com> writes:

> The PhyMemMode gdb extension command was missing from the gdb.rst
> document.
>
> Signed-off-by: Jon Doron <arilou@gmail.com>

Queued to docs/next, thanks.

> ---
>  docs/system/gdb.rst | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/docs/system/gdb.rst b/docs/system/gdb.rst
> index a40145fcf8..abda961e2b 100644
> --- a/docs/system/gdb.rst
> +++ b/docs/system/gdb.rst
> @@ -87,3 +87,23 @@ three commands you can query and set the single step b=
ehavior:
>        (gdb) maintenance packet Qqemu.sstep=3D0x5
>        sending: "qemu.sstep=3D0x5"
>        received: "OK"
> +
> +
> +Another feature that QEMU gdbstub provides is to toggle the memory GDB
> +works with, by default GDB will show the current process memory respecti=
ng
> +the virtual address translation.
> +
> +If you want to examine/change the physical memory you can set the gdbstub
> +to work with the physical memory rather with the virtual one.
> +
> +The memory mode can be checked by sending the following command:
> +
> +``maintenance packet qqemu.PhyMemMode``
> +    This will return either 0 or 1, 1 indicates you are currently in the
> +    physical memory mode.
> +
> +``maintenance packet Qqemu.PhyMemMode:1``
> +    This will change the memory mode to physical memory.
> +
> +``maintenance packet Qqemu.PhyMemMode:0``
> +    This will change it back to normal memory mode.


--=20
Alex Benn=C3=A9e

