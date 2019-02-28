Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gzOAB-0000IQ-Ar
	for mharc-qemu-trivial@gnu.org; Thu, 28 Feb 2019 11:03:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41543)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gzOA3-0000DN-62
	for qemu-trivial@nongnu.org; Thu, 28 Feb 2019 11:03:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gzO9y-0004iz-T9
	for qemu-trivial@nongnu.org; Thu, 28 Feb 2019 11:03:49 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59280)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1gzO9s-0004eo-7D; Thu, 28 Feb 2019 11:03:42 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 53E9613B224;
	Thu, 28 Feb 2019 16:03:38 +0000 (UTC)
Received: from [10.3.116.222] (ovpn-116-222.phx2.redhat.com [10.3.116.222])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA9355D707;
	Thu, 28 Feb 2019 16:03:37 +0000 (UTC)
To: Aarushi Mehta <mehta.aaru20@gmail.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: qemu-trivial@nongnu.org, Stefan Hajnoczi <stefanha@gmail.com>,
	Julia Suvorova <jusual@mail.ru>
References: <60952760a82dc603b836ca41fd0f9b1325cad635.camel@gmail.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <3f30ec53-6cac-d2cb-5fdb-db9ab3438c85@redhat.com>
Date: Thu, 28 Feb 2019 10:03:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <60952760a82dc603b836ca41fd0f9b1325cad635.camel@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 28 Feb 2019 16:03:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] trivial fix of malloc to
 g_new in thunk
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
X-List-Received-Date: Thu, 28 Feb 2019 16:03:57 -0000

On 2/28/19 9:35 AM, Aarushi Mehta wrote:
> 
> Signed-off-by: Aarushi Mehta <mehta.aaru20@gmail.com>
> ---
> Note that since thunking occurs throughout the lifetime of the QEMU instance, 
> there is no matching 'free' to correct

This sentence is vital to the patch, so it belongs above the --- and
S-o-b as part of the commit message.

> It might be valuable to edit the BiteSizedTasks to reflect that g_new is favoured over g_malloc

And I've done that now, by emphasizing the discussion in HACKING (rather
than repeating it on the wiki):
https://wiki.qemu.org/index.php?title=Contribute/BiteSizedTasks&diff=8247&oldid=8242

With the improved commit message,
Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

