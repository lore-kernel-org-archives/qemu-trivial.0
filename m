Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S9bY0-00071r-1e
	for mharc-qemu-trivial@gnu.org; Mon, 19 Mar 2012 08:18:48 -0400
Received: from eggs.gnu.org ([208.118.235.92]:48803)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S9bXQ-0006Uq-N0
	for qemu-trivial@nongnu.org; Mon, 19 Mar 2012 08:18:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S9bWy-0007eM-EF
	for qemu-trivial@nongnu.org; Mon, 19 Mar 2012 08:18:12 -0400
Received: from mail-lb0-f173.google.com ([209.85.217.173]:55312)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1S9bWi-0007bh-QS; Mon, 19 Mar 2012 08:17:29 -0400
Received: by lbon3 with SMTP id n3so3459222lbo.4
	for <multiple recipients>; Mon, 19 Mar 2012 05:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=dtnNaxM+FAEvxYibbw05ALm4EVvuaI7bM1UDJK9aP+U=;
	b=w40slM7OodrgghH91mPTfoFoxP5kpJRz/jSim2mkNu9H4VqPhlzEq4dx4XJ9Mj8hr+
	iJUsnAH52qCxYV0XI/R3t4qa3QZFqLoRCNR1pZJQfQeJ6fOoikJTNWBupgfGRmSBfzpW
	874WVfP5OVWEIdTaTp99vNEx6CPrnIt7usQy7kOBbUcgzCFUBN/70T779OBkAMsrOBtV
	YbBxkPdn1hC19DugrGRoghMn18P297UmzaqiUznp5RmPHwmPiGUVSd8OTGW20nxJ/vBo
	KstoQPjto/xvV2C9+ciftP/nubqc0xFFR5WK/LQgoNBBHN7m1bIvTlMl2TU+GJypY0Lo
	TG8A==
MIME-Version: 1.0
Received: by 10.112.46.202 with SMTP id x10mr4424794lbm.39.1332159445798; Mon,
	19 Mar 2012 05:17:25 -0700 (PDT)
Received: by 10.112.63.132 with HTTP; Mon, 19 Mar 2012 05:17:25 -0700 (PDT)
In-Reply-To: <4F670B62.2040606@suse.de>
References: <1331985651-16227-1-git-send-email-sw@weilnetz.de>
	<4F670B62.2040606@suse.de>
Date: Mon, 19 Mar 2012 12:17:25 +0000
Message-ID: <CAJSP0QX6=x+AFxC6rK1hnBkoZHSgSporYVCXxGH5E293SVdpUA@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.217.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target-mips: Remove unused
	inline function
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
X-List-Received-Date: Mon, 19 Mar 2012 12:18:47 -0000

On Mon, Mar 19, 2012 at 10:33 AM, Andreas F=E4rber <afaerber@suse.de> wrote=
:
> Hello Stefan,
>
> Am 17.03.2012 13:00, schrieb Stefan Weil:
>> Function set_HILO is not needed anywhere.
>
> Does this cause any warnings? Given the state mips is currently in (TCG
> patches queuing), I'd suggest to hold this off for a bit, but I don't
> really mind either way.
>
> Commit message does not mention if this was never used in the first
> place or became unused during TCG conversion or some other refactoring?

It doesn't cause any warning on my build here, so there's no strict
need for this patch.

I have dropped the patch for now.  Please resend if you want to get it
in and address Andreas' questions.

Thanks,
Stefan

