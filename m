Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TbFFT-0000dV-Cy
	for mharc-qemu-trivial@gnu.org; Wed, 21 Nov 2012 13:42:11 -0500
Received: from eggs.gnu.org ([208.118.235.92]:47270)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TbFFQ-0000XJ-HS
	for qemu-trivial@nongnu.org; Wed, 21 Nov 2012 13:42:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TbFFO-0000X0-8d
	for qemu-trivial@nongnu.org; Wed, 21 Nov 2012 13:42:08 -0500
Received: from mail-ie0-f173.google.com ([209.85.223.173]:65487)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TbFFO-0000Wq-3N
	for qemu-trivial@nongnu.org; Wed, 21 Nov 2012 13:42:06 -0500
Received: by mail-ie0-f173.google.com with SMTP id e13so684539iej.4
	for <qemu-trivial@nongnu.org>; Wed, 21 Nov 2012 10:42:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=WG8KwmpjOuXEWMu1/3/VXGWJ9PpUsbelbAvx9MjArT8=;
	b=dFWWrdke8lL2Errw6PwlA5x6WdiwTbo2HP4I4QhGp7ogXBLY4wgGFYvVmhpWr4L+WS
	MBQdGRtMWHedQN1JsOzykCFHhQCZ/B60bMkU9H+zMI04scD/ZUJ0gAJx5eIenc1p2Rl4
	tsh4R8fzW9wdhMU8P1BEwTzkkM2h9NvbcbPY/WAiMgwRWoVyIfYIXfQx8hCoq7d55qgP
	sSbNgpdxJUNe4Qqb//oVl89TieEgfSGcgxPOiSb7ZDaREZkQ/8kod1IDfFuNuI4RVv74
	ZUGpdAOQGmR/1EpLwKEyUKgodghFUcuIJ7Dzo6l62EvyI5HhS0CoyKR4ubMg7XXzxa/j
	L4Lw==
MIME-Version: 1.0
Received: by 10.50.190.162 with SMTP id gr2mr428848igc.65.1353523325375; Wed,
	21 Nov 2012 10:42:05 -0800 (PST)
Received: by 10.50.88.166 with HTTP; Wed, 21 Nov 2012 10:42:05 -0800 (PST)
In-Reply-To: <50AD1C33.8060509@twiddle.net>
References: <1351805797-31899-1-git-send-email-rth@twiddle.net>
	<50AD06A6.3000602@twiddle.net> <50AD0AB3.7020207@suse.de>
	<50AD1C33.8060509@twiddle.net>
Date: Wed, 21 Nov 2012 18:42:05 +0000
Message-ID: <CAFEAcA_S9woXZqHBQntp_DFD4YYBBzA16x8Vh3AtM9DYBT5v+Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Gm-Message-State: ALoCoQkDFIMW0YnFuS/FLRO0tqOG+17is/IedglTtD3ujTaAUuZgHHVUC5OPIL95FA+MFnyGJwNp
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.223.173
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/3] trivial: Remove some
 pre-TCG CPUArchState members
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
X-List-Received-Date: Wed, 21 Nov 2012 18:42:09 -0000

On 21 November 2012 18:23, Richard Henderson <rth@twiddle.net> wrote:
> On 2012-11-21 09:09, Andreas F=C3=A4rber wrote:
>> Not sure if this fits our current Hard Freeze definition though. ;)
>
> How often do I need to ping patches to get them applied?
> I've generally been waiting 1-2 weeks between pings.
> I've got at least 5 minor patch sets outstanding, dating
> back to at least late September.

My rule of thumb is a week or so between pings, yes.

> I hope for the next release there's both soft and hard
> freeze periods, and much more help from those with commit
> privs in reducing the outstanding patch queues before we
> decide on "done".

There was a soft freeze period: 1st Nov to 19 Nov. I
don't personally expect trivial patches sent after the
soft freeze to be applied before release, so this one
missing the boat is not very surprising. Patches dating
back to September are a different story :-(

-- PMM

