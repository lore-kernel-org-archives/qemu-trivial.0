Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VGvLf-0001Uh-9y
	for mharc-qemu-trivial@gnu.org; Tue, 03 Sep 2013 14:29:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33484)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VGvLY-0001P5-7e
	for qemu-trivial@nongnu.org; Tue, 03 Sep 2013 14:29:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VGvLR-0002ua-43
	for qemu-trivial@nongnu.org; Tue, 03 Sep 2013 14:29:00 -0400
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:37116)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VGvLQ-0002uW-Td
	for qemu-trivial@nongnu.org; Tue, 03 Sep 2013 14:28:53 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	C542272819E4; Tue,  3 Sep 2013 20:28:50 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 1KaZzTYHALUz; Tue,  3 Sep 2013 20:28:48 +0200 (CEST)
Received: from [192.168.178.35] (p54AD8396.dip0.t-ipconnect.de
	[84.173.131.150])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	7B92972800FD; Tue,  3 Sep 2013 20:28:48 +0200 (CEST)
Message-ID: <52262A5E.2010507@weilnetz.de>
Date: Tue, 03 Sep 2013 20:28:46 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: qemu-devel <qemu-devel@nongnu.org>
References: <1377063869-16834-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1377063869-16834-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.4.6
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] configure: Enable extra compiler warnings
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
X-List-Received-Date: Tue, 03 Sep 2013 18:29:05 -0000

Am 21.08.2013 07:44, schrieb Stefan Weil:
> Compiler option -Wextra enables an additional set of compiler warnings.
>
> Some of these warnings were already enabled explicitly in QEMU:
> -Wold-style-declaration, -Wtype-limits, -Wignored-qualifiers and
> -Wempty-body are now redundant and can be removed.
>
> Others don't work with the current code and must be disabled to
> avoid warnings: -Wno-missing-field-initializers, -Wno-override-init,
> -Wno-sign-compare and -Wno-unused-parameter.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> This is a rather old and long tested patch: I use -Wextra in my
> QEMU builds for more than a year now. At least one bug was found
> by using this warning level (see commit
> b22dd1243f38286263d40496ce5298a8a7d96eea).
>
> My tests include Linux and Windows hosts (gcc), but not BSD based hosts,
> so maybe those hosts might need additional code fixes.
> clang reports lots of -Wunused-value warnings.
>
> Regards,
> Stefan
>
>  configure |   14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)

Ping? I'd appreciate getting this patch committed.
Is it trivial enough for qemu-trivial?

Stefan

See also http://patchwork.ozlabs.org/patch/268687/


