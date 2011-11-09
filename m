Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RO53j-0007fK-9K
	for mharc-qemu-trivial@gnu.org; Wed, 09 Nov 2011 05:07:07 -0500
Received: from eggs.gnu.org ([140.186.70.92]:54785)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RO53g-0007Vi-LK
	for qemu-trivial@nongnu.org; Wed, 09 Nov 2011 05:07:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RO53c-0004Ca-Ff
	for qemu-trivial@nongnu.org; Wed, 09 Nov 2011 05:07:04 -0500
Received: from mail-wy0-f173.google.com ([74.125.82.173]:64552)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RO53U-0004BL-SU; Wed, 09 Nov 2011 05:06:53 -0500
Received: by wyh22 with SMTP id 22so1549335wyh.4
	for <multiple recipients>; Wed, 09 Nov 2011 02:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Xp92qMTr/PuMbME17WvkKRu850R2cxaKXQNjzFRreEs=;
	b=Ev97Rs6tSpYhC8VIA9M5o+9N/XJXJFM0Q94myWvtY7RULbqKk3+GZ/eMfXuMkXPNgA
	LqoeGQvFx+ON9uTfxuZvHeK0jH4Boi8U+VQimBDO5BlmiRS/7rVca9ykj3LZbN6m4RZM
	vnBsLmTupMbIC1KUpBnOeHmaSMzq2b3hxP684=
Received: by 10.216.136.195 with SMTP id w45mr1245658wei.38.1320833211643;
	Wed, 09 Nov 2011 02:06:51 -0800 (PST)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id fw16sm5059116wbb.13.2011.11.09.02.06.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Nov 2011 02:06:50 -0800 (PST)
Date: Wed, 9 Nov 2011 10:06:49 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20111109100649.GA4659@stefanha-thinkpad.localdomain>
References: <1320762379-9276-1-git-send-email-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1320762379-9276-1-git-send-email-armbru@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] ui/vnc: Convert
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
X-List-Received-Date: Wed, 09 Nov 2011 10:07:05 -0000

On Tue, Nov 08, 2011 at 03:26:19PM +0100, Markus Armbruster wrote:
> Fixes protocol_client_auth_sasl_mechname() not to crash when malloc()
> fails.  Spotted by Coverity.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  ui/vnc-auth-sasl.c |   19 +++++--------------
>  1 files changed, 5 insertions(+), 14 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

