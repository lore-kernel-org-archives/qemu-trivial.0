Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cZNiH-0007zg-OZ
	for mharc-qemu-trivial@gnu.org; Thu, 02 Feb 2017 15:10:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34469)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1cZNiF-0007xi-F9
	for qemu-trivial@nongnu.org; Thu, 02 Feb 2017 15:10:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1cZNiE-0002lZ-Aj
	for qemu-trivial@nongnu.org; Thu, 02 Feb 2017 15:10:35 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:49728
	helo=v2201612906741603.powersrv.de)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sw@weilnetz.de>)
	id 1cZNiA-0002jW-1r; Thu, 02 Feb 2017 15:10:30 -0500
Received: from localhost (localhost [127.0.0.1])
	by v2201612906741603.powersrv.de (Postfix) with ESMTP id D7B44DA20F9;
	Thu,  2 Feb 2017 21:10:28 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
	by localhost (mail.powersrv.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aOwQlaw_Le7R; Thu,  2 Feb 2017 21:10:27 +0100 (CET)
Received: from edv32.bib.uni-mannheim.de (p54AC84A3.dip0.t-ipconnect.de
	[84.172.132.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 0B1EFDA121B; 
	Thu,  2 Feb 2017 21:10:27 +0100 (CET)
To: Eric Blake <eblake@redhat.com>
References: <20170202195601.11286-1-sw@weilnetz.de>
	<bdfbc0e6-e630-a1ac-5132-24b6a2dd6122@redhat.com>
Cc: Richard Henderson <rth@twiddle.net>, qemu-trivial@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>
From: Stefan Weil <sw@weilnetz.de>
Message-ID: <a5309467-337b-2827-489d-2abbce8356e4@weilnetz.de>
Date: Thu, 2 Feb 2017 21:10:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <bdfbc0e6-e630-a1ac-5132-24b6a2dd6122@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 37.120.169.71
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tci: Remove invalid
 assertions
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
X-List-Received-Date: Thu, 02 Feb 2017 20:10:36 -0000

Am 02.02.2017 um 21:00 schrieb Eric Blake:
> On 02/02/2017 01:56 PM, Stefan Weil wrote:
>> tb_jmp_insn_offset and tb_jmp_reset_offset are pointers
>> and cannot be used with ARRAY_SIZE.
>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>>  tcg/tci/tcg-target.inc.c | 2 --
>>  1 file changed, 2 deletions(-)
>
> mst posted an alternative patch:
> https://lists.gnu.org/archive/html/qemu-devel/2017-02/msg00551.html


Yes, I noticed that, too. It's not obvious that this new
assertion will be correct, and none of the other targets
has that kind of assertion. Only two targets use an
assertion which detects NULL pointers, but NULL pointers
will result in an abort anyway.

Do you think that there are reasons why TCI should use
the assertion suggested by Michael?

Stefan



