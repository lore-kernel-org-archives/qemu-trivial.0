Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TxIHY-0006mY-As
	for mharc-qemu-trivial@gnu.org; Mon, 21 Jan 2013 09:23:28 -0500
Received: from eggs.gnu.org ([208.118.235.92]:44917)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TxIHR-0006eq-4U
	for qemu-trivial@nongnu.org; Mon, 21 Jan 2013 09:23:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TxIHQ-0004rt-0Y
	for qemu-trivial@nongnu.org; Mon, 21 Jan 2013 09:23:21 -0500
Received: from mail-lb0-f182.google.com ([209.85.217.182]:55059)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TxIHP-0004rd-Pn
	for qemu-trivial@nongnu.org; Mon, 21 Jan 2013 09:23:19 -0500
Received: by mail-lb0-f182.google.com with SMTP id gg6so3753713lbb.41
	for <qemu-trivial@nongnu.org>; Mon, 21 Jan 2013 06:23:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=rseAQ86EL6ykGrEJ2K0/QcKCiyB1dSBGrMf++YB5r1Y=;
	b=khtOshHXkYGG9vNhQTe/XDLiC4cz7ROojtO+JsBtVwJghLCOFWbju2D1GPaNmjF7PC
	WpHa0353u1kGp4/yVhgKeYlR+JSVvM8eNbzdXoi3feeAg39ppAzC3yaPTSgcYuMZonOA
	W0or4p9vmSwUAByTqNBR4pvKoTSP8Xq7rlSrs0Ig36Q6/hNTqkbJcH/PSWNMbmMDWs69
	leB2/v0SZnKPg+v/iyp2yApANJNYR9HiJh9PiF3B7Q/AvAyWatIWzCVQdOzwKUj69Ani
	RCoN771yKSgMJqKcenkukBiJl91r2dvsc56Q4at2GjnBeS76/+TF2yT3yEHWJMaX2wLK
	1q8w==
X-Received: by 10.112.43.161 with SMTP id x1mr6578149lbl.89.1358778198591;
	Mon, 21 Jan 2013 06:23:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.107.42 with HTTP; Mon, 21 Jan 2013 06:22:58 -0800 (PST)
In-Reply-To: <50FD4E55.1080709@redhat.com>
References: <1358769827-7317-1-git-send-email-peter.maydell@linaro.org>
	<50FD4E55.1080709@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Jan 2013 14:22:58 +0000
Message-ID: <CAFEAcA-A+yoZUkxi544EcVpnYu3N4amKBoGssM_0dUit_M+nWw@mail.gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQkQQsmxU0+VuXIEUJq5bgSmtpTm02t+Myb/meASXdSjdcfvAuYYPBMsn19z02X+uV8Njzj2
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.217.182
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	patches@linaro.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] qemu-pixman.h: Avoid
 mutual inclusion loop with console.h
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
X-List-Received-Date: Mon, 21 Jan 2013 14:23:27 -0000

On 21 January 2013 14:19, Gerd Hoffmann <kraxel@redhat.com> wrote:
>> Stefan: I've made the obvious change to fix the spice compile issue,
>> but none of my systems have a new enough spice-protocol/spice-server
>> to allow me to configure with spice enabled. I'd appreciate it if
>> you could check it does indeed compile OK now...
>
> I'll run this through the buildbot ...

Thanks, and apologies for forgetting to cc you.

-- PMM

