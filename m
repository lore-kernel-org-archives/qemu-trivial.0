Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Qegzd-0001jw-Ab
	for mharc-qemu-trivial@gnu.org; Thu, 07 Jul 2011 01:19:17 -0400
Received: from eggs.gnu.org ([140.186.70.92]:38249)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>) id 1Qegza-0001j0-4G
	for qemu-trivial@nongnu.org; Thu, 07 Jul 2011 01:19:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>) id 1QegzY-00030s-Rm
	for qemu-trivial@nongnu.org; Thu, 07 Jul 2011 01:19:13 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:47624)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>)
	id 1QegzU-00030Y-Pw; Thu, 07 Jul 2011 01:19:09 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	322C77281BE1; Thu,  7 Jul 2011 07:19:06 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id qdgFo1pASeYS; Thu,  7 Jul 2011 07:19:05 +0200 (CEST)
Received: from [192.168.178.20] (p54ADA44D.dip.t-dialin.net [84.173.164.77])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	B68C872818A1; Thu,  7 Jul 2011 07:19:04 +0200 (CEST)
Message-ID: <4E1541C7.9060400@mail.berlios.de>
Date: Thu, 07 Jul 2011 07:19:03 +0200
From: Stefan Weil <weil@mail.berlios.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Thunderbird/3.1.10
MIME-Version: 1.0
To: Blue Swirl <blauwirbel@gmail.com>
References: <20110707050349.C27C2BF74@buildbot.b1-systems.de>
In-Reply-To: <20110707050349.C27C2BF74@buildbot.b1-systems.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial <qemu-trivial@nongnu.org>, gollub@b1-systems.de, agraf@suse.de,
	Anthony Liguori <anthony@codemonkey.ws>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] buildbot failure in qemu on
	xen_x86_64_debian_5_0
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
X-List-Received-Date: Thu, 07 Jul 2011 05:19:15 -0000

Am 07.07.2011 07:03, schrieb qemu@buildbot.b1-systems.de:
> The Buildbot has detected a new failure on builder 
> xen_x86_64_debian_5_0 while building qemu.
> Full details are available at:
> http://buildbot.b1-systems.de/qemu/builders/xen_x86_64_debian_5_0/builds/26
>
> Buildbot URL: http://buildbot.b1-systems.de/qemu/
>
> Buildslave for this Build: b1_qemu_1
>
> Build Reason: The Nightly scheduler named 'nightly_xen' triggered this 
> build
> Build Source Stamp: [branch xen-next] HEAD
> Blamelist:
>
> BUILD FAILED: failed compile
>
> sincerely,
> -The Buildbot
>

This patch fixes compilation for Debian Lenny based buildbots:
http://patchwork.ozlabs.org/patch/103157/.

Maybe someone can apply the patch (or provide a different
solution) to stop those repeated buildbot mails and fix the
build breakage.

Is it possible to configure the buildbots to send a mail only
when the status changes (good -> bad, bad -> good)?

Thanks and kind regards,

Stefan Weil


