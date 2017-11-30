Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eKROi-0005rX-Dd
	for mharc-qemu-trivial@gnu.org; Thu, 30 Nov 2017 11:09:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56659)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eKROg-0005pz-CY
	for qemu-trivial@nongnu.org; Thu, 30 Nov 2017 11:09:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eKROc-0007c6-Cs
	for qemu-trivial@nongnu.org; Thu, 30 Nov 2017 11:09:10 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55785)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1eKROS-0007Wz-9V; Thu, 30 Nov 2017 11:08:56 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 720B98008D;
	Thu, 30 Nov 2017 16:08:55 +0000 (UTC)
Received: from [10.36.116.158] (ovpn-116-158.ams2.redhat.com [10.36.116.158])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 374B35D75A;
	Thu, 30 Nov 2017 16:08:52 +0000 (UTC)
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Jason Wang <jasowang@redhat.com>
References: <20171130134159.9697-1-eblake@redhat.com>
	<20171130134159.9697-2-eblake@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <ecbf4f53-8094-658d-75b7-a7cda8a1ca08@redhat.com>
Date: Thu, 30 Nov 2017 17:08:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171130134159.9697-2-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 30 Nov 2017 16:08:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/3] net: Drop unusual use
 of do { } while (0); 
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
X-List-Received-Date: Thu, 30 Nov 2017 16:09:11 -0000

On 30.11.2017 14:41, Eric Blake wrote:
> For a couple of macros in pcnet.c, we have to provide a new scope
> to avoid compiler warnings about declarations in the middle of a
> switch statement that aren't in a sub-scope.  But use of
> 'do { ... } while (0);' merely to provide that new scope is arcane
> overkill, compared to just using '{ ... }'.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  hw/net/pcnet.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>

