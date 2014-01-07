Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W0XLk-0004l8-PP
	for mharc-qemu-trivial@gnu.org; Tue, 07 Jan 2014 09:09:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50551)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1W0XLe-0004bp-IE
	for qemu-trivial@nongnu.org; Tue, 07 Jan 2014 09:09:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1W0XLZ-00055h-I9
	for qemu-trivial@nongnu.org; Tue, 07 Jan 2014 09:09:38 -0500
Received: from mx1.redhat.com ([209.132.183.28]:26140)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1W0XLO-00053l-Uk; Tue, 07 Jan 2014 09:09:23 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s07E9JtU032702
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 7 Jan 2014 09:09:20 -0500
Received: from blackfin.pond.sub.org (ovpn-116-58.ams2.redhat.com
	[10.36.116.58])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s07E9H1w004957
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 7 Jan 2014 09:09:18 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 0BFB9200CD; Tue,  7 Jan 2014 15:09:17 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Namhyung Kim <namhyung@gmail.com>
References: <1389099231-3389-1-git-send-email-namhyung@gmail.com>
Date: Tue, 07 Jan 2014 15:09:16 +0100
In-Reply-To: <1389099231-3389-1-git-send-email-namhyung@gmail.com> (Namhyung
	Kim's message of "Tue, 7 Jan 2014 21:53:51 +0900")
Message-ID: <87iotvj33n.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] docs: Fix typo in QMP
	WAKEUP example
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
X-List-Received-Date: Tue, 07 Jan 2014 14:09:43 -0000

Namhyung Kim <namhyung@gmail.com> writes:

> Cc: qemu-trivial@nongnu.org
> Signed-off-by: Namhyung Kim <namhyung@gmail.com>
> ---
>  docs/qmp/qmp-events.txt |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/docs/qmp/qmp-events.txt b/docs/qmp/qmp-events.txt
> index 6b87e97..a378c87 100644
> --- a/docs/qmp/qmp-events.txt
> +++ b/docs/qmp/qmp-events.txt
> @@ -479,7 +479,7 @@ Data: None.
>  
>  Example:
>  
> -{ "event": "WATCHDOG",
> +{ "event": "WAKEUP",
>       "timestamp": { "seconds": 1344522075, "microseconds": 745528 } }
>  
>  WATCHDOG

Reviewed-by: Markus Armbruster <armbru@redhat.com>

