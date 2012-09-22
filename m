Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TFRpU-0006lI-9U
	for mharc-qemu-trivial@gnu.org; Sat, 22 Sep 2012 11:41:16 -0400
Received: from eggs.gnu.org ([208.118.235.92]:54587)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TFRpT-0006lC-39
	for qemu-trivial@nongnu.org; Sat, 22 Sep 2012 11:41:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TFRpR-0003IX-Sf
	for qemu-trivial@nongnu.org; Sat, 22 Sep 2012 11:41:15 -0400
Received: from mail-wi0-f181.google.com ([209.85.212.181]:63462)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TFRpR-0003IR-MP; Sat, 22 Sep 2012 11:41:13 -0400
Received: by wibhm2 with SMTP id hm2so2344252wib.10
	for <multiple recipients>; Sat, 22 Sep 2012 08:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=voNRGSZuLNMnbxP3bo8vA5Tqd433iYg/872dJH+SMjg=;
	b=ykusZbcvdw7n+7n0ViCS3rHOCo6q32v8KUOVo+9DotGJexGk5+V1djKDT7ld4zaCt3
	mxv//jCSuf4ZhDq3S46ZsOj+uvxCrbdEFtvqlmX94CK2UtvYhddClGXoZu9zijqybbk2
	LiBj/vjEqdD0jR5aCNVP2ltTF7ceEctdecfycCPrynwEoPvLs3z6l9iHu1dIPBlqh25h
	qPTr9wPJQ3qvEGSNPLsVJ53tmWnsfAZbJ/iWTWdErfkFpY7lGX8oIWkLcXpew9KgZ0mN
	l1PlCK+OLUOG2FgPlFKK3x7eJXGKFgavIVflvPUeV35geHbfsWbVjrqYivvCAOz5kMTW
	MkfQ==
Received: by 10.180.104.197 with SMTP id gg5mr3655321wib.9.1348328472735;
	Sat, 22 Sep 2012 08:41:12 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id l6sm4187142wiz.4.2012.09.22.08.41.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 22 Sep 2012 08:41:12 -0700 (PDT)
Date: Sat, 22 Sep 2012 16:41:10 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120922154110.GE13216@stefanha-thinkpad.localdomain>
References: <1346496963-27422-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1346496963-27422-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.181
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] ioh3420: Remove unreachable code
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
X-List-Received-Date: Sat, 22 Sep 2012 15:41:16 -0000

On Sat, Sep 01, 2012 at 12:56:03PM +0200, Stefan Weil wrote:
> Report from smatch:
> hw/ioh3420.c:128 ioh3420_initfn(35) info: ignoring unreachable code.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/ioh3420.c |    1 -
>  1 file changed, 1 deletion(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

