Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T4rnl-0007N9-TK
	for mharc-qemu-trivial@gnu.org; Fri, 24 Aug 2012 07:11:45 -0400
Received: from eggs.gnu.org ([208.118.235.92]:45511)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T4rnj-0007F3-AJ
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2012 07:11:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T4rni-00018v-3L
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2012 07:11:43 -0400
Received: from mail-wi0-f175.google.com ([209.85.212.175]:48882)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1T4rna-00017n-8D; Fri, 24 Aug 2012 07:11:34 -0400
Received: by wibhm2 with SMTP id hm2so551521wib.10
	for <multiple recipients>; Fri, 24 Aug 2012 04:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7KjAc80f2v+iogts9aAZhVklzewTNzpHh7apCe1AI6k=;
	b=lzdjjr6y8+0z6GbiPfLOeyqv0MQrwKCHR0ukjXWkuk14PJ4ta7w3+S3YGIvxX2iHka
	JLaTnHEWuNhius4PJVuFeHvukfbmDxVTyjVmvor7gqf/auoJpwQPj7Z2pGHcAjoxXo7E
	nNyw0iAHt4Td6uL072Lx1DQ5zqvR9mc7JSnNSyfxRsgB3IamLvsX8nv1UK94tg44pOE+
	xu7Z+g336zJgzRk+BUi5P8ACJ06rItSn+WHof1+uLFw9YD7qWw7Z+mKxeLZiz3YwxzC8
	sT2W89WkohisD6Cqwvhxhs7phllQr2IWNWRayDWEMdcVyC9eA2VX1xRgB+FJQLlT+PZR
	EJJA==
Received: by 10.180.105.163 with SMTP id gn3mr4799549wib.2.1345806693494;
	Fri, 24 Aug 2012 04:11:33 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id t7sm5826250wix.6.2012.08.24.04.11.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Aug 2012 04:11:32 -0700 (PDT)
Date: Fri, 24 Aug 2012 12:11:28 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Message-ID: <20120824111128.GG10867@stefanha-thinkpad.localdomain>
References: <Pine.GSO.4.64.1208221717460.28960@mono>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.GSO.4.64.1208221717460.28960@mono>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.175
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2] Fix copy&paste typos in documentation
 comments
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
X-List-Received-Date: Fri, 24 Aug 2012 11:11:44 -0000

On Wed, Aug 22, 2012 at 05:18:38PM +0200, BALATON Zoltan wrote:
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  memory.h |   11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
>  v2: indented memory_region_init_ram_ptr

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

