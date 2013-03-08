Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UDtSE-0000e7-HK
	for mharc-qemu-trivial@gnu.org; Fri, 08 Mar 2013 04:19:06 -0500
Received: from eggs.gnu.org ([208.118.235.92]:47428)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UDtS9-0000W8-GA
	for qemu-trivial@nongnu.org; Fri, 08 Mar 2013 04:19:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UDtS4-0006PK-BL
	for qemu-trivial@nongnu.org; Fri, 08 Mar 2013 04:19:01 -0500
Received: from mail-wg0-f43.google.com ([74.125.82.43]:43102)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1UDtRv-0006MZ-Nz; Fri, 08 Mar 2013 04:18:47 -0500
Received: by mail-wg0-f43.google.com with SMTP id e12so2280371wge.22
	for <multiple recipients>; Fri, 08 Mar 2013 01:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=oGodrwbyta0SNUIl5G8fFWWpInsNaZWGBFFpoHNcezM=;
	b=KQTR5qlnnYJP4WEf2FGKoB0g5x1XQeU9cgAJIYOBwVyVzmj8zo8NtLHtJ9lhijac8K
	NOa9xz8BNbiboLsrx5/0G69hFNX8hkKv2269UpMMuxKEW97PDUEmPPZflNOIiKCtDQCW
	yu6IakLnmSPN69kDrJdFNk2VcGCnsgJAp8afb48ehCqJ42mZT2vqVsw6ZjszCiDftBmt
	FMh6suak7avBDnFgxQvsQVu/wq0QFF1RzRM/MlyBZLiizGdWdr+peBsZwsYL0l4aQtu4
	5T8urBD9xUTBXlKBUOwl7L9T0QdX2q6MymbkswKAIXFXLpptF27P2iKDjEcV2uLYMqSR
	/Niw==
X-Received: by 10.195.12.133 with SMTP id eq5mr2259766wjd.52.1362734327047;
	Fri, 08 Mar 2013 01:18:47 -0800 (PST)
Received: from localhost ([2a02:810d:ec0:195:852b:b477:8102:5356])
	by mx.google.com with ESMTPS id fv2sm8165738wib.6.2013.03.08.01.18.45
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 08 Mar 2013 01:18:46 -0800 (PST)
Date: Fri, 8 Mar 2013 10:18:44 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20130308091844.GC9597@stefanha-thinkpad.redhat.com>
References: <1362417107-27069-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1362417107-27069-1-git-send-email-pbonzini@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.125.82.43
Cc: qemu-trivial@nongnu.org, michael@walle.cc, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] lm32: remove unused function
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
X-List-Received-Date: Fri, 08 Mar 2013 09:19:05 -0000

On Mon, Mar 04, 2013 at 06:11:47PM +0100, Paolo Bonzini wrote:
> The milkymist-minimac device in fact does not exist at all.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/milkymist-hw.h | 16 ----------------
>  1 file changed, 16 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

