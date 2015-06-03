Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z03Oh-0004F0-Ty
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jun 2015 03:47:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54595)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Z03Of-0004Cd-Gf
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 03:47:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Z03Oe-0001X7-Mr
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 03:47:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48267)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1Z03Oa-0001We-Ec; Wed, 03 Jun 2015 03:47:28 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 3B66A19F203;
	Wed,  3 Jun 2015 07:47:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-58.ams2.redhat.com
	[10.36.116.58])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t537lPa4003880
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 3 Jun 2015 03:47:26 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id ACFB6303F809; Wed,  3 Jun 2015 09:47:24 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: "Daniel P. Berrange" <berrange@redhat.com>
References: <1433258768-28946-1-git-send-email-berrange@redhat.com>
Date: Wed, 03 Jun 2015 09:47:24 +0200
In-Reply-To: <1433258768-28946-1-git-send-email-berrange@redhat.com> (Daniel
	P. Berrange's message of "Tue, 2 Jun 2015 16:26:08 +0100")
Message-ID: <87twupxmgj.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Add .dir-locals.el file to
	configure emacs coding style
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
X-List-Received-Date: Wed, 03 Jun 2015 07:47:34 -0000

"Daniel P. Berrange" <berrange@redhat.com> writes:

> The default emacs setup indents by 2 spaces and uses tabs
> which is counter to the QEMU coding style rules. Adding a
> .dir-locals.el file in the top level of the GIT repo will
> inform emacs about the QEMU coding style, and so assist
> contributors in avoiding common style mistakes before
> they submit patches.

Yes, please!

> Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
> ---
>  .dir-locals.el | 8 ++++++++
>  1 file changed, 8 insertions(+)
>  create mode 100644 .dir-locals.el
>
> diff --git a/.dir-locals.el b/.dir-locals.el
> new file mode 100644
> index 0000000..ddb2fae
> --- /dev/null
> +++ b/.dir-locals.el
> @@ -0,0 +1,8 @@
> +(
> + (c-mode . (
> +            (c-file-style . "K&R")
> +            (indent-tabs-mode . nil)
> +            (c-indent-level . 4)
> +            (c-basic-offset . 4)
> +            ))
> +)

Unidiomatic placement of parenthesis.

The documented style name is "k&r", not "K&R".

This is its definition in my Emacs (23.4.1):

    ("k&r"
     (c-basic-offset . 5)
     (c-comment-only-line-offset . 0)
     (c-offsets-alist . ((statement-block-intro . +)
			 (knr-argdecl-intro . 0)
			 (substatement-open . 0)
			 (substatement-label . 0)
			 (label . 0)
			 (statement-cont . +))))

You overwrite c-basic-offset.  But then you can just as well use style
"stroustrup":

    ("stroustrup"
     (c-basic-offset . 4)
     (c-comment-only-line-offset . 0)
     (c-offsets-alist . ((statement-block-intro . +)
			 (substatement-open . 0)
			 (substatement-label . 0)
			 (label . 0)
			 (statement-cont . +))))

What does c-indent-level do?  Are you sure it's needed?

Does the following .dir-locals.el work for you equally well?

((c-mode . ((c-file-style . "stroustrup")
            (indent-tabs-mode . nil))))

