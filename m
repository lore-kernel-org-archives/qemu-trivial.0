Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kQ9Bf-0005ab-1c
	for mharc-qemu-trivial@gnu.org; Wed, 07 Oct 2020 09:08:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kQ9Bc-0005Zg-ML
 for qemu-trivial@nongnu.org; Wed, 07 Oct 2020 09:08:52 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:42307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kQ9BZ-0002PD-PU
 for qemu-trivial@nongnu.org; Wed, 07 Oct 2020 09:08:52 -0400
Received: by mail-wr1-x441.google.com with SMTP id e18so2069638wrw.9
 for <qemu-trivial@nongnu.org>; Wed, 07 Oct 2020 06:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=YRTHziXE3efCJEmeU85Y64K3ObXF157HZlRNDQGvv5k=;
 b=hx57rpvj2MmSAGOgTRVnnOb7B0lYNKMRlbPJcdRbt9Ew4xP6FfmFxFxjE7lYfshSRx
 /ZxD9gX8KdoVkRkknR9hrQuNhZy57uarImupyvcsmdwr7AlXyFGadJeG3b1vwNN9sDrc
 b2HQjSqXJYtc4M3L8UoE7VetAhW6K4SifWip+2sbMOiqCGMMJz5zfLu0VpRAjhun23Ux
 4C9b1Vv5PPtpUki/OkVM+raywwQqLWA0jrW48j3hz5G6/7nOxTNu+jxppgMaivxIy03I
 qkWM4skqGHeQIdA8s2ttHZebg7QluA06lDtNr+vg0Pnn3SWiZWpLw9JrulLmn5LZiPPM
 iTsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=YRTHziXE3efCJEmeU85Y64K3ObXF157HZlRNDQGvv5k=;
 b=fH2Z7KBtkxSAsoJYufloHv4kr2cmSM23o6vI2VwAMTj4F7HJNYSexjkO1iBsivLt+m
 iVJfLcJntNcdS/WZYk+YjQen+bHQ3cgkJ5Uby642Riucp3MRyPnzEBiI5PeOSyUIoHVW
 hi7v1TLEaFlnPFmzxru0lekcMxaBx+R1wD8h8jNlTbmQ2qeRfHIjxfJ+ZgBisVSK7vbl
 +BHrusS9UhEml9PqlcgggMIGXz90UtHcBeI0EM2lFGc6o4dpcmOSbArV7jYwHSJ4IhDP
 n5dU6Kn/j0jQidptqJX58WbmWIja3yEKYpbLynISDsQ5YILBBmNCU4dS+gOtpJ251COq
 dcww==
X-Gm-Message-State: AOAM5328lAbuZ+h8Pb9ATvVWQfjdZ/kzZrBMQU44CLALdrJKJmJ67riO
 C+vB6UHsyUyC1KBMQ4Y7RaY35g==
X-Google-Smtp-Source: ABdhPJzgiz9g0/KxEpfHHqyWsRAx+Cf+uhu/MorLH9Ff7j+2xCeUh2Wa0k8dkNSS9a/lP613HyCmOg==
X-Received: by 2002:adf:ea52:: with SMTP id j18mr3385255wrn.422.1602076126863; 
 Wed, 07 Oct 2020 06:08:46 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n2sm2863811wrt.82.2020.10.07.06.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 06:08:43 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 199311FF7E;
 Wed,  7 Oct 2020 14:08:43 +0100 (BST)
References: <20201007105518.1019-1-luoyonggang@gmail.com>
User-agent: mu4e 1.5.5; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Yonggang Luo <luoyonggang@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth
 <thuth@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 0/2] Improve cirrus msys2
In-reply-to: <20201007105518.1019-1-luoyonggang@gmail.com>
Date: Wed, 07 Oct 2020 14:08:43 +0100
Message-ID: <87zh4yyyhw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x441.google.com
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
X-List-Received-Date: Wed, 07 Oct 2020 13:08:53 -0000


Yonggang Luo <luoyonggang@gmail.com> writes:

> Fixes the broken msys2/mingw ci and speed it up.

Queued to testing/next, thanks.
<snip>


--=20
Alex Benn=C3=A9e

