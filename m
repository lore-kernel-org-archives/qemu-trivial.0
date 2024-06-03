Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sE8yf-0006dL-LM
	for mharc-qemu-trivial@gnu.org; Mon, 03 Jun 2024 10:48:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1sE8yd-0006Vh-TU
 for qemu-trivial@nongnu.org; Mon, 03 Jun 2024 10:47:59 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1sE8yc-0008I4-BA
 for qemu-trivial@nongnu.org; Mon, 03 Jun 2024 10:47:59 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4212b4eea2eso28432315e9.2
 for <qemu-trivial@nongnu.org>; Mon, 03 Jun 2024 07:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717426076; x=1718030876; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hC5oS8qcfqX2YzELOY2dv0gb1qSTe8ALZytLVFrOhlY=;
 b=Iy2D8oIWX9hpoJl++mShr/BN6w3kmtK4/2BakKbUtMp1xXt7UqTdrkrjak6gpRWxNU
 jXJerbZfNp5kd+xbdekVq+GjqNBc3Du48tozrsNlaHDrnoYjX0LTm8eOHcXitOZAWw8P
 fA8AE5lFTR+luE+1seimRzKud7w2YbSOQONNgsbAPGvq4c35VV8grX5AAxaNHW7wwAdV
 /PosNhpR/zHBNw0SSa5e7RP417XbIOgQraWESc8pnL4pOJoVCCBt+qr+7wpDc71ufs05
 VKa4Z1SiBwFjFpDDfjJYhgRpxj4XR7FFPKah//xOw/kt9YBFfSCrmT1gxKpNJcyyovt7
 NEcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717426076; x=1718030876;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hC5oS8qcfqX2YzELOY2dv0gb1qSTe8ALZytLVFrOhlY=;
 b=CIQQnkcgVf3ibk6Wjp4NfJjU82fVvFi2G7NuVaY4WzAV9j7d8OoipwCRsxtU/Ku8Nw
 WPkTKhqkDMyc+CfyScxAXACWXN3tKSQTzJPwF8QR2L/qmIPSk2BsrQTHd13iOhb15JRh
 hG1UCZUEduZST6T+ZgZxA97i734x1MtCvTND/j+pjjOGt/AgLiqSY/gvmzAcWyxZSrkd
 ym+jbEpNyMvJDWfmN+Kto4dzZN/1OCM7KB2niwhSXNtVEY3CBF7FfFeEghuByzR59b2x
 KbtZMjWRK2kP43cvgxQ+pR/cdDAEwZRUl5+nB9MPb+XZy52i3ix+dZymdXISWz9JP9KP
 Wyng==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4MTcPTWtHgd2CnhwHJz7h4/GEzTD+COeDlywl7Ux0aEQzezp8wlibiViDDdCG8vwP48BITTu2JIqty5iRZBP1WTMiLWP3lw==
X-Gm-Message-State: AOJu0YyPen0hdZZGsQiAUHXLZ7JJk+LpPG4g6YZfZsHMCcp4FpspfLZm
 573a4tPQmBKcholLrGrXII1EoqDzwnk+xIinK9YV0wkpym3ZrIUXxD25j1EK23w=
X-Google-Smtp-Source: AGHT+IGi8Lje8wEL2iXz4QSEGSyT6isQkzbcBsBial3E0kaSBwH/VQLgri57gJ+uKrdQNPLwg7XxuQ==
X-Received: by 2002:a05:600c:1ca6:b0:41c:7bd:5a84 with SMTP id
 5b1f17b1804b1-4212e07548amr84126155e9.17.1717426076248; 
 Mon, 03 Jun 2024 07:47:56 -0700 (PDT)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4213c264714sm45251025e9.12.2024.06.03.07.47.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jun 2024 07:47:55 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 6C2025F860;
 Mon,  3 Jun 2024 15:47:55 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org,  Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: Re: [PATCH] io/channel-socket: Fix -fsanitize=undefined problem
 with latest Clang
In-Reply-To: <20240529133106.1224866-1-thuth@redhat.com> (Thomas Huth's
 message of "Wed, 29 May 2024 15:31:06 +0200")
References: <20240529133106.1224866-1-thuth@redhat.com>
Date: Mon, 03 Jun 2024 15:47:55 +0100
Message-ID: <877cf6gk10.fsf@draig.linaro.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 03 Jun 2024 14:48:00 -0000

Thomas Huth <thuth@redhat.com> writes:

> Casting function pointers from one type to another causes undefined
> behavior errors when compiling with -fsanitize=3Dundefined with Clang
> v18:

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

