Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dahhQ-00038k-CA
	for mharc-qemu-trivial@gnu.org; Thu, 27 Jul 2017 08:15:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42425)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dahhO-00038L-A7
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 08:15:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dahhN-0002Hh-Gj
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 08:15:26 -0400
Received: from mail-wr0-x22d.google.com ([2a00:1450:400c:c0c::22d]:37391)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dahhN-0002H1-AY
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 08:15:25 -0400
Received: by mail-wr0-x22d.google.com with SMTP id 33so86333582wrz.4
	for <qemu-trivial@nongnu.org>; Thu, 27 Jul 2017 05:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Yyz2FatahnTiQbf7qNDWVOahPecabKISRH+06Rh6XNw=;
	b=I6q4Nf14XbSllqXhXK4tZlXAPQCcBFcuLt1IWOhAXHC9vzSw3bLYUUrhljq6Y/qsfB
	JM97AVeeSjHlv2GR6jcppBEW3i1AbY6yVNoHdsMeU9B8aLu3GWS0o4HzL05kymowpLbv
	55SyRxSLspXeX86eF0Hho1LhRF9nRUnygE504=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Yyz2FatahnTiQbf7qNDWVOahPecabKISRH+06Rh6XNw=;
	b=rlHxcl879tF6l+gCkQBFOrhkybqjMxgiYsplqLEVQ2y4LhY/xcaX3x1075Xcmvjlc7
	ZfFHOXAvLVqc28dZC+0OURksEpXLjQazy5jUXNt8oogpCPp3NL3e2/2XNDF5eJjdxolE
	aSS7hG9on6NrlbpBa4X38g3DXR6Y8h7p1Y7M56QD646V9CvV8fuksYLrwhD12Xbmq/ix
	Lr9rr/5FN9RSzhynyXV5eAXgwy8pJYFobgzkWR4D+loKGAVJPMfzgOVCEYQU5Y4G/RLO
	aiBR3S8Y4THJJEhiSS1ICZNYiQcG3U/JsXd7/7BpC+OcaOj40HS9BGbaE7B80Goe3xbA
	h7CQ==
X-Gm-Message-State: AIVw11313up6JIX8jmQDrBv0jr/RoydaYfwpKgjDONfd6QXMpW4YNoDm
	cn/Y/4HOMSkx9O5CQn6t2bzxVdfpLEy1
X-Received: by 10.223.160.229 with SMTP id n34mr3817776wrn.117.1501157723985; 
	Thu, 27 Jul 2017 05:15:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Thu, 27 Jul 2017 05:15:03 -0700 (PDT)
In-Reply-To: <20170727120210.6943-2-crosa@redhat.com>
References: <20170727120210.6943-1-crosa@redhat.com>
	<20170727120210.6943-2-crosa@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Jul 2017 13:15:03 +0100
Message-ID: <CAFEAcA-CzG=JYjajJqMRL+pcMC2_06HTm1_xhD=ca=AReXHmTA@mail.gmail.com>
To: Cleber Rosa <crosa@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22d
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/5] configure: remove
 duplicate single quotes on config.log header
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
X-List-Received-Date: Thu, 27 Jul 2017 12:15:27 -0000

On 27 July 2017 at 13:02, Cleber Rosa <crosa@redhat.com> wrote:
> The generation of the informational header on config.log contains two
> pairs of single quotes, which seems unintentional, and looks like
> this:
>
>   # QEMU configure log Thu Jul 26 08:17:15 EDT 2017
>   # Configured with: './configure' '--target-list=x86_64-softmmu'

I think this is deliberate. The idea is that the string is a
validly shell-quoted string that you can cut and paste
into a shell prompt if you want to. (This is less important
than it used to be now we have config.status.)

If your configure command has more than one line you get
something like this:

# Configured with: '../../configure'
'--target-list=arm-softmmu,aarch64-softmmu,arm-linux-user,aarch64-linux-user'
'--enable-debug' '--cc=ccache gcc' '--audio-drv-list=pa'

...and note in particular how the '--cc=ccache gcc' argument
is printed. Your change would give

# Configured with: '../../configure
--target-list=arm-softmmu,aarch64-softmmu,arm-linux-user,aarch64-linux-user
--enable-debug --cc=ccache gcc --audio-drv-list=pa'

which can't be cut and pasted, and is ambiguous.

thanks
-- PMM

