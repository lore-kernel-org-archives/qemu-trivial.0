Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dhEbN-0001NH-10
	for mharc-qemu-trivial@gnu.org; Mon, 14 Aug 2017 08:36:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45195)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dhEbL-0001LY-0m
	for qemu-trivial@nongnu.org; Mon, 14 Aug 2017 08:36:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dhEbK-0002Ir-4o
	for qemu-trivial@nongnu.org; Mon, 14 Aug 2017 08:36:11 -0400
Received: from mail-wr0-x22a.google.com ([2a00:1450:400c:c0c::22a]:37771)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dhEbJ-0002IC-T1
	for qemu-trivial@nongnu.org; Mon, 14 Aug 2017 08:36:10 -0400
Received: by mail-wr0-x22a.google.com with SMTP id 33so33983887wrz.4
	for <qemu-trivial@nongnu.org>; Mon, 14 Aug 2017 05:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9MKFe39DT1bgDhX0gF2Z8950I+VezsxNwfnCPGRV208=;
	b=TiyJPCboHTnJt/TOumbw/BRwlwyoPckLG2TvuV3cnerJ0nm4Uzdv87TSN5yNLPHg0Z
	asyFrgpzcoEQKQTPI0oUE7uc9gSiAONZSRMTsv+gTLwhIFomN/sQdjsxexbEE2qKEB8P
	KNTXWBa136/QPKy5wXWjUnARiLRjPxSqCaOiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9MKFe39DT1bgDhX0gF2Z8950I+VezsxNwfnCPGRV208=;
	b=caR0+5Qack0z/X90CuxCmaS9eS6cQQwnp5zaPcmrE5xJCQipGU+lpcoV4y8Ig8oat3
	oe2nhm955tP497OGYPf+f9TSrDe0Z+hNel47UxxdFohM5nNfZfkqYwvWdz5MnOFLwdr2
	V/pvFnN6y/71+NTTx895JP3Ye5KWVjlQDyKSjTD6hTI+3gaFrBZ4zFR092eBVx6ACipL
	D3tswErkM+5q2wSl7dJQog1Q830/QWCijZioMs8uPdZzHJSH/UbWV/qDqXFJDZ2E6ibk
	/xqcdReMTuH+kpfPKsDLgBoyDdJu8h7t/yAGYvAfY6To6RNNLJnHZUuydowKUAJQL9cd
	hzXQ==
X-Gm-Message-State: AHYfb5iYcOILAURI1tZPh+gVv1X2/LY0CMPq49D1a6nbC4HxOioCD+UU
	/BicoSZVx4UyG0KI+KNOWbf1bvVG8+SZ
X-Received: by 10.223.165.138 with SMTP id g10mr15098799wrc.167.1502714168801; 
	Mon, 14 Aug 2017 05:36:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Mon, 14 Aug 2017 05:35:48 -0700 (PDT)
In-Reply-To: <cover.1502708830.git.mjt@msgid.tls.msk.ru>
References: <cover.1502708830.git.mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Aug 2017 13:35:48 +0100
Message-ID: <CAFEAcA-AwJBev+SDuKz129+0WBvAP2wefzn2p7jwu-bCTjoFUQ@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22a
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 0/7] Trivial patches for
 2017-08-14
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
X-List-Received-Date: Mon, 14 Aug 2017 12:36:12 -0000

On 14 August 2017 at 12:07, Michael Tokarev <mjt@tls.msk.ru> wrote:
> There are just a few small thigs, I've omitted larger series for now.
>
> The following changes since commit 9db6ffc76676731a25a5538ab71e8ca6ac234f80:
>
>   Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into staging (2017-08-11 15:11:50 +0100)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git tags/trivial-patches-fetch
>
> for you to fetch changes up to a808c0865b720e22ca2929ec3d362d4610fbad51:
>
>   hw/misc/mmio_interface: Return after error_setg() to avoid crash (2017-08-14 13:06:54 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2017-08-14
>
> ----------------------------------------------------------------
> Cleber Rosa (3):
>       qemu-iotests: get rid of _full_imgproto_details()
>       qemu-iotests: remove commented out variables
>       qemu-iotests: remove comment about root privileges requirement
>
> Eduardo Otubo (1):
>       unicore32: abort when entering "x 0" on the monitor
>
> Eric Blake (1):
>       libqtest: Fix typo in comments
>
> Thomas Huth (2):
>       qemu-doc: Fix "-net van" typo
>       hw/misc/mmio_interface: Return after error_setg() to avoid crash

Applied, thanks.

-- PMM

