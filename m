Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TP86s-0006w2-54
	for mharc-qemu-trivial@gnu.org; Fri, 19 Oct 2012 04:39:14 -0400
Received: from eggs.gnu.org ([208.118.235.92]:38008)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TP86m-0006vN-6l
	for qemu-trivial@nongnu.org; Fri, 19 Oct 2012 04:39:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TP86g-0003h4-0l
	for qemu-trivial@nongnu.org; Fri, 19 Oct 2012 04:39:08 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:41946)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TP86f-0003gy-QQ; Fri, 19 Oct 2012 04:39:01 -0400
Received: by mail-bk0-f45.google.com with SMTP id jf3so69285bkc.4
	for <multiple recipients>; Fri, 19 Oct 2012 01:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+PZmTEDh9nkXMcD7z5cnaofXFeel78vKz3TXjCCDw34=;
	b=VMUnBG9bbfiTV8WOief91/GXozsuXp8+HknfaaFUJE6aayKZ7pulSBcN5RjWgwFqmt
	juxnxlJ6+ZomOs33xwnS3I56J6UM75QfmmiIfi6MtqF8BT19GPSek8uyFRe4HccvDo6Y
	/UAlllW03MkbbfqrXCmhSEuiOPggor0e9D4kOaZmIjNsJHacgWkW3oq/3jqS+fmHdlwf
	NT7UoH53959vUXSrNbR3arn2rnfvPj6p/uXtU1UhEoNEgwcMsPUt0PUtvGHgwrw1VEUv
	/DvD7BmuZmrODXiWVXTUu0udVACJI4fONKzuLqnRLZHpY374Seodv8zvKXO08xD7JJYV
	xc1g==
Received: by 10.204.9.136 with SMTP id l8mr147162bkl.78.1350635940877;
	Fri, 19 Oct 2012 01:39:00 -0700 (PDT)
Received: from localhost (188-194-252-80-dynip.superkabel.de. [188.194.252.80])
	by mx.google.com with ESMTPS id z22sm316927bkw.2.2012.10.19.01.38.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 19 Oct 2012 01:38:59 -0700 (PDT)
Date: Fri, 19 Oct 2012 10:38:58 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20121019083858.GD4656@stefanha-thinkpad.redhat.com>
References: <1350279940-24134-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1350279940-24134-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] configure: Remove unused parameters from
 main function
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
X-List-Received-Date: Fri, 19 Oct 2012 08:39:12 -0000

On Mon, Oct 15, 2012 at 07:45:40AM +0200, Stefan Weil wrote:
> This modification is required if compiler option -Wunused-parameter is activated.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  configure |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

