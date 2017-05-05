Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d6WZz-00046J-8H
	for mharc-qemu-trivial@gnu.org; Fri, 05 May 2017 02:19:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57632)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d6WZx-000452-9L
	for qemu-trivial@nongnu.org; Fri, 05 May 2017 02:19:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d6WZw-0000Bf-Ge
	for qemu-trivial@nongnu.org; Fri, 05 May 2017 02:19:01 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39307)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1d6WZq-0008Rl-A9; Fri, 05 May 2017 02:18:54 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 3315340388;
	Fri,  5 May 2017 09:18:19 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 781413F8;
	Fri,  5 May 2017 09:18:18 +0300 (MSK)
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20170428022329.30726-1-eblake@redhat.com>
Cc: qemu-trivial@nongnu.org, thuth@redhat.com, dgilbert@redhat.com
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <856a755d-cee1-04a5-dafc-eac09ec9c01b@msgid.tls.msk.ru>
Date: Fri, 5 May 2017 09:18:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170428022329.30726-1-eblake@redhat.com>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] tests: Ignore another built executable
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
X-List-Received-Date: Fri, 05 May 2017 06:19:02 -0000

28.04.2017 05:23, Eric Blake wrote:
> Commit 78f86a2b7 added a new test, but forgot to exclude the built
> binary from version control.

Applied to -trivial (adding mention of test-hmp to subject), thanks!

/mjt


