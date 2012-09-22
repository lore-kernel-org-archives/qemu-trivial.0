Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TFST8-000279-Al
	for mharc-qemu-trivial@gnu.org; Sat, 22 Sep 2012 12:22:14 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43037)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TFST5-000200-Qy
	for qemu-trivial@nongnu.org; Sat, 22 Sep 2012 12:22:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TFST4-0000Ql-Ul
	for qemu-trivial@nongnu.org; Sat, 22 Sep 2012 12:22:11 -0400
Received: from mail-wg0-f53.google.com ([74.125.82.53]:37870)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TFST2-0000QW-OS; Sat, 22 Sep 2012 12:22:08 -0400
Received: by wgbdr1 with SMTP id dr1so2787297wgb.10
	for <multiple recipients>; Sat, 22 Sep 2012 09:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=EjDU0waRM1n5nmA/GK361v6EjDEu3BSyoPpYDbY73oU=;
	b=lRFRqrMZ7Pr5/KhZu1Wwr5q6ak0ALVKnVhmXlHznU93wVcXkq7xAedMTIz8tm1i0Cg
	4Uvqu7W4wHc+x2tYWYhzFEKJj4Fc0fql+YqHaj+sFF5UrQs4bMS+th6oFukdqZQjFRvd
	xgQd7pyBGCUWxYvuI3PYrSzhzxxPe9wRDA4hIhVIUrw8hk1ilCMVqPPwHPawQpGl500/
	HZ61hUBLXioVOG42EfGfm9quc/lXRRwsXpy/naV6X16EmO2HmS6kOGT2bWG1gE206FUN
	AlATyWOcoR+Ix+sQEyVN9FxrHn1EN2RuLlAQJVd2zV+5hLfA4KQRPkeEdKUFwsBrsrDt
	uM0A==
Received: by 10.216.85.149 with SMTP id u21mr4438470wee.147.1348330927979;
	Sat, 22 Sep 2012 09:22:07 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id ct3sm4370128wib.5.2012.09.22.09.22.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 22 Sep 2012 09:22:07 -0700 (PDT)
Date: Sat, 22 Sep 2012 17:22:05 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20120922162205.GA14154@stefanha-thinkpad.localdomain>
References: <1348062764-30806-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1348062764-30806-1-git-send-email-pbonzini@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-timer: simplify
	qemu_run_timers
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
X-List-Received-Date: Sat, 22 Sep 2012 16:22:12 -0000

On Wed, Sep 19, 2012 at 03:52:44PM +0200, Paolo Bonzini wrote:
> ptimer_head is an invariant pointer to clock->active_timers.
> Remove it, and just reference clock->active_timers directly.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  qemu-timer.c | 7 +++----
>  1 file modificato, 3 inserzioni(+), 4 rimozioni(-)

qemu_run_timers() is a piece of code that I always have to read
line-by-line.  This simplification helps a bit, nice.

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

