Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VExuY-0001zt-Hc
	for mharc-qemu-trivial@gnu.org; Thu, 29 Aug 2013 04:49:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38505)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VExuS-0001vm-I0
	for qemu-trivial@nongnu.org; Thu, 29 Aug 2013 04:49:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VExuG-00057d-VZ
	for qemu-trivial@nongnu.org; Thu, 29 Aug 2013 04:48:56 -0400
Received: from mail-pd0-f178.google.com ([209.85.192.178]:59379)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VExuG-00057U-PS
	for qemu-trivial@nongnu.org; Thu, 29 Aug 2013 04:48:44 -0400
Received: by mail-pd0-f178.google.com with SMTP id w10so162535pde.37
	for <qemu-trivial@nongnu.org>; Thu, 29 Aug 2013 01:48:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=NPnfLfbT1v7vB/oN9qDdgsX2RSkHpVaU/ZyPWSsqm4U=;
	b=KvA06e1jFah90ZC6wl8aFNcnj/K15uWMyWOXwLJgoEphbtULPvo6z9a7dflSYFrl+I
	x2SgduJG0GoEvaUbDY9vq1BZ/6Fv0D/DbEngzEscIk51GS+ajAMHX1CSSFDxCSawEDSb
	rhv0WjHyBUrlAvBbMpF1BsdQjKdV33KUJEefueV2k97/b6cBfeBhMQBC8xriQCo0aL6E
	E+7q/vp0yDozmAMO9ouokunvSYzyk6zocmzermtSerY9as7bbwAauIOvlH5ofSjzFKUd
	wNu7HSwJp3pgZ6sUjYdbLNJXiuuFhr+P9IuMbUdonZ46DVxr7QDDULsF/0gCKfjG1Xio
	jRbw==
X-Gm-Message-State: ALoCoQlv0ozimcB4zceYZ1bWi46UgRefLmfJbU/XcJTKyekdO3MVTnimlP+yxMOCVuvmwlsgqDUP
X-Received: by 10.68.252.135 with SMTP id zs7mr832055pbc.194.1377766123342;
	Thu, 29 Aug 2013 01:48:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.70.1.8 with HTTP; Thu, 29 Aug 2013 01:48:23 -0700 (PDT)
In-Reply-To: <1376664409-2695-1-git-send-email-anthony.perard@citrix.com>
References: <1376664409-2695-1-git-send-email-anthony.perard@citrix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Aug 2013 09:48:23 +0100
Message-ID: <CAFEAcA_Hooh5+HoPexLroX4RDNPbnnPvrZ9McVLf=QYHNBugUQ@mail.gmail.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.192.178
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Stefano Stabellini <stefano.stabellini@citrix.com>,
	QEMU-devel <qemu-devel@nongnu.org>, Xen Devel <xen-devel@lists.xen.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for v1.6] pc: Fix
 initialization of the ram_memory variable.
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
X-List-Received-Date: Thu, 29 Aug 2013 08:49:00 -0000

On 16 August 2013 15:46, Anthony PERARD <anthony.perard@citrix.com> wrote:
> In some cases (Xen), it will not be initialized before to be used. This
> leads to segv.
>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
>
> ---
>
> It works with this simple initialization to NULL, but would it be
> necessary (or better) to assign a proper value to this variables ?

Yes, is this really the right fix? I raised this before 1.6 came
out (since clang complains about it):
http://lists.gnu.org/archive/html/qemu-devel/2013-07/msg05383.html
(though I see I got the sense of the conditional wrong in the
subject line of that mail)

and Stefano suggested the right fix was more complicated
than just passing NULL. Also IIRC if you follow the variable
down then it eventually gets actually used by code, so just
passing NULL sounds wrong.

thanks
-- PMM

