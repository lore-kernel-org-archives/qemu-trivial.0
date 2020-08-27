Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kBHUT-00026G-U1
	for mharc-qemu-trivial@gnu.org; Thu, 27 Aug 2020 08:58:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBHUS-00025q-6G
 for qemu-trivial@nongnu.org; Thu, 27 Aug 2020 08:58:52 -0400
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:35304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBHUQ-0000if-LP
 for qemu-trivial@nongnu.org; Thu, 27 Aug 2020 08:58:51 -0400
Received: by mail-ed1-x541.google.com with SMTP id ba12so3727851edb.2
 for <qemu-trivial@nongnu.org>; Thu, 27 Aug 2020 05:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=znbRqtNim8WpwSphr2Jif35lxatQTIMyD7IaVe0VZ9w=;
 b=j1aJlF1JsDiuZRFA1IlNaW9XWhS9Wutssv/XaacfhEXBPV/eHccmZYU66c23P7N5RD
 AWiGHntZglrDUXvqv5EDBISiUe8iMuvqaeZDYdG2JAD63mENSHQcWZVQVyxIX9qqvrH6
 /JE6rPeQ/NWHsfGTguQd/hx/NiXiNEV7fjkYIQPMGo80S7HmUhDLhgbk2Nq0fjzSr3Tm
 DnfIliyHgaNn4m/UYDJopG1S5WZQ/BGef9bUiWpMlJSSkqvR3wvLtRtfgeCL5byojOSg
 xeYVY3hsCulXYtp2ys/W5VqlNDYU54d21/8k4s5PPVjlRfBbEMjBiP7IRL89/Kvf/NtK
 sgEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=znbRqtNim8WpwSphr2Jif35lxatQTIMyD7IaVe0VZ9w=;
 b=dTZDibsAVHMOljLuyo8De8BhJnbf8NDfCOyYpLmMx7FpAE8XWlUqaYqohVsYmcVlOw
 Enzde33deN3BgxkF6em4ckbSowlW4uQxWeD3fPGo0rPac6O68F2sz5/LFrYXfbOZ44aS
 ACE5DYmQ3q0iBD3VH/r5jtgb1CcQloF91m/8u3EvmMvjm50B//xuIXO01xR9hUBjL0yH
 d2vycD6dRUJPuSYTK3g/ZcE8+CZnuuxYJQBF3flK9a2OdatSnL6M2w9jW7TIeHw93Rk1
 oyLAmyFZYyBVmoG3j00bPUS/6wZVUVgr+kyertd5U1zd8FjGKOnPkpLBIAttTZn4JIqW
 KpRg==
X-Gm-Message-State: AOAM532MOR0Mw1WeneYZOeAKXi77025VAPLvld4gT2YokRuUAD9DBRTE
 wTJL5pJIHJocwRC8nCUuvHGmEy9PKxPTZ4uSqmtF6Q==
X-Google-Smtp-Source: ABdhPJzLB+Y7NUeFI5pq2FDPMzs6Cvg3UUVGVfdxvnz6ysdkuz9/sruMderRuA8hsB47uKqfyHdsZ33wyF7vZSb47SY=
X-Received: by 2002:aa7:d596:: with SMTP id r22mr20081606edq.204.1598533129170; 
 Thu, 27 Aug 2020 05:58:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200812190206.31595-1-f4bug@amsat.org>
 <1ccf070b-7abd-ebfd-2788-92a81b4fc8fe@amsat.org>
 <CAFEAcA-nLLM3dqC=71JSfu9+8=xsnpfavD0Wk4Lkuf+EOytgQA@mail.gmail.com>
 <CAAdtpL6_dxhkoBS2hK8O_8Qj9s-MAtRnrBOTQZyTAEkW5Xwz1A@mail.gmail.com>
In-Reply-To: <CAAdtpL6_dxhkoBS2hK8O_8Qj9s-MAtRnrBOTQZyTAEkW5Xwz1A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Aug 2020 13:58:38 +0100
Message-ID: <CAFEAcA84b3WG5xDg18r4_XK2kZfQcBBqsmAxhroAg2ECbV+MmA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] hw/misc/unimp: Improve how offset/value are
 displayed
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x541.google.com
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
X-List-Received-Date: Thu, 27 Aug 2020 12:58:52 -0000

On Wed, 26 Aug 2020 at 10:55, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>> What tree were you expecting these to go in via? Probably worth
>> being specific about who you're pinging in this kind of case ;-)
>
>
> Ok understood for the next time. In this case you are listed as
> maintainer :)

Oh, so I am, I had forgotten that :-)

Anyway, I'll take it via the arm tree. My point was really just
that if you're asking for something to be done it's useful to
specify who you're asking if it's not completely obvious, because
otherwise everybody's liable to assume somebody else will be
dealing with it...

thanks
-- PMM

