Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UVfYq-0002f7-Gz
	for mharc-qemu-trivial@gnu.org; Fri, 26 Apr 2013 06:07:24 -0400
Received: from eggs.gnu.org ([208.118.235.92]:54941)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UVfYn-0002Yr-HS
	for qemu-trivial@nongnu.org; Fri, 26 Apr 2013 06:07:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UVfYi-0002QL-O3
	for qemu-trivial@nongnu.org; Fri, 26 Apr 2013 06:07:21 -0400
Received: from mail-bk0-x22f.google.com ([2a00:1450:4008:c01::22f]:55123)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UVfYi-0002QG-Gi
	for qemu-trivial@nongnu.org; Fri, 26 Apr 2013 06:07:16 -0400
Received: by mail-bk0-f47.google.com with SMTP id ji1so1625446bkc.34
	for <qemu-trivial@nongnu.org>; Fri, 26 Apr 2013 03:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=PpZWnPBbiRbJCpsoSEKajKmNkUFckxgKWRpFWxcGf7M=;
	b=PsMlfHkkOPFsU1ED4/lkCVNbqQY1dEyuyrJWVDKgnemQHpeCjUZlPn1266JXoHxGIY
	Zd1HAhEpMXyv7uNkjDv1CT2JbM+ZHy9j7y0v2tE11g3llmDaVihNg16z5VI2nNhPLvSg
	qmo21uXH2aGGjT7KJxi5w36d7zko4c9BdQ3BSk1i2mK+aDff5Ko6q+GQsxexGxnhIL1e
	nSIV0sfkGBzb4ApjjBvDQlO34YR1Cb3BjUfUZ6bTpxVTJQuvikzm/b/dOTE+U3uSiXV2
	t9DHhz/gJhyVDUiqyfzvKVVcUONTpqcjkhYf0yhvG1HsHk9bzUb6YbcTrq3DNkGpuyEY
	E5Hg==
X-Received: by 10.204.238.200 with SMTP id kt8mr17922759bkb.50.1366970835737; 
	Fri, 26 Apr 2013 03:07:15 -0700 (PDT)
Received: from localhost ([2a02:810d:ec0:195:933:b278:833c:e7be])
	by mx.google.com with ESMTPSA id x18sm2897824bkw.4.2013.04.26.03.07.14
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 26 Apr 2013 03:07:15 -0700 (PDT)
Date: Fri, 26 Apr 2013 12:07:13 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Maksim Ratnikov <m.o.ratnikov@gmail.com>
Message-ID: <20130426100713.GD22315@stefanha-thinkpad.hitronhub.home>
References: <CAAWx3aQJh=nK5Tfi1nYTnREXzMRwOG6u4bUOd0Gx2n28OpG3pg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAWx3aQJh=nK5Tfi1nYTnREXzMRwOG6u4bUOd0Gx2n28OpG3pg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4008:c01::22f
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] SMBUS module update.
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
X-List-Received-Date: Fri, 26 Apr 2013 10:07:23 -0000

On Thu, Apr 25, 2013 at 02:20:18AM +0400, Maksim Ratnikov wrote:
> Subject: [PATCH] SMBUS module update. Previous realization doesn't consider
> flags in the status register. In this patch processing of bits of DS and
> INTR of the register HST_STS is added. Mechanism of clearing bits value in
> the register HST_STS is updated. Error processing is updated: if DEV_ERR
> bit are set transaction isn't evaluated.
> Signed-off-by: Maksim Ratnikov <m.o.ratnikov@gmail.com>
> ---
>  hw/pm_smbus.c |   26 ++++++++++++++++++--------
>  1 files changed, 18 insertions(+), 8 deletions(-)

Also, please always send patches to qemu-devel.  They must be on the
QEMU mailing list even if they go through the trivial patches queue.

Stefan

