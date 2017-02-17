Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cegaK-0007XO-C9
	for mharc-qemu-trivial@gnu.org; Fri, 17 Feb 2017 06:20:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59418)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1cegaH-0007Vy-Tu
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2017 06:20:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1cegaG-0004SC-V3
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2017 06:20:17 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57900)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1cegaA-0004OC-QQ; Fri, 17 Feb 2017 06:20:10 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 900A3C04B328;
	Fri, 17 Feb 2017 11:20:10 +0000 (UTC)
Received: from [10.36.116.208] (ovpn-116-208.ams2.redhat.com [10.36.116.208])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id v1HBK6jK026395
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 17 Feb 2017 06:20:07 -0500
To: Peter Maydell <peter.maydell@linaro.org>
References: <CABHMSTVDnAxAvpp81+z_2fkAFO7tazLJs3cFXpuDuuGQj-Ek-A@mail.gmail.com>
	<1933406e-2576-e687-3545-a72f3b999310@redhat.com>
	<bf1410bc-bc6d-bb29-5591-55634f25d487@redhat.com>
	<e19aed34-77c2-f588-351d-2daa8a099ae9@redhat.com>
	<CAFEAcA-3TkmaJXpG2RpzBPKmj+JKGK5EBwPvXWkwR=Qkobq-Sg@mail.gmail.com>
Cc: Laszlo Ersek <lersek@redhat.com>, Chad Joan <chadjoan@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7c4d6c25-3b1c-61ec-1eda-6c5e7cee8755@redhat.com>
Date: Fri, 17 Feb 2017 12:20:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-3TkmaJXpG2RpzBPKmj+JKGK5EBwPvXWkwR=Qkobq-Sg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 17 Feb 2017 11:20:10 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] Fix build break during
 configuration on musl-libc based Linux systems.
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
X-List-Received-Date: Fri, 17 Feb 2017 11:20:18 -0000



On 17/02/2017 11:18, Peter Maydell wrote:
> Defining _XOPEN_SOURCE is easy enough, and I think we should
> do it unconditionally. We should check what effect this has
> on the BSD hosts though I guess. (You could argue that we
> should be defining _XOPEN_SOURCE anyway for the benefit of
> the non-glibc BSD/Solaris/etc platforms.)

Sounds good, then I think we should define it to 700 just like glibc does.

Paolo

