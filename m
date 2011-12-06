Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RXs3H-0007Ef-Ef
	for mharc-qemu-trivial@gnu.org; Tue, 06 Dec 2011 05:15:07 -0500
Received: from eggs.gnu.org ([140.186.70.92]:33223)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RXs39-0006sR-Ao
	for qemu-trivial@nongnu.org; Tue, 06 Dec 2011 05:15:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RXs33-0004dY-O8
	for qemu-trivial@nongnu.org; Tue, 06 Dec 2011 05:14:59 -0500
Received: from mail-bw0-f45.google.com ([209.85.214.45]:41151)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RXs2s-0004bQ-Kj; Tue, 06 Dec 2011 05:14:42 -0500
Received: by bkaq10 with SMTP id q10so5940900bka.4
	for <multiple recipients>; Tue, 06 Dec 2011 02:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=dT6q1fB/zbcc7kL4PWWtk9bef+1a2ohXhpEapscsTCo=;
	b=S5Ngr3IV4fXtXkCygjgaktI6cygY3Lh+oR0kX7UYAzeXS4tOshWblImx1GS1AEFYtu
	hrTw1pakQAid/UKrgjcK4KIVPNs1G8dq8+LOwxIMLK5+WsJ2r4iM/c7J+IJrWZj9oc2f
	5EzedxGLcnBXorcoX6S2J8g8SJeAuDC8YRP2c=
Received: by 10.180.74.211 with SMTP id w19mr6385711wiv.7.1323166481574;
	Tue, 06 Dec 2011 02:14:41 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	hn15sm14160265wib.22.2011.12.06.02.14.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Dec 2011 02:14:41 -0800 (PST)
Date: Tue, 6 Dec 2011 10:14:40 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20111206101439.GA9809@stefanha-thinkpad.localdomain>
References: <1322818241-18137-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1322818241-18137-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org,
	=?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Convert source files to UTF-8 encoding
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
X-List-Received-Date: Tue, 06 Dec 2011 10:15:05 -0000

On Fri, Dec 02, 2011 at 10:30:41AM +0100, Stefan Weil wrote:
> Most QEMU files either are pure ASCII or use UTF-8.
> Convert some files which still used ISO-8859-1 to UTF-8.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/ds1225y.c           |    2 +-
>  hw/fdc.c               |    2 +-
>  hw/jazz_led.c          |    2 +-
>  hw/tc6393xb_template.h |    2 +-
>  hw/vmport.c            |    2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)

Thänk§, äppliéd to thé triviäl pätché§ -néxt tréé:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches-next

Stefan

