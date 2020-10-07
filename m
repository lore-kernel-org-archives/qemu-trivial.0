Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kQBpz-0003Vk-5v
	for mharc-qemu-trivial@gnu.org; Wed, 07 Oct 2020 11:58:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kQBpu-0003TL-Hx
 for qemu-trivial@nongnu.org; Wed, 07 Oct 2020 11:58:38 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:51575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kQBps-0000XL-6P
 for qemu-trivial@nongnu.org; Wed, 07 Oct 2020 11:58:38 -0400
Received: by mail-wm1-x344.google.com with SMTP id d81so2892954wmc.1
 for <qemu-trivial@nongnu.org>; Wed, 07 Oct 2020 08:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=2drdNr/M1U24UH3JKKtdMLm6a3hL9FeW/33oM5mx0SE=;
 b=lozlnULpkc06EfM0cZx3HuvOvijJg09n1WmL4wUOp9C1FypkBya40TBQAroaG2pWZX
 z82FY9dmxMvTPG046KahebuEOcv8BSLuCGV1m/nkz+DIQUrwqogCB/0nhg2wZfxWht43
 Y38TVcofS8COPSb/tV6yJkroE+bzfdCJyIe+WvlyypmRMeqd/H8JMBKybqXSC2xSeybO
 jSCiS06bjdZL+yM1t17X8wKJTFFUBMr+3N3MbJdd5NDY67Va5FDQegOa+j3XBVR1d7Rw
 HWXyBPm7SiI/tZLzhRywnZ/b/SS5ZW/ghh4/wGgaBwa4ZkP1WBg+lMB34+sfpPzCUMW9
 taSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=2drdNr/M1U24UH3JKKtdMLm6a3hL9FeW/33oM5mx0SE=;
 b=Lnf+f5crmsuM+jpM+G9wfZtWdPRGDXnbjiGquz009XYpYVfVZiO+DqcpFPZIpwypWS
 0p7XZZTN1H339mZ4MpPY1xi486d9phXjPRloVOvOA5/isw/kyPMA+rDDJegZQo6dI2ho
 BxXR2qMVIpIxjYIvk0kc+mxmxsLkOcOJ4zHzbEHAlQ2kVC7uBckKopZguMYoC3PZvB8Q
 pUnBNSXogY+6SqHxPH5BR+SKrHT6KyXPYfC2Y//iCl2sQsvpHuwnvwG+GrEZ2CKyt6gN
 1kuyBAwMS6fSgKfWRGmgtSDsRFM1JtHxEFxT0zLYPPHW3b+wI/yoNsCBPpFg7J/GLKp+
 /+AQ==
X-Gm-Message-State: AOAM532Zlk5O7r54jdtqOG8+z+MfyeBG/VwwvaprC0S37Iv575Gdss4v
 CdQQeahd5YHi4Jfww9PP7Qcj5A==
X-Google-Smtp-Source: ABdhPJwXNwYFQWjiX1GcAr7Nz7VrvmvQiSbJ8gFFU5M5cw1Po3jxOoP97adxK9vUC2m0sa/K2hQEBA==
X-Received: by 2002:a1c:ac88:: with SMTP id v130mr3959424wme.43.1602086312699; 
 Wed, 07 Oct 2020 08:58:32 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p67sm3258951wmp.11.2020.10.07.08.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 08:58:31 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D86851FF7E;
 Wed,  7 Oct 2020 16:58:30 +0100 (BST)
References: <20201007145300.1197-1-luoyonggang@gmail.com>
User-agent: mu4e 1.5.5; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Yonggang Luo <luoyonggang@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth
 <thuth@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 0/2] Improve cirrus msys2
In-reply-to: <20201007145300.1197-1-luoyonggang@gmail.com>
Date: Wed, 07 Oct 2020 16:58:30 +0100
Message-ID: <87imbmyqmx.fsf@linaro.org>
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
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 07 Oct 2020 15:58:38 -0000


Yonggang Luo <luoyonggang@gmail.com> writes:

> Fixes the broken msys2/mingw ci and speed it up.

Queued to prepr/misc-testing-gitdm-plugin-fixes, thanks. I renamed the
script to setup_script.

--=20
Alex Benn=C3=A9e

