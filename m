Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e03Us-0007Tj-1L
	for mharc-qemu-trivial@gnu.org; Thu, 05 Oct 2017 06:35:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50033)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1e03Up-0007SF-Py
	for qemu-trivial@nongnu.org; Thu, 05 Oct 2017 06:35:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1e03Up-00055q-2K
	for qemu-trivial@nongnu.org; Thu, 05 Oct 2017 06:35:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34628)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1e03Ui-0004v6-Rb; Thu, 05 Oct 2017 06:35:08 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D52D36E778;
	Thu,  5 Oct 2017 10:35:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com D52D36E778
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=lvivier@redhat.com
Received: from [10.36.116.122] (ovpn-116-122.ams2.redhat.com [10.36.116.122])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E569D5D9CD;
	Thu,  5 Oct 2017 10:35:06 +0000 (UTC)
To: Marco A L Barbosa <malbarbo@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <CAHpsRN-XzxjJZb=rb0iHMv4Afv=2H3N5U7p4+NNJFPkxgSLMXg@mail.gmail.com>
	<43071208-759c-6476-0cb0-c4e7e0daaf77@redhat.com>
	<CAHpsRN9s_qa_knpn0QRVu0UasFrx1c+nvy2rY6hHB7GvnRkCZg@mail.gmail.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <82b1a00d-ea31-c76f-96bd-402828cceebf@redhat.com>
Date: Thu, 5 Oct 2017 12:35:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAHpsRN9s_qa_knpn0QRVu0UasFrx1c+nvy2rY6hHB7GvnRkCZg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 05 Oct 2017 10:35:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] linux-user: Add random ioctls
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
X-List-Received-Date: Thu, 05 Oct 2017 10:35:16 -0000

On 05/10/2017 12:24, Marco A L Barbosa wrote:
>     I doesn't look really trivial...
> 
>     To manage the buf field you must read buf_size and it cannot be done in
>     a generic way: you must define a function to translate the buffer, use
>     IOCTL_SPECIAL() with RNDADDENTROPY and RNDGETPOOL.
> 
>     You should send your patch using "git send-email" or "git publish"
>     instead of adding it in you email client.
> 
> 
> Thanks for your advices.
> 
> My use case only requires support for RNDGETENTCNT... Considering that
> RNDADDENTROPY and RNDGETPOOL are non trivial, would a patch with only
> RNDGETENTCNT, RNDADDTOENTCNT, RNDZAPENTCNT and RNDCLEARPOOL be accepted?

I think you can only post what you use. If it is tested, it's better...

Thanks,
Laurent

