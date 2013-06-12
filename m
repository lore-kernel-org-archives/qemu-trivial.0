Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmsGk-00035T-Ix
	for mharc-qemu-trivial@gnu.org; Wed, 12 Jun 2013 17:07:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60178)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flukshun@gmail.com>) id 1UmsGg-00033w-Ec
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 17:07:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <flukshun@gmail.com>) id 1UmsGf-0003xm-69
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 17:07:46 -0400
Received: from mail-ob0-x22a.google.com ([2607:f8b0:4003:c01::22a]:43344)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flukshun@gmail.com>)
	id 1UmsGf-0003xY-10; Wed, 12 Jun 2013 17:07:45 -0400
Received: by mail-ob0-f170.google.com with SMTP id ef5so13964064obb.1
	for <multiple recipients>; Wed, 12 Jun 2013 14:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gitff6/8MzymqYRmJWUpOZ0eP5PD3KKZmKC1+ykFdCM=;
	b=cBB18bofzm4F1oJn4rxjkhEeWCAkByrneYG29ipGxqro/5jBajb+nMmtVxEW8uYAS9
	bkis1KFVKvN3lu268IvcK5PDZ3W7o1QJ9nuEHoYb225If2Umz6ZXVWbRWc06W6d1lLcZ
	zQ2Cb74PevMzUkXC4Ukin6zJqw5/8uEUd3lQuhOBwkV2aU6SMvUhs1SNPrWjtThTBxc+
	YHxgqTa9H+P3KO1T7w1Vc77ZjsOZlq0hIYWUwfOuOM6lT8d5mu0O10+JluHEsGtQ83Nk
	L2ZEPzgOQdBPPCaq3wKPsnyNxfjgzMsWWtC+0D5ENp6Bkq1fej4NsE0/DIFzXO1VW1hv
	s6iA==
X-Received: by 10.60.97.232 with SMTP id ed8mr16719075oeb.96.1371071264425;
	Wed, 12 Jun 2013 14:07:44 -0700 (PDT)
Received: from localhost ([32.97.110.51])
	by mx.google.com with ESMTPSA id i2sm35213748obz.11.2013.06.12.14.07.41
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 12 Jun 2013 14:07:43 -0700 (PDT)
Sender: fluxion <flukshun@gmail.com>
Date: Wed, 12 Jun 2013 16:07:28 -0500
From: mdroth <mdroth@linux.vnet.ibm.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20130612210728.GH12585@vm>
References: <1369175577-18130-1-git-send-email-mdroth@linux.vnet.ibm.com>
	<20130612201151.GF12585@vm>
	<CAFEAcA8f_yjeHvfwucVXrLm-c+7byg_EK80mYqMLE=3Y0RZzcw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8f_yjeHvfwucVXrLm-c+7byg_EK80mYqMLE=3Y0RZzcw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c01::22a
Cc: Anthony Liguori <aliguori@us.ibm.com>, quintela@redhat.com,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	qemu-stable@nongnu.org, nick@bytemark.co.uk
Subject: Re: [Qemu-trivial] [PATCH] wdt_i6300esb: fix vmstate versioning
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
X-List-Received-Date: Wed, 12 Jun 2013 21:07:49 -0000

On Wed, Jun 12, 2013 at 09:42:14PM +0100, Peter Maydell wrote:
> On 12 June 2013 21:11, mdroth <mdroth@linux.vnet.ibm.com> wrote:
> > On Tue, May 21, 2013 at 05:32:57PM -0500, Michael Roth wrote:
> >> When this VMSD was introduced it's version fields were set to
> >> sizeof(I6300State), making them essentially random from build to build,
> >> version to version.
> >>
> >> To fix this, we lock in a high version id and low minimum version id to
> >> support old->new migration from all prior versions of this device's
> >> state. This should work since the device state has not changed since
> >> its introduction.
> >>
> >> The potentially breaks migration from 1.5+ to 1.5, but since the
> >> versioning was essentially random prior to this patch, new->old
> >> migration was not consistently functional to begin with.
> >>
> >> Reported-by: Nicholas Thomas <nick@bytemark.co.uk>
> >> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> >> Cc: qemu-stable@nongnu.org
> >> Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
> >
> > CC'ing qemu-trivial. Looking to get this in for 1.5.1
> 
> This is a good patch but it definitely doesn't seem like
> -trivial material to me. -trivial isn't "way to get patches
> in that would otherwise fall through the cracks" :-)

I honestly thought it was trivial once all the considerations were
documented, but reading through it all again makes my head hurt a
bit so you're probably right.

Anthony, Juan?

> 
> thanks
> -- PMM
> 

