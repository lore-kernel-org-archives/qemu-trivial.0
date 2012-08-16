Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T1zl3-000285-7Q
	for mharc-qemu-trivial@gnu.org; Thu, 16 Aug 2012 09:05:05 -0400
Received: from eggs.gnu.org ([208.118.235.92]:51480)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T1zks-00022Q-Ki
	for qemu-trivial@nongnu.org; Thu, 16 Aug 2012 09:05:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T1zkm-000735-SQ
	for qemu-trivial@nongnu.org; Thu, 16 Aug 2012 09:04:54 -0400
Received: from mail-wi0-f181.google.com ([209.85.212.181]:40490)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1T1zkm-00072u-Hp; Thu, 16 Aug 2012 09:04:48 -0400
Received: by wibhm2 with SMTP id hm2so488370wib.10
	for <multiple recipients>; Thu, 16 Aug 2012 06:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=c3eGla7mW75j7Zi51cXj9fh25WGcyQM+IH4ftdhzkuc=;
	b=k/X5ZLRF3+kUSlCXB5r+hdC4uPu+P5xBTU0HoYBgJ9LYU/B2yg+klAtsTtyB7C3x61
	Bm5klMYtD95QAeUooEf8/Mf6cyIy0/1udQYUB6i2QjTpSulGHXxtBEqs1PDpQn/Ns4F3
	s8xMRfCQmSlRfvkw/XxcZizSPj/Hmo7sPJ4DYa7HPSdN83pdHl5ZHDkKYFF3EAmRWZOD
	tGCQ/x38D5gt2XIGCAhG8s+6mLtI8MOYjDbrWbnKd+OpIAcV/bi5B1t2Ol9r/+VkLHyx
	BuhjaAOtqc0mrLHO98BH1WRF+mrIZKg0yFq2gXta1XDkfdHiTJUUHRz0pVWhXCr5kUGD
	muKw==
Received: by 10.180.82.164 with SMTP id j4mr3006386wiy.18.1345122287074;
	Thu, 16 Aug 2012 06:04:47 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id
	cl8sm3717541wib.10.2012.08.16.06.04.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 16 Aug 2012 06:04:46 -0700 (PDT)
Date: Thu, 16 Aug 2012 14:04:44 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120816130444.GA3217@stefanha-thinkpad.localdomain>
References: <1344629007-23311-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1344629007-23311-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.181
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Spelling fixes in comments and
 documentation
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
X-List-Received-Date: Thu, 16 Aug 2012 13:05:04 -0000

On Fri, Aug 10, 2012 at 10:03:25PM +0200, Stefan Weil wrote:
> These wrong spellings were detected by codespell:
> 
> * successully -> successfully
> 
> * alot -> a lot
> 
> * wanna -> want to
> 
> * infomation -> information
> 
> * occured -> occurred
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  docs/specs/ppc-spapr-hcalls.txt |    2 +-
>  docs/usb2.txt                   |    4 ++--
>  hw/xen_pt.h                     |    4 ++--
>  hw/xen_pt_config_init.c         |   14 +++++++-------
>  qemu-img.c                      |    2 +-
>  qemu-img.texi                   |    2 +-
>  6 files changed, 14 insertions(+), 14 deletions(-)

Added Peter's suggestions.

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

