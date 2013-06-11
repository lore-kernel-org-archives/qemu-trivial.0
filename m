Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmSVj-0003RB-Ik
	for mharc-qemu-trivial@gnu.org; Tue, 11 Jun 2013 13:37:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47976)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1UmSVg-0003MB-7Q
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 13:37:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1UmSVe-0007Nb-W6
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 13:37:32 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:46452)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1UmSVb-0007Mx-Ew; Tue, 11 Jun 2013 13:37:27 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	4375D728097F; Tue, 11 Jun 2013 19:37:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id qt1YkAPNtCxh; Tue, 11 Jun 2013 19:37:24 +0200 (CEST)
Received: from [192.168.178.35] (p54ADAB1E.dip0.t-ipconnect.de [84.173.171.30])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	CD7A0728097B; Tue, 11 Jun 2013 19:37:23 +0200 (CEST)
Message-ID: <51B76053.4070101@weilnetz.de>
Date: Tue, 11 Jun 2013 19:37:23 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
References: <1370896582-11910-1-git-send-email-sw@weilnetz.de>
	<alpine.DEB.2.02.1306111200260.4548@kaball.uk.xensource.com>
In-Reply-To: <alpine.DEB.2.02.1306111200260.4548@kaball.uk.xensource.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 78.47.199.172
Cc: qemu-trivial <qemu-trivial@nongnu.org>, xen-devel@lists.xensource.com,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] hw/xen: Use g_free instead of free and
 fix potential memory leaks
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
X-List-Received-Date: Tue, 11 Jun 2013 17:37:34 -0000

Am 11.06.2013 13:02, schrieb Stefano Stabellini:
> On Mon, 10 Jun 2013, Stefan Weil wrote:
>> The wrong functions and the missing calls of g_free were reported
>> by cppcheck.
>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> Acked-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
>
> Are you happy to get this patch upstream via qemu-trivial? Or do you
> want me to pick it up?

Thank you for the review.

qemu-trivial is fine, and Michael already applied the patch.

Regards
Stefan


