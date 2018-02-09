Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ekFjs-0005kI-QK
	for mharc-qemu-trivial@gnu.org; Fri, 09 Feb 2018 15:57:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42632)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ekFjq-0005iX-3l
	for qemu-trivial@nongnu.org; Fri, 09 Feb 2018 15:57:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ekFjo-0005ix-Q3
	for qemu-trivial@nongnu.org; Fri, 09 Feb 2018 15:57:42 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:44298 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1ekFjj-0005Xj-Dk; Fri, 09 Feb 2018 15:57:35 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D98EA4022905;
	Fri,  9 Feb 2018 20:57:34 +0000 (UTC)
Received: from [10.10.122.122] (ovpn-122-122.rdu2.redhat.com [10.10.122.122])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2CED02166BAE;
	Fri,  9 Feb 2018 20:57:34 +0000 (UTC)
To: Yasmin Beatriz <yasmins@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20180209202621.97852-1-yasmins@linux.vnet.ibm.com>
Cc: qemu-trivial@nongnu.org, joserz@linux.vnet.ibm.com
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <baf09d46-934f-1f82-1f68-21ae22ffd2f9@redhat.com>
Date: Fri, 9 Feb 2018 14:57:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180209202621.97852-1-yasmins@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Fri, 09 Feb 2018 20:57:34 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Fri, 09 Feb 2018 20:57:34 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] dump: Show custom
 message for ENOSPC
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
X-List-Received-Date: Fri, 09 Feb 2018 20:57:43 -0000

On 02/09/2018 02:26 PM, Yasmin Beatriz wrote:
> This patch intends to make a more specific message for when
> the system has not enough space to save guest memory.
> 
> Reported-by: yilzhang@redhat.com
> Cc: Jose Ricardo Ziviani <joserz@linux.vnet.ibm.com>
> Signed-off-by: Yasmin Beatriz <yasmins@linux.vnet.ibm.com>
> ---

> @@ -364,7 +364,11 @@ static void write_data(DumpState *s, void *buf, int length, Error **errp)
>   
>       ret = fd_write_vmcore(buf, length, s);
>       if (ret < 0) {
> -        error_setg(errp, "dump: failed to save memory");
> +        if (ret == -ENOSPC) {
> +            error_setg(errp, "dump: not enough space to save memory");
> +        } else {
> +            error_setg(errp, "dump: failed to save memory");
> +        }

Why is this caller the only one in the file that gets distinguished 
error messages?  And why not use error_setg_errno() instead of 
open-coding just one special errno value?  If you're changing the return 
value of fd_write_vmcore() anyways, I'd suggest that ALL callers in the 
file be updated to use error_setg_errno().

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

