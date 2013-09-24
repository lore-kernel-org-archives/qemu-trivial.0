Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VOadA-0001d8-KU
	for mharc-qemu-trivial@gnu.org; Tue, 24 Sep 2013 17:58:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51382)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1VOacz-0001Se-J5
	for qemu-trivial@nongnu.org; Tue, 24 Sep 2013 17:58:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1VOack-0001EO-Dt
	for qemu-trivial@nongnu.org; Tue, 24 Sep 2013 17:58:41 -0400
Received: from e31.co.us.ibm.com ([32.97.110.149]:36071)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1VOack-0001E0-6C
	for qemu-trivial@nongnu.org; Tue, 24 Sep 2013 17:58:26 -0400
Received: from /spool/local
	by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <mdroth@linux.vnet.ibm.com>;
	Tue, 24 Sep 2013 15:58:25 -0600
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
	by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 24 Sep 2013 15:58:23 -0600
Received: from d03relay01.boulder.ibm.com (d03relay01.boulder.ibm.com
	[9.17.195.226])
	by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id 3EEBC3E40026;
	Tue, 24 Sep 2013 15:58:23 -0600 (MDT)
Received: from d03av06.boulder.ibm.com (d03av06.boulder.ibm.com [9.17.195.245])
	by d03relay01.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	r8OLwMjf353986; Tue, 24 Sep 2013 15:58:22 -0600
Received: from d03av06.boulder.ibm.com (loopback [127.0.0.1])
	by d03av06.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP
	id r8OM1Px4027291; Tue, 24 Sep 2013 16:01:25 -0600
Received: from localhost ([9.41.105.206])
	by d03av06.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	r8OM1Pc5027281; Tue, 24 Sep 2013 16:01:25 -0600
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
From: Michael Roth <mdroth@linux.vnet.ibm.com>
In-Reply-To: <1375789738-28034-1-git-send-email-stefanha@redhat.com>
References: <1375789738-28034-1-git-send-email-stefanha@redhat.com>
Message-ID: <20130924215822.25429.16708@loki>
User-Agent: alot/0.3.4
Date: Tue, 24 Sep 2013 16:58:22 -0500
X-TM-AS-MML: No
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 13092421-8236-0000-0000-000002112DFA
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 32.97.110.149
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-stable@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-stable] [PATCH for-1.6] qemu-timer: fix
 get_clock() gettimeofday() fallback #ifdef
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
X-List-Received-Date: Tue, 24 Sep 2013 21:58:51 -0000

Quoting Stefan Hajnoczi (2013-08-06 06:48:58)
> If CLOCK_MONOTONIC is not defined by system headers we use
> gettimeofday(2).  Apparently this is not used very often since no one
> noticed the #ifdef was actually broken and left the function definition
> unterminated.
> =

> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Ping, looking to pull this in for stable.

> ---
>  include/qemu/timer.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/include/qemu/timer.h b/include/qemu/timer.h
> index 9dd206c..e3299b8 100644
> --- a/include/qemu/timer.h
> +++ b/include/qemu/timer.h
> @@ -125,8 +125,8 @@ static inline int64_t get_clock(void)
>             changes, so it should be avoided. */
>          return get_clock_realtime();
>      }
> -}
>  #endif
> +}
> =

>  void qemu_get_timer(QEMUFile *f, QEMUTimer *ts);
>  void qemu_put_timer(QEMUFile *f, QEMUTimer *ts);
> -- =

> 1.8.1.4


