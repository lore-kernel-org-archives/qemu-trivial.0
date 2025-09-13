Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E77CAC58E
	for <qemu-trivial@archiver.kernel.org>; Sat, 13 Sep 2025 10:43:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1uxNj7-0001Jd-Pr; Sat, 13 Sep 2025 06:43:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uxNiu-0001He-6y
 for qemu-trivial@nongnu.org; Sat, 13 Sep 2025 06:43:18 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uxNir-0007Bx-8V
 for qemu-trivial@nongnu.org; Sat, 13 Sep 2025 06:43:14 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3df726ecff3so1542404f8f.3
 for <qemu-trivial@nongnu.org>; Sat, 13 Sep 2025 03:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757760191; x=1758364991; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=roOkeYsJSJo4xShnJ5Df5hNGC4JiwdyRZWQP138uK2I=;
 b=oPBE33daqjONFTYZhJLiIoBIANdDDTFpwvLu3vjRN8qUSntcpr/y4wAAaMy9I06L0v
 KunkRcEmJJtq92WlIUUJJtiKZS3AEnw04bqUeYjh1PonPSJGkrDB8QowNBDxrnfvp2vC
 WfkeYjlo3XUEVJnPYfwvSV1DzANnc48/dwKMS+oYy0CUhLWMTedr0oPoARU/zrH3vxBk
 iphAgJwttBVcE9th4vzDC2mtHDZ9TLA9vGP14mr4BtvD0Mq8Uk9NbSu9J2AZa/qvJSYa
 JFlW57gXaNRqtRkCHvrPSGJ0oFJMh/h3oszunqoMB3uJK3Xyg3IylujhF6NemxcBLBaf
 nB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757760191; x=1758364991;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=roOkeYsJSJo4xShnJ5Df5hNGC4JiwdyRZWQP138uK2I=;
 b=J5FhzALtN9iqvYGU0+yDlj8pvrxfIE2jmNZQ8R8hDKcJgJN1KEvGy/y32PilUaR6HR
 DwhGgqqYNUiaHHihhLhxp2TtS315Q5ROA6xTjtprDnyImsYN/qQTfNsBfByWdSuPWag+
 QDQorMEsZOztYxubamIcYSanKCfRftJCFs8XfSTDszZBeMKSmyRTSFfkxndXwB81p4bC
 QRknzq+0araSFFqqA6NaSdb93uj4I11AUXZ77ZvD8CFbucCyKEWhX92U8FoEq9Bu5iiL
 H7atan6gly6PcH8/T9Ye5KbaLOeoE0ybutGdNBAw3uBslI0pxU2FyfXB+dG3JypCo0y2
 l38g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxZXab2R+dUVwivtv1whg4J6Z2aIeeBHHNTJqdqU5rTe+edgOfRNYE/8ZUqdqSjsJ2n6qPtH0CvpN2cyc=@nongnu.org
X-Gm-Message-State: AOJu0YxyhnvjjPar+d56kJoprzkKKiFxZ4DRHifDAGyRZ4845ovVYkcf
 kH7uwRIHrzUQ3+rMtSWjRMSjjqgAJ8qaYYLez3/D/pOfc6bXY5LtmA+R7hASwyufP1A=
X-Gm-Gg: ASbGncuayexiWBJ34wxQbAksIfeqttGCrBdVqHQ47Ld39X4lNVSWlPmyYqwjaMaxf8g
 GQY53YxHo2Xwxe1f9Zi/vn0Je8K0x0nJHbeBLaTR+s2Aix7U2wedZhf6ufEhHQCNGcTgRGaDB3P
 XFTzdPSAHEmFziyVdJ+7oIdZ8z7/conbrSmog3HTpy22S37mytHl4Drb5SKtqlWpJwo3ayVv9kH
 B2vNQQokpTSYefdhAp+S9uo3t/hcwPWxGScSXaaPGat3ZQ5polBqlaymB6bOQjSPzJNoleVbeJh
 0oVXsPso/t/3LvMBj96VEN+rr+ibFmeNq1rSWXoxKQjrVse1ab7NbBPFO+6Ufym6SnLEyNhzN0R
 or4/sLUlc30dVXh2RKeiK+Vb+sbi+6EJKFA==
X-Google-Smtp-Source: AGHT+IEx+ONiAdfieAwPpzl8/JhEUd1jFzsYRHVd353MkBayRTBBYAzOqAeHZGrMaK6BUbbQtK2eLQ==
X-Received: by 2002:a05:6000:240b:b0:3e7:6457:ca85 with SMTP id
 ffacd0b85a97d-3e765781280mr6510319f8f.5.1757760191026; 
 Sat, 13 Sep 2025 03:43:11 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45f28c193f9sm12327615e9.2.2025.09.13.03.43.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Sep 2025 03:43:10 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 8EA4A5F7F7;
 Sat, 13 Sep 2025 11:43:09 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Filip Hejsek <filip.hejsek@gmail.com>
Cc: qemu-devel@nongnu.org,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>, qemu-trivial@nongnu.org
Subject: Re: [PATCH trivial] ui/gtk: Fix callback function signature
In-Reply-To: <20250913-fix-signature-v1-1-974d16871432@gmail.com> (Filip
 Hejsek's message of "Sat, 13 Sep 2025 00:58:35 +0200")
References: <20250913-fix-signature-v1-1-974d16871432@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.1
Date: Sat, 13 Sep 2025 11:43:09 +0100
Message-ID: <87plbu7hvm.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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

Filip Hejsek <filip.hejsek@gmail.com> writes:

> The correct type for opaque pointer is gpointer,
> not gpointer * (which is a pointer to a pointer).
>
> Signed-off-by: Filip Hejsek <filip.hejsek@gmail.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

