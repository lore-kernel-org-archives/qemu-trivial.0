Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dsOr1-0002h6-EE
	for mharc-qemu-trivial@gnu.org; Thu, 14 Sep 2017 03:46:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49080)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dsOqz-0002fw-9L
	for qemu-trivial@nongnu.org; Thu, 14 Sep 2017 03:46:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dsOqy-0001rX-Ei
	for qemu-trivial@nongnu.org; Thu, 14 Sep 2017 03:46:29 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41979)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dsOqt-0001ni-VT; Thu, 14 Sep 2017 03:46:24 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 36A97412D1;
	Thu, 14 Sep 2017 10:46:23 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with ESMTP id 13B005B9;
	Thu, 14 Sep 2017 10:46:21 +0300 (MSK)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
References: <1504030416-18618-1-git-send-email-thuth@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <d9baab15-d911-99e2-45fb-60e82c8e9ac5@msgid.tls.msk.ru>
Date: Thu, 14 Sep 2017 10:46:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1504030416-18618-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH for-2.11] tests: Fix broken
 ivshmem-server-msi/-irq tests
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
X-List-Received-Date: Thu, 14 Sep 2017 07:46:30 -0000

29.08.2017 21:13, Thomas Huth wrote:
> Broken with commit b4ba67d9a7025 ("libqos: Change PCI accessors to take
> opaque BAR handle") a while ago, but nobody noticed since the tests are
> only run in SPEED=slow mode: The msix_pba_bar is not correctly initialized
> anymore if bir_pba has the same value as bir_table. With this fix,
> "make check SPEED=slow" should work fine again.

Applied to -trivial, thanks!

/mjt

