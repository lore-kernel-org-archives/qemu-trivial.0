Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eZdsG-0007qx-MA
	for mharc-qemu-trivial@gnu.org; Thu, 11 Jan 2018 09:30:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56705)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1eZds9-0007nH-7Y
	for qemu-trivial@nongnu.org; Thu, 11 Jan 2018 09:30:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1eZds3-00073n-IQ
	for qemu-trivial@nongnu.org; Thu, 11 Jan 2018 09:30:25 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:54897)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1eZdrx-0006za-Bo; Thu, 11 Jan 2018 09:30:13 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id D31294093E;
	Thu, 11 Jan 2018 17:29:12 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with ESMTP id B3232E0E;
	Thu, 11 Jan 2018 17:29:12 +0300 (MSK)
To: Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <1515607608-18250-1-git-send-email-thuth@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <69822e79-70af-a8f2-5e21-9b7c403f0ec3@msgid.tls.msk.ru>
Date: Thu, 11 Jan 2018 17:29:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1515607608-18250-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] ui/sdl2: Ignore key repeats for shortcut
 keys
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
X-List-Received-Date: Thu, 11 Jan 2018 14:30:31 -0000

10.01.2018 21:06, Thomas Huth wrote:
> Holding down a shortcut key currently continuesly triggers the shortcut
> event, e.g. holding CTRL-ALT-f continuesly switches between windowed and
> fullscreen mode, or holding CTRL-ALT-u even crashes QEMU with a segfault.
> This is ugly, we should rather ignore automatic key repeats when handling
> the keyboard shortcuts.

Applied to -trivial, thank you!

/mjt

