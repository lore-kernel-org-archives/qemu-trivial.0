Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VK7le-0000l3-JG
	for mharc-qemu-trivial@gnu.org; Thu, 12 Sep 2013 10:21:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58878)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VK7lX-0000iT-Ka
	for qemu-trivial@nongnu.org; Thu, 12 Sep 2013 10:21:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VK7lR-00026f-OH
	for qemu-trivial@nongnu.org; Thu, 12 Sep 2013 10:21:03 -0400
Received: from mail-lb0-f179.google.com ([209.85.217.179]:54687)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VK7lR-000269-Ge
	for qemu-trivial@nongnu.org; Thu, 12 Sep 2013 10:20:57 -0400
Received: by mail-lb0-f179.google.com with SMTP id x18so942074lbi.38
	for <qemu-trivial@nongnu.org>; Thu, 12 Sep 2013 07:20:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=89Nja3QmonMFFJLQOD3btG27HQIcqgKq1gJKiEn46VM=;
	b=QBQAiGKTXpOY9Xf9F5cHPa0n5s0RiWY3fdmjK1vJRrxrJdABVVUIZK+M79fg5hTTZx
	uTRUL2K6vuEkjyI5YmyHn1xn5V+imLydblRICjQeScGwQfRz/ljeX6gXEdBIrtcEnJFy
	7ifjYvPE1Q8CAW2Hu+3zft4pJY7pufs9VrL+uyR3q4u6V9XTv0GVIM/+9DPttcF8nKbQ
	+lu6SQkki0B5TLkN8qpL1TTyfkkVF7pp2ZxehRGCrv+5vTduFh+d8lj8gpPhpNjJeCiI
	C8bld4x/XiCMGk08GZ0apDyr3tJ6Ho1gTEgorfEIMLDqUBHB62ZmVRkxfYcicn1RZHDb
	nl8A==
X-Gm-Message-State: ALoCoQklFqXJXvoIusQYPXWzj6+MFHuhKA2qVuKAoWwDvGXj4q3b6WWTPYwp/Tj5cxUy5z/yQNIE
X-Received: by 10.152.10.99 with SMTP id h3mr6429200lab.13.1378995655634; Thu,
	12 Sep 2013 07:20:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.161.232 with HTTP; Thu, 12 Sep 2013 07:20:35 -0700 (PDT)
In-Reply-To: <5231CC3F.30001@web.de>
References: <1378918197-9036-1-git-send-email-peter.maydell@linaro.org>
	<20130912012318.GA9134@T430s.nay.redhat.com> <5231CC3F.30001@web.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Sep 2013 15:20:35 +0100
Message-ID: <CAFEAcA_9zYRpd1szJs=DaoPtAB01gBfeV4vYJiPrS9UxX6sQWQ@mail.gmail.com>
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <andreas.faerber@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.179
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Fam Zheng <famz@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-trivial] [PATCH] ui/Makefile.objs: delete unnecessary
	cocoa.o dependency
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
X-List-Received-Date: Thu, 12 Sep 2013 14:21:08 -0000

On 12 September 2013 15:14, Andreas F=C3=A4rber <andreas.faerber@web.de> wr=
ote:
> I don't think I have any other Cocoa patches queued - or did I miss a
> more acceptable version of the command-key workaround?

http://lists.nongnu.org/archive/html/qemu-devel/2013-08/msg02300.html
is the latest on that front: it is no longer trying to
add new command line options, at least. It was on my
todo list to look at and test but I never got round
to it :-(

-- PMM

