Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sUTWU-00024l-OH
	for mharc-qemu-trivial@gnu.org; Thu, 18 Jul 2024 11:58:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sUTWT-00021d-3D
 for qemu-trivial@nongnu.org; Thu, 18 Jul 2024 11:58:25 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sUTWR-0001UZ-7L
 for qemu-trivial@nongnu.org; Thu, 18 Jul 2024 11:58:24 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-595856e2336so1643321a12.1
 for <qemu-trivial@nongnu.org>; Thu, 18 Jul 2024 08:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721318301; x=1721923101; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BicxdVjzUdVqK2d1Ak7i2HMnuV4H14w3G5YWcCqGOA4=;
 b=vyYrLwc6PnlDHmQDDA3avp4mIvrtmUM15q/Yp4ZFm/muC2NtdvssUOe6MHl3kKaUsq
 3a5IEvML6QBUgVEPXW9GGOxODRmn8JD5zWdGHUAJaugG1kCYw2Y+nnyimFWy2DWdHoXO
 KWgi7KlboKDMT5BJIVb51FDXWDxKdo1d8yNolIL0nnplgYkM+7p9hoaHLQzOFocMfL9d
 KopfdhjqxgWY56W0Gcs/E8VwVlq/IxXyXXmM6yy7hzdbDDJSwdVQdJFwixmFfY1aNYRC
 g/ZPLmhtCHPFFS2ZnLZMQbleqGBGnrmosO4fhpoETw97huaO91GPLKsQAYLcHbZZh3nx
 nPEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721318301; x=1721923101;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BicxdVjzUdVqK2d1Ak7i2HMnuV4H14w3G5YWcCqGOA4=;
 b=sA+LQtyvjmKJR0M4wa5GThCXX/s2KJhBIp5z7xZILGu0pzFH/de+9jV8uvMtvy9CLd
 tgE0F969l5MudUq8VoOqbH43VWIhm7FinDoxTcyQJcWajG/S92fZofRszKSVYWxZ7Xud
 ++qYr3AQ+X5JPYon89X/nOPGRsewelPRcJqDF4S1K7/cCSfG4icqoXNOVI/hUiPdVpTL
 aNhJ8joMxZBdWrPmTyRe0joQ5uhy5heNVmPCLq9uQdcTpR7v5rK52L+DzZLHU28txhKO
 VYwZr1s7MLyVfKSrRCrH7glx5wqCEFeiL73WDVb8W3Z1uk45FSy2B7WpczXKdINndR0H
 TXXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSuzu2xROTbO+YqeLJbFcEXbZDU0ccROs6g7ifR9wR+ozsGXfoG2KO1Ebl6Z74i8urbKHHRPC/BQGgnYAV/a1viO0FAq8y6A==
X-Gm-Message-State: AOJu0YyuIav0CBMJjU/ZQ9sSkAR3nOmIFBVvdaYc0QS1kumiFvERixI+
 MJYawkO42uc3TbgiVznJMnudIAWYGBUk9DF2MvuihfMRpPYZ7Q4HX6scbsicPqYsx8V+6GyYYCP
 p4VVrLBoocs1jZ5Sir1msn/AsC6Y+mdjTghZCnA==
X-Google-Smtp-Source: AGHT+IHvhgK4ZfCSRQLbTxMlLHZunR7F7ydP/EJ0rWdmOaPyNGJ/RopDZOwbj23hEg8mWmF6CNbTKdLqUu/oH5UoFdQ=
X-Received: by 2002:a05:6402:27c7:b0:58c:36e:51bf with SMTP id
 4fb4d7f45d1cf-5a1557cd64bmr3503020a12.3.1721318301492; Thu, 18 Jul 2024
 08:58:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240530111029.1726329-1-kraxel@redhat.com>
In-Reply-To: <20240530111029.1726329-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jul 2024 16:58:10 +0100
Message-ID: <CAFEAcA8ShMnj43QwhKZxPvqQ9ei3s6LBGgXHQwRvpKf98dvuBA@mail.gmail.com>
Subject: Re: [PATCH v2] vnc: increase max display size
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
X-List-Received-Date: Thu, 18 Jul 2024 15:58:25 -0000

On Thu, 30 May 2024 at 12:11, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> It's 2024.  4k display resolutions are a thing these days.
> Raise width and height limits of the qemu vnc server.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1596
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  ui/vnc.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/ui/vnc.h b/ui/vnc.h
> index 4521dc88f792..e5fa2efa3e5d 100644
> --- a/ui/vnc.h
> +++ b/ui/vnc.h
> @@ -81,8 +81,8 @@ typedef void VncSendHextileTile(VncState *vs,
>
>  /* VNC_MAX_WIDTH must be a multiple of VNC_DIRTY_PIXELS_PER_BIT. */
>
> -#define VNC_MAX_WIDTH ROUND_UP(2560, VNC_DIRTY_PIXELS_PER_BIT)
> -#define VNC_MAX_HEIGHT 2048
> +#define VNC_MAX_WIDTH ROUND_UP(5120, VNC_DIRTY_PIXELS_PER_BIT)
> +#define VNC_MAX_HEIGHT 2160
>
>  /* VNC_DIRTY_BITS is the number of bits in the dirty bitmap. */
>  #define VNC_DIRTY_BITS (VNC_MAX_WIDTH / VNC_DIRTY_PIXELS_PER_BIT)

Hi -- somebody on IRC pointed out that this simple patch
had been code-reviewed by Daniel but never made it into git.
Marc-Andr=C3=A9: you're listed maintainer for ui/ -- do you have
a pullreq planned?

Alternatively we could take it via qemu-trivial since it's
a pretty tiny patch (cc'd).

thanks
-- PMM

