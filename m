Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Shzyd-0005MM-KW
	for mharc-qemu-trivial@gnu.org; Fri, 22 Jun 2012 05:16:27 -0400
Received: from eggs.gnu.org ([208.118.235.92]:60691)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1ShzyW-00050P-3l
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2012 05:16:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1ShzyQ-0003Gb-2M
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2012 05:16:19 -0400
Received: from mail-wg0-f53.google.com ([74.125.82.53]:53071)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1ShzyD-0003BK-4R; Fri, 22 Jun 2012 05:16:01 -0400
Received: by wgbfm10 with SMTP id fm10so1374854wgb.10
	for <multiple recipients>; Fri, 22 Jun 2012 02:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=iGLPemOvoeMxTM88KxdU5ur9XGdx+TpHu8h3h4xtJQ4=;
	b=rU9DENG0YW2KThNcFp+AFxMbGoPe/r7Wo4OdBbs+P/Wm2jrgwav1wCQ8CExo9WFNK1
	YN90C3rz5Mp6gGOd5Fpqpiw+w9e0RsGcXXDtDWrrpicOIgbHvsIpHIEN/G9U/4ldLsod
	FUMbeSehF7jfgCy10l+nD8hmUwisGBg0PqlTFceKqGTIoa038OR+AdXudES4dc0XlBIW
	yOk/KRYch2eJIqnSfotV2fYbTbxtTVFwRbzZihLFXrBc9VMQ6xViXGuj7mGFwEFtNLwv
	dREHZ4xaOvLurYMKVakRpQpR0EGOWc65noWhrzXGMowUH/PuidkCPH+r95o+Wbi65WW3
	l0lA==
Received: by 10.216.226.218 with SMTP id b68mr774058weq.167.1340356558382;
	Fri, 22 Jun 2012 02:15:58 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id
	gv7sm50972744wib.4.2012.06.22.02.15.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 22 Jun 2012 02:15:57 -0700 (PDT)
Date: Fri, 22 Jun 2012 10:15:55 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: "Peter A. G. Crosthwaite" <peter.crosthwaite@petalogix.com>
Message-ID: <20120622091555.GF27038@stefanha-thinkpad.localdomain>
References: <1340254284-20415-1-git-send-email-peter.crosthwaite@petalogix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1340254284-20415-1-git-send-email-peter.crosthwaite@petalogix.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org, edgar.iglesias@gmail.com, qemu-devel@nongnu.org,
	john.williams@petalogix.com
Subject: Re: [Qemu-trivial] [PATCH v1] device_tree: load_device_tree():
 Allow NULL sizep
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
X-List-Received-Date: Fri, 22 Jun 2012 09:16:26 -0000

On Thu, Jun 21, 2012 at 02:51:24PM +1000, Peter A. G. Crosthwaite wrote:
> The sizep arg is populated with the size of the loaded device tree. Since this
> is one of those informational "please populate" type arguments it should be
> optional. Guarded writes to *sizep against NULL accordingly.
> 
> Signed-off-by: Peter A. G. Crosthwaite <peter.crosthwaite@petalogix.com>
> ---
>  device_tree.c |    8 ++++++--
>  1 files changed, 6 insertions(+), 2 deletions(-)

Can someone who knows device trees review this?

All current users need the size in order to copy the fdt into guest
memory.  Why should the size argument be optional?

Stefan

