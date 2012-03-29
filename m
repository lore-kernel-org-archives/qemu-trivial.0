Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SDAkh-0000BN-4T
	for mharc-qemu-trivial@gnu.org; Thu, 29 Mar 2012 04:30:39 -0400
Received: from eggs.gnu.org ([208.118.235.92]:42956)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SDAkZ-0000B8-E2
	for qemu-trivial@nongnu.org; Thu, 29 Mar 2012 04:30:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SDAkT-0005kN-4P
	for qemu-trivial@nongnu.org; Thu, 29 Mar 2012 04:30:31 -0400
Received: from mail-ey0-f173.google.com ([209.85.215.173]:45045)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SDAkS-0005kC-Rw; Thu, 29 Mar 2012 04:30:25 -0400
Received: by eaaf11 with SMTP id f11so939316eaa.4
	for <multiple recipients>; Thu, 29 Mar 2012 01:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=nlFKJ7uP0M48l4lYUk30pMcvzqAoI8MEuR4ILcTTDdo=;
	b=L4UcKeDI9WhPL1iPbChHqWyYdGUPKKScZcZrc4D5f/aiXLkdq+10qitrUxXHXi9KDB
	5l3tzbFuwiovFB91zj3jzstkW98YJ9b2MKVl7bZc/k2ZC0cVeaB97K9gRF4QSMuvi69c
	UWI3MrJXf64FoLAGilAyoNOKgIimsltc59YRNOi5vxlBjiughXYwKmnqg+XSVVQiBnSi
	LSWWlgzVTVD0MjOzUm8KX9vebuhv5grj3KWvM+79Q3Kc0Xsaildg0s+WEBorQq8Kl/D1
	4B1qykX54XDw5aJiOKAWjnXwu0tokNByH+gXjOlNCOozayFZc1BK4gHZg9e/o9oTscH4
	MYlg==
Received: by 10.14.187.1 with SMTP id x1mr4623750eem.101.1333009822021;
	Thu, 29 Mar 2012 01:30:22 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice1n1.emea.ibm.com. [195.212.29.67])
	by mx.google.com with ESMTPS id
	m55sm19199227eei.1.2012.03.29.01.30.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 29 Mar 2012 01:30:21 -0700 (PDT)
Date: Thu, 29 Mar 2012 07:53:51 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <20120329065351.GA13344@stefanha-thinkpad.localdomain>
References: <4F735EE6.4080106@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4F735EE6.4080106@siemens.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.215.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Stefan Weil <weil@mail.berlios.de>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] w32: Undefine error constants before
 their redefinition
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
X-List-Received-Date: Thu, 29 Mar 2012 08:30:37 -0000

On Wed, Mar 28, 2012 at 08:56:38PM +0200, Jan Kiszka wrote:
> Avoids lots of warnings.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  qemu_socket.h |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

