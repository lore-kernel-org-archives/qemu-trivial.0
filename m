Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD93CF6C1B
	for <qemu-trivial@archiver.kernel.org>; Wed,  7 Jan 2026 09:26:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vdPnd-0004yE-5Y; Wed, 07 Jan 2026 04:25:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vdPnX-0004xp-QY
 for qemu-trivial@nongnu.org; Wed, 07 Jan 2026 04:25:49 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vdPnV-0000Pr-HN
 for qemu-trivial@nongnu.org; Wed, 07 Jan 2026 04:25:46 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-477a2ab455fso17283635e9.3
 for <qemu-trivial@nongnu.org>; Wed, 07 Jan 2026 01:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767777943; x=1768382743; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Je7EhsBvdhIN5eIEAnez63qUunUFd+qS+5QonGAu4wo=;
 b=nvyNTo7e2SgbR+48HiNbp6xb3AIsxIt/M6eKfSxCBZhh3OiV54538T+LKbm1fIOlOW
 5Cwsp+8gIFBHv3nb75ECP6J5I6n4OeGFZ5YSAnvZZOSflb1t8Q2Gybt3Nc1NrvuohAkq
 17vXgCECi1iQze21UkLPbzwvWaql6cufK9Qm7aE0GDd6+1MD51zyyc5KBXfOYuPr/9i0
 oiasyncxuZDYySaGvRtnObPA6YdhNxJx9QtH1MSvVzrajHX9cktlgq5zANl/tF6UuIQH
 Djr8XC+E/ItHrlHe+d93yhq45UEkh6Sfoej9hUPpndVZzzsL8KPxnq9+ulTaLKCfsMHY
 9BMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767777943; x=1768382743;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Je7EhsBvdhIN5eIEAnez63qUunUFd+qS+5QonGAu4wo=;
 b=b8lTgrSiI3BC1jWy8ffx3zFBBmJn/O/oTp9l8nT4QjNInJ51fTH4qeFyWZkkvwZ3EW
 VmPnji8EdQdm7vT16W6/YgqotGxpu1Hcn34GP+UYL0WKb3HUWwNMBPrIKPPIxPnGKUw0
 MI5DjUPdEUaJL0sqR0lteNbtDDgpy1hnLCZ3ufGa6LxF8POz9msrMFIam8DuHMBNskSX
 FQZna0JMddzUPMdXvCK5FDH4V+5Gom/SqUVjJrdj8fR1TIQQUPk+WwT9TomoRsjc1KB+
 EzsrV3GkSnm7QUXJoToX4aCC/zq+d6WCP3CMnmgqlDFx20peVgCjV4MhUuwpgRBk7L9j
 m89w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTs56J1gkfqaiBhFLwNQMlpn2ztl0CyvoEaTlory5luJyhgQ0xdgdnxE2uZe0U+j21sIeEpZCv3T2tQgk=@nongnu.org
X-Gm-Message-State: AOJu0YxRPSUGivjT2YPEzj1q3Pj0dSR8ENyvz7Gfq2Gb/Md2Or2muxFs
 JB5lgISBa+H/Kez2rny6HhtZryQ6mjNinQXntXWJ0VQXJaSrnIj7YfDdkF5J9KrMeUk=
X-Gm-Gg: AY/fxX6RSiz2DzYu2vdpTjp1IEcTEoKRpIWyzbjdTRogPlch8V/k4txv6+9V+JvOY/l
 tczTS+5+HAoFsnNYfVWD5zvB53fvPyAYSmXc9414hbw5Tdj+g9WOYMGYELfaOFD/bvALdGsljv7
 D4MaIGLIf90YVl+hhaWnY6bhn2w0cRCy1ed8X6Hv5saHHs8++9m3PFeagTLvhZ94opPV7Kb5xmp
 22ZGRzmdTdBkySZHFvq5vBze8YgmrowhKpaCMuhvrAm8+ycKEDbaaAF0hvzRM2gkTpjT6Y3hVeG
 SC1id+vqjKoBgVJzymE8E9aSUJQz4uqlM3gmx3Vtg3taf8dftPpD/dWx7obLzBh46NXEFjoOf6/
 qhzI2e6rJoa5SXIQ1Fu4ik8aP1by2dBFgnt1+VBGsU75UbvKwlfxCFfoZGfd97PDfuF2mdClRjj
 eJHgXoj0ADiLo=
X-Google-Smtp-Source: AGHT+IEz3rOurTUKvL1xIgIpF4X/aMzCXljazzGuN6wKN8vMIctd+t6nllLIE2CeyP+yp0b6GAiyPA==
X-Received: by 2002:a05:600c:3110:b0:479:3a86:dc1a with SMTP id
 5b1f17b1804b1-47d84b41176mr18436075e9.36.1767777942711; 
 Wed, 07 Jan 2026 01:25:42 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f70bc4fsm85811945e9.15.2026.01.07.01.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 01:25:42 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 455E85F88E;
 Wed, 07 Jan 2026 09:25:41 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Yodel Eldar <yodel.eldar@yodel.dev>
Cc: qemu-devel@nongnu.org,  qemu-trivial@nongnu.org,  Thomas Huth
 <thuth@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,  Daniel
 P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH] tests/functional/qemu_test/testcase: Fix mismatched
 quotations
In-Reply-To: <20260106220319.74785-1-yodel.eldar@yodel.dev> (Yodel Eldar's
 message of "Tue, 6 Jan 2026 16:03:19 -0600")
References: <20260106220319.74785-1-yodel.eldar@yodel.dev>
User-Agent: mu4e 1.12.14; emacs 30.1
Date: Wed, 07 Jan 2026 09:25:41 +0000
Message-ID: <87ms2pai5m.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

Yodel Eldar <yodel.eldar@yodel.dev> writes:

> A debug string incorrectly mixes single-quotes with double-quotes,
> causing the variable within to be treated as a literal. Fix it.
>
> Signed-off-by: Yodel Eldar <yodel.eldar@yodel.dev>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  tests/functional/qemu_test/testcase.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/functional/qemu_test/testcase.py b/tests/functional/qe=
mu_test/testcase.py
> index 58f2740100..ff86c9d187 100644
> --- a/tests/functional/qemu_test/testcase.py
> +++ b/tests/functional/qemu_test/testcase.py
> @@ -349,7 +349,7 @@ def require_netdev(self, netdevname):
>          helptxt =3D run([self.qemu_bin, '-M', 'none', '-netdev', 'help'],
>                        capture_output=3DTrue, check=3DTrue, encoding=3D'u=
tf8').stdout
>          if helptxt.find('\n' + netdevname + '\n') < 0:
> -            self.skipTest('no support for " + netdevname + " networking')
> +            self.skipTest('no support for ' + netdevname + ' networking')
>=20=20
>      def require_device(self, devicename):
>          helptxt =3D run([self.qemu_bin, '-M', 'none', '-device', 'help'],

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

