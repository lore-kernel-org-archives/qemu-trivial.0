Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RvQDI-000843-Bh
	for mharc-qemu-trivial@gnu.org; Thu, 09 Feb 2012 04:22:48 -0500
Received: from eggs.gnu.org ([140.186.70.92]:45118)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RvQDD-0007oW-Ob
	for qemu-trivial@nongnu.org; Thu, 09 Feb 2012 04:22:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RvQD7-0007m5-71
	for qemu-trivial@nongnu.org; Thu, 09 Feb 2012 04:22:43 -0500
Received: from mail-ww0-f53.google.com ([74.125.82.53]:50722)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RvQD2-0007iq-TZ; Thu, 09 Feb 2012 04:22:33 -0500
Received: by mail-ww0-f53.google.com with SMTP id dr12so1404667wgb.10
	for <multiple recipients>; Thu, 09 Feb 2012 01:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=uOJEWJDLWANDUOTAGbtVXaTkd8HBbWhTcJJTDHqJwNg=;
	b=Zoit1faWi78yO25r9sg3n/FarOONRdySHriRm7VpDyGRSFRfgQOCR6od9lrSY2IB9Y
	wCkIlvSkriitzC/5zUYFc6zOgjUTqcKKW190slIPL4quV0WtEy+fJ5DCSYxFBQMH64DM
	sKpWTBY1ZQ1sb8/BWMAkymM6WG9ZzEJeETLwc=
Received: by 10.180.90.212 with SMTP id by20mr1488063wib.12.1328779352350;
	Thu, 09 Feb 2012 01:22:32 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id s8sm5446848wiz.8.2012.02.09.01.22.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Feb 2012 01:22:31 -0800 (PST)
Date: Thu, 9 Feb 2012 08:44:09 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>
Message-ID: <20120209084409.GC30956@stefanha-thinkpad.localdomain>
References: <1328563183-2823-1-git-send-email-hpoussin@reactos.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1328563183-2823-1-git-send-email-hpoussin@reactos.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] ide: fix compilation errors when
 DEBUG_IDE is set
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
X-List-Received-Date: Thu, 09 Feb 2012 09:22:45 -0000

On Mon, Feb 06, 2012 at 10:19:42PM +0100, Hervé Poussineau wrote:
> 
> Signed-off-by: Hervé Poussineau <hpoussin@reactos.org>
> ---
>  hw/ide/pci.c  |    2 +-
>  hw/ide/piix.c |    4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

The types in this code are a mess but your patch doesn't make it worse.
It would be nice to clean things up in the future.

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

