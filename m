Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QTGkD-0007yu-9R
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2011 13:04:09 -0400
Received: from eggs.gnu.org ([140.186.70.92]:51768)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1QTGkA-0007yR-9j
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2011 13:04:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1QTGk8-0007YE-3b
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2011 13:04:05 -0400
Received: from mail-qw0-f45.google.com ([209.85.216.45]:38565)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1QTGk5-0007Xk-2j; Sun, 05 Jun 2011 13:04:01 -0400
Received: by qwj8 with SMTP id 8so1678625qwj.4
	for <multiple recipients>; Sun, 05 Jun 2011 10:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=dRvCVuQQqpYgl8qGAmHbOUuZfCxVFs70UjnnqqAIMkA=;
	b=dBn+Oj6ViaP/D2dCl+g9NP+k7WTVvPNX+Mof2GybCpAMWwPutX45/nMZkPmtOpBwqX
	vl9dUK5qki5IqAYSEH7f1DkusrY3gfZoeP9JW7wMT7Dx/rz2XxA+FuR4Nyku/jI0X+6U
	fLRRqzPQtbj8LGyP9yNBTZG1Vts0Fmqlfqhsc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	b=t6fQ9yXU8C+ZNpxVpZy1S64Po15ysHptLY1Y4zxcmKAEmx013xhjirEJgTvbZuMPQL
	WnbsCz2ggBlaAa+MsWFmAuheMelpnmkw1XiuB1WYB5DjhibUnnjcwJvCVnWpkwyL8te6
	yaRL4Rj1ZB7gq1o6XXd9Gn2UZ64KKlWkw5v6c=
Received: by 10.224.70.195 with SMTP id e3mr1311991qaj.317.1307293440175; Sun,
	05 Jun 2011 10:04:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.224.45.202 with HTTP; Sun, 5 Jun 2011 10:03:40 -0700 (PDT)
In-Reply-To: <BANLkTi=HKTVJQiroEN9v64gFgR4-J_rC9g@mail.gmail.com>
References: <1307071609-1165-1-git-send-email-cerbere@gmail.com>
	<BANLkTimyRHr2DWkNqEZcLu9Hw1fGtbvNSw@mail.gmail.com>
	<BANLkTi=HKTVJQiroEN9v64gFgR4-J_rC9g@mail.gmail.com>
From: Blue Swirl <blauwirbel@gmail.com>
Date: Sun, 5 Jun 2011 20:03:40 +0300
Message-ID: <BANLkTikJtOcUdPFMcOrT_1LcaYG3ryU2QQ@mail.gmail.com>
To: Alexandre Raymond <cerbere@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fix compilation warning due
 to missing header for sigaction (followup)
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
X-List-Received-Date: Sun, 05 Jun 2011 17:04:08 -0000

On Sun, Jun 5, 2011 at 7:49 PM, Alexandre Raymond <cerbere@gmail.com> wrote:
> Hi Blue,
>
> This patch indeed depends on http://patchwork.ozlabs.org/patch/98325/.
>
> Since it had already been applied by Andreas to the trivial tree, I
> didn't think it was necessary to resend it in the followup.
>
> If you prefer, I can resend both in the same series.

No need, I think this should also go via trivial patches queue. The
patch looks fine to me.

