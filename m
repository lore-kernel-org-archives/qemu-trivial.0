Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dsOpC-0001MN-A8
	for mharc-qemu-trivial@gnu.org; Thu, 14 Sep 2017 03:44:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48059)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dsOpA-0001Ly-Et
	for qemu-trivial@nongnu.org; Thu, 14 Sep 2017 03:44:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dsOp9-0000O8-NK
	for qemu-trivial@nongnu.org; Thu, 14 Sep 2017 03:44:36 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46261)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dsOp5-0000IQ-7K; Thu, 14 Sep 2017 03:44:31 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id D54DD412CF;
	Thu, 14 Sep 2017 10:44:28 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with ESMTP id B0F9F5B9;
	Thu, 14 Sep 2017 10:44:26 +0300 (MSK)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
References: <1504100343-26607-1-git-send-email-thuth@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <b8342522-fa37-3d56-65d8-c61a8e42ba25@msgid.tls.msk.ru>
Date: Thu, 14 Sep 2017 10:44:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1504100343-26607-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH for-2.11] hw/misc/ivshmem: Fix
 ivshmem_recv_msg() to also work on big endian systems
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
X-List-Received-Date: Thu, 14 Sep 2017 07:44:37 -0000

30.08.2017 16:39, Thomas Huth =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> The "slow" ivshmem-tests currently fail when they are running on a
> big endian host:

Applied to -trivial, thanks!

/mjt

