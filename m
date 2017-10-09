Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e1RbS-0005vb-BB
	for mharc-qemu-trivial@gnu.org; Mon, 09 Oct 2017 02:31:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48895)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1e1RbQ-0005vV-Dk
	for qemu-trivial@nongnu.org; Mon, 09 Oct 2017 02:31:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1e1RbN-0004U9-4Y
	for qemu-trivial@nongnu.org; Mon, 09 Oct 2017 02:31:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50696)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>) id 1e1RbM-0004TR-Uw
	for qemu-trivial@nongnu.org; Mon, 09 Oct 2017 02:31:45 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 309BB8765D;
	Mon,  9 Oct 2017 06:31:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 309BB8765D
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=lvivier@redhat.com
Received: from [10.36.116.166] (ovpn-116-166.ams2.redhat.com [10.36.116.166])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8C1335C699;
	Mon,  9 Oct 2017 06:31:41 +0000 (UTC)
To: Marco A L Barbosa <malbarbo@gmail.com>
Cc: qemu-trivial@nongnu.org
References: <20171005135530.837-1-malbarbo@gmail.com>
	<498b5456-1a96-fbd9-6202-0a1301e3a8c5@redhat.com>
	<CAHpsRN-qFgp-QzjX-QdDUYgUA-DbWinp=hsk-V8L4WxXFDti8A@mail.gmail.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <477627a9-3441-be7d-bea2-abc409d1cfc8@redhat.com>
Date: Mon, 9 Oct 2017 08:31:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAHpsRN-qFgp-QzjX-QdDUYgUA-DbWinp=hsk-V8L4WxXFDti8A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 09 Oct 2017 06:31:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] linux-user: Add some random ioctls
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
X-List-Received-Date: Mon, 09 Oct 2017 06:31:49 -0000

On 06/10/2017 23:35, Marco A L Barbosa wrote:
> Thanks again for the advice.
> 
> This and the other patch should be resubmitted following those
> instructions or it is not necessary?

I don't think it's necessary.

Thanks,
Laurent

