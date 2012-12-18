Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tkzau-0003Ys-RO
	for mharc-qemu-trivial@gnu.org; Tue, 18 Dec 2012 11:00:36 -0500
Received: from eggs.gnu.org ([208.118.235.92]:36793)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Tkzar-0003QQ-S6
	for qemu-trivial@nongnu.org; Tue, 18 Dec 2012 11:00:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Tkzaq-000613-PT
	for qemu-trivial@nongnu.org; Tue, 18 Dec 2012 11:00:33 -0500
Received: from mail-we0-f182.google.com ([74.125.82.182]:58753)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Tkzad-0005ur-90; Tue, 18 Dec 2012 11:00:19 -0500
Received: by mail-we0-f182.google.com with SMTP id u54so399010wey.27
	for <multiple recipients>; Tue, 18 Dec 2012 08:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=ZvcRMi6/U/3JzXAI5NURGzIeHLV97y6eDZxlbfYTpgI=;
	b=LYDQlPLI+MMo85HZQS74QW8ZQA81wlslBVL5RNp7R/BB04UR7F5eh/L9uLy8jhjCon
	J18ceZA8Fhvy4t8CzA1eaB19/3QgToE4xOGo3+fqnRWnLN2/2BzLxUv9/XUitYVZA2UZ
	kWQ9MRT50Z+s4RYCnAt2NS1UgrqzxdENHnOsnGSn7NAUgIzvt/WCv65BlXFhRfz8Zi/3
	JAePhExsKNn+W05h4z9no8WcNBXaLP/9x4BmpeP8YGTqES7e0034WOsKnpB6UYjIEgBu
	dprHDTzrp6EwBvh7HvNo9sajnNsZp3dMZSKzrcOnyZPNEG9qTvLI5fbsSbbXSelCM7O2
	Q+jQ==
X-Received: by 10.180.24.4 with SMTP id q4mr5749080wif.19.1355846415995;
	Tue, 18 Dec 2012 08:00:15 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id s10sm3277190wiw.4.2012.12.18.08.00.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Dec 2012 08:00:14 -0800 (PST)
Date: Tue, 18 Dec 2012 17:00:13 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Alon Levy <alevy@redhat.com>
Message-ID: <20121218160013.GB12099@stefanha-thinkpad.redhat.com>
References: <1354795349-2613-1-git-send-email-alevy@redhat.com>
	<1354795700-3052-1-git-send-email-alevy@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1354795700-3052-1-git-send-email-alevy@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.125.82.182
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] arch_init/ram_load: add
 error message for block length mismatch
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
X-List-Received-Date: Tue, 18 Dec 2012 16:00:36 -0000

On Thu, Dec 06, 2012 at 02:08:20PM +0200, Alon Levy wrote:
> Signed-off-by: Alon Levy <alevy@redhat.com>
> ---
> Please ignore previous version, accidentally removed goto done and used wrong
> format size specifiers.
> 
>  arch_init.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch_init.c b/arch_init.c
> index e6effe8..fba24f3 100644
> --- a/arch_init.c
> +++ b/arch_init.c
> @@ -808,6 +808,9 @@ static int ram_load(QEMUFile *f, void *opaque, int version_id)
>                      QLIST_FOREACH(block, &ram_list.blocks, next) {
>                          if (!strncmp(id, block->idstr, sizeof(id))) {
>                              if (block->length != length) {
> +                                fprintf(stderr, "Length mismatch: %s: %ld "
> +                                        "in != %ld\n", id, length,
> +                                        block->length);

Please use RAM_ADDR_FMT for ram_addr_t values.

Stefan

