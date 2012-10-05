Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TK6y3-0006od-55
	for mharc-qemu-trivial@gnu.org; Fri, 05 Oct 2012 08:25:23 -0400
Received: from eggs.gnu.org ([208.118.235.92]:40747)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TK6xv-0006nW-Ks
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2012 08:25:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TK6xn-0007WH-M2
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2012 08:25:15 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:61105)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TK6xn-0007TY-Df; Fri, 05 Oct 2012 08:25:07 -0400
Received: by mail-bk0-f45.google.com with SMTP id jf3so766765bkc.4
	for <multiple recipients>; Fri, 05 Oct 2012 05:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=WMSRCXs2BLW3lqLmskgWRl9h4SbDkoGGtPguWAcDBBU=;
	b=VKNdpzBkwl12vZllHq7XC14sP07kbiJWzP4rw+/yAwSZTIymvjeHhxe/+80K/Hl4fH
	oeIayU9laG1s/fKvvz1FjW6sjY0JY1m4Z7nVN4GQMzE/pGl0U7RPMpXmMWP61K6CMRW1
	4+uOzWruEQUsMA0mkpsgLf1OGtBeqAJ5brzszGFu/PdXWXkFgZS76ScIa/OW079sOJlx
	/PPJ5ykMrHaue5reeOHWSk7o/2JB3YKtoa8FSk85eURhwAcOlloUcHpz+xtH15YVGarI
	PUEG4UKjmM4+cirbePcYsrpADpUUPYzKw9TcKWDtTWIUE0jgPyiBC3RBDobuKhqtN4ta
	vTmw==
Received: by 10.204.9.136 with SMTP id l8mr2688084bkl.78.1349439906363;
	Fri, 05 Oct 2012 05:25:06 -0700 (PDT)
Received: from localhost ([82.113.121.2])
	by mx.google.com with ESMTPS id fm5sm1841102bkc.5.2012.10.05.05.25.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 05 Oct 2012 05:25:05 -0700 (PDT)
Date: Fri, 5 Oct 2012 14:25:02 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20121005122502.GC10951@stefanha-thinkpad.redhat.com>
References: <1348772258-31168-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1348772258-31168-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, Jan Kiszka <jan.kiszka@siemens.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] slirp: Fix spelling in
 comment (enought -> enough, insure -> ensure)
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
X-List-Received-Date: Fri, 05 Oct 2012 12:25:21 -0000

On Thu, Sep 27, 2012 at 08:57:38PM +0200, Stefan Weil wrote:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> 
> As a non native speaker, I feel that 'ensure' is better here than 'insure'.
> Could a native speaker please confirm that?
> 
> Thanks,
> 
> Stefan
> 
>  slirp/ip_icmp.h |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

