Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1auuMI-0003jc-5i
	for mharc-qemu-trivial@gnu.org; Tue, 26 Apr 2016 00:12:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41837)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1auuMG-0003gn-11
	for qemu-trivial@nongnu.org; Tue, 26 Apr 2016 00:12:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1auuMF-0007EE-9I
	for qemu-trivial@nongnu.org; Tue, 26 Apr 2016 00:12:19 -0400
Received: from mail-ig0-x229.google.com ([2607:f8b0:4001:c05::229]:37561)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>)
	id 1auuMF-0007E7-3s; Tue, 26 Apr 2016 00:12:19 -0400
Received: by mail-ig0-x229.google.com with SMTP id g8so5219864igr.0;
	Mon, 25 Apr 2016 21:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=jJAQzqImlazZoi/id8uYEWfA+53swOTP+jjPkOPUFMc=;
	b=FMgfMR0WadKIFv6lGIGZFQihCIecf4oBGi1O2qF83eOxctcO7LUwU39i11y5Mgkbrr
	3od0bk5JEADvJXRjUj1zP4IQtnUieyG892Jd1M37qVebwMxnqo0Gtc8PYfv02a5H7rev
	Ww+E6GM1je8qa+VhkiQ59axhZDSJBbmZ7vPUogEq5W/cwX3a1mViJXRHO7Hn4oXm2EQ+
	BIwE4I0q7j9E5sZjBNm5+jnPbA3Je+vfqxgYkP1oo0N4l/Vx2N+BjILrvMppqvTeLu3t
	zYRor2AZJFSosNrUxi/+PO3VM3N5wjDrdRXWtdyKKv59CkxdQPrFyw4T+vwakqKJ2TT+
	+hDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=jJAQzqImlazZoi/id8uYEWfA+53swOTP+jjPkOPUFMc=;
	b=Pj5KbhrnwzzcQBhUZQTnM0PjaJpjvZkWwbszSuvmQCvLVjk+B0USD4nSx8fP3hPN+8
	7Qlsg/2OqDhopj0GSyv0E8N/zMD5wwaCzhrbYtSKabDgDFJRxJuDDdwpIx3HC4KZ0c2I
	+d2AzQnh0LrVL1whMIUSyKwn2JSXWTVnNHIBwQjw9THnUkQLePXh1kwmbIEcRgst+9hW
	D14dckDkD2pdbbQvs9CgsOlksOrcYgru+WcmnJwcB77L3KSSd+/hBnzCiKc0HlYvN7QV
	3nCp/LR+zQwm1a0ZrEMPn0qyujY8ubqx96r3Wz/jngxeRFR6QctcjHXmJrd1cvmaqvS5
	1WtQ==
X-Gm-Message-State: AOPr4FWMKnbOKmX0I/dxNBrxCufXGZnMy++isJ74akE0AvFTUwIG8E5jT4zRw+ucc9mS5yiIYyQ7WnuBZro9lQ==
MIME-Version: 1.0
X-Received: by 10.50.186.163 with SMTP id fl3mr10224798igc.27.1461643938281;
	Mon, 25 Apr 2016 21:12:18 -0700 (PDT)
Received: by 10.50.103.225 with HTTP; Mon, 25 Apr 2016 21:12:18 -0700 (PDT)
In-Reply-To: <1461641713-32720-1-git-send-email-zhoujie2011@cn.fujitsu.com>
References: <1461641713-32720-1-git-send-email-zhoujie2011@cn.fujitsu.com>
Date: Tue, 26 Apr 2016 07:12:18 +0300
Message-ID: <CAMo8BfL=dAerS7LYPwFCf2xr+Zh4S5KUqFRFEPx-zm=N7GueaQ@mail.gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
To: Zhou Jie <zhoujie2011@cn.fujitsu.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c05::229
Subject: Re: [Qemu-trivial] [PATCH] hw/net/opencores_eth: Allocating Large
 sized arrays to heap
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Apr 2016 04:12:21 -0000

Hi Zhou,

On Tue, Apr 26, 2016 at 6:35 AM, Zhou Jie <zhoujie2011@cn.fujitsu.com> wrote:
> open_eth_start_xmit has a huge stack usage of 65536 bytes approx.
> Moving large arrays to heap to reduce stack usage.

It's an exception, not the rule when full 65536 byte long buffer might be
needed. Can we do a little better change and not allocate and free this
buffer every time unconditionally, but instead make buf smaller (1536
bytes, maximal frame length when HUGEN bit is not set in MODER)
and only do allocation when that's not enough?

-- 
Thanks.
-- Max

