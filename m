Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bk3ym-0001fv-Tv
	for mharc-qemu-trivial@gnu.org; Wed, 14 Sep 2016 02:47:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41356)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk3yk-0001eY-Pg
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 02:47:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk3yk-0008K2-0U
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 02:47:30 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:49172)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bk3yf-0008Hn-HN; Wed, 14 Sep 2016 02:47:25 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 5E8EE417FF;
	Wed, 14 Sep 2016 09:47:19 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id ED8E3AAB;
	Wed, 14 Sep 2016 09:47:18 +0300 (MSK)
To: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org
References: <1469790338-28990-1-git-send-email-caoj.fnst@cn.fujitsu.com>
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Peter Maydell <peter.maydell@linaro.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <3ce74c99-1a3e-b29d-79bb-22d7125af51e@msgid.tls.msk.ru>
Date: Wed, 14 Sep 2016 09:47:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <1469790338-28990-1-git-send-email-caoj.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=windows-1251; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH 0/3] trivial changes of timer & cpus
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
X-List-Received-Date: Wed, 14 Sep 2016 06:47:31 -0000

29.07.2016 14:05, Cao jin wrote:
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc  Peter Crosthwaite <crosthwaite.peter@gmail.com>
> Cc: Richard Henderson <rth@twiddle.net>
>
> Cao jin (3):
>   timer: update comments
>   cpus: rename local variable to meaningful one
>   cpus: update comments
>
>  cpus.c               | 13 +++++++------
>  include/qemu/timer.h | 19 ++++++-------------
>  2 files changed, 13 insertions(+), 19 deletions(-)

Applied all 3 to -trivial, thanks!

/mjt



