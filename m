Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gZLWg-0006f6-QT
	for mharc-qemu-trivial@gnu.org; Tue, 18 Dec 2018 14:59:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40292)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gZLWf-0006do-1t
	for qemu-trivial@nongnu.org; Tue, 18 Dec 2018 14:59:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gZLWe-0007Gp-5w
	for qemu-trivial@nongnu.org; Tue, 18 Dec 2018 14:59:32 -0500
Received: from mx1.redhat.com ([209.132.183.28]:65309)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1gZLWY-0006cT-2f; Tue, 18 Dec 2018 14:59:27 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EF59385546;
	Tue, 18 Dec 2018 19:59:24 +0000 (UTC)
Received: from [10.10.122.76] (ovpn-122-76.rdu2.redhat.com [10.10.122.76])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 277967C805;
	Tue, 18 Dec 2018 19:59:24 +0000 (UTC)
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, armbru@redhat.com,
	Laurent Vivier <lvivier@redhat.com>
References: <20181115211752.1295571-1-eblake@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <ae6d8857-0d5f-f70c-1547-2f75d1a74cf6@redhat.com>
Date: Tue, 18 Dec 2018 13:59:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181115211752.1295571-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 18 Dec 2018 19:59:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/2] typedefs.h cleanup
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
X-List-Received-Date: Tue, 18 Dec 2018 19:59:33 -0000

On 11/15/18 3:17 PM, Eric Blake wrote:
> Prompted by my review of xiezhide's work.  No semantic change, but
> not technically a bug fix, so I don't care if it goes in 3.1 or
> waits for 4.0.
> 
> Eric Blake (2):
>    typedefs: (Re-)sort entries alphabetically
>    numa: Match struct to typedef name
> 

Ping. Patch 2 is now in master (aec90730) via numa, but patch 1 got 
overlooked in the trivial queue, even though it has reviews.

>   include/qemu/typedefs.h | 12 ++++++------
>   include/sysemu/numa.h   |  2 +-
>   2 files changed, 7 insertions(+), 7 deletions(-)
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

