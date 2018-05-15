Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fIYTA-0003MA-O9
	for mharc-qemu-trivial@gnu.org; Tue, 15 May 2018 07:50:16 -0400
Received: from eggs.gnu.org ([208.118.235.92]:55262)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fIYT8-0003JH-AX
	for qemu-trivial@nongnu.org; Tue, 15 May 2018 07:50:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fIYT5-00056e-GG
	for qemu-trivial@nongnu.org; Tue, 15 May 2018 07:50:12 -0400
Received: from mail-oi0-x22c.google.com ([2607:f8b0:4003:c06::22c]:42828)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fIYT5-00055S-Ag
	for qemu-trivial@nongnu.org; Tue, 15 May 2018 07:50:11 -0400
Received: by mail-oi0-x22c.google.com with SMTP id t27-v6so13658429oij.9
	for <qemu-trivial@nongnu.org>; Tue, 15 May 2018 04:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=f2ReTOQzNJ4a7HW20JGHZPMwsCLtWUNRZ8ue6W82Muk=;
	b=H1QrmE/3qmxx0/eJobJpXZQchrGcmEs3WjMFU0NZEuUU2UWwlF76y9B7j/FX4nXZvP
	ambEiCFgvA7/OpeqLkjmu5ljqEZz4VBboWCI34srmGWdNY3IjVNYPUOuYB+XTN4UG3Kf
	Vc6D64f+PAxcsAdX2eXzrlWkWlD/Q3K2HVFGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=f2ReTOQzNJ4a7HW20JGHZPMwsCLtWUNRZ8ue6W82Muk=;
	b=m6ame4xnvhAz/v6XNYZqrlfacmChMfWKd15F7K1x87+Vdw3zEQAeGD6uqQdyG30GX9
	VSQg+kr1OyCKQOrGcHD5G/TC9vS/3YWIEV1EmPO09vp7hQEWE3vpLuZU1f80wUi+jyHX
	jbalHLyPbp0ds/ktoeYkOG3dJpOKgd65+VRSqIZ4CgHRsf+7OwlzL7CIWm5fWBVLWkmO
	NPK/DlfwaG9qblg3yshnCs9+9ANUeFkUIxAERCD1Gks9bjiVTHyTBJezR14CNjWS3mvq
	gqfitZ1N5CRCDYvXPbqg1toIrXI7hPWZJuIE9nLOfYEIdhRCg/C9jQ/LHYvJZTDWj51Y
	p52Q==
X-Gm-Message-State: ALKqPwdW3OIGMH5VwmmTIYk5Ja5eKhqn7WpLuOLwHSmAjfMCTVHaLqhu
	ZnamsEY/1wCViod1vF55neGgJS2PsTAPX+u1jRcx6g==
X-Google-Smtp-Source: AB8JxZpsdBJs+A4vtUrRfShhKQ/YG71aVanXID3m1nv9FItfqNluAA6MB0AtIlt3Wo58TROnheYjB7o1xME8U5yJ0zw=
X-Received: by 2002:aca:f141:: with SMTP id
	p62-v6mr9691569oih.80.1526385010285; 
	Tue, 15 May 2018 04:50:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Tue, 15 May 2018 04:49:49
	-0700 (PDT)
In-Reply-To: <20180515091901.27774-1-kraxel@redhat.com>
References: <20180515091901.27774-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 May 2018 12:49:49 +0100
Message-ID: <CAFEAcA8ejSxKXhh19FzEduSriAvauSjar8atoF=CkgEW_TyWTg@mail.gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::22c
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/10] Ui 20180515 patches
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
X-List-Received-Date: Tue, 15 May 2018 11:50:15 -0000

On 15 May 2018 at 10:18, Gerd Hoffmann <kraxel@redhat.com> wrote:
> The following changes since commit fbd3a489df9953e2a5d017c922f3c103b2426952:
>
>   Merge remote-tracking branch 'remotes/cohuck/tags/s390x-20180514' into staging (2018-05-14 18:53:42 +0100)
>
> are available in the git repository at:
>
>   git://git.kraxel.org/qemu tags/ui-20180515-pull-request
>
> for you to fetch changes up to 677b490501823c1cb6946d8bb9e7907c12cd0c71:
>
>   gtk: disable the F10 menubar key (2018-05-15 10:47:01 +0200)
>
> ----------------------------------------------------------------
> ui: qapi parser for -display cmd line.
> gtk: multiple fixes.
> sdl: opts bugfix.
> vnc: magic cookie.
>
> ----------------------------------------------------------------
>
> Gerd Hoffmann (7):
>   sdl2: move opts assignment into loop
>   vnc: add magic cookie to VncState
>   ui: add qapi parser for -display
>   ui: switch trivial displays to qapi parser
>   ui: switch gtk display to qapi parser
>   ui: document non-qapi parser cases.
>   console: use linked list for QemuConsoles
>
> Peter Wu (2):
>   gtk: make it possible to hide the menu bar
>   gtk: disable the F10 menubar key
>
> Tomeu Vizoso (1):
>   ui/gtk: Only try to initialize EGL/X11 if GtkGlArea failed
>

Applied, thanks.

-- PMM

