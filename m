Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aw8us-0000rB-6s
	for mharc-qemu-trivial@gnu.org; Fri, 29 Apr 2016 09:57:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50555)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1aw8uk-0000Xz-9T
	for qemu-trivial@nongnu.org; Fri, 29 Apr 2016 09:57:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1aw8uY-0002Pt-Bp
	for qemu-trivial@nongnu.org; Fri, 29 Apr 2016 09:56:56 -0400
Received: from mail.weilnetz.de ([37.221.199.173]:47226)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1aw8uY-0002Nx-6H
	for qemu-trivial@nongnu.org; Fri, 29 Apr 2016 09:56:50 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by mail.weilnetz.de (Postfix) with ESMTP id BB42F11810AF;
	Fri, 29 Apr 2016 15:56:31 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from mail.weilnetz.de ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id KAb54j7qYkBh; Fri, 29 Apr 2016 15:56:30 +0200 (CEST)
Received: from edv32.bib.uni-mannheim.de (mobile-207-146.wlan.uni-mannheim.de
	[134.155.207.146])
	by mail.weilnetz.de (Postfix) with ESMTPSA id E3E3A1181097;
	Fri, 29 Apr 2016 15:56:29 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>,
	Jan Vesely <jano.vesely@gmail.com>
References: <1461935279-30418-1-git-send-email-jano.vesely@gmail.com>
	<CAFEAcA-yNp8wGnyzMrTu=28g4vYPv-5F-PJ4aeHq8xSnxRZLkA@mail.gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>
From: Stefan Weil <sw@weilnetz.de>
Message-ID: <5723680D.2050601@weilnetz.de>
Date: Fri, 29 Apr 2016 15:56:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-yNp8wGnyzMrTu=28g4vYPv-5F-PJ4aeHq8xSnxRZLkA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Subject: Re: [Qemu-trivial] [PATCH] configure: Check if struct fsxattr is
 available from linux header
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
X-List-Received-Date: Fri, 29 Apr 2016 13:57:08 -0000

Am 29.04.2016 um 15:54 schrieb Peter Maydell:

> This means we'll build with a HAVE_FSXATTR define set, but
> nothing in the tree tries to use that as far as I can tell:
> "git grep HAVE_FSXATTR" returns no matches. What am I missing?
> 
> thanks
> -- PMM
> 

It's used by the system headers:

/usr/include/xfs/xfs_fs.h:#ifndef HAVE_FSXATTR

Stefan

