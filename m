Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yy1uc-0007Nn-VC
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 13:48:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55109)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Yy1ua-0007Hl-42
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 13:48:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Yy1uZ-0006mO-ES
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 13:48:08 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:36722)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Yy1uQ-0006i4-96; Thu, 28 May 2015 13:47:58 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 3AB1442771;
	Thu, 28 May 2015 20:47:54 +0300 (MSK)
Message-ID: <556754CA.1090301@msgid.tls.msk.ru>
Date: Thu, 28 May 2015 20:47:54 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.6.0
MIME-Version: 1.0
To: Shannon Zhao <zhaoshenglong@huawei.com>, qemu-devel@nongnu.org
References: <1432816784-12436-1-git-send-email-zhaoshenglong@huawei.com>
In-Reply-To: <1432816784-12436-1-git-send-email-zhaoshenglong@huawei.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, shannon.zhao@linaro.org,
	peter.maydell@linaro.org
Subject: Re: [Qemu-trivial] [PATCH v2 0/4] Fix memory leak due to calling
 qemu_find_file and not freeing return buf
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 28 May 2015 17:48:09 -0000

28.05.2015 15:39, Shannon Zhao wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
> 
> Before I sent some patches to fix memory leak spotted by valgrind. Then
> I'd like to dig deeper and find that two places have memory leak due to
> calling qemu_find_file and not freeing return buf. Then through code
> searching another two places are found. So this patchset is to fix them.

Applied all 4 to -trivial, thank you!

/mjt

