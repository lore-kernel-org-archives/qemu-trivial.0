Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ekFfi-0002za-4e
	for mharc-qemu-trivial@gnu.org; Fri, 09 Feb 2018 15:53:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41254)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ekFff-0002xq-G6
	for qemu-trivial@nongnu.org; Fri, 09 Feb 2018 15:53:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ekFfe-000351-JK
	for qemu-trivial@nongnu.org; Fri, 09 Feb 2018 15:53:23 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:47032 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1ekFfZ-00033Y-7Z; Fri, 09 Feb 2018 15:53:17 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 965A18182D0A;
	Fri,  9 Feb 2018 20:53:06 +0000 (UTC)
Received: from [10.10.122.122] (ovpn-122-122.rdu2.redhat.com [10.10.122.122])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0BC22FA2AF;
	Fri,  9 Feb 2018 20:52:59 +0000 (UTC)
To: Yasmin Beatriz <yasmins@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20180209193138.97198-1-yasmins@linux.vnet.ibm.com>
Cc: qemu-trivial@nongnu.org, joserz@linux.vnet.ibm.com
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <c8cf6861-042a-4c6e-0163-b49b38b577d3@redhat.com>
Date: Fri, 9 Feb 2018 14:52:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180209193138.97198-1-yasmins@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Fri, 09 Feb 2018 20:53:06 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Fri, 09 Feb 2018 20:53:06 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] dump: Show custom message
 for ENOSPC
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Feb 2018 20:53:24 -0000

On 02/09/2018 01:31 PM, Yasmin Beatriz wrote:
> This patch intends to make a more specific message for when
> the system has not enough space to save guest memory.
> 
> Reported-by: yilzhang@redhat.com
> Cc: Jose Ricardo Ziviani <joserz@linux.vnet.ibm.com>
> Signed-off-by: Yasmin Beatriz <yasmins@linux.vnet.ibm.com>
> ---
>   dump.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/dump.c b/dump.c
> index e9dfed060a..eb56ff53f6 100644
> --- a/dump.c
> +++ b/dump.c
> @@ -106,6 +106,9 @@ static int fd_write_vmcore(const void *buf, size_t size, void *opaque)
>   
>       written_size = qemu_write_full(s->fd, buf, size);
>       if (written_size != size) {
> +        if (errno == ENOSPC) {
> +            return -ENOSPC;
> +        }
>           return -1;

Mixing a return of -1 and negative errno is ugly (as -1 is 
indistinguishable from -EPERM on many, but not all, operating systems). 
If you need to distinguish between different error types, then return 
negative errno in all places.

>       }
>   
> @@ -364,7 +367,11 @@ static void write_data(DumpState *s, void *buf, int length, Error **errp)
>   
>       ret = fd_write_vmcore(buf, length, s);
>       if (ret < 0) {
> -        error_setg(errp, "dump: failed to save memory");

Or, if you really want better error messages, it might make sense to 
push errp setting down into fd_write_vmcore() (all callers have to be 
updated).

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

