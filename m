Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gqghZ-0000ve-Gy
	for mharc-qemu-trivial@gnu.org; Mon, 04 Feb 2019 11:02:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44648)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gqghX-0000uQ-Ox
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 11:02:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gqghQ-0005Jw-S7
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 11:02:27 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:44288)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gqghP-0004Ci-EL
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 11:02:19 -0500
Received: by mail-ot1-x343.google.com with SMTP id g16so527690otg.11
	for <qemu-trivial@nongnu.org>; Mon, 04 Feb 2019 08:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Qs5FRvyG4gm0FwbDZ0Oo7jGLVO5m7gSxsUBeG2aIkXE=;
	b=fnX0CkmYcN1nvEBFm3TshgKV/opdl/mYScHeexRhXBtFhwzfAN31vycmLLM8qrd/0x
	DlfO5t6ZYt3iGjkRJChqHXHC9SJumI2OCTt/J0QSWxYfd9B0LnM3iLqifgfIHHoIoP98
	DwYatQ0E0d5sCqy1ps1np3H8HTUwf0ZLAsdos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Qs5FRvyG4gm0FwbDZ0Oo7jGLVO5m7gSxsUBeG2aIkXE=;
	b=ZVW5ECk5HpkQTAKNIaBnBa33HOqil61CfRibs/OoT5F0VnvlTfywakXlXTo2CwwMYL
	mhNYMnPrpWM0VHkmKDT7hB+qkC6/4iWWbVUOi38LmlBKVccZRPBreq9kIdTsiUz6qyIn
	DpkI7qWQ40uqTn7+qyNpWJuf/Dzz4qd8uZjLfZSVLh2njX1NxSnMeEuDh7hUwOzc3972
	LqWOrT6F6QoB8/+/w7SPa7B0RmB4LdsrZd3eLxfyqBbF6kLIvoQUgf0yfFYGCTntSUh+
	GBCHTw4etTiFQxTiCjCyMOt9FcaXkH0rIqam/EI6x34SFC7Dp94lPWu2Uf1wH3ch+3Zd
	yuvw==
X-Gm-Message-State: AHQUAub42tIkxG14iCYW+6D7dGaJVFCN1dDHi0IBLag2cj3AxHSrmhcl
	Vum1C96ogteQdYzBy9rE1O8J4C5DSy4CaCd5dcwdaQ==
X-Google-Smtp-Source: AHgI3IalkUY4OHBfo0K5dMLhiFJUUDQWZ96xOy5KddNAuRSc64Vkniu4k+l9a79EWP1CFvWAerT75VdXDd51G5nPSV4=
X-Received: by 2002:aca:2dc9:: with SMTP id t192mr7637oit.325.1549296097454;
	Mon, 04 Feb 2019 08:01:37 -0800 (PST)
MIME-Version: 1.0
References: <1549268743-18502-1-git-send-email-thuth@redhat.com>
	<87o97r4s8l.fsf@zen.linaroharston>
In-Reply-To: <87o97r4s8l.fsf@zen.linaroharston>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Feb 2019 16:01:26 +0000
Message-ID: <CAFEAcA9kiRkx0-MRTrvUcDQ+wGZ9KGS44-2+0tSsjgbJY83ieg@mail.gmail.com>
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, Fam Zheng <fam@euphon.net>, 
	QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, 
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tests/docker/test-mingw and
 docs: Remove --with-sdlabi=2.0
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Feb 2019 16:02:28 -0000

On Mon, 4 Feb 2019 at 13:35, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
>
> Thomas Huth <thuth@redhat.com> writes:
>
> > Patchew currently reports failures with the mingw docker test - this
> > is due to --with-sdlabi=3D2.0 configure flag which does not exist anymo=
re.
> > Remove this remainder from the docker test and the docs now.
> >
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
>
> Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> I'm happy for this to be applied directly by Peter.

Applied to master as a buildfix, thanks.

-- PMM

