Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZxHTT-0006bF-47
	for mharc-qemu-trivial@gnu.org; Fri, 13 Nov 2015 11:45:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48293)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZxHTN-0006Ub-Nx
	for qemu-trivial@nongnu.org; Fri, 13 Nov 2015 11:45:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZxHTM-00063x-RD
	for qemu-trivial@nongnu.org; Fri, 13 Nov 2015 11:45:13 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45283)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1ZxHTC-0005sb-SN; Fri, 13 Nov 2015 11:45:02 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 5C24519D05D;
	Fri, 13 Nov 2015 16:45:02 +0000 (UTC)
Received: from [10.36.7.43] (vpn1-7-43.ams2.redhat.com [10.36.7.43])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tADGixLL007065
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 13 Nov 2015 11:45:01 -0500
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1447419494-10670-1-git-send-email-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <5646138B.7000809@redhat.com>
Date: Fri, 13 Nov 2015 17:44:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1447419494-10670-1-git-send-email-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] net: convert qemu_log to
	error_report
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
X-List-Received-Date: Fri, 13 Nov 2015 16:45:18 -0000

On 13/11/15 13:58, Paolo Bonzini wrote:
> Ensure that the error is printed with the proper timestamp.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  net/dump.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/dump.c b/net/dump.c
> index dd0555f..ab71ffc 100644
> --- a/net/dump.c
> +++ b/net/dump.c
> @@ -84,7 +84,7 @@ static ssize_t dump_receive_iov(DumpState *s, const struct iovec *iov, int cnt)
>      cnt = iov_copy(&dumpiov[1], cnt, iov, cnt, 0, caplen);
>  
>      if (writev(s->fd, dumpiov, cnt + 1) != sizeof(hdr) + caplen) {
> -        qemu_log("-net dump write error - stop dump\n");
> +        error_report("-net dump write error - stop dump");
>          close(s->fd);
>          s->fd = -1;
>      }

We should maybe also reword that text a little bit, since this code is
now used by the netdev dumping filter, too, so "-net dump" is not the
only user anymore. Anyway, that can also be done with a later patch, so
if you don't want to do this now:

Reviewed-by: Thomas Huth <thuth@redhat.com>


