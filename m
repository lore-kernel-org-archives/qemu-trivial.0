Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVEQt-0004B7-FO
	for mharc-qemu-trivial@gnu.org; Tue, 10 Mar 2015 03:18:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44057)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YVEQq-00048n-7U
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 03:18:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YVEQp-0002Ca-6K
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 03:18:24 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54448)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YVEQh-00028z-55; Tue, 10 Mar 2015 03:18:15 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id C09A741302;
	Tue, 10 Mar 2015 10:18:13 +0300 (MSK)
Message-ID: <54FE9AB5.2040300@msgid.tls.msk.ru>
Date: Tue, 10 Mar 2015 10:18:13 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.5.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
References: <1425966045-13510-1-git-send-email-mjt@msgid.tls.msk.ru>
	<54FE996C.2040501@weilnetz.de>
In-Reply-To: <54FE996C.2040501@weilnetz.de>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [Qemu-trivial] [PATCH] cris: remove unused cris_cond15
	declarations
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
X-List-Received-Date: Tue, 10 Mar 2015 07:18:25 -0000

10.03.2015 10:12, Stefan Weil wrote:
[]
> There remains a comment in disas/cris.c referring to cris_conds15. Maybe you
> want to add that to your patch, too (keep my review then).

Oh yeah, I overlooked it.

However maybe we should keep this somehow (maybe in a better comment
in this cris_cc_strings[] place?).  I'll leave this to Edgar.

Meanwhile I updated the patch adding removal of this variable reference
from a comment in cris_cc_strings[] definition.

Thanks,

/mjt

