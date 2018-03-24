Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ezlsI-0008Oq-UB
	for mharc-qemu-trivial@gnu.org; Sat, 24 Mar 2018 12:18:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52306)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ezlrD-00065m-ST
	for qemu-trivial@nongnu.org; Sat, 24 Mar 2018 12:18:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ezlpH-0000Da-Lw
	for qemu-trivial@nongnu.org; Sat, 24 Mar 2018 12:16:33 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:49046 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1ezhb7-0002HH-3H; Sat, 24 Mar 2018 07:44:33 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 93E35722C6;
	Sat, 24 Mar 2018 11:44:32 +0000 (UTC)
Received: from [10.10.121.135] (ovpn-121-135.rdu2.redhat.com [10.10.121.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 82D56D7DFC;
	Sat, 24 Mar 2018 11:44:29 +0000 (UTC)
To: Michal Privoznik <mprivozn@redhat.com>, qemu-devel@nongnu.org
References: <6f10cd53d361a395aa0e85a9311ec4e9a8fc11e5.1521868451.git.mprivozn@redhat.com>
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, famz@redhat.com,
	qemu-block@nongnu.org, qemu-stable <qemu-stable@nongnu.org>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <be650180-7aaf-8a7a-6601-92fce6ca2a95@redhat.com>
Date: Sat, 24 Mar 2018 06:44:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <6f10cd53d361a395aa0e85a9311ec4e9a8fc11e5.1521868451.git.mprivozn@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Sat, 24 Mar 2018 11:44:32 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Sat, 24 Mar 2018 11:44:32 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-pr-helper: Actually
 allow users to specify pidfile
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
X-List-Received-Date: Sat, 24 Mar 2018 16:18:34 -0000

On 03/24/2018 12:14 AM, Michal Privoznik wrote:
> Due to wrong specification of arguments to getopt_long() any
> attempt to set pidfile resulted in:
> 
> 1) the default to be leaked
> 2) the @pidfile variable to be set to NULL (because optarg is
> NULL without this patch).

Broken in introduction with commit b855f8d, in 2.11.

> 
> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>

CC: qemu-stable@nongnu.org
Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

