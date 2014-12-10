Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XycTk-0006GO-9h
	for mharc-qemu-trivial@gnu.org; Wed, 10 Dec 2014 03:18:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57694)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XycTd-00067J-RW
	for qemu-trivial@nongnu.org; Wed, 10 Dec 2014 03:18:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XycTZ-0001Fw-1e
	for qemu-trivial@nongnu.org; Wed, 10 Dec 2014 03:18:29 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:49802)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XycTP-0001Cn-7n; Wed, 10 Dec 2014 03:18:15 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 3A1E4419A1;
	Wed, 10 Dec 2014 11:18:06 +0300 (MSK)
Message-ID: <548801BE.4090605@msgid.tls.msk.ru>
Date: Wed, 10 Dec 2014 11:18:06 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.2.0
MIME-Version: 1.0
To: arei.gonglei@huawei.com, qemu-devel@nongnu.org
References: <1415847577-5820-1-git-send-email-arei.gonglei@huawei.com>
In-Reply-To: <1415847577-5820-1-git-send-email-arei.gonglei@huawei.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, peter.huangpeng@huawei.com,
	mst@redhat.com
Subject: Re: [Qemu-trivial] [PATCH 0/2] acpi-build: trivial fixes
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
X-List-Received-Date: Wed, 10 Dec 2014 08:18:34 -0000

13.11.2014 05:59, arei.gonglei@huawei.com wrote:
> Gonglei (2):
>   acpi-build: adjust indention 8 -> 4 spaces
>   acpi-build: Make DPRINTF working for acpi-build

Applied both to -trivial, thank you!

/mjt

