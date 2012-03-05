Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S4b58-0002mu-T6
	for mharc-qemu-trivial@gnu.org; Mon, 05 Mar 2012 11:48:18 -0500
Received: from eggs.gnu.org ([208.118.235.92]:52167)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S4b53-0002Vb-Mf
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2012 11:48:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S4b4v-000706-3G
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2012 11:48:13 -0500
Received: from mail-we0-f173.google.com ([74.125.82.173]:35300)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1S4b4P-0006uk-Sn; Mon, 05 Mar 2012 11:47:34 -0500
Received: by werp12 with SMTP id p12so3117444wer.4
	for <multiple recipients>; Mon, 05 Mar 2012 08:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=kUm4tz1nJb68lwJl0Z5xWzNi6ccRO38x+j0jjqbanqE=;
	b=cw+dC27ZmvQDNNpA0SRyXHkcL820PBmZI6qXLoUeDCB9Ub4Ovzy6o86ftjVtv+SRzA
	+spDPiSz13bD/EJ4zyy60Lf0Rgqgs15mzztVnFn1+EgpI3dH3wB8TNdfpZWg1y/BzoIT
	sF3KcqVLyeHRC/37FaE3Lc1BMiWJGACVg3kON8rqjKsWg020cVQMSXPUkN4Mgt2JtmAD
	EH+I8eVHdWQvpMX41HfdXGjxjYcOyChJLeBYSiI9Q/DNbu2cmmBUPBj6TNOGxO6uK4OQ
	Az4vLZW3WsT5q8wFbz2jTtdceNHhxAe4V+t9y8kOZBCRePmDe3kQKFtRJtdZdOjOEgzF
	J82Q==
Received: by 10.180.19.227 with SMTP id i3mr13174861wie.17.1330966051246;
	Mon, 05 Mar 2012 08:47:31 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	h19sm21920541wiw.9.2012.03.05.08.47.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Mar 2012 08:47:30 -0800 (PST)
Date: Mon, 5 Mar 2012 16:47:29 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <20120305164729.GC8197@stefanha-thinkpad.localdomain>
References: <4F4F44D6.2020907@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4F4F44D6.2020907@siemens.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Roy Tam <roytam@gmail.com>,
	qemu-devel <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] usb: Fix signature of stub
 usb_host_device_open
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
X-List-Received-Date: Mon, 05 Mar 2012 16:48:18 -0000

On Thu, Mar 01, 2012 at 10:43:50AM +0100, Jan Kiszka wrote:
> This was a breakage of 3741715cf2.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  usb-stub.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Even if a build fix is trivial, I suggest sending it only to
qemu-devel@nongnu.org because trivial patches pull requests only get
sent out about once per week.  It's fastest to get build fixed committed
directly.

Stefan

