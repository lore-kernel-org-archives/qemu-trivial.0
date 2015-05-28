Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YxwVu-0000v4-7u
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 08:02:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55727)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YxwVo-0000mT-7y
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:02:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YxwVj-0000hp-4b
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:02:11 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:60021)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YxwVX-0000fJ-KW; Thu, 28 May 2015 08:01:55 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id D27FB4272A;
	Thu, 28 May 2015 15:01:54 +0300 (MSK)
Message-ID: <556703B2.8050606@msgid.tls.msk.ru>
Date: Thu, 28 May 2015 15:01:54 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.6.0
MIME-Version: 1.0
To: Shannon Zhao <zhaoshenglong@huawei.com>, qemu-devel@nongnu.org
References: <1432811625-13392-1-git-send-email-zhaoshenglong@huawei.com>	<1432811625-13392-5-git-send-email-zhaoshenglong@huawei.com>
	<556701E8.1040801@msgid.tls.msk.ru>
In-Reply-To: <556701E8.1040801@msgid.tls.msk.ru>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, shannon.zhao@linaro.org
Subject: Re: [Qemu-trivial] [PATCH 4/4] hw/display/tcx.c: Fix memory leak
	spotted by valgrind
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
X-List-Received-Date: Thu, 28 May 2015 12:02:17 -0000

28.05.2015 14:54, Michael Tokarev wrote:
> Applied to -trivial, thanks!

..or not applied yet... :)

This is again the same situation with the error message as with
1/4 hw/display/cg3.c, and the same question - is the error fatal?

And note that you're the number-one person who made changes to
this file... ;)

/mjt


