Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YAajZ-0005SO-4r
	for mharc-qemu-trivial@gnu.org; Mon, 12 Jan 2015 03:52:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38908)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YAajW-0005NO-Aa
	for qemu-trivial@nongnu.org; Mon, 12 Jan 2015 03:52:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YAajV-0007Fc-Hi
	for qemu-trivial@nongnu.org; Mon, 12 Jan 2015 03:52:22 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:60538)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YAajQ-0007EM-Vk; Mon, 12 Jan 2015 03:52:17 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 4A2A7406CD;
	Mon, 12 Jan 2015 11:52:16 +0300 (MSK)
Message-ID: <54B38B40.2080702@msgid.tls.msk.ru>
Date: Mon, 12 Jan 2015 11:52:16 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.3.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1419373615-17989-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1419373615-17989-1-git-send-email-peter.maydell@linaro.org>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 0/3] miscellaneous minor clang fixes
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
X-List-Received-Date: Mon, 12 Jan 2015 08:52:23 -0000

24.12.2014 01:26, Peter Maydell wrote:
> This is a collection of three miscellaneous minor fixes for
> clang compile warnings, which I think could reasonably go via
> the -trivial tree. The map_exec patch has been on list and
> reviewed before; the other two are new.
> 
> Peter Maydell (2):
>   tests/hd-geo-test.c: Remove unused test_image variable
>   migration/qemu-file.c: Don't shift left into sign bit
> 
> SeokYeon Hwang (1):
>   translate-all: Mark map_exec() with the 'unused' attribute

Applied all to -trivial, thank you!

/mjt

