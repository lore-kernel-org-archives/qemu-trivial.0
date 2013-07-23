Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V1ixK-0003Wz-15
	for mharc-qemu-trivial@gnu.org; Tue, 23 Jul 2013 16:13:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57660)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1V1ixH-0003U7-Iv
	for qemu-trivial@nongnu.org; Tue, 23 Jul 2013 16:13:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1V1ixG-0007ov-IR
	for qemu-trivial@nongnu.org; Tue, 23 Jul 2013 16:13:07 -0400
Received: from smtp.mail.uni-mannheim.de ([134.155.96.80]:43385)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1V1ixE-0007nQ-03; Tue, 23 Jul 2013 16:13:04 -0400
Received: from localhost (localhost [127.0.0.1])
	by smtp.mail.uni-mannheim.de (Postfix) with ESMTP id 8821914F4AD;
	Tue, 23 Jul 2013 22:13:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at uni-mannheim.de
Received: from smtp.mail.uni-mannheim.de ([134.155.96.80])
	by localhost (mail-r86.rz.uni-mannheim.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id WBQznPnZ4oSa; Tue, 23 Jul 2013 22:13:06 +0200 (CEST)
Received: from [192.168.178.35] (p54AD9D53.dip0.t-ipconnect.de [84.173.157.83])
	by smtp.mail.uni-mannheim.de (Postfix) with ESMTPSA id A4F3E14F27D;
	Tue, 23 Jul 2013 22:13:06 +0200 (CEST)
Message-ID: <51EEE3CB.5030300@weilnetz.de>
Date: Tue, 23 Jul 2013 22:12:59 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Anthony Liguori <aliguori@us.ibm.com>
References: <1373057744-20278-1-git-send-email-sw@weilnetz.de>
	<51E4D733.6090908@weilnetz.de> <51E84766.20603@weilnetz.de>
In-Reply-To: <51E84766.20603@weilnetz.de>
X-Enigmail-Version: 1.4.6
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 134.155.96.80
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/4] po/Makefile: Fix
 regression and some minor issues
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
X-List-Received-Date: Tue, 23 Jul 2013 20:13:08 -0000

Am 18.07.2013 21:52, schrieb Stefan Weil:
> Am 16.07.2013 07:16, schrieb Stefan Weil:
>> Am 05.07.2013 22:55, schrieb Stefan Weil:
>>> These patches are included:
>>>
>>> [PATCH 1/4] po/Makefile: Fix and improve help message
>>> [PATCH 2/4] po/Makefile: Fix *.mo generation for out-of-tree builds
>>> [PATCH 3/4] po/Makefile: Fix generation of messages.po
>>> [PATCH 4/4] po/Makefile: Use macro quiet-command for nice looking
>>>
>>> Regards
>>> Stefan W.
>> Ping?
> Ping^2
>

Ping^3

Who is maintaining GTK? Anthony?

Is there any chance to get some of the issues which
are addressed by this series fixed in the next version of
QEMU?

Patch 1 certainly could also be applied via qemu-trivial,
maybe some of the others, too. See
http://patchwork.ozlabs.org/patch/257202/.

Stefan


