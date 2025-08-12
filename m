Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37EC8C87FCB
	for <qemu-trivial@archiver.kernel.org>; Tue, 12 Aug 2025 11:12:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1ulmur-0001aT-UP; Tue, 12 Aug 2025 07:11:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ulmuq-0001a4-IG
 for qemu-trivial@nongnu.org; Tue, 12 Aug 2025 07:11:40 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ulmuo-0001jk-D9
 for qemu-trivial@nongnu.org; Tue, 12 Aug 2025 07:11:40 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3b79bd3b1f7so2492825f8f.1
 for <qemu-trivial@nongnu.org>; Tue, 12 Aug 2025 04:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754997086; x=1755601886; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kzWqb5vkHVbcsTYcm6j1FZk0lDweTnTqevRxe8zjdi8=;
 b=EAskxyJAlXDN+TI5lVRlb5gKAmRjW1jrrjIM8lS8oUvjAtgGacD7eyGWO6wzylfVh3
 jEFYzzKonMaZoWwI5D8xy4lZMmoVQjm7PLtR49tUnE0C1NNlHXfTx4u6yWqM25y5A2cv
 1K3VDZ2JwApOOIjDY3SVBe80SQ4vb2ceO47FYEyPyVot/RusjIYM1MgEmbzlbbh7Rc2L
 iVJ7A6sRgVDkcOaDiukymEpyPazi9tN6TBeuwW6y050u6xwxeGAnkCPyz4kDeVzRPtGN
 6b9BKkf55HdzG/rq8K6HcHAgnCMgCv8+JrIzkca9kqWwKNLBSPAPza2jGbWFX9MNyuW0
 s1TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754997086; x=1755601886;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kzWqb5vkHVbcsTYcm6j1FZk0lDweTnTqevRxe8zjdi8=;
 b=avRzhNuUK5HDtYIfxxBFYNlFVdTmEa6o5LS7eU9pDkpTHeISMKUHqFNY5SRgruwIT/
 ax0v4JksjgrweR5NblyCWZfXKf9lsfEXFoqANf3QjCdYj5LnhAYzcaWUFYlUx/RlridH
 lkty1lXozCymc3Luu56nIgDbCw18qVsgD2+bRnmZ/CG2gkNfvpl5m/uscbbX7kgIGp+n
 2VxF1C4AptzmJbEdPhenL0CJQCf3VeDgfXZVnn6w7GS0fpE4x5GPG1bsQERiMpw849uK
 RL399Aq9qK1JSfh2osXIK4XcKb03iWIQTWRd5mujxY1mprvogz5znttN0d/QvWLWJUdO
 Wj0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRDgdyL8WbRI7Mb8gkeq/oRa9ESJnNPznQN6WHT8dGBHglLe1F1cKcJueMzLjM8iqRY/Q8Ali6K3WgUek=@nongnu.org
X-Gm-Message-State: AOJu0YyDAj5rJSle2JHo1XPqjmmbPaGyG6eSv6voEY1Rn9NX+Jg7sthh
 b7ZPs9OIdHjwhHchzcTDEmNCtB0prISMCamUdnqnY12l2vrKgSUqUGiXZASD7m/65c4=
X-Gm-Gg: ASbGncvstyOunUK9lRef5PJxdjVmO+rfWI9UwJgBhRSTPY2dX2txYFnWnJ3zA0ZeA6/
 AcKNMWd0HoYvYFBJ8Ya8YD3suBsMH9NTcI95mLccQJokf+OfzGTavHOa00jVbP6XnpX0hpnM26x
 Op91iyj5g+jEbrMMeU7dkXoHkOAo2+qo84A4x+Rb9MZ1g4fjfiPGYmGn5aBGt3uQ3iUra7q9eG6
 3tU7GNp1fgX+bNIFKrJQbTaxl9ZuwCiU58L5mAol/y1rIRjg6Zzh15hYJwKm4qcOHOuO7t7up5s
 /tHJr/6yJqZqGeP5Hj3K0OD4qAJ7EWXdvqh5HojazH0DaU4TxnokEr/0Pj4pFBAF4aWgutitBdm
 9EpZj+I1VpQvdWTnd7jhO0dk=
X-Google-Smtp-Source: AGHT+IFI1YHAFIVL40vLbs9Tk2jkICv0UGDg2n/QBOr0RjpV+ynX2k/hubMP7hGWaZ1pra2HEYIC5Q==
X-Received: by 2002:adf:f645:0:b0:3b9:1443:ae1 with SMTP id
 ffacd0b85a97d-3b914430ef7mr939604f8f.2.1754997085808; 
 Tue, 12 Aug 2025 04:11:25 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3abedesm44332840f8f.3.2025.08.12.04.11.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Aug 2025 04:11:24 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id DAF285F7F3;
 Tue, 12 Aug 2025 12:11:23 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-trivial@nongnu.org,  Alexandre Iooss
 <erdnaxe@crans.org>,  Paolo Bonzini <pbonzini@redhat.com>,  Mahmoud
 Mandour <ma.mandourr@gmail.com>,  Pierrick Bouvier
 <pierrick.bouvier@linaro.org>,  Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] scripts/coverity-scan/COMPONENTS.md: Add a 'plugins'
 category
In-Reply-To: <20250811094341.91597-1-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 11 Aug 2025 11:43:41
 +0200")
References: <20250811094341.91597-1-philmd@linaro.org>
User-Agent: mu4e 1.12.12; emacs 30.1
Date: Tue, 12 Aug 2025 12:11:23 +0100
Message-ID: <87tt2caj6s.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Cover the TCG plugins files under their own Coverity category.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

