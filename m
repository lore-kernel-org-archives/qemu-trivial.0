Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vh1Qb-00033d-As
	for mharc-qemu-trivial@gnu.org; Thu, 14 Nov 2013 13:14:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48817)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1Vh1QR-0002pJ-Na
	for qemu-trivial@nongnu.org; Thu, 14 Nov 2013 13:14:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1Vh1QK-0003av-Cc
	for qemu-trivial@nongnu.org; Thu, 14 Nov 2013 13:13:55 -0500
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:40995)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1Vh1Q5-0003Z3-HV; Thu, 14 Nov 2013 13:13:33 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	0397772801A2; Thu, 14 Nov 2013 19:13:32 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id UjMLEWTIOGrM; Thu, 14 Nov 2013 19:13:26 +0100 (CET)
Received: from [192.168.178.35] (p54ADBCA0.dip0.t-ipconnect.de
	[84.173.188.160])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	5EA6672800DC; Thu, 14 Nov 2013 19:13:26 +0100 (CET)
Message-ID: <528512C5.3080503@weilnetz.de>
Date: Thu, 14 Nov 2013 19:13:25 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: qemu-devel <qemu-devel@nongnu.org>
References: <1384452423-7831-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1384452423-7831-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH (1.7?)] configure: Use -B switch only for
 Python versions which support it
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
X-List-Received-Date: Thu, 14 Nov 2013 18:14:03 -0000

Am 14.11.2013 19:07, schrieb Stefan Weil:
> Commit 1d984a67a95d88f3e708b077dab8adeb47c38c93 added the -B switch
> unconditionally. This breaks Python versions before 2.6 which don't
> support that switch.
>
> Now configure adds -B only if it is accepted by the Python interpreter.
>
> This modification introduces a small incompatiblity because -B might now

s/incompatiblity/incompatibility/


