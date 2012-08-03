Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SxEbU-0006rG-Tw
	for mharc-qemu-trivial@gnu.org; Fri, 03 Aug 2012 05:55:32 -0400
Received: from eggs.gnu.org ([208.118.235.92]:57343)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SxEbS-0006j6-Dv
	for qemu-trivial@nongnu.org; Fri, 03 Aug 2012 05:55:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SxEbO-0006TI-JJ
	for qemu-trivial@nongnu.org; Fri, 03 Aug 2012 05:55:30 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:61858)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SxEbI-0006SQ-6Z; Fri, 03 Aug 2012 05:55:20 -0400
Received: by bkcji1 with SMTP id ji1so163601bkc.4
	for <multiple recipients>; Fri, 03 Aug 2012 02:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=4sL6dJuGlwWJ6XSxG3aSHJQQ/0BplvJOs1Gq0ofXUMs=;
	b=l4qeMedf2GMFLKkSbLuGx+uWKjIdnTiFgPSwznEAxmDmlQVm2fegbrJwYl2wUWoqd1
	vYLgT48ULd2asPRITJCxKtTCY9Jtwqbxm1U9jHlQDE1Srv+rqUpMbzlIfokgQz6AG5vu
	m5iCQBrbdB/Lc6CAzaTl3eu6SGoXhwdKwEkjzFJLHbUFjP9h1DKJfZgwvjxGgLVHJVoz
	aLh68m3rErgSkyZhg4XlpS1FbZ6S3c41q0RatEzZFisWLx5vT3i+0psmPmQE6FyMfz08
	wQHL3IibvQJ9RECFtGCPZcGH2bLrtZ5SBYw3+ZvFqjlxDIEyITqsbvAVqsWO/uz/SEAk
	v1Tg==
Received: by 10.204.13.82 with SMTP id b18mr398091bka.118.1343987718660;
	Fri, 03 Aug 2012 02:55:18 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id fu8sm4537170bkc.5.2012.08.03.02.55.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Aug 2012 02:55:17 -0700 (PDT)
Date: Fri, 3 Aug 2012 10:55:15 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Tyler Hall <tylerwhall@gmail.com>
Message-ID: <20120803095515.GA23797@stefanha-thinkpad.localdomain>
References: <1343256304-32029-1-git-send-email-tylerwhall@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1343256304-32029-1-git-send-email-tylerwhall@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 1/2] exec.c: Fix off-by-one error in
 register_subpage
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
X-List-Received-Date: Fri, 03 Aug 2012 09:55:31 -0000

On Wed, Jul 25, 2012 at 06:45:03PM -0400, Tyler Hall wrote:
> subpage_register() expects "end" to be the last byte in the mapping.
> Registering a non-page-aligned memory region that extends up to or
> beyond a page boundary causes subpage_register() to silently fail
> through the (end >= PAGE_SIZE) check.
> 
> This bug does not cause noticeable problems for mappings that do not
> extend to a page boundary, though they do register an extra byte.
> 
> Signed-off-by: Tyler Hall <tylerwhall@gmail.com>
> ---
>  exec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, both applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

