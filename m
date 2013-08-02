Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V5G1Q-0004xW-W0
	for mharc-qemu-trivial@gnu.org; Fri, 02 Aug 2013 10:08:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51991)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V5G1J-0004mt-EK
	for qemu-trivial@nongnu.org; Fri, 02 Aug 2013 10:07:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V5G1D-0002HJ-Fh
	for qemu-trivial@nongnu.org; Fri, 02 Aug 2013 10:07:53 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45394)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1V5G11-0002BC-9k; Fri, 02 Aug 2013 10:07:35 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 6459A40414;
	Fri,  2 Aug 2013 18:07:24 +0400 (MSK)
Message-ID: <51FBBD1B.4010108@msgid.tls.msk.ru>
Date: Fri, 02 Aug 2013 18:07:23 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130704 Icedove/17.0.7
MIME-Version: 1.0
To: Fam Zheng <famz@redhat.com>
References: <1375351937-17893-1-git-send-email-famz@redhat.com>
In-Reply-To: <1375351937-17893-1-git-send-email-famz@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] vmdk: fix comment for
	vmdk_co_write_zeroes
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
X-List-Received-Date: Fri, 02 Aug 2013 14:07:59 -0000

01.08.2013 14:12, Fam Zheng wrote:
> The comment was truncated. Add the missing parts, especially explain why
> we need zero_dry_run.
>

Thanks, applied to the trivial patches queue.

/mjt

