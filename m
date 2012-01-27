Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rqf9l-0007sb-Pc
	for mharc-qemu-trivial@gnu.org; Fri, 27 Jan 2012 01:19:29 -0500
Received: from eggs.gnu.org ([140.186.70.92]:33222)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Rqf9i-0007mA-EK
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2012 01:19:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Rqf9h-0000vM-Ez
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2012 01:19:26 -0500
Received: from mail-pz0-f45.google.com ([209.85.210.45]:51283)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Rqf9f-0000v7-Bw; Fri, 27 Jan 2012 01:19:23 -0500
Received: by dajr28 with SMTP id r28so1433136daj.4
	for <multiple recipients>; Thu, 26 Jan 2012 22:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=5oqMWh7Io0zuZh7rsKEnJIpmnCn0ky77ga8/PdFnWfA=;
	b=mohpUtTSwo/lL/gfw4A1+7t7NvtbF7huZJ3LHdq2twGg8KEyBYLy/zG55AOTLex38g
	lHfYiBqxhKK/JeTkySFatV4DtIi7ZsgbYmGg2COgGHBEF2GsDya3o74YexPCUahFDwT7
	WitiQECv0PvwX9qf55u62uwgS0EJYXwAq+vlw=
Received: by 10.68.213.228 with SMTP id nv4mr11885738pbc.52.1327645162140;
	Thu, 26 Jan 2012 22:19:22 -0800 (PST)
Received: from localhost (42-98-55-070.static.netvigator.com. [42.98.55.70])
	by mx.google.com with ESMTPS id o7sm17439247pbq.8.2012.01.26.22.19.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Jan 2012 22:19:21 -0800 (PST)
Date: Fri, 27 Jan 2012 06:19:17 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <20120127061917.GG17836@stefanha-thinkpad.localdomain>
References: <4F1DA82F.4090808@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4F1DA82F.4090808@siemens.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.45
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] optionroms: Silence intermediate file
 removal
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
X-List-Received-Date: Fri, 27 Jan 2012 06:19:27 -0000

On Mon, Jan 23, 2012 at 07:34:23PM +0100, Jan Kiszka wrote:
> The build process of optionroms spits out an "rm ..." line. Moreover, it
> removes all .o files that can be handy for debugging purposes.
> 
> Disable automatic intermediate removal and only clean up the unneeded
> and large .img and .raw files.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  pc-bios/optionrom/Makefile |    6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/pc-bios/optionrom/Makefile b/pc-bios/optionrom/Makefile
> index 51da288..3edde85 100644
> --- a/pc-bios/optionrom/Makefile
> +++ b/pc-bios/optionrom/Makefile
> @@ -16,14 +16,16 @@ QEMU_CFLAGS = $(CFLAGS)
>  
>  build-all: multiboot.bin linuxboot.bin
>  
> +.SECONDARY:

I suggest a comment explaining what this built-in target name does.
Otherwise someone might delete it because it is empty.

