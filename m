Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YAFPZ-0006iE-TJ
	for mharc-qemu-trivial@gnu.org; Sun, 11 Jan 2015 05:06:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47905)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1YAFPY-0006h4-E3
	for qemu-trivial@nongnu.org; Sun, 11 Jan 2015 05:06:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1YAFPX-0002rW-Di
	for qemu-trivial@nongnu.org; Sun, 11 Jan 2015 05:06:20 -0500
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:56008)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1YAFPT-0002qF-7X; Sun, 11 Jan 2015 05:06:15 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	7183311810A8; Sun, 11 Jan 2015 11:06:13 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id TS3ZUXlKMef0; Sun, 11 Jan 2015 11:06:11 +0100 (CET)
Received: from [192.168.178.24] (p54ACA617.dip0.t-ipconnect.de [84.172.166.23])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	6E8581180040; Sun, 11 Jan 2015 11:06:11 +0100 (CET)
Message-ID: <54B24B12.6020703@weilnetz.de>
Date: Sun, 11 Jan 2015 11:06:10 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.3.0
MIME-Version: 1.0
To: Marcel Apfelbaum <marcel@redhat.com>, qemu-trivial@nongnu.org
References: <1420969037-16603-1-git-send-email-marcel@redhat.com>
In-Reply-To: <1420969037-16603-1-git-send-email-marcel@redhat.com>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vl.c: fix some alignment
	issues
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
X-List-Received-Date: Sun, 11 Jan 2015 10:06:21 -0000

Am 11.01.2015 um 10:37 schrieb Marcel Apfelbaum:
> The main's switch had a few cases misaligned.
>
> Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
> ---
>   vl.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>

Reviewed-by: Stefan Weil <sw@weilnetz.de>

The misalignment was caused by tabs which were used instead of spaces.

A short look on vl.c shows lots of more lines with tabs (also in other 
switch
statements), so this patch could be extended to fix more lines.

Stefan


