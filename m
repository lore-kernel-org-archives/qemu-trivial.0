Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ttanj-000410-Ho
	for mharc-qemu-trivial@gnu.org; Fri, 11 Jan 2013 04:21:23 -0500
Received: from eggs.gnu.org ([208.118.235.92]:41216)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Ttanf-0003mp-5x
	for qemu-trivial@nongnu.org; Fri, 11 Jan 2013 04:21:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Ttanc-0006lI-Dc
	for qemu-trivial@nongnu.org; Fri, 11 Jan 2013 04:21:18 -0500
Received: from mail-we0-f169.google.com ([74.125.82.169]:50263)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TtanV-0006jf-J6; Fri, 11 Jan 2013 04:21:09 -0500
Received: by mail-we0-f169.google.com with SMTP id t49so745829wey.14
	for <multiple recipients>; Fri, 11 Jan 2013 01:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=08RcFguS3zVPsA3rkUzRdB7pwuWKTEPeQCAPYUo+xk4=;
	b=RlP/VrFdhgcQfgHevpcKiCybvce3MG3O98AIkUj6Vq1Wjz5EHW7lHlN+HyhHU1aLS5
	OnjYMZDvPbXp4mF8VEiuD+lsaUOcXoWr9nzRjZBsLXZdgJnsjkqZRZMfJPH+O2c/6+SE
	PazVwGT1YDTxi8O8cC9zIU0oSKarFClce0kx9BdBF1qESX7q14cmLFp3DXJ81EBqtpQj
	a7jAl9NkuZQqPZd1gtk4nFnac1yNKHadE8rk/qTfDk/Rt//DW+vZDb6TSXusa9aAaHqk
	iW9JL9MYMtf/JqphAz95Wi4byfp6avo18VqcQUcOtuBPIp+aUkSb4durFV0yA0W6ICFf
	zl0A==
X-Received: by 10.180.75.208 with SMTP id e16mr14193340wiw.3.1357895644593;
	Fri, 11 Jan 2013 01:14:04 -0800 (PST)
Received: from localhost (nat-pool-muc-t.redhat.com. [209.132.186.12])
	by mx.google.com with ESMTPS id u6sm6278201wif.2.2013.01.11.01.14.02
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 11 Jan 2013 01:14:03 -0800 (PST)
Date: Fri, 11 Jan 2013 10:13:57 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Julien Grall <julien.grall@citrix.com>
Message-ID: <20130111091357.GA14135@stefanha-thinkpad.muc.redhat.com>
References: <1357755022-3572-1-git-send-email-julien.grall@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1357755022-3572-1-git-send-email-julien.grall@citrix.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.125.82.169
Cc: qemu-trivial@nongnu.org, aliguori@us.ibm.com, qemu-devel@nongnu.org,
	adam@os.inf.tu-dresden.de
Subject: Re: [Qemu-trivial] [PATCH] hw/pc.c: Fix converting of
 ioport_register* to MemoryRegion
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
X-List-Received-Date: Fri, 11 Jan 2013 09:21:21 -0000

On Wed, Jan 09, 2013 at 06:10:22PM +0000, Julien Grall wrote:
> The commit 258711 introduced MemoryRegion to replace ioport_region*
> for ioport 80h and F0h.
> A MemoryRegion needs to have both read and write callback otherwise a segfault
> will occur when an access is made.
> 
> The previous behaviour of this both ioport is to return 0xffffffffffffffff.
> So keep this behaviour.
> 
> Reported-by: Adam Lackorzynski <adam@os.inf.tu-dresden.de>
> Signed-off-by: Julien Grall <julien.grall@citrix.com>
> ---
>  hw/pc.c |   12 ++++++++++++
>  1 file changed, 12 insertions(+)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

