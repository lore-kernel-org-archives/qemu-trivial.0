Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VULjh-0005Cd-DL
	for mharc-qemu-trivial@gnu.org; Thu, 10 Oct 2013 15:17:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36084)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VULeR-0002xe-F7
	for qemu-trivial@nongnu.org; Thu, 10 Oct 2013 15:12:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VULeL-0008TB-Gd
	for qemu-trivial@nongnu.org; Thu, 10 Oct 2013 15:11:59 -0400
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:55037)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1VULe8-0008IV-74; Thu, 10 Oct 2013 15:11:40 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	318D672809F4; Thu, 10 Oct 2013 21:11:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id F1u5EaA6xi0z; Thu, 10 Oct 2013 21:11:37 +0200 (CEST)
Received: from [192.168.178.35] (p54ADB22B.dip0.t-ipconnect.de [84.173.178.43])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	719FA72809F1; Thu, 10 Oct 2013 21:11:36 +0200 (CEST)
Message-ID: <5256FBE7.80207@weilnetz.de>
Date: Thu, 10 Oct 2013 21:11:35 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Corentin Chary <corentincj@iksaif.net>
References: <1373228703-26226-1-git-send-email-sw@weilnetz.de>	<037D60EF2A5746E468BF0A04@nimrod.local>	<CAFEAcA9V_THiPwVwv-gYH14h2kujDnWpGAOSBd95C9W56p3AuQ@mail.gmail.com>	<51DA438A.8060903@weilnetz.de>
	<CAHR064g-jOt7XaY4G9a7MZRs_qd9REnyyGn8D=mrRoY+J-bXUA@mail.gmail.com>
In-Reply-To: <CAHR064g-jOt7XaY4G9a7MZRs_qd9REnyyGn8D=mrRoY+J-bXUA@mail.gmail.com>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: Peter Maydell <peter.maydell@linaro.org>, Alex Bligh <alex@alex.org.uk>,
	qemu-trivial@nongnu.org, Jan Kiszka <jan.kiszka@siemens.com>,
	Qemu-development List <qemu-devel@nongnu.org>,
	Anthony Liguori <anthony@codemonkey.ws>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Spelling fixes
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
X-List-Received-Date: Thu, 10 Oct 2013 19:12:06 -0000

Am 08.07.2013 17:14, schrieb Corentin Chary:
> The comments (and most of the code) are from libvncserver (and,
> earlier, from "THE 'ZYWRLE' VNC CODEC SOURCE CODE. " as described in
> the header):
>
> http://fastdroid-vnc.googlecode.com/svn-history/r3/trunk/LibVNCServer-0.9.7/libvncserver/zywrletemplate.c
>

Then I suggest to apply my patch as it is. It fixes two locations and
improves a third one a little bit.

Stefan


