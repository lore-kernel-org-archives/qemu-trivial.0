Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Up0Ri-0002GG-Fp
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jun 2013 14:15:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47776)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flukshun@gmail.com>) id 1Up0Rc-00029C-IB
	for qemu-trivial@nongnu.org; Tue, 18 Jun 2013 14:15:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <flukshun@gmail.com>) id 1Up0Rb-0001EY-QC
	for qemu-trivial@nongnu.org; Tue, 18 Jun 2013 14:15:52 -0400
Received: from mail-ob0-x22e.google.com ([2607:f8b0:4003:c01::22e]:65275)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flukshun@gmail.com>)
	id 1Up0RX-0001Dl-HO; Tue, 18 Jun 2013 14:15:47 -0400
Received: by mail-ob0-f174.google.com with SMTP id wd20so4954923obb.19
	for <multiple recipients>; Tue, 18 Jun 2013 11:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=z0ikXj7Q4gO3H2CYlo/xG3H4mTyVI3fLrnDpqwl1lTk=;
	b=Mo8xucgCWueM3mYO5nG/kxRbf8QUAjUa4sHoCESPOQflKeP9jubvcRW0rg1zTsQMwB
	Zb9JOTdeicvEtVNAtQFW0KpmydbccnBG0KYXwZAwVe1pic2YKerHcF+BSkDpj82duhrd
	Ji7ZOcIzdxZrBxyypddc0rsxwxk4DjPzoO3Qmqh89E+p7g23Jz5FM4VObXmnbT64xH7Q
	PbH3KT5vfU9CqtguzzxbRJFCPPtrxd5NbemsNf3/MKJtub2IM6LMkPiQkOhmRJ94aeR3
	C1MIt5VcKZrnDI0wH3b2xy84UyPmnT2RZJ2wy4UTVQB12Bk7qmmDJI53F6GWOtQAx80/
	0ieg==
X-Received: by 10.182.246.227 with SMTP id xz3mr12781805obc.67.1371579346835; 
	Tue, 18 Jun 2013 11:15:46 -0700 (PDT)
Received: from localhost ([32.97.110.51])
	by mx.google.com with ESMTPSA id wv8sm22934731obb.2.2013.06.18.11.15.44
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 18 Jun 2013 11:15:46 -0700 (PDT)
Sender: fluxion <flukshun@gmail.com>
Date: Tue, 18 Jun 2013 13:15:12 -0500
From: mdroth <mdroth@linux.vnet.ibm.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20130618181512.GC17657@vm>
References: <1371542723-926-1-git-send-email-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1371542723-926-1-git-send-email-armbru@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c01::22e
Cc: qemu-trivial@nongnu.org, berrange@redhat.com, qemu-devel@nongnu.org,
	qemu-stable@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-stable] [PATCH] acl: acl_add can't insert
 before last list element, fix
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
X-List-Received-Date: Tue, 18 Jun 2013 18:15:54 -0000

On Tue, Jun 18, 2013 at 10:05:23AM +0200, Markus Armbruster wrote:
> Watch this:
> 
>     $ upstream-qemu -nodefaults -S -vnc :0,acl,sasl -monitor stdio
>     QEMU 1.5.50 monitor - type 'help' for more information
>     (qemu) acl_add vnc.username drei allow
>     acl: added rule at position 1
>     (qemu) acl_show vnc.username
>     policy: deny
>     1: allow drei
>     (qemu) acl_add vnc.username zwei allow 1
>     acl: added rule at position 2
>     (qemu) acl_show vnc.username
>     policy: deny
>     1: allow drei
>     2: allow zwei
>     (qemu) acl_add vnc.username eins allow 1
>     acl: added rule at position 1
>     (qemu) acl_show vnc.username
>     policy: deny
>     1: allow eins
>     2: allow drei
>     3: allow zwei
> 
> The second acl_add inserts at position 2 instead of 1.
> 
> Root cause is an off-by-one in qemu_acl_insert(): when index ==
> acl->nentries, it appends instead of inserting before the last list
> element.
> 
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Michael Roth <mdroth@linux.vnet.ibm.com>

> ---
>  util/acl.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/util/acl.c b/util/acl.c
> index a7f33ff..938b7ae 100644
> --- a/util/acl.c
> +++ b/util/acl.c
> @@ -138,9 +138,9 @@ int qemu_acl_insert(qemu_acl *acl,
> 
>      if (index <= 0)
>          return -1;
> -    if (index >= acl->nentries)
> +    if (index > acl->nentries) {
>          return qemu_acl_append(acl, deny, match);
> -
> +    }
> 
>      entry = g_malloc(sizeof(*entry));
>      entry->match = g_strdup(match);
> -- 
> 1.7.11.7
> 
> 

