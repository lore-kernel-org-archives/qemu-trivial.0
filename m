Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZUN40-0005as-07
	for mharc-qemu-trivial@gnu.org; Tue, 25 Aug 2015 18:51:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49081)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ZUN3x-0005ZQ-WD
	for qemu-trivial@nongnu.org; Tue, 25 Aug 2015 18:51:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ZUN3t-0000E6-0s
	for qemu-trivial@nongnu.org; Tue, 25 Aug 2015 18:51:29 -0400
Received: from mx4-phx2.redhat.com ([209.132.183.25]:44161)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1ZUN3s-0000Dz-HV; Tue, 25 Aug 2015 18:51:24 -0400
Received: from zmail13.collab.prod.int.phx2.redhat.com
	(zmail13.collab.prod.int.phx2.redhat.com [10.5.83.15])
	by mx4-phx2.redhat.com (8.13.8/8.13.8) with ESMTP id t7PMp83A008665;
	Tue, 25 Aug 2015 18:51:08 -0400
Date: Tue, 25 Aug 2015 18:51:08 -0400 (EDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Message-ID: <285075347.18984776.1440543068614.JavaMail.zimbra@redhat.com>
In-Reply-To: <1440535491-4511-1-git-send-email-lvivier@redhat.com>
References: <1440535491-4511-1-git-send-email-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.4.164.1, 10.5.101.130]
X-Mailer: Zimbra 8.0.6_GA_5922 (ZimbraWebClient - FF39 (Linux)/8.0.6_GA_5922)
Thread-Topic: remove useless muldiv64()
Thread-Index: pg3kXloippDX/GP5iT3WaHQHFNBZdg==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 209.132.183.25
Cc: Peter Maydell <peter.maydell@linaro.org>, Jia Liu <proljc@gmail.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	qemu-trivial <qemu-trivial@nongnu.org>,
	Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>, Leon Alrae <leon.alrae@imgtec.com>
Subject: Re: [Qemu-trivial] [PATCH 0/7] remove useless muldiv64()
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
X-List-Received-Date: Tue, 25 Aug 2015 22:51:31 -0000

> Originally, timers were ticks based, and it made sense to
> add ticks to current time to know when to trigger an alarm.
> 
> But since commit:
> 
> 7447545 change all other clock references to use nanosecond resolution
> accessors
> 
> All timers use nanoseconds and we need to convert ticks to nanoseconds, by
> doing something like:
> 
>      y = muldiv64(x, get_ticks_per_sec(), TIMER_FREQ)
> 
> where x is the number of device ticks and y the number of system ticks.
> 
> y is used as nanoseconds in timer functions,
> it works because 1 tick is 1 nanosecond.
> (get_ticks_per_sec() is 10^9)
> 
> But if get_ticks_per_sec() / TIMER_FREQ is an integer, we can do:
> 
>     y = x * TIMER_PERIOD;

Cc: qemu-trivial@nongnu.org

Paolo

