Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RNjFi-0005jF-BD
	for mharc-qemu-trivial@gnu.org; Tue, 08 Nov 2011 05:50:02 -0500
Received: from eggs.gnu.org ([140.186.70.92]:41867)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RNjFf-0005Ys-EA
	for qemu-trivial@nongnu.org; Tue, 08 Nov 2011 05:50:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RNjFb-0002TD-F9
	for qemu-trivial@nongnu.org; Tue, 08 Nov 2011 05:49:59 -0500
Received: from mail-fx0-f45.google.com ([209.85.161.45]:55778)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RNjFZ-0002Ss-6Y; Tue, 08 Nov 2011 05:49:53 -0500
Received: by faap15 with SMTP id p15so460740faa.4
	for <multiple recipients>; Tue, 08 Nov 2011 02:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1xA30+OzRmaGqYRkVr0zl1AqdniT8/IevWihL2EjzVE=;
	b=cWSb7dkTkf99a0hnVWaydVwJZY95mLpwQFP7OIlKDtHLcE4pRzyYEtv1B46h26O8AF
	7+g/uWWAtLSQwqgdXIJNrK9uu+QtslPr8gw+vzE2zFoXqi1tEDbVtm9fOb/zEva8B3+9
	0Mn4zhus5feFEQcpVXpOnoGgm8+qf6KOusUI0=
Received: by 10.223.58.8 with SMTP id e8mr15515590fah.27.1320749392254;
	Tue, 08 Nov 2011 02:49:52 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id f4sm1727280faj.1.2011.11.08.02.49.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 Nov 2011 02:49:51 -0800 (PST)
Date: Tue, 8 Nov 2011 10:49:50 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20111108104950.GB18592@stefanha-thinkpad.localdomain>
References: <1320746152-31620-1-git-send-email-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1320746152-31620-1-git-send-email-armbru@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ui/vnc: Convert
 sasl.mechlist to g_malloc() & friends
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
X-List-Received-Date: Tue, 08 Nov 2011 10:50:00 -0000

On Tue, Nov 08, 2011 at 10:55:52AM +0100, Markus Armbruster wrote:
> Fixes protocol_client_auth_sasl_mechname() not to crash when malloc()
> fails.  Spotted by Coverity.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  ui/vnc-auth-sasl.c |   10 +++++-----
>  1 files changed, 5 insertions(+), 5 deletions(-)

g_malloc(), the allocator the never* fails.

* Or if it does you won't be around to care about it ;-)

Thanks, merged into the trivial-patches tree:

http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

