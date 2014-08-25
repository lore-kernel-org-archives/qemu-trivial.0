Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XLotI-0003Io-CN
	for mharc-qemu-trivial@gnu.org; Mon, 25 Aug 2014 03:40:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53175)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XLotB-0003Fl-5y
	for qemu-trivial@nongnu.org; Mon, 25 Aug 2014 03:40:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XLot5-0000Pj-TV
	for qemu-trivial@nongnu.org; Mon, 25 Aug 2014 03:40:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32122)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1XLosv-0008UV-BR; Mon, 25 Aug 2014 03:40:13 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s7P7eAvE019076
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 25 Aug 2014 03:40:11 -0400
Received: from blackfin.pond.sub.org (ovpn-116-66.ams2.redhat.com
	[10.36.116.66])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s7P7e8aI003057
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 25 Aug 2014 03:40:10 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 7FDFA303FEA7; Mon, 25 Aug 2014 09:40:07 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
References: <1408525330-25414-1-git-send-email-sw@weilnetz.de>
	<53F9AE86.7040700@msgid.tls.msk.ru> <53F9B372.10602@weilnetz.de>
Date: Mon, 25 Aug 2014 09:40:07 +0200
In-Reply-To: <53F9B372.10602@weilnetz.de> (Stefan Weil's message of "Sun, 24
	Aug 2014 11:42:10 +0200")
Message-ID: <87r405yq3s.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] libdecnumber: Fix warnings
	from smatch (missing static, boolean operations)
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
X-List-Received-Date: Mon, 25 Aug 2014 07:40:34 -0000

Stefan Weil <sw@weilnetz.de> writes:

> Am 24.08.2014 11:21, schrieb Michael Tokarev:
>> Applied to -trivial, thank you!
>>
>> But I've a small concern - should we really do this on "external" sources,
>> and divirge from upstream needlessly?
>>
>> Thanks,
>>
>> /mjt
>
> In general, I agree. In this case, the code was part of gcc, and newer
> versions of gcc use GPL 3 which is incompatible with QEMU, so I assume
> that the code in QEMU is no longer available from a maintained
> upstream.

Upstream switched to another license != upstream is no longer
maintained.

If you license your contribution under GPLv2+, both upstream and
downstream should be able to use it just fine.

Have you checked the current upstream code for presence of these issues?

