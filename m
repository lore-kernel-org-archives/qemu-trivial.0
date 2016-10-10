Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1btWrO-000565-NT
	for mharc-qemu-trivial@gnu.org; Mon, 10 Oct 2016 05:27:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57720)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Yongbok.Kim@imgtec.com>) id 1btWrJ-00050G-Pl
	for qemu-trivial@nongnu.org; Mon, 10 Oct 2016 05:27:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Yongbok.Kim@imgtec.com>) id 1btWrE-0005Ob-RM
	for qemu-trivial@nongnu.org; Mon, 10 Oct 2016 05:26:56 -0400
Received: from mailapp02.imgtec.com ([217.156.133.132]:28490
	helo=mailapp01.imgtec.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Yongbok.Kim@imgtec.com>)
	id 1btWr9-0005Gb-Fi; Mon, 10 Oct 2016 05:26:47 -0400
Received: from HHMAIL03.hh.imgtec.org (unknown [10.44.0.21])
	by Forcepoint Email with ESMTPS id E144CF40F2C7F;
	Mon, 10 Oct 2016 10:26:40 +0100 (IST)
Received: from HHMAIL01.hh.imgtec.org (10.100.10.19) by HHMAIL03.hh.imgtec.org
	(10.44.0.21) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Mon, 10 Oct 2016 10:26:43 +0100
Received: from [192.168.169.15] (192.168.169.15) by HHMAIL01.hh.imgtec.org
	(10.100.10.21) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Mon, 10 Oct 2016 10:26:42 +0100
To: Michael Tokarev <mjt@tls.msk.ru>, Thomas Huth <thuth@redhat.com>,
	"Aurelien Jarno" <aurelien@aurel32.net>, <qemu-devel@nongnu.org>
References: <1475220411-22873-1-git-send-email-thuth@redhat.com>
	<076cfc47-2079-d084-3898-5c754f274374@msgid.tls.msk.ru>
CC: <qemu-trivial@nongnu.org>, Leon Alrae <leon.alrae@imgtec.com>
From: Yongbok Kim <yongbok.kim@imgtec.com>
Message-ID: <b3ab995b-0967-a1c2-e098-8f80038eba31@imgtec.com>
Date: Mon, 10 Oct 2016 10:26:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <076cfc47-2079-d084-3898-5c754f274374@msgid.tls.msk.ru>
Content-Type: text/plain; charset="windows-1251"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.169.15]
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 217.156.133.132
Subject: Re: [Qemu-trivial] [PATCH] MAINTAINERS: Add some more MIPS related
 files
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
X-List-Received-Date: Mon, 10 Oct 2016 09:27:02 -0000



On 08/10/2016 09:14, Michael Tokarev wrote:
> 30.09.2016 10:26, Thomas Huth wrote:
>> The MIPS section is missing some related header files, and files
>> in the hw/misc/, hw/intc/ and hw/timer/ folders.
> 
> Applied to -trivial, thanks!
> 
> /mjt

Thanks for that!

Regards,
Yongbok

