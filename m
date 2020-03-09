Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jBKSh-0004xm-6P
	for mharc-qemu-trivial@gnu.org; Mon, 09 Mar 2020 11:36:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39064)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1jBKSe-0004rk-6r
 for qemu-trivial@nongnu.org; Mon, 09 Mar 2020 11:36:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1jBKSd-0005qI-2Q
 for qemu-trivial@nongnu.org; Mon, 09 Mar 2020 11:36:56 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33833
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1jBKSc-0005q0-VE
 for qemu-trivial@nongnu.org; Mon, 09 Mar 2020 11:36:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583768214;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eG+zSgZUNz/14nsquyO0VyjTc4txO/Znzv9papAs/e4=;
 b=OLPc/W6sBLcTSFhrnSWnFZmItx53wwK2CIEB+I4TDOYSAgAkb3cDnEy+RavVOKQboDaemt
 DmQQLkMnm8g6IhHs0xd8Gon6TFiE0Mw4n28N+N2rozIDqbsBgukz73ZbCR12nP0ZD0k5HH
 W1ohvBgGMZ8MDIMY78nMEvSfkYeuh2s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-TNcIz1DENmmxLvE89sU2zA-1; Mon, 09 Mar 2020 11:36:36 -0400
X-MC-Unique: TNcIz1DENmmxLvE89sU2zA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1514CDB60;
 Mon,  9 Mar 2020 15:36:35 +0000 (UTC)
Received: from redhat.com (ovpn-112-61.ams2.redhat.com [10.36.112.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E754E1BC6D;
 Mon,  9 Mar 2020 15:36:27 +0000 (UTC)
Date: Mon, 9 Mar 2020 15:36:24 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 pkrempa@redhat.com, "open list:Sheepdog" <sheepdog@lists.wpkg.org>,
 qemu-block@nongnu.org, libvir-list@redhat.com,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org, mreitz@redhat.com,
 "open list:Trivial patches" <qemu-trivial@nongnu.org>,
 Liu Yuan <namei.unix@gmail.com>, Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v3 1/4] block: Add trivial backing_fmt support to qcow,
 sheepdog, vmdk
Message-ID: <20200309153624.GK3033513@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20200306225121.3199279-1-eblake@redhat.com>
 <20200306225121.3199279-2-eblake@redhat.com>
 <20200309152112.GC6478@linux.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20200309152112.GC6478@linux.fritz.box>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Mon, 09 Mar 2020 15:36:57 -0000

On Mon, Mar 09, 2020 at 04:21:12PM +0100, Kevin Wolf wrote:
> Am 06.03.2020 um 23:51 hat Eric Blake geschrieben:
> > For qcow2 and qed, we want to encourage the use of -F always, as these
> > formats can suffer from data corruption or security holes if backing
> > format is probed.  But for other formats, the backing format cannot be
> > recorded.  Making the user decide on a per-format basis whether to
> > supply a backing format string is awkward, better is to just blindly
> > accept a backing format argument even if it is ignored by the
> > contraints of the format at hand.
> >=20
> > Signed-off-by: Eric Blake <eblake@redhat.com>
>=20
> I'm not sure if I agree with this reasoning. Accepting and silently
> ignoring -F could give users a false sense of security. If I specify a
> -F raw and QEMU later probes qcow2, that would be very surprising.

And if the user specifies "-F raw" and we probe qcow2, and the user
does not realize this, they can become silently reliant on always
probing qcow2. If we then honour the "-F raw" option in a later
QEMU release, we'll break the behaviour they've relied on.

IMHO, we must not accept "-F fmt" unless we're in a position to
honour it.

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|


