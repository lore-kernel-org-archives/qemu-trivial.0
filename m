Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WJSYK-0000r3-LO
	for mharc-qemu-trivial@gnu.org; Fri, 28 Feb 2014 13:52:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55090)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1WJSYD-0000hk-Lb
	for qemu-trivial@nongnu.org; Fri, 28 Feb 2014 13:52:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1WJSY8-0003Fy-M0
	for qemu-trivial@nongnu.org; Fri, 28 Feb 2014 13:52:49 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35788)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1WJSXx-00037D-KG; Fri, 28 Feb 2014 13:52:33 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s1SIqU1E003574
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 28 Feb 2014 13:52:31 -0500
Received: from localhost (ovpn-113-119.phx2.redhat.com [10.3.113.119])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s1SIqTMS000628; Fri, 28 Feb 2014 13:52:29 -0500
Date: Fri, 28 Feb 2014 13:50:02 -0500
From: Luiz Capitulino <lcapitulino@redhat.com>
To: Hani Benhabiles <kroosec@gmail.com>
Message-ID: <20140228135002.73234702@redhat.com>
In-Reply-To: <1393452592-13934-1-git-send-email-kroosec@gmail.com>
References: <1393452592-13934-1-git-send-email-kroosec@gmail.com>
Organization: Red Hat
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] monitor: Remove left-over code in
	do_info_profile.
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
X-List-Received-Date: Fri, 28 Feb 2014 18:52:54 -0000

On Wed, 26 Feb 2014 23:09:52 +0100
Hani Benhabiles <kroosec@gmail.com> wrote:

> This is a left-over from 4a1418e.
> 
> Signed-off-by: Hani Benhabiles <hani@linux.com>

Applied to the qmp branch, thanks.

> ---
>  monitor.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/monitor.c b/monitor.c
> index aebcbd8..3863d83 100644
> --- a/monitor.c
> +++ b/monitor.c
> @@ -2021,10 +2021,6 @@ int64_t dev_time;
>  
>  static void do_info_profile(Monitor *mon, const QDict *qdict)
>  {
> -    int64_t total;
> -    total = qemu_time;
> -    if (total == 0)
> -        total = 1;
>      monitor_printf(mon, "async time  %" PRId64 " (%0.3f)\n",
>                     dev_time, dev_time / (double)get_ticks_per_sec());
>      monitor_printf(mon, "qemu time   %" PRId64 " (%0.3f)\n",


