Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S7RvZ-0001N9-D6
	for mharc-qemu-trivial@gnu.org; Tue, 13 Mar 2012 09:38:13 -0400
Received: from eggs.gnu.org ([208.118.235.92]:58556)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1S7RvS-00012K-IL
	for qemu-trivial@nongnu.org; Tue, 13 Mar 2012 09:38:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1S7RvM-00046W-Cm
	for qemu-trivial@nongnu.org; Tue, 13 Mar 2012 09:38:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:29556)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1S7RvA-00045G-4a; Tue, 13 Mar 2012 09:37:48 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q2DDbkii005707
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 13 Mar 2012 09:37:46 -0400
Received: from doriath.home (ovpn-113-79.phx2.redhat.com [10.3.113.79])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q2DDbiwA032592; Tue, 13 Mar 2012 09:37:45 -0400
Date: Tue, 13 Mar 2012 10:37:50 -0300
From: Luiz Capitulino <lcapitulino@redhat.com>
To: Jeff Cody <jcody@redhat.com>
Message-ID: <20120313103750.0cb97f47@doriath.home>
In-Reply-To: <14fd588cffd843789d6b6a4379f42ac1b2a6fbbf.1331575674.git.jcody@redhat.com>
References: <14fd588cffd843789d6b6a4379f42ac1b2a6fbbf.1331575674.git.jcody@redhat.com>
Organization: Red Hat
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] monitor: Remove unused bool field 'qapi'
 in mon_cmd_t struct
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
X-List-Received-Date: Tue, 13 Mar 2012 13:38:12 -0000

On Mon, 12 Mar 2012 14:13:57 -0400
Jeff Cody <jcody@redhat.com> wrote:

> Some minor code cleanup: the 'qapi' bool field in mon_cmd_t is
> unused, and can be removed.
> 
> Signed-off-by: Jeff Cody <jcody@redhat.com>

Acked-by: Luiz Capitulino <lcapitulino@redhat.com>

> ---
>  monitor.c |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
> 
> diff --git a/monitor.c b/monitor.c
> index a787aab..34272eb 100644
> --- a/monitor.c
> +++ b/monitor.c
> @@ -128,7 +128,6 @@ typedef struct mon_cmd_t {
>          int  (*cmd_async)(Monitor *mon, const QDict *params,
>                            MonitorCompletion *cb, void *opaque);
>      } mhandler;
> -    bool qapi;
>      int flags;
>  } mon_cmd_t;
>  


