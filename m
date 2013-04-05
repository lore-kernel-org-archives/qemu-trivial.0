Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UO6Jt-0006va-AH
	for mharc-qemu-trivial@gnu.org; Fri, 05 Apr 2013 09:04:41 -0400
Received: from eggs.gnu.org ([208.118.235.92]:41356)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UO6Jl-0006hZ-AT
	for qemu-trivial@nongnu.org; Fri, 05 Apr 2013 09:04:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UO6Jj-0006qg-4T
	for qemu-trivial@nongnu.org; Fri, 05 Apr 2013 09:04:33 -0400
Received: from mail-wi0-x22c.google.com ([2a00:1450:400c:c05::22c]:45504)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1UO6JZ-0006h8-Ez; Fri, 05 Apr 2013 09:04:21 -0400
Received: by mail-wi0-f172.google.com with SMTP id hr17so563256wib.17
	for <multiple recipients>; Fri, 05 Apr 2013 06:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=GPn/wQ/rHczCp4+Q1rG/8UqNs/5zpRy/piHSxVnsOu8=;
	b=iZ+SIYBEOvIWijM73022x9ouQzGZYLLAUHuYdm9fZHUHP5oX6uAhLAeEfKkthgG6jp
	lz2V+r41uamLk0cmDnpbPdHZWcKRmGvb9FSAfFr9f+6bNmxdd9sf8adMBfI6ohILIZfi
	3SMYXZsKsYZIXUA521d7VpI7M8j2N7ctVNu4uD75jHWXCPWk+LFxnJn08jCq2HTxI3Gs
	rnNy5LCIm9izzwwxIVbcQVbUklIL3kgNEwBX4Qals0KTiqN4gbuoFzw9pujPH9Yt3nSP
	5rjS/QJZCWQzrblT8JgkKWj4uDq8BNVdn9B6SukYPoqeXrkb74b5e1rp6PRJ8MCdxryo
	TV5A==
X-Received: by 10.194.83.33 with SMTP id n1mr16487797wjy.7.1365167060660;
	Fri, 05 Apr 2013 06:04:20 -0700 (PDT)
Received: from localhost ([2a02:810d:ec0:195:2d83:6a4a:ca86:7c26])
	by mx.google.com with ESMTPS id dp5sm3642690wib.1.2013.04.05.06.04.19
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 05 Apr 2013 06:04:19 -0700 (PDT)
Date: Fri, 5 Apr 2013 15:04:17 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Message-ID: <20130405130417.GE15818@stefanha-thinkpad.redhat.com>
References: <cover.1365037290.git.peter.crosthwaite@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1365037290.git.peter.crosthwaite@xilinx.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22c
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org,
	dantesu@faraday-tech.com, edgar.iglesias@gmail.com
Subject: Re: [Qemu-trivial] [PATCH v1 0/2] Remove un-needed use of
 ssi_create_slave_no_init
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
X-List-Received-Date: Fri, 05 Apr 2013 13:04:39 -0000

On Thu, Apr 04, 2013 at 11:03:14AM +1000, Peter Crosthwaite wrote:
> Trivial code cleanup of the PetaLogix and Zynq machine models.
> 
> 
> Peter Crosthwaite (2):
>   petalogix_ml605_mmu: Cleanup ssi_create_slave()
>   xilinx_zynq: Cleanup ssi_create_slave
> 
>  hw/arm/xilinx_zynq.c                |    3 +--
>  hw/microblaze/petalogix_ml605_mmu.c |    3 +--
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 
> 

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

