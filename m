Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1t3v0M-00082u-EY
	for mharc-qemu-trivial@gnu.org; Thu, 24 Oct 2024 06:23:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t3v0F-000821-Qr
 for qemu-trivial@nongnu.org; Thu, 24 Oct 2024 06:23:41 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t3v0B-0007VP-Ap
 for qemu-trivial@nongnu.org; Thu, 24 Oct 2024 06:23:37 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-37d4b0943c7so484145f8f.1
 for <qemu-trivial@nongnu.org>; Thu, 24 Oct 2024 03:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729765412; x=1730370212; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=u8yCiViDHhU/JoC7HoI+6GT/YVXrZnCmwOJeWprysjE=;
 b=RwQLTDi0YfzUfBh5prQYbLikpXYBAboQufU1AxxVcgJ8aLnTU4Sbm81XSj8hACJzTD
 oCDh8dtZ3qtkpKidMpjubpzIMydYTyfPdQrOO5dZ+Fep7Tx3LrTBAcYq1I0VieIHq5aw
 eh221DPqnmdJS2huII2UZJ0w1gmMgpq4kR0OdpcSPBI8OlC6ik3BvY7rafZfi1oCdYaw
 p1ByXJPOrq2mZnQqX9XYu6ROXsBvsBnAL8dWidhExkOQhlYrz+wnZyCYLXtGfE5KDue7
 Jr2bH98bReJGZOtDfwj+wIwG7F7Eb5CIOKXSsROKh45TqUeRb+AlL+TYjJvSpRhqVbJu
 kYxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729765412; x=1730370212;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u8yCiViDHhU/JoC7HoI+6GT/YVXrZnCmwOJeWprysjE=;
 b=atl7RehqHqPgXjd5g6zmD0wnjxLuVcQiUHWO0bGs/m1/xIL4NXH0fv5/f7SxFpVUcK
 v6RjHQLdY+n7WpmqD7To7uMbbVQvbF0NxoYTN+ysxYjNN7I3ZNCTj/xgQlegLr27mo7T
 BY1mFUc2CMiT3jG1Aq7rrrFGFhiG4mK9x6VJXHh7VPWs8cIpaZ3965a3s3P4thzEOcL/
 RRyaVvUZrtzZJBple/c6yIgAuNBqL9Ht5jr5TG7+S6k7gSStKMHiIenVIhmv1cVB1dyO
 dXuKItvmw7Tc74bIa1pjGqeudfV+wAfJ9+rv3jRNj+v77A2vDUDXJf5ckbmZNuS+Jj+h
 hkiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSIvlIicTOFakIEfZpKyracR+MfcK6q8ec8HY67mm4r705DH61hlauUeVKBFd5uXXRzYUrz3MLS6eRpng=@nongnu.org
X-Gm-Message-State: AOJu0Yx6NtVuDur/JE5kf8FCcM0u+pK+fSQCjGpvAsmNlvan7oedQsGt
 jlXjT3athOfXLFXKQnS7o1NLBb5anHFae6ZBLp3W46nsPxiCF7q/hAgRZcPGP1IoYnUonrgLM0Z
 9oniKn/Pu3mnAveLZoVvKPOAzjctJiSaajmJhqrt4NiBr+meK
X-Google-Smtp-Source: AGHT+IHbT9y73W6rkexFcedasOsEPUrpFXN4/f51UMTPKqJhIx7JC+j7K/VDjVI7GaJgVEOiMBO9tskT3fLVfLeCGw4=
X-Received: by 2002:adf:ef03:0:b0:37d:493c:f7b8 with SMTP id
 ffacd0b85a97d-3803ac84066mr1047826f8f.2.1729765412023; Thu, 24 Oct 2024
 03:23:32 -0700 (PDT)
MIME-Version: 1.0
References: <20241022061533.1304493-1-mjt@tls.msk.ru>
In-Reply-To: <20241022061533.1304493-1-mjt@tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Oct 2024 11:23:20 +0100
Message-ID: <CAFEAcA9dULCs15JWsvX2AhQ801sj7hxUN=u3Xh827a4yRTvKpQ@mail.gmail.com>
Subject: Re: [PULL 0/5] Trivial patches for 2024-10-22
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
X-List-Received-Date: Thu, 24 Oct 2024 10:23:41 -0000

On Tue, 22 Oct 2024 at 07:16, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> The following changes since commit cc5adbbd50d81555b8eb73602ec16fde40b55be4:
>
>   Merge tag 'pull-tpm-2024-10-18-1' of https://github.com/stefanberger/qemu-tpm into staging (2024-10-18 15:45:02 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/mjt0k/qemu.git tags/pull-trivial-patches
>
> for you to fetch changes up to 5ae3ec63631a907ba474094df99594cd545590df:
>
>   replace error_setg(&error_fatal, ...) with error_report() (2024-10-21 22:40:47 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2024-10-22
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/9.2
for any user-visible changes.

-- PMM

