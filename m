Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RqeiH-0003Fv-8L
	for mharc-qemu-trivial@gnu.org; Fri, 27 Jan 2012 00:51:05 -0500
Received: from eggs.gnu.org ([140.186.70.92]:55260)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RqeiE-00039B-8S
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2012 00:51:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RqeiC-0006JI-OO
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2012 00:51:02 -0500
Received: from mail-pz0-f45.google.com ([209.85.210.45]:37814)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Rqei9-0006Ij-Ox; Fri, 27 Jan 2012 00:50:57 -0500
Received: by dajr28 with SMTP id r28so1411708daj.4
	for <multiple recipients>; Thu, 26 Jan 2012 21:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=5DhM+MEi4VwK1xjut0BsfBMM/0lJbo6X6Nei/x3N5Us=;
	b=AhsnlvX127HfHTfVYuiCvWEeePF81+3fr7aMtgCTG2cw1pwnSzk4ma4TR2SWiyQRdX
	btRABB/P8P8Ck9bjegK6L38xTGz0I4vd3uq5g7GHMnw0I2IW/DXghqAmKKCYTdUsiYNC
	XtNUWpK5/4MMtV1kWUZP/5r8qLmWca/8prNxc=
Received: by 10.68.74.138 with SMTP id t10mr11572620pbv.126.1327643456629;
	Thu, 26 Jan 2012 21:50:56 -0800 (PST)
Received: from localhost (42-98-55-070.static.netvigator.com. [42.98.55.70])
	by mx.google.com with ESMTPS id i10sm17267100pbg.10.2012.01.26.21.50.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Jan 2012 21:50:55 -0800 (PST)
Date: Fri, 27 Jan 2012 05:50:51 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <20120127055051.GE17836@stefanha-thinkpad.localdomain>
References: <4F1AC0EB.3050304@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4F1AC0EB.3050304@web.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.45
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] qdev-property: Make bit property parsing
 stricter
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
X-List-Received-Date: Fri, 27 Jan 2012 05:51:03 -0000

On Sat, Jan 21, 2012 at 02:43:07PM +0100, Jan Kiszka wrote:
> By using strncasecmp, we allow for arbitrary characters after the
> "on"/"off" string. Fix this by switching to strcasecmp.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  hw/qdev-properties.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

