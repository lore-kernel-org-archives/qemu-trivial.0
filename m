Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WwzTL-0006nZ-Da
	for mharc-qemu-trivial@gnu.org; Tue, 17 Jun 2014 15:55:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33018)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1WwzTE-0006bp-9m
	for qemu-trivial@nongnu.org; Tue, 17 Jun 2014 15:55:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1WwzT8-0002vi-On
	for qemu-trivial@nongnu.org; Tue, 17 Jun 2014 15:55:04 -0400
Received: from cantor2.suse.de ([195.135.220.15]:39297 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>)
	id 1WwzSl-0002r6-D9; Tue, 17 Jun 2014 15:54:35 -0400
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 42FF9ABE1;
	Tue, 17 Jun 2014 19:40:08 +0000 (UTC)
Message-ID: <53A09997.4030705@suse.de>
Date: Tue, 17 Jun 2014 21:40:07 +0200
From: Alexander Graf <agraf@suse.de>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
References: <1403025508-19171-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1403025508-19171-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] target-ppc: Fix compiler warning
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
X-List-Received-Date: Tue, 17 Jun 2014 19:55:10 -0000


On 17.06.14 19:18, Stefan Weil wrote:
> gcc reports a warning which is usually wrong:
>
> target-ppc/dfp_helper.c: In function =E2=80=98dfp_get_digit=E2=80=99:
> target-ppc/dfp_helper.c:417:1: warning:
>   control reaches end of non-void function [-Wreturn-type]
>
> The compiler shows the warning if assert is not marked with the noretur=
n
> attribute or if the code is compiled with -DNDEBUG.
>
> Using g_assert_not_reached better documents the intention and does not
> have these problems.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Reviewed-by: Alexander Graf <agraf@suse.de>

Please take it via -trivial.


Alex


