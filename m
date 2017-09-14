Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dsOxW-00008y-2M
	for mharc-qemu-trivial@gnu.org; Thu, 14 Sep 2017 03:53:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53306)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dsOxT-00005F-Mg
	for qemu-trivial@nongnu.org; Thu, 14 Sep 2017 03:53:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dsOxS-0001ds-Vs
	for qemu-trivial@nongnu.org; Thu, 14 Sep 2017 03:53:11 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54495)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dsOxM-0001RM-88; Thu, 14 Sep 2017 03:53:04 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7D09E412D3;
	Thu, 14 Sep 2017 10:53:03 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with ESMTP id 5B9915B9;
	Thu, 14 Sep 2017 10:53:01 +0300 (MSK)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: patches@linaro.org
References: <1504613972-15847-1-git-send-email-peter.maydell@linaro.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <e44bc9c8-abc8-44d4-54ef-6083aa833fd9@msgid.tls.msk.ru>
Date: Thu, 14 Sep 2017 10:53:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1504613972-15847-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] util/qemu-thread-posix.c: Replace OS
 ifdefs with CONFIG_HAVE_SEM_TIMEDWAIT
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
X-List-Received-Date: Thu, 14 Sep 2017 07:53:12 -0000

05.09.2017 15:19, Peter Maydell wrote:
> In qemu-thread-posix.c we have two implementations of the
> various qemu_sem_* functions, one of which uses native POSIX
> sem_* and the other of which emulates them with pthread conditions.
> This is necessary because not all our host OSes support
> sem_timedwait().
..

Applied to -trivial, thanks!

/mjt

