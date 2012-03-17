Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S8xMW-0002r5-MD
	for mharc-qemu-trivial@gnu.org; Sat, 17 Mar 2012 13:24:16 -0400
Received: from eggs.gnu.org ([208.118.235.92]:59004)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1S8xMT-0002pf-T7
	for qemu-trivial@nongnu.org; Sat, 17 Mar 2012 13:24:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1S8xMR-0005tw-3O
	for qemu-trivial@nongnu.org; Sat, 17 Mar 2012 13:24:13 -0400
Received: from mail-iy0-f173.google.com ([209.85.210.173]:50399)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1S8xMQ-0005tT-Ue
	for qemu-trivial@nongnu.org; Sat, 17 Mar 2012 13:24:11 -0400
Received: by iafj26 with SMTP id j26so8048008iaf.4
	for <qemu-trivial@nongnu.org>; Sat, 17 Mar 2012 10:24:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=Uh2UZBKCri9kD36OSiAwtl0xw6iSd7LPJbY38x9Q0Ic=;
	b=TobB8ni782k33PYewBz+d1O7w/2ahq5zfdrG8FrUWj6qeMnjHc1g6h7fdrTSJIAOId
	Y8EOjMU3CKBB1/Y94wjM5OCt5X4PPYy2FcaYln4yqIUinKhb9N0akqXRT+OuURDjuOSz
	MToMm98bd73CmeMdMuxnRStsMeC8ec+pIhHuOSg2WZ+KsNCRV68dGhJdL6iqt5Tth2dX
	7zdfDjpuSIidZt9xnzkXVgmZBwoAgieehnO4YI9fHAIKNIs2xD3YPfIHp5jcrdb1o/7z
	JFFYJgievo8jDyrQ9knQgS5B4pIgXy+08otlNmlOt04yKRlym4xBvB6N+Dh5LRbCZpUO
	mS9g==
MIME-Version: 1.0
Received: by 10.50.188.138 with SMTP id ga10mr2249029igc.51.1332005048256;
	Sat, 17 Mar 2012 10:24:08 -0700 (PDT)
Received: by 10.50.100.198 with HTTP; Sat, 17 Mar 2012 10:24:08 -0700 (PDT)
In-Reply-To: <4F64B4F2.5020805@weilnetz.de>
References: <1331998306-30941-1-git-send-email-sw@weilnetz.de>
	<CAFEAcA89CWS=+N1JPXo=o-sR9sAxBg4X+AZGb47UdzdWCTjy2A@mail.gmail.com>
	<4F64B4F2.5020805@weilnetz.de>
Date: Sat, 17 Mar 2012 17:24:08 +0000
Message-ID: <CAFEAcA9_P8tmG-M2ytw5eaRPq8KBPc7iXWuGf1M9=rkxnsWRdw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQkp49S8ej3u4FPB+/GjzKT55/9Q9m06QddXtvbGXdEE8NhorSBbpXqic+qrT7NmmEU1+63f
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Fix creation of
 symbolic links for MinGW toolchain
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 17 Mar 2012 17:24:15 -0000

On 17 March 2012 15:59, Stefan Weil <sw@weilnetz.de> wrote:
> Am 17.03.2012 16:49, schrieb Peter Maydell:
>> Where do we symlink directories? (I exclude the setting up
>> of the linux headers because that will only happen on Linux
>> hosts where we know we have working symlinks.)

> pc-bios/keymaps

Oh yes, missed that one (since it's a directory name cunningly
hidden in a variable named FILES :-)).

I'm just a little wary of 'rm -rf', especially here where
we're nuking whatever was passed as an argument and we
aren't getting the shell quoting right. In theory we could
use a wildcard for the keymaps the same way we do for a
bunch of the other pc-bios files; I'm not sure if it's worth
the effort, though.

-- PMM

