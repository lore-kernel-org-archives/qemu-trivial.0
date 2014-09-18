Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XUkyK-00080Z-P0
	for mharc-qemu-trivial@gnu.org; Thu, 18 Sep 2014 19:18:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39896)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XUkyF-0007tr-1v
	for qemu-trivial@nongnu.org; Thu, 18 Sep 2014 19:18:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XUkyA-0005jZ-OP
	for qemu-trivial@nongnu.org; Thu, 18 Sep 2014 19:18:38 -0400
Received: from mail-lb0-f181.google.com ([209.85.217.181]:59897)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XUkyA-0005i9-IK
	for qemu-trivial@nongnu.org; Thu, 18 Sep 2014 19:18:34 -0400
Received: by mail-lb0-f181.google.com with SMTP id z11so2089706lbi.26
	for <qemu-trivial@nongnu.org>; Thu, 18 Sep 2014 16:18:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=y7JM7ndEAncpN4B7z9duHiHEADa0QhtCS67sTAmwxVQ=;
	b=NLdUhzEMcahO8CbYhkRl4lKCGj92vRfeSO62Zuvp93vy4XCJVzmPvLQCmotgqGnENq
	G4/oazKKQPJEbRap+Vau+gLg5u7tEaO0eRLPCtVYbXynrkbs2ZTP7RoTDAVJMWC/Oo8J
	2qDtqmDfV8R5UJ3nYMOJfsz+eqs5ETbS7sJb5rcNEbtaJAY5Qx0CoNFkWCvWdX/Va60Z
	YGqsNSZPJAO8raDSdQJO2n8S5zvkbsEFIgX+cvKWWWQkZ3QFk+yGtZXRyYLQh/CgYooi
	JgKlHIvnhRehAYT2TAXYQOxrWmvTwQoG3FgPJWFh4dwdITC8bPeJ8eQiMzJUbOp1sk04
	NurA==
X-Gm-Message-State: ALoCoQno9EMEPDhGjbRdQ8liQ307CjbA7bzZvHpluluJYvi+ESlWGENM0fPh6F02CFVp1+ATJt81
X-Received: by 10.112.55.102 with SMTP id r6mr2622701lbp.23.1411082308481;
	Thu, 18 Sep 2014 16:18:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.130.161 with HTTP; Thu, 18 Sep 2014 16:18:08 -0700 (PDT)
In-Reply-To: <1411081173-14618-1-git-send-email-mdroth@linux.vnet.ibm.com>
References: <1411081173-14618-1-git-send-email-mdroth@linux.vnet.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Sep 2014 16:18:08 -0700
Message-ID: <CAFEAcA-yFgahc7k0tZ5i9O2-tn5g+pzXDUooxTk-gCDQSUZC_A@mail.gmail.com>
To: Michael Roth <mdroth@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.181
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [PATCH] tests: avoid running duplicate qom-tests
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
X-List-Received-Date: Thu, 18 Sep 2014 23:18:43 -0000

On 18 September 2014 15:59, Michael Roth <mdroth@linux.vnet.ibm.com> wrote:
> Since 3687d532 we've been unconditionally adding qom-test to our qtests
> for every arch. However, some archs inherit their tests from Makefile
> variables for other archs, such as i386/x86_64,
> microblaze/microblazeel, and xtensa/xtensaeb. Since these are evaluated
> in a lazy manner, we ultimately end up adding qom-test twice.
>
> In the case x86_64, where we have a large number of machine types that
> we rerun qom-test for, this has lead to a fairly noticeable increase
> in the overall run-time of `make check` (78s vs. 42s on my machine).
> Similar speed-ups are visible for other such archs, but not nearly as
> significant.
>
> Fix this by only adding qom-test to an arch's test list if it's not
> already present.
>
> Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
> ---
>  tests/Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tests/Makefile b/tests/Makefile
> index a5e3d0c..9f2a35c 100644
> --- a/tests/Makefile
> +++ b/tests/Makefile
> @@ -192,7 +192,8 @@ check-qtest-xtensaeb-y = $(check-qtest-xtensa-y)
>
>  # qom-test works for all sysemu architectures:
>  $(foreach target,$(SYSEMU_TARGET_LIST), \
> -    $(eval check-qtest-$(target)-y += tests/qom-test$(EXESUF)))
> +       $(if $(findstring tests/qom-test$(EXESUF), $(check-qtest-$(target)-y)),, \
> +               $(eval check-qtest-$(target)-y += tests/qom-test$(EXESUF))))

See also Andreas' suggested fix:
https://lists.gnu.org/archive/html/qemu-devel/2014-04/msg01087.html
and mine:
https://lists.gnu.org/archive/html/qemu-devel/2014-03/msg05771.html

Andreas didn't like my patch because it sorts all the tests
as a side effect, and I didn't like the hard-coded listing
of architectures in Andreas' patch. It looks like maybe your
version will satisfy both of us :-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

