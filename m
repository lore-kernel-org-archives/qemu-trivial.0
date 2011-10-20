Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RGwBg-0001eP-51
	for mharc-qemu-trivial@gnu.org; Thu, 20 Oct 2011 13:13:48 -0400
Received: from eggs.gnu.org ([140.186.70.92]:54970)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RGwBc-0001SI-N6
	for qemu-trivial@nongnu.org; Thu, 20 Oct 2011 13:13:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RGwBX-0006n3-4p
	for qemu-trivial@nongnu.org; Thu, 20 Oct 2011 13:13:44 -0400
Received: from mail-qw0-f45.google.com ([209.85.216.45]:37081)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RGwBU-0006mS-3E; Thu, 20 Oct 2011 13:13:36 -0400
Received: by qadc12 with SMTP id c12so1957787qad.4
	for <multiple recipients>; Thu, 20 Oct 2011 10:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=sRaQgaBP6bk8wZDsPiB/Uy7JvC93oeHERiCRDH6k60w=;
	b=IGilgdxOqzrBqaBEsu5ndtge1SmCl8exOmRLIQLDGkT9EEE4Xac7ATCeNv5gbBRDBV
	slBBB8a/rl9VLeK/0liggAkRYEMZahJvZYBKwyCWhirBsuDIbJfTsE84jDIOTtGqBcO9
	BHFOmyyVMmrTaknLBRSku/CjbKLWB78gX7iXE=
Received: by 10.68.33.193 with SMTP id t1mr21167330pbi.89.1319130814616;
	Thu, 20 Oct 2011 10:13:34 -0700 (PDT)
Received: from localhost ([71.198.47.196])
	by mx.google.com with ESMTPS id ki1sm20809299pbb.3.2011.10.20.10.13.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Oct 2011 10:13:33 -0700 (PDT)
Date: Thu, 20 Oct 2011 10:13:32 -0700
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Pavel Borzenkov <pavel.borzenkov@gmail.com>
Message-ID: <20111020171332.GB7089@stefanha-thinkpad.localdomain>
References: <1318958302-14091-1-git-send-email-pavel.borzenkov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1318958302-14091-1-git-send-email-pavel.borzenkov@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] vmdk: remove unneeded variable assignment
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
X-List-Received-Date: Thu, 20 Oct 2011 17:13:46 -0000

On Tue, Oct 18, 2011 at 09:18:22PM +0400, Pavel Borzenkov wrote:
> Spotted by Clang Analyzer
> 
> Signed-off-by: Pavel Borzenkov <pavel.borzenkov@gmail.com>
> ---
>  block/vmdk.c |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

