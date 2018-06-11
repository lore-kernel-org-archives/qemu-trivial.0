Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fST4G-0004Io-KE
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jun 2018 16:05:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34569)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1fST4F-0004Hl-4S
	for qemu-trivial@nongnu.org; Mon, 11 Jun 2018 16:05:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1fST4E-0003w3-7g
	for qemu-trivial@nongnu.org; Mon, 11 Jun 2018 16:05:31 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:44762 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1fST49-0003qk-6K; Mon, 11 Jun 2018 16:05:25 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A57E0818BAF4;
	Mon, 11 Jun 2018 20:05:24 +0000 (UTC)
Received: from [10.10.120.103] (ovpn-120-103.rdu2.redhat.com [10.10.120.103])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EE5802022DF5;
	Mon, 11 Jun 2018 20:05:23 +0000 (UTC)
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
References: <20180611195607.3015-1-ehabkost@redhat.com>
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Sergio Andres Gomez Del Real <sergio.g.delreal@gmail.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <7e40b530-d59b-5d4e-8b34-9ebb0ce142b1@redhat.com>
Date: Mon, 11 Jun 2018 15:05:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180611195607.3015-1-ehabkost@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Mon, 11 Jun 2018 20:05:24 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Mon, 11 Jun 2018 20:05:24 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-options: Add missing
 newline to -accel help text
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
X-List-Received-Date: Mon, 11 Jun 2018 20:05:32 -0000

On 06/11/2018 02:56 PM, Eduardo Habkost wrote:
> The newline was removed by commit c97d6d2c, and broke -help output:

-help output is not supposed to be parsed by machine, in part because of 
stuff like this ;)

> 
> Before this patch:
> 
>    $ qemu-system-x86_64 -help | grep smp
>                    thread=single|multi (enable multi-threaded TCG)-smp [...]
> 
> After this patch:
> 
>    $ qemu-system-x86_64 -help  | grep smp
>    -smp [cpus=]n[,maxcpus=cpus][,cores=cores][,threads=threads][,sockets=sockets]
> 
> Fixes: c97d6d2cdf97edb4aebe832fdba65d701ad7bcb6
> Cc: Sergio Andres Gomez Del Real <sergio.g.delreal@gmail.com>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---

But for the humans, this is a definite mistake worth fixing.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

