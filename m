Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iNYwa-00015H-5Q
	for mharc-qemu-trivial@gnu.org; Thu, 24 Oct 2019 04:58:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42253)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iNYwX-00014a-Vr
 for qemu-trivial@nongnu.org; Thu, 24 Oct 2019 04:58:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iNYwV-00045t-6V
 for qemu-trivial@nongnu.org; Thu, 24 Oct 2019 04:58:04 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:59715
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iNYwU-00044F-O1
 for qemu-trivial@nongnu.org; Thu, 24 Oct 2019 04:58:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571907480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sgj2kHCBhfIDMrtcNYT+KUTTqnro5jh/Ax+LK3eL7Bc=;
 b=Ok+pspR5b2+1P6xG5veyk5rVAacaEp6YUV29BVBrovUq9tFurqnroGfwFaIxUYyhwUAZ6K
 Bjxemw4UijK9845BSAjfGnOxZKdOGOUxC82ML4PH7shEeLpbmyPdEzKdFMs+KDdu6IB1bv
 FzVJgP/v0nUn+aZFSVx1Pc8qTJWoOIQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-JTeIz7qKOUmyyWix7KMF7A-1; Thu, 24 Oct 2019 04:57:58 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B85095E9;
 Thu, 24 Oct 2019 08:57:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.118.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2508362A8A;
 Thu, 24 Oct 2019 08:57:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5C7021138619; Thu, 24 Oct 2019 10:57:52 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Subject: Re: [PATCH] buildfix: update texinfo menu
References: <20191023101956.19120-1-kraxel@redhat.com>
Date: Thu, 24 Oct 2019 10:57:52 +0200
In-Reply-To: <20191023101956.19120-1-kraxel@redhat.com> (Gerd Hoffmann's
 message of "Wed, 23 Oct 2019 12:19:56 +0200")
Message-ID: <87ftjitt9r.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: JTeIz7qKOUmyyWix7KMF7A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Oct 2019 08:58:07 -0000

Gerd Hoffmann <kraxel@redhat.com> writes:

> Build error message:
> qemu-doc.texi:34: node `Top' lacks menu item for `Recently removed featur=
es' despite being its Up target
>
> Fixes: 3264ffced3d0 ("dirty-bitmaps: remove deprecated autoload parameter=
")
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  qemu-doc.texi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/qemu-doc.texi b/qemu-doc.texi
> index 3c5022050f0f..3ddf5c0a6865 100644
> --- a/qemu-doc.texi
> +++ b/qemu-doc.texi
> @@ -44,6 +44,7 @@
>  * Security::
>  * Implementation notes::
>  * Deprecated features::
> +* Recently removed features::
>  * Supported build platforms::
>  * License::
>  * Index::

Reviewed-by: Markus Armbruster <armbru@redhat.com>

Cc'ing qemu-trivial.


