Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cdwc4-0007Tw-AJ
	for mharc-qemu-trivial@gnu.org; Wed, 15 Feb 2017 05:15:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57351)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cdwc2-0007Rl-40
	for qemu-trivial@nongnu.org; Wed, 15 Feb 2017 05:15:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cdwc1-00054r-2x
	for qemu-trivial@nongnu.org; Wed, 15 Feb 2017 05:15:02 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:46485)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cdwbv-000527-ND; Wed, 15 Feb 2017 05:14:55 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 83AC3421B6;
	Wed, 15 Feb 2017 13:14:54 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id BFFEB264;
	Wed, 15 Feb 2017 13:14:53 +0300 (MSK)
To: Thomas Huth <thuth@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>, qemu-devel@nongnu.org
References: <1486576658-29719-1-git-send-email-thuth@redhat.com>
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <7bc689db-8f76-d9ad-ffd3-688d2f964431@msgid.tls.msk.ru>
Date: Wed, 15 Feb 2017 13:14:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <1486576658-29719-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH v3] hw/core/register: Mark the device
 with cannot_instantiate_with_device_add_yet
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
X-List-Received-Date: Wed, 15 Feb 2017 10:15:03 -0000

08.02.2017 20:57, Thomas Huth wrote:
> The "qemu,register" device needs to be wired up in source code, there
> is no way the user can make any real use of this device with the
> "-device" parameter or the "device_add" monitor command yet.

Applied both v3 patches to -trivial, thank you!

/mjt

