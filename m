Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cvoET-0004m8-Rr
	for mharc-qemu-trivial@gnu.org; Wed, 05 Apr 2017 12:56:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35970)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1cvoER-0004m1-U0
	for qemu-trivial@nongnu.org; Wed, 05 Apr 2017 12:56:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1cvoEO-0005Dp-TE
	for qemu-trivial@nongnu.org; Wed, 05 Apr 2017 12:56:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37808)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>) id 1cvoEO-0005Bi-Nv
	for qemu-trivial@nongnu.org; Wed, 05 Apr 2017 12:56:28 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6F888A3288;
	Wed,  5 Apr 2017 16:56:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 6F888A3288
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=lvivier@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 6F888A3288
Received: from [10.36.116.178] (ovpn-116-178.ams2.redhat.com [10.36.116.178])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CEDF417A75;
	Wed,  5 Apr 2017 16:56:25 +0000 (UTC)
To: jc <chaujohnthan@163.com>, qemu-trivial@nongnu.org
References: <76408681.3d5f.15b34bfe08c.Coremail.chaujohnthan@163.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <6bd84fab-d9e7-ac68-f790-2cd8494210e4@redhat.com>
Date: Wed, 5 Apr 2017 18:56:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <76408681.3d5f.15b34bfe08c.Coremail.chaujohnthan@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 05 Apr 2017 16:56:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] a trival comipling problem.
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
X-List-Received-Date: Wed, 05 Apr 2017 16:56:32 -0000

On 03/04/2017 18:57, jc wrote:
> /opt/qemu-2.9.0-rc2/linux-user/syscall.c: In function
> 'target_to_host_timex':
> /opt/qemu-2.9.0-rc2/linux-user/syscall.c:6974: error: 'struct timex' has
> no member named 'tai'

For the archive as we have discussed of that off-line:

"tai" field in "struct time" has been added in glibc header version 2.12.

It's the reason of the problem as jc is using version 2.7.

Laurent


