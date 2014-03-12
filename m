Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WNfKo-0000hN-FL
	for mharc-qemu-trivial@gnu.org; Wed, 12 Mar 2014 05:20:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53470)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1WNfKi-0000XM-4D
	for qemu-trivial@nongnu.org; Wed, 12 Mar 2014 05:20:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1WNfKd-0004fK-8X
	for qemu-trivial@nongnu.org; Wed, 12 Mar 2014 05:20:16 -0400
Received: from mail-ea0-x235.google.com ([2a00:1450:4013:c01::235]:51904)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1WNfKd-0004fF-1i; Wed, 12 Mar 2014 05:20:11 -0400
Received: by mail-ea0-f181.google.com with SMTP id k10so4824418eaj.40
	for <multiple recipients>; Wed, 12 Mar 2014 02:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gzDwhPHQOngwayBoaif9//uuJNXWa9tUyrygIFVu6GA=;
	b=ievRGTvVYPMSLZMnVdO1w5rclVJU0Z5FN0qvz6gYn8B4orQ+2RtFtpCsgJkEfYtRr6
	nDdWKSxNwx6QmsxD731GoKCj/VNQQMTJ1L6n8Fc18KSltu8Wv1Wc/4XH2fnAgV8onbMp
	eXy6HxIY7y9e2MhK85aIdKauLm+DiZCOjz5h4RJb+IV1zwYd/txMm4UYeFhIDsfRwvNx
	ZZ1BHGjXgLMAHnshA1P4N5UNFGaKLhrfNqlD3NKZgo0JeaqxPAaFAmHAcg6YQdKWfGuQ
	s3OmZaakWhTmYA/vBbs0XjeXBx25/wHPAENzzOgkuM3WDNRiSu4YtJdRAw9QH8TbpMKo
	oLiA==
X-Received: by 10.14.6.195 with SMTP id 43mr1592629een.101.1394616010042;
	Wed, 12 Mar 2014 02:20:10 -0700 (PDT)
Received: from localhost (nat-pool-muc-t.redhat.com. [209.132.186.12])
	by mx.google.com with ESMTPSA id
	m42sm67744993eex.21.2014.03.12.02.20.07 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Mar 2014 02:20:09 -0700 (PDT)
Date: Wed, 12 Mar 2014 10:20:05 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20140312092005.GC18850@stefanha-thinkpad.muc.redhat.com>
References: <1394054580-29120-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1394054580-29120-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4013:c01::235
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-io: Fix warnings from
 static code analysis
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
X-List-Received-Date: Wed, 12 Mar 2014 09:20:21 -0000

On Wed, Mar 05, 2014 at 10:23:00PM +0100, Stefan Weil wrote:
> Smatch complains about several global symbols which should be local.
> 
> Add the missing 'static' attributes and move the 'extern' declaration
> of variable qemuio_misalign to qemu-io.h. This variable also changes
> the type from 'int' to 'bool' which better fits documents its use.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  include/qemu-io.h |    2 ++
>  qemu-io-cmds.c    |    2 +-
>  qemu-io.c         |    7 +++----
>  3 files changed, 6 insertions(+), 5 deletions(-)

Thanks, applied to my block tree:
https://github.com/stefanha/qemu/commits/block

Stefan

