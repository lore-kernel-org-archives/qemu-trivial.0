Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TZMSQ-0006ik-Rz
	for mharc-qemu-trivial@gnu.org; Fri, 16 Nov 2012 08:59:46 -0500
Received: from eggs.gnu.org ([208.118.235.92]:34943)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TZMSM-0006XJ-VR
	for qemu-trivial@nongnu.org; Fri, 16 Nov 2012 08:59:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TZMSJ-0005iq-Ts
	for qemu-trivial@nongnu.org; Fri, 16 Nov 2012 08:59:42 -0500
Received: from mail-ee0-f45.google.com ([74.125.83.45]:34344)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TZMSD-0005i2-IS; Fri, 16 Nov 2012 08:59:33 -0500
Received: by mail-ee0-f45.google.com with SMTP id d49so1680708eek.4
	for <multiple recipients>; Fri, 16 Nov 2012 05:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=azS3RKU1wGWRIFOQF9vCHb0op7h4f0/yU1WEnxN4/N8=;
	b=SvjdTesNA7CiHr7Y4I7psVx7WKfyLyd70e7zyH4ltTp4glpqOkcbqnxrE8Rb8RRSEt
	D2bRrEtWdfy7/XuK2RKt7wDhBz61SLPH/ORoMyjLOElGEWmt20JI92sazuoZwEKmnPGM
	eF4U9uIKpfF9/XL0LFJqg2Wck3FZN0VzQROy3yNXEHTQzFE6CZBGRZEi0dU4IPmDpGR7
	JQXwn/XFzg2+6cLKZCY9FOC6nFr7XdNeT/+YPLduMPvAf3NvTMNSAdnNkHmmtfgvn9T9
	YGo0cFo1E3GSyUop55FS1gqsct4svrL+57gBfRRYqGLNMaHhTQ5JZWcetIeMnM7tAbLA
	NGkw==
Received: by 10.14.179.69 with SMTP id g45mr13710106eem.42.1353074372696;
	Fri, 16 Nov 2012 05:59:32 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id y44sm3630122eel.14.2012.11.16.05.59.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Nov 2012 05:59:32 -0800 (PST)
Date: Fri, 16 Nov 2012 14:59:30 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: =?utf-8?B?6Zmz6Z+L5Lu7IChXZWktUmVuIENoZW4p?= <chenwj@iis.sinica.edu.tw>
Message-ID: <20121116135930.GE31927@stefanha-thinkpad.redhat.com>
References: <20121116022947.GA50435@cs.nctu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20121116022947.GA50435@cs.nctu.edu.tw>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.125.83.45
Cc: qemu-trivial@nongnu.org, Jia Liu <proljc@gmail.com>, qemu-devel@nongnu.org,
	"Johnson, Eric" <ericj@mips.com>
Subject: Re: [Qemu-trivial] [PATCH] target-mips: Add comments on POOL32Axf
 encoding
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
X-List-Received-Date: Fri, 16 Nov 2012 13:59:46 -0000

On Fri, Nov 16, 2012 at 10:29:47AM +0800, 陳韋任 (Wei-Ren Chen) wrote:
>   Current QEMU MIPS POOL32AXF encoding comes from microMIPS32
> and microMIPS32 DSP. Add comment here to help reading.
> 
>   Please review, thanks.
> 
> Regards,
> chenwj
> 
> Signed-off-by: Chen Wei-Ren <chenwj@iis.sinica.edu.tw>
> ---
>  target-mips/translate.c |   17 +++++++++++++++++
>  1 files changed, 17 insertions(+), 0 deletions(-)

Please send this through Aurelien.  Perhaps there's more to discuss
about how the various MIPS instruction sets should be organized in QEMU.

Stefan

