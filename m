Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UyJKf-0006oY-FD
	for mharc-qemu-trivial@gnu.org; Sun, 14 Jul 2013 06:15:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55575)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UyJKd-0006mx-QW
	for qemu-trivial@nongnu.org; Sun, 14 Jul 2013 06:15:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UyJKa-0001i4-Vj
	for qemu-trivial@nongnu.org; Sun, 14 Jul 2013 06:15:07 -0400
Received: from mail-lb0-f171.google.com ([209.85.217.171]:54371)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UyJKa-0001cg-Pq
	for qemu-trivial@nongnu.org; Sun, 14 Jul 2013 06:15:04 -0400
Received: by mail-lb0-f171.google.com with SMTP id 13so8693619lba.16
	for <qemu-trivial@nongnu.org>; Sun, 14 Jul 2013 03:15:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=eQFN1f7rRZkmU8Nxkw8cSwyf4EP5fYdO1c9AX8ZtS1E=;
	b=eRJF9X59B/mM+Gng3yaCtVO3SgtciwVo7fDaip3KJoRlUzonHmZWgtg6zSG+6lf6kc
	pJzSCfIg4vgsX/BYORizLlGctAQ9OzjOfvpKJAQesOqVqgtAPS4qtro1PcPGmgu8rW6D
	K4d5Wzw5NviTrzLC/wo982EazpsVvH+LONKea1vD9SIwMWxHQw2GAFqwCxHZJAxsHUuB
	VqGO2DmuEO8D6XLhrMkhhzsiT+sx6xypQ8ICMc/Rn28JWppy0hYOYXc+SBKX6qOiTsZi
	TWx4fWxZ7MsncPZ/yu2QwNbuk64E1GEfoFEX68x/pb6Hnna8JmBt4ttziDKhzzR9GyvM
	/biQ==
X-Received: by 10.112.132.7 with SMTP id oq7mr22415990lbb.2.1373796903116;
	Sun, 14 Jul 2013 03:15:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.97.146 with HTTP; Sun, 14 Jul 2013 03:14:43 -0700 (PDT)
In-Reply-To: <CAPyFy2BW9+hLC=7+oxnyiA17Lm484VgaQRz8S-RaV_vv92LoHg@mail.gmail.com>
References: <1373660992-92075-1-git-send-email-emaste@freebsd.org>
	<51E11A1B.2020503@msgid.tls.msk.ru>
	<CAPyFy2BW9+hLC=7+oxnyiA17Lm484VgaQRz8S-RaV_vv92LoHg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 14 Jul 2013 11:14:43 +0100
Message-ID: <CAFEAcA9-ahq0LEVpOf9Ywra7e0CxcCP041+BiX+abnG=_daZyQ@mail.gmail.com>
To: Ed Maste <emaste@freebsd.org>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQkyVcnQ8gCn7Em0gZ9q8CuWanGATv5Zm8Rrl9NYZFRwIG92gaNbs6ruk2FlluiSqu8WtPXm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.171
Cc: qemu-trivial@nongnu.org, Jan Kiszka <jan.kiszka@siemens.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] slirp: reorder include to
 fix FreeBSD build failure
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
X-List-Received-Date: Sun, 14 Jul 2013 10:15:08 -0000

On 13 July 2013 23:35, Ed Maste <emaste@freebsd.org> wrote:
> I'm not sure that anonymous union support is universal across
> all compilers used to build QEMU though - do you know?

A quick grep shows we already use anonymous unions in
a few places, so it must be OK.

-- PMM

