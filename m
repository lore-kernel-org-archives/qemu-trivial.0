Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YmoQm-0007om-VI
	for mharc-qemu-trivial@gnu.org; Mon, 27 Apr 2015 15:11:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52104)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YmoQl-0007oX-94
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 15:11:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YmoQg-0007V7-PV
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 15:10:59 -0400
Received: from mail-ie0-f170.google.com ([209.85.223.170]:35632)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YmoQg-0007Uy-Kp
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 15:10:54 -0400
Received: by iejt8 with SMTP id t8so1719168iej.2
	for <qemu-trivial@nongnu.org>; Mon, 27 Apr 2015 12:10:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=wAp5X3dZZt8hMvTsnK2XERwMSydYHeW/5o/j10ejPVc=;
	b=FrbAR/N8WDxmlAx+5x0G2iAriUa1Y8Lg2V6ms4IjH6TDsbe3a/0Sget/XA9mDbgVM0
	x/ydbb8hPvdnmBIQWgqhL+0Tuc9rQfYGe6pEmzIkOZElK7Fz9hcKWoOd7oR7cwNoosga
	7czdtZPBqk8Mu4PNv0+tpVm30oR/DDxjTBfvssqsjoLmNSmEwXTBNf0908fxypkLQBoj
	4lMiIRRmdOult3/1WDVUeW2/lGDGmD8xddBDcPmqwtezXnl8NmOsqFxFKFHuFTjo05lY
	0/pJJzQ525MBL0J3bVzyNtKAl05+VJEH2XEYtqlb9DLkJ2AX+ZcGsEHWj0CnRMXkBN1u
	KJJg==
X-Gm-Message-State: ALoCoQmH0Dif50ytxkejQkvD0d5ztHcSwc1OoLRFBhWmpXxOlPka5hiOoN7ApX13ZulVtvQPyHIy
X-Received: by 10.43.60.14 with SMTP id wq14mr14193305icb.60.1430161854273;
	Mon, 27 Apr 2015 12:10:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.136.220 with HTTP; Mon, 27 Apr 2015 12:10:34 -0700 (PDT)
In-Reply-To: <CAEgOgz5-hThXXxUZJRswFH1LgUEzFYGXGL+ON-R9K0NWfdhkew@mail.gmail.com>
References: <cover.1430096379.git.crosthwaite.peter@gmail.com>
	<a07c62df4232de834d97e01a981281c68d97fbbc.1430096379.git.crosthwaite.peter@gmail.com>
	<553E2571.2000700@msgid.tls.msk.ru>
	<CAFEAcA-a==mJ2kfb6E=So+agg1uZ9VsWMNYwS0BwzEM+RKUAWQ@mail.gmail.com>
	<CAFEAcA8t7_9BzOGekyJpz+_d_qYxT6rTXa=domd4JH0c6zRJUA@mail.gmail.com>
	<CAEgOgz5-hThXXxUZJRswFH1LgUEzFYGXGL+ON-R9K0NWfdhkew@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Apr 2015 20:10:34 +0100
Message-ID: <CAFEAcA8f4VDRT1GSGtWG0nzTp=qGUoP3dt8n=B7hLQSVDU7MJQ@mail.gmail.com>
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.223.170
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH target-arm 2/2] arm: cpu.h:
	Delete unused cpu_pc_from_tb()
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
X-List-Received-Date: Mon, 27 Apr 2015 19:11:00 -0000

On 27 April 2015 at 20:06, Peter Crosthwaite
<peter.crosthwaite@xilinx.com> wrote:
> On Mon, Apr 27, 2015 at 12:00 PM, Peter Maydell
> <peter.maydell@linaro.org> wrote:
>> I think I go for "just update the comment"...
>>
>
> Does that mean a respin of this patch or should the tricore fix and
> the comment be a follow up?

I have no preference either way.

-- PMM

