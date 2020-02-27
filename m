Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j7GKR-0004oi-Cr
	for mharc-qemu-trivial@gnu.org; Thu, 27 Feb 2020 05:23:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43527)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1j7GKO-0004gx-Af
 for qemu-trivial@nongnu.org; Thu, 27 Feb 2020 05:23:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1j7GKE-0001fv-6j
 for qemu-trivial@nongnu.org; Thu, 27 Feb 2020 05:23:36 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:24181
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1j7GKE-0001fH-3M
 for qemu-trivial@nongnu.org; Thu, 27 Feb 2020 05:23:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582799005;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HpAZRkTSNyf6882gZT2RNP8pEIg/Do3AyTJYPaPK+ns=;
 b=deng7z/xo/rKzhbr96Mgvok+q+XRLzxOluq7R1ZxPCK3hWwJNJ5+A9i2vBfmK4xIJrYVWD
 AuTGfNlAP0l1/Ra8NMcgj+DazkfuA/aF9RH4/jOWiPIUhSOAf1dsLPAohtI7m3UpE+cWau
 dNCMmss0VvtrvEndnR9PeHd597h/B98=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-zyOAoqYkPpSRlGlndzqWpQ-1; Thu, 27 Feb 2020 05:23:21 -0500
X-MC-Unique: zyOAoqYkPpSRlGlndzqWpQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4A63189F762;
 Thu, 27 Feb 2020 10:23:20 +0000 (UTC)
Received: from redhat.com (ovpn-112-43.ams2.redhat.com [10.36.112.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 693815DA76;
 Thu, 27 Feb 2020 10:23:16 +0000 (UTC)
Date: Thu, 27 Feb 2020 10:23:13 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/2] chardev: Improve error report by calling
 error_setg_win32()
Message-ID: <20200227102313.GD1645630@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20200227100250.20514-1-philmd@redhat.com>
 <20200227100250.20514-2-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200227100250.20514-2-philmd@redhat.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
X-List-Received-Date: Thu, 27 Feb 2020 10:23:37 -0000

On Thu, Feb 27, 2020 at 11:02:49AM +0100, Philippe Mathieu-Daud=C3=A9 wrote=
:
> Use error_setg_win32() which adds a hint similar to strerror(errno)).
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  chardev/char-pipe.c | 2 +-
>  chardev/char-win.c  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>


Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|


