Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YLjJ8-0005yQ-Bk
	for mharc-qemu-trivial@gnu.org; Wed, 11 Feb 2015 21:15:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54151)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YLjJ6-0005uV-Bf
	for qemu-trivial@nongnu.org; Wed, 11 Feb 2015 21:15:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YLjJ3-00040Q-4V
	for qemu-trivial@nongnu.org; Wed, 11 Feb 2015 21:15:08 -0500
Received: from szxga01-in.huawei.com ([119.145.14.64]:5869)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YLjJ2-0003xU-JE; Wed, 11 Feb 2015 21:15:05 -0500
Received: from 172.24.2.119 (EHLO szxeml434-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CJK57496; Thu, 12 Feb 2015 10:15:00 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml434-hub.china.huawei.com
	(10.82.67.225) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 12 Feb 2015 10:14:58 +0800
Message-ID: <54DC0C9B.40505@huawei.com>
Date: Thu, 12 Feb 2015 10:14:51 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Gerd Hoffmann <kraxel@redhat.com>, <qemu-devel@nongnu.org>
References: <1423673410-15100-1-git-send-email-kraxel@redhat.com>
In-Reply-To: <1423673410-15100-1-git-send-email-kraxel@redhat.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
	Luiz Capitulino <lcapitulino@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] spice: fix memory leak
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
X-List-Received-Date: Thu, 12 Feb 2015 02:15:09 -0000

On 2015/2/12 0:50, Gerd Hoffmann wrote:
> Found by coverity.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  monitor.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/monitor.c b/monitor.c
> index c3cc060..2c37953 100644
> --- a/monitor.c
> +++ b/monitor.c
> @@ -1101,6 +1101,7 @@ static int client_migrate_info(Monitor *mon, const QDict *qdict,
>      if (strcmp(protocol, "spice") == 0) {
>          if (!qemu_using_spice(&err)) {
>              qerror_report_err(err);
> +            error_free(err);
>              return -1;
>          }
>  
> 
Hi, Gerd
the err variable should be initialized to NULL.

This leak had been fixed by:
http://patchwork.ozlabs.org/patch/438696/

and v2:
[PATCH v2] monitor: Fix missing err = NULL in client_migrate_info()

Regards,
-Gonglei


