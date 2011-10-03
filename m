Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RAp17-00019r-2Q
	for mharc-qemu-trivial@gnu.org; Mon, 03 Oct 2011 16:21:37 -0400
Received: from eggs.gnu.org ([140.186.70.92]:46074)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1RAp13-0000yx-T7
	for qemu-trivial@nongnu.org; Mon, 03 Oct 2011 16:21:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1RAp13-0006qP-1Z
	for qemu-trivial@nongnu.org; Mon, 03 Oct 2011 16:21:33 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:41147)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1RAp10-0006pX-6P; Mon, 03 Oct 2011 16:21:30 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	810D2728327E; Mon,  3 Oct 2011 22:21:18 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id AXH6mz1XGhlc; Mon,  3 Oct 2011 22:20:49 +0200 (CEST)
Received: from flocke.weilnetz.de (p5086F1F7.dip.t-dialin.net [80.134.241.247])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	26CFA728327D; Mon,  3 Oct 2011 22:20:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] ident=stefan)
	by flocke.weilnetz.de with esmtp (Exim 4.72)
	(envelope-from <sw@weilnetz.de>)
	id 1RAp0A-0004q3-Oy; Mon, 03 Oct 2011 22:20:38 +0200
Message-ID: <4E8A1916.2040307@weilnetz.de>
Date: Mon, 03 Oct 2011 22:20:38 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20110818 Iceowl/1.0b1 Icedove/3.0.11
MIME-Version: 1.0
To: qemu-trivial <qemu-trivial@nongnu.org>
References: <1316203388-24910-1-git-send-email-weil@mail.berlios.de>
	<4E8A1578.1040505@weilnetz.de>
In-Reply-To: <4E8A1578.1040505@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/2] Use QEMU_GNUC_PREREQ to
 fix wrong gcc version test
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
X-List-Received-Date: Mon, 03 Oct 2011 20:21:35 -0000

Am 03.10.2011 22:05, schrieb Stefan Weil:
> Am 16.09.2011 22:03, schrieb Stefan Weil:
>> These two patches fix a wrong gcc version test.
>>
>> [PATCH 1/2] Move macro QEMU_GNUC_PREREQ to compiler.h
>> [PATCH 2/2] Fix and clean code which tests the gcc version
>
> Ping? Maybe these patches can be applied via qemu-trivial.
>
> http://patchwork.ozlabs.org/patch/115027/
> http://patchwork.ozlabs.org/patch/115030/

Sorry, my mistake: both patches were already applied.

