Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UXBtx-0005Sd-78
	for mharc-qemu-trivial@gnu.org; Tue, 30 Apr 2013 10:51:29 -0400
Received: from eggs.gnu.org ([208.118.235.92]:42684)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1UXBtt-0005MG-H8
	for qemu-trivial@nongnu.org; Tue, 30 Apr 2013 10:51:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1UXBtp-0002Og-1K
	for qemu-trivial@nongnu.org; Tue, 30 Apr 2013 10:51:25 -0400
Received: from e23smtp09.au.ibm.com ([202.81.31.142]:40506)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1UXBto-0002OD-F7
	for qemu-trivial@nongnu.org; Tue, 30 Apr 2013 10:51:20 -0400
Received: from /spool/local
	by e23smtp09.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <aliguori@us.ibm.com>;
	Wed, 1 May 2013 00:41:48 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
	by e23smtp09.au.ibm.com (202.81.31.206) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Wed, 1 May 2013 00:41:46 +1000
Received: from d23relay03.au.ibm.com (d23relay03.au.ibm.com [9.190.235.21])
	by d23dlp02.au.ibm.com (Postfix) with ESMTP id D435F2BB004F;
	Wed,  1 May 2013 00:51:12 +1000 (EST)
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
	by d23relay03.au.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	r3UEp6L918284784; Wed, 1 May 2013 00:51:06 +1000
Received: from d23av03.au.ibm.com (loopback [127.0.0.1])
	by d23av03.au.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	r3UEpCbL024106; Wed, 1 May 2013 00:51:12 +1000
Received: from titi.na.relay.ibm.com (titi.austin.ibm.com [9.41.105.190])
	by d23av03.au.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	r3UEp8ui024043; Wed, 1 May 2013 00:51:10 +1000
From: Anthony Liguori <aliguori@us.ibm.com>
To: Jesse Larrew <jlarrew@linux.vnet.ibm.com>, qemu-devel@nongnu.org
In-Reply-To: <1367250772-17928-1-git-send-email-jlarrew@linux.vnet.ibm.com>
References: <1367250772-17928-1-git-send-email-jlarrew@linux.vnet.ibm.com>
User-Agent: Notmuch/0.15.2+77~g661dcf8 (http://notmuchmail.org) Emacs/23.3.1
	(x86_64-pc-linux-gnu)
Date: Tue, 30 Apr 2013 09:51:08 -0500
Message-ID: <87ppxcnkbn.fsf@codemonkey.ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 13043014-3568-0000-0000-000003841573
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 202.81.31.142
Cc: qemu-trivial@nongnu.org, Jesse Larrew <jlarrew@linux.vnet.ibm.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] libqtest: only call
	fclose() on open files
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
X-List-Received-Date: Tue, 30 Apr 2013 14:51:26 -0000

Jesse Larrew <jlarrew@linux.vnet.ibm.com> writes:

> libqtest.c can segfault when calling fclose() if the pidfile wasn't
> opened successfully. This patch fixes the issue.
>
> Signed-off-by: Jesse Larrew <jlarrew@linux.vnet.ibm.com>

Reviewed-by: Anthony Liguori <aliguori@us.ibm.com>

Regards,

Anthony Liguori

> ---
>  tests/libqtest.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/libqtest.c b/tests/libqtest.c
> index 884f959..879ffe9 100644
> --- a/tests/libqtest.c
> +++ b/tests/libqtest.c
> @@ -99,8 +99,8 @@ static pid_t qtest_qemu_pid(QTestState *s)
>          if (fgets(buffer, sizeof(buffer), f)) {
>              pid = atoi(buffer);
>          }
> +        fclose(f);
>      }
> -    fclose(f);
>      return pid;
>  }
>  
> -- 
> 1.7.11.7


