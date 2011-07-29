Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QmoAo-0001iK-Tr
	for mharc-qemu-trivial@gnu.org; Fri, 29 Jul 2011 10:36:22 -0400
Received: from eggs.gnu.org ([140.186.70.92]:47076)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1QmoAm-0001h3-9q
	for qemu-trivial@nongnu.org; Fri, 29 Jul 2011 10:36:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1QmoAl-0006MP-7H
	for qemu-trivial@nongnu.org; Fri, 29 Jul 2011 10:36:20 -0400
Received: from mail-gw0-f45.google.com ([74.125.83.45]:56763)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>)
	id 1QmoAl-0006ML-4i; Fri, 29 Jul 2011 10:36:19 -0400
Received: by gwb19 with SMTP id 19so3285980gwb.4
	for <multiple recipients>; Fri, 29 Jul 2011 07:36:18 -0700 (PDT)
Received: by 10.150.65.9 with SMTP id n9mr865284yba.177.1311950178276;
	Fri, 29 Jul 2011 07:36:18 -0700 (PDT)
Received: from [192.168.0.103] (cpe-70-123-132-139.austin.res.rr.com
	[70.123.132.139])
	by mx.google.com with ESMTPS id e4sm1397019ybk.1.2011.07.29.07.36.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 29 Jul 2011 07:36:17 -0700 (PDT)
Message-ID: <4E32C560.2020001@redhat.com>
Date: Fri, 29 Jul 2011 09:36:16 -0500
From: Anthony Liguori <anthony@codemonkey.ws>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: TeLeMan <geleman@gmail.com>
References: <1311582554-963-1-git-send-email-geleman@gmail.com>
In-Reply-To: <1311582554-963-1-git-send-email-geleman@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.83.45
Cc: qemu-trivial@nongnu.org, "Daniel P. Berrange" <berrange@redhat.com>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] monitor: fix build breakage
	with --disable-vnc
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
X-List-Received-Date: Fri, 29 Jul 2011 14:36:21 -0000

On 07/25/2011 03:29 AM, TeLeMan wrote:
> The breakage was introduced by the commit 13661089810d3e59931f3e80d7cb541b99af7071
>
> Signed-off-by: TeLeMan<geleman@gmail.com>

Applied.  Thanks.

Regards,

Anthony Liguori

> ---
>   monitor.c |    2 ++
>   1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/monitor.c b/monitor.c
> index 92cdd05..52ae5f2 100644
> --- a/monitor.c
> +++ b/monitor.c
> @@ -1200,10 +1200,12 @@ static int add_graphics_client(Monitor *mon, const QDict *qdict, QObject **ret_d
>           }
>   	qerror_report(QERR_ADD_CLIENT_FAILED);
>   	return -1;
> +#ifdef CONFIG_VNC
>       } else if (strcmp(protocol, "vnc") == 0) {
>   	int fd = monitor_get_fd(mon, fdname);
>   	vnc_display_add_client(NULL, fd, skipauth);
>   	return 0;
> +#endif
>       } else if ((s = qemu_chr_find(protocol)) != NULL) {
>   	int fd = monitor_get_fd(mon, fdname);
>   	if (qemu_chr_add_client(s, fd)<  0) {


