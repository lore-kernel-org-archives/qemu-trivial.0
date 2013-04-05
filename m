Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UO6AG-0003xx-4U
	for mharc-qemu-trivial@gnu.org; Fri, 05 Apr 2013 08:54:44 -0400
Received: from eggs.gnu.org ([208.118.235.92]:38672)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UO6A7-0003hG-Vl
	for qemu-trivial@nongnu.org; Fri, 05 Apr 2013 08:54:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UO6A6-0002wm-Ow
	for qemu-trivial@nongnu.org; Fri, 05 Apr 2013 08:54:35 -0400
Received: from mail-wg0-f49.google.com ([74.125.82.49]:57519)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1UO69t-0002nh-TV; Fri, 05 Apr 2013 08:54:22 -0400
Received: by mail-wg0-f49.google.com with SMTP id e11so3852933wgh.16
	for <multiple recipients>; Fri, 05 Apr 2013 05:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=rceAZsHNwXRwG5H9ztFmFF7YZunDVptOMhZ+ltjppGE=;
	b=IOYckB7318CzHRj1taV1ngF7xm7DihobzXZrcR9TYfOlxcXovVv1J4k/CQlyt5DHyF
	EK8bFI41ZcaU7uyFFJ+8BpneXsZ87uM6/T8wzhtO0nhmcAwFFsHwaRB1bpoFzJJ5WIro
	7qAmGZ9QFswjE05slfWUWAYkKCTo5NVoYMpK6S/cpAPGNWXHDmYPir/ENuwpXUKsnwuH
	ORrKPFCEnde0FYLBGSXaGOxN6yYC1fhLC9t8MPzK+n13iWkadKjpp0hAmso63P8mTLzX
	bkOYkmst1RCpZhYMd+396CIyzS4tj3i4TKDTWsiXfZkes/POaLK/ALjpF8iUcNYWzkD8
	W5Sw==
X-Received: by 10.180.76.84 with SMTP id i20mr4057827wiw.9.1365166461020;
	Fri, 05 Apr 2013 05:54:21 -0700 (PDT)
Received: from localhost ([2a02:810d:ec0:195:2d83:6a4a:ca86:7c26])
	by mx.google.com with ESMTPS id s2sm4081882wib.4.2013.04.05.05.54.19
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 05 Apr 2013 05:54:19 -0700 (PDT)
Date: Fri, 5 Apr 2013 14:54:18 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Richard Henderson <rth@twiddle.net>
Message-ID: <20130405125418.GC15818@stefanha-thinkpad.redhat.com>
References: <1364663005-1470-1-git-send-email-rth@twiddle.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1364663005-1470-1-git-send-email-rth@twiddle.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.125.82.49
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target-s390: Fix SRNMT
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
X-List-Received-Date: Fri, 05 Apr 2013 12:54:42 -0000

On Sat, Mar 30, 2013 at 10:03:25AM -0700, Richard Henderson wrote:
> Fallthough into abort = oops.
> 
> Cc: qemu-trivial@nongnu.org
> Cc: Alexander Graf <agraf@suse.de>
> Signed-off-by: Richard Henderson <rth@twiddle.net>
> ---
>  target-s390x/translate.c | 1 +
>  1 file changed, 1 insertion(+)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

