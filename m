Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TFSKc-00070G-Vm
	for mharc-qemu-trivial@gnu.org; Sat, 22 Sep 2012 12:13:26 -0400
Received: from eggs.gnu.org ([208.118.235.92]:51657)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TFSKa-0006ug-Ge
	for qemu-trivial@nongnu.org; Sat, 22 Sep 2012 12:13:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TFSKZ-0005xc-KS
	for qemu-trivial@nongnu.org; Sat, 22 Sep 2012 12:13:24 -0400
Received: from mail-we0-f173.google.com ([74.125.82.173]:64238)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TFSKX-0005xM-Or; Sat, 22 Sep 2012 12:13:21 -0400
Received: by weyt11 with SMTP id t11so2294082wey.4
	for <multiple recipients>; Sat, 22 Sep 2012 09:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bd+DtXI+kjKZXjTlZ6TV1oEFAV4VDjl60puDsldeoCw=;
	b=pahA9GuIQVhEwDhdHk8tdOR7VGFWjRnDEUyFc5iDjjJ65lY66VNE39R3hotBLejrvh
	Cx0yRKx+WhNf8G8e1Gc/GdKboHzSVlS5X52dAIAOA8Q9SVEeehNSi/1UCWaE9vPqownK
	CAhQG7mfg87OLE/3aZlnXF03kXd+OCNPnJE33x8p2zhS0NqcZ9q8ubfAidzVPC6JqQnL
	ZKVHVQFRxPYsz5PQhHPWp39/1WaSNslErySZWJhcC9zLSstYxEWN8luG6zTi6nmuC74X
	ZEKM7kq7j1VXYVHf0mMWMK+2gHMX/KLq77oMDB5f6T66shaNssiN5nUUYTbF6GGTh+RY
	5Q8g==
Received: by 10.216.242.204 with SMTP id i54mr4543723wer.112.1348330400795;
	Sat, 22 Sep 2012 09:13:20 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id t8sm4336885wiy.3.2012.09.22.09.13.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 22 Sep 2012 09:13:19 -0700 (PDT)
Date: Sat, 22 Sep 2012 17:13:17 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Laszlo Ersek <lersek@redhat.com>
Message-ID: <20120922161317.GI13216@stefanha-thinkpad.localdomain>
References: <1347873003-11593-1-git-send-email-lersek@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1347873003-11593-1-git-send-email-lersek@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, armbru@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] TextConsole: saturate escape parameter
 in TTY_STATE_CSI
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
X-List-Received-Date: Sat, 22 Sep 2012 16:13:25 -0000

On Mon, Sep 17, 2012 at 11:10:03AM +0200, Laszlo Ersek wrote:
> Signed-off-by: Laszlo Ersek <lersek@redhat.com>
> ---
>  Build tested.
>  console.c |    7 +++++--
>  1 files changed, 5 insertions(+), 2 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

