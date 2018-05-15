Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fISQO-0005ew-0e
	for mharc-qemu-trivial@gnu.org; Tue, 15 May 2018 01:23:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59956)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fISQL-0005d1-Gc
	for qemu-trivial@nongnu.org; Tue, 15 May 2018 01:22:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fISQK-00020e-Ot
	for qemu-trivial@nongnu.org; Tue, 15 May 2018 01:22:57 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:54848 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fISQF-0001xh-Om; Tue, 15 May 2018 01:22:51 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C1CBCEB6E5;
	Tue, 15 May 2018 05:22:50 +0000 (UTC)
Received: from [10.36.116.96] (ovpn-116-96.ams2.redhat.com [10.36.116.96])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED28B112D17B;
	Tue, 15 May 2018 05:22:49 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: patches@linaro.org
References: <20180514173044.5025-1-peter.maydell@linaro.org>
	<20180514173044.5025-2-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <716c53cb-89f6-088e-a5f1-47a6c5f740a7@redhat.com>
Date: Tue, 15 May 2018 07:22:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180514173044.5025-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Tue, 15 May 2018 05:22:50 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Tue, 15 May 2018 05:22:50 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] gdbstub: Use
 qemu_set_cloexec()
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
X-List-Received-Date: Tue, 15 May 2018 05:22:58 -0000

On 14.05.2018 19:30, Peter Maydell wrote:
> Use the utility routine qemu_set_cloexec() rather than
> manually calling fcntl(). This lets us drop the #ifndef _WIN32
> guards and also means Coverity doesn't complain that we're
> ignoring the fcntl error return (CID 1005665, CID 1005667).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  gdbstub.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>



