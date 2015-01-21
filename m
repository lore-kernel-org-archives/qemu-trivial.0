Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YDqDR-0007Zs-K9
	for mharc-qemu-trivial@gnu.org; Wed, 21 Jan 2015 03:00:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58440)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YDqDP-0007Yr-47
	for qemu-trivial@nongnu.org; Wed, 21 Jan 2015 03:00:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YDqDO-0004Dp-An
	for qemu-trivial@nongnu.org; Wed, 21 Jan 2015 03:00:39 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:51349)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YDqDH-00049z-UE; Wed, 21 Jan 2015 03:00:32 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 310B442199;
	Wed, 21 Jan 2015 11:00:30 +0300 (MSK)
Message-ID: <54BF5C9E.3090904@msgid.tls.msk.ru>
Date: Wed, 21 Jan 2015 11:00:30 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.3.0
MIME-Version: 1.0
To: Don Koch <dkoch@verizon.com>, qemu-devel@nongnu.org
References: <1421436099-2487-1-git-send-email-dkoch@verizon.com>
In-Reply-To: <1421436099-2487-1-git-send-email-dkoch@verizon.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] Trace calls for xenfb, ps2 and pcnet
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
X-List-Received-Date: Wed, 21 Jan 2015 08:00:39 -0000

16.01.2015 22:21, Don Koch wrote:
> Add trace calls for debugging xenfb, ps2 and pcnet.

Applied series to -trivial, thanks!

/mjt

