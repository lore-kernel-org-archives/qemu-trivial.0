Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bpdds-00084B-5s
	for mharc-qemu-trivial@gnu.org; Thu, 29 Sep 2016 11:53:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50987)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bpddq-00081S-80
	for qemu-trivial@nongnu.org; Thu, 29 Sep 2016 11:52:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bpddo-0002y7-K3
	for qemu-trivial@nongnu.org; Thu, 29 Sep 2016 11:52:57 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:60890)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bpddj-0002u0-7R; Thu, 29 Sep 2016 11:52:51 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 14CFA4325E;
	Thu, 29 Sep 2016 18:52:48 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id E45E1B0F;
	Thu, 29 Sep 2016 18:52:46 +0300 (MSK)
To: David Anderson <dave@natulte.net>, qemu-devel@nongnu.org
References: <20160922040019.19165-1-dave@natulte.net>
Cc: qemu-trivial@nongnu.org
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <24687c78-d7cb-07f4-ac6e-bf717ed03fb8@msgid.tls.msk.ru>
Date: Thu, 29 Sep 2016 18:52:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <20160922040019.19165-1-dave@natulte.net>
Content-Type: text/plain; charset=windows-1251; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] qapi: make the json schema files more
 regular.
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
X-List-Received-Date: Thu, 29 Sep 2016 15:52:59 -0000

22.09.2016 07:00, David Anderson wrote:
> This makes it easier to parse the schema file for tool generation:
> each paragraph is either a non-docstring comment, or a docstring
> immediately followed by a Python dict describing an API item.

Applied to -trivial, thanks!

/mjt

