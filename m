Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V0v67-0006re-EU
	for mharc-qemu-trivial@gnu.org; Sun, 21 Jul 2013 10:58:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50594)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1V0v65-0006os-5M
	for qemu-trivial@nongnu.org; Sun, 21 Jul 2013 10:58:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1V0v64-0004Yd-1u
	for qemu-trivial@nongnu.org; Sun, 21 Jul 2013 10:58:53 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:35053)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1V0v60-0004X8-ET; Sun, 21 Jul 2013 10:58:48 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	B5B8B72809FE; Sun, 21 Jul 2013 16:58:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id DCpjX8I94mWH; Sun, 21 Jul 2013 16:58:35 +0200 (CEST)
Received: from [192.168.178.35] (p54ADAE42.dip0.t-ipconnect.de [84.173.174.66])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	D7E447280079; Sun, 21 Jul 2013 16:58:34 +0200 (CEST)
Message-ID: <51EBF71A.3050300@weilnetz.de>
Date: Sun, 21 Jul 2013 16:58:34 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
References: <1373647719-32757-1-git-send-email-sw@weilnetz.de>
	<51E4E011.70407@weilnetz.de> <51E846AC.5070309@weilnetz.de>
	<F63092DE-7795-4009-AB16-68BE6EC53F94@suse.de>
	<51E98C93.8010508@weilnetz.de> <51EA9DBA.4080400@suse.de>
In-Reply-To: <51EA9DBA.4080400@suse.de>
X-Enigmail-Version: 1.4.6
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 78.47.199.172
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Blue Swirl <blauwirbel@gmail.com>,
	Anthony Liguori <aliguori@us.ibm.com>, Alexander Graf <agraf@suse.de>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] PPC: dbdma: macio: Fix
 format specifiers (build regression)
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
X-List-Received-Date: Sun, 21 Jul 2013 14:58:54 -0000

Am 20.07.2013 16:24, schrieb Andreas F=E4rber:
>
> Anthony recently stated very clearly that in order for him to pick up a
> patch it needs to have a Reviewed-by. This one only got an Acked-by.


No rule without exception. When I look at the list of patches
which were picked up recently, I see lots of patches without
a Reviewed-by.

I still think that build regressions should be fixed
very fast and don't understand why it takes so long:

http://patchwork.ozlabs.org/patch/257203/ (2013-07-05)
http://patchwork.ozlabs.org/patch/258774/ (2013-07-12)

Do we need more people with commit rights?


