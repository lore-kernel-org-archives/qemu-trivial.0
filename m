Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1esvJY-0002Zu-4N
	for mharc-qemu-trivial@gnu.org; Mon, 05 Mar 2018 13:58:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44623)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1esvJS-0002Ua-LC
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 13:58:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1esvJR-0005oT-RE
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 13:58:18 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:54064 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1esvJH-0005kP-Uo; Mon, 05 Mar 2018 13:58:08 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3BEA54063640;
	Mon,  5 Mar 2018 18:58:07 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.59])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 86AF71C551;
	Mon,  5 Mar 2018 18:57:56 +0000 (UTC)
Date: Mon, 5 Mar 2018 18:57:54 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Walle <michael@walle.cc>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Yongbok Kim <yongbok.kim@mips.com>, Marek Vasut <marex@denx.de>,
	Alexander Graf <agraf@suse.de>,
	=?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
	Marcel Apfelbaum <marcel@redhat.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Chris Wulff <crwulff@gmail.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Paul Burton <paul.burton@mips.com>,
	"open list:New World" <qemu-ppc@nongnu.org>,
	Aurelien Jarno <aurelien@aurel32.net>
Message-ID: <20180305185754.GE17368@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20180305112732.26471-1-f4bug@amsat.org>
	<20180305112732.26471-3-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20180305112732.26471-3-f4bug@amsat.org>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Mon, 05 Mar 2018 18:58:07 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Mon, 05 Mar 2018 18:58:07 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'berrange@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [RFC PATCH v2 02/30] hw: include
 "qemu/cunits.h" and clean unused "qemu/cutils.h"
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Mar 2018 18:58:22 -0000

On Mon, Mar 05, 2018 at 08:27:04AM -0300, Philippe Mathieu-Daud=C3=A9 wro=
te:
> These files were including "qemu/cutils.h" to use the byte-based size
> definitions, now available in "qemu/cunits.h".

I know I'm "complaining" about bike-shed colour here....

Feels like just calling it units.h is sufficient - all our .h code is
C code so don't need reminding of it by filename, particularly since
we're avoiding system header clash by using the qemu/ prefix on #includes=
.

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Regardless of whether you rename it or not though,

   Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>


Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

