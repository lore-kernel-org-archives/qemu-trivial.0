Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RinNk-0003ks-PJ
	for mharc-qemu-trivial@gnu.org; Thu, 05 Jan 2012 08:29:24 -0500
Received: from eggs.gnu.org ([140.186.70.92]:50561)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1RinNf-0003St-Nn
	for qemu-trivial@nongnu.org; Thu, 05 Jan 2012 08:29:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1RinNZ-0000Pj-VX
	for qemu-trivial@nongnu.org; Thu, 05 Jan 2012 08:29:19 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60807)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1RinNX-0000P9-Mh; Thu, 05 Jan 2012 08:29:11 -0500
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q05DT5qK006771
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 5 Jan 2012 08:29:05 -0500
Received: from yakj.usersys.redhat.com (ovpn-112-17.ams2.redhat.com
	[10.36.112.17])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q05DT3Db025689; Thu, 5 Jan 2012 08:29:04 -0500
Message-ID: <4F05A59D.4060407@redhat.com>
Date: Thu, 05 Jan 2012 14:29:01 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
References: <1325769367-32267-1-git-send-email-stefanha@linux.vnet.ibm.com>
In-Reply-To: <1325769367-32267-1-git-send-email-stefanha@linux.vnet.ibm.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Dr David Alan Gilbert <davidagilbert@uk.ibm.com>
Subject: Re: [Qemu-trivial] [PATCH] qemu-nbd: drop loop which can never loop
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
X-List-Received-Date: Thu, 05 Jan 2012 13:29:23 -0000

On 01/05/2012 02:16 PM, Stefan Hajnoczi wrote:
> For some reason nbd_client_thread() has a do..while loop which can never
> loop, the condition is bogus because we would take a goto instead.  Drop
> the loop.
>
> Reported-by: Dr David Alan Gilbert<davidagilbert@uk.ibm.com>
> Signed-off-by: Stefan Hajnoczi<stefanha@linux.vnet.ibm.com>
> ---
>   qemu-nbd.c |   10 ++++------
>   1 files changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/qemu-nbd.c b/qemu-nbd.c
> index 155b058..eb61c33 100644
> --- a/qemu-nbd.c
> +++ b/qemu-nbd.c
> @@ -202,12 +202,10 @@ static void *nbd_client_thread(void *arg)
>       int ret;
>       pthread_t show_parts_thread;
>
> -    do {
> -        sock = unix_socket_outgoing(sockpath);
> -        if (sock == -1) {
> -            goto out;
> -        }
> -    } while (sock == -1);
> +    sock = unix_socket_outgoing(sockpath);
> +    if (sock == -1) {
> +        goto out;
> +    }
>
>       ret = nbd_receive_negotiate(sock, NULL,&nbdflags,
>                                   &size,&blocksize);

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

It used to loop until commit f1ef555.  When I simplified the loop I 
failed to actually remove it.

I suppose it will get in through your trivial patches tree, won't it?

Paolo

