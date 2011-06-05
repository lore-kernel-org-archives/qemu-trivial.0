Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QTGWf-000624-Cs
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2011 12:50:09 -0400
Received: from eggs.gnu.org ([140.186.70.92]:50045)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cerbere@gmail.com>) id 1QTGWc-00061K-JB
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2011 12:50:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cerbere@gmail.com>) id 1QTGWa-0001zl-VI
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2011 12:50:06 -0400
Received: from mail-pz0-f45.google.com ([209.85.210.45]:38490)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cerbere@gmail.com>)
	id 1QTGWW-0001xu-1k; Sun, 05 Jun 2011 12:50:00 -0400
Received: by pzk30 with SMTP id 30so1636566pzk.4
	for <multiple recipients>; Sun, 05 Jun 2011 09:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=xyhKKH4d/7oOklJev4WND+e7YIyGoj6zpiPeJ+ptjTc=;
	b=VPoI8QX8fKM7qLMpC2dyvsQYLCLbQqc9F2s++JtvLEGsYLLfygcCB5pdRUJYjH2kcR
	RpX3PWNlAUcYHh3u0nSD0faf8UCO1j+AlguecaqHAUDi3j+k9RDMZolLS9ZBiFXT1NTP
	uBr7RbmUH9W6zQuyGqYTlAbMUi5sa3HHfbcpQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	b=lj9w2ob0i5cZ6O+YtDE8flzpwPolgtIYMPBgThnJYhkMrAxe1Q9jaWD9tKq4Eom2ER
	1HLBXwZVLvsej3x5PypfMVJzXmCqwVAM7And052hwLwnVhg+K60IFU7686YVWGaGiEhu
	8+qN7QA6hc/b7uG9qp+Q6tLyCJElAn6Yt9HqU=
Received: by 10.68.9.132 with SMTP id z4mr1571015pba.282.1307292598396; Sun,
	05 Jun 2011 09:49:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.55.37 with HTTP; Sun, 5 Jun 2011 09:49:38 -0700 (PDT)
In-Reply-To: <BANLkTimyRHr2DWkNqEZcLu9Hw1fGtbvNSw@mail.gmail.com>
References: <1307071609-1165-1-git-send-email-cerbere@gmail.com>
	<BANLkTimyRHr2DWkNqEZcLu9Hw1fGtbvNSw@mail.gmail.com>
From: Alexandre Raymond <cerbere@gmail.com>
Date: Sun, 5 Jun 2011 12:49:38 -0400
Message-ID: <BANLkTi=HKTVJQiroEN9v64gFgR4-J_rC9g@mail.gmail.com>
To: Blue Swirl <blauwirbel@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.210.45
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
X-List-Received-Date: Sun, 05 Jun 2011 16:50:08 -0000

Hi Blue,

This patch indeed depends on http://patchwork.ozlabs.org/patch/98325/.

Since it had already been applied by Andreas to the trivial tree, I
didn't think it was necessary to resend it in the followup.

If you prefer, I can resend both in the same series.

Alexandre

On Sun, Jun 5, 2011 at 11:44 AM, Blue Swirl <blauwirbel@gmail.com> wrote:
> On Fri, Jun 3, 2011 at 6:26 AM, Alexandre Raymond <cerbere@gmail.com> wrote:
>> This patch removes all references to signal.h when qemu-common.h is included
>> as they become redundant.
>
> This breaks the build. Maybe it depends on some previous patch? If so,
> it would be nice to submit the patches as a series so that the patches
> can be tested, now I could not find the other patch.
>

