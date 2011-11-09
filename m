Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RO59y-0001vv-Tf
	for mharc-qemu-trivial@gnu.org; Wed, 09 Nov 2011 05:13:34 -0500
Received: from eggs.gnu.org ([140.186.70.92]:42328)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RO59w-0001qj-Fz
	for qemu-trivial@nongnu.org; Wed, 09 Nov 2011 05:13:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RO59v-0005QJ-L9
	for qemu-trivial@nongnu.org; Wed, 09 Nov 2011 05:13:32 -0500
Received: from mail-ww0-f53.google.com ([74.125.82.53]:51298)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RO59n-0005LC-QX; Wed, 09 Nov 2011 05:13:23 -0500
Received: by wwg7 with SMTP id 7so1869365wwg.10
	for <multiple recipients>; Wed, 09 Nov 2011 02:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=rhn6/PhtkL2rMgeRW5KB7lwQH7MZE9qtzSQMxhTxD7U=;
	b=s38YVq2QytQY4061RAluxAXmBiI3d9MlW5v0SGEXH+3qugufeVqOawDSLKfhBZXYe6
	ChTUqprUJq89o0Rqdcz6MI/n3IO8Q6tahtKTLhVIuJjl9RPMCL/4RbqyPoeXZj/Gc+ur
	45BWLZGc3nKi3LV5S5dvWNlBkgnV7pjKf2eD4=
Received: by 10.180.0.14 with SMTP id 14mr1825130wia.65.1320833602933;
	Wed, 09 Nov 2011 02:13:22 -0800 (PST)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id bn3sm2552120wib.2.2011.11.09.02.13.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Nov 2011 02:13:22 -0800 (PST)
Date: Wed, 9 Nov 2011 10:13:21 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20111109101321.GC4659@stefanha-thinkpad.localdomain>
References: <1320828775-16828-1-git-send-email-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1320828775-16828-1-git-send-email-armbru@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, kraxel@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] qxl: Don't convert from size_t to int
 and back in qxl_cursor()
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
X-List-Received-Date: Wed, 09 Nov 2011 10:13:33 -0000

On Wed, Nov 09, 2011 at 09:52:55AM +0100, Markus Armbruster wrote:
> Just for cleanliness; it would take a truly gigantic cursor to break.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/qxl-render.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

