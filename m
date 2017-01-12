Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cRdIo-0008Ex-AY
	for mharc-qemu-trivial@gnu.org; Thu, 12 Jan 2017 06:12:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54469)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cRdIj-0008BL-Er
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2017 06:12:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cRdIi-0000LG-AG
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2017 06:12:13 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:33822)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cRdIb-0000HY-SU; Thu, 12 Jan 2017 06:12:06 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id D00BA40A33;
	Thu, 12 Jan 2017 14:12:05 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 161C454C;
	Thu, 12 Jan 2017 14:12:05 +0300 (MSK)
To: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1478094287-15009-1-git-send-email-caoj.fnst@cn.fujitsu.com>
Cc: peter.maydell@linaro.org, thuth@redhat.com, eblake@redhat.com,
	armbru@redhat.com, mst@redhat.com
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <85e7c088-cead-6fac-c916-03e6e9b4f9c5@msgid.tls.msk.ru>
Date: Thu, 12 Jan 2017 14:12:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.5.1
MIME-Version: 1.0
In-Reply-To: <1478094287-15009-1-git-send-email-caoj.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH v4 0/2] trivial changes on util/mmap-alloc
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
X-List-Received-Date: Thu, 12 Jan 2017 11:12:17 -0000

02.11.2016 16:44, Cao jin wrote:
> Cao jin (2):
>   util/mmap-alloc: check parameter before using
>   util/mmap-alloc: refactor a little bit for readability
> 
>  util/mmap-alloc.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)

Applied (finally) to -trivial, thank you very much!

/mjt


