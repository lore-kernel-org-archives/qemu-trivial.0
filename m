Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f94Vm-0001BV-FC
	for mharc-qemu-trivial@gnu.org; Thu, 19 Apr 2018 04:01:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49141)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1f94V6-0000n3-QB
	for qemu-trivial@nongnu.org; Thu, 19 Apr 2018 04:01:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1f94Ue-0008Mx-Qr
	for qemu-trivial@nongnu.org; Thu, 19 Apr 2018 04:01:04 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:54464 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1f94UD-0007qe-Nb; Thu, 19 Apr 2018 04:00:09 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 309D940711D4;
	Thu, 19 Apr 2018 08:00:09 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A4D5910F1BFB;
	Thu, 19 Apr 2018 08:00:00 +0000 (UTC)
Date: Thu, 19 Apr 2018 08:59:58 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Olaf Hering <olaf@aepfle.de>
Cc: Markus Armbruster <armbru@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Fam Zheng <famz@redhat.com>, qemu-trivial@nongnu.org,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	"open list:All patches CC here" <qemu-devel@nongnu.org>,
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20180419075958.GD10259@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20180418123838.3511-1-olaf@aepfle.de>
	<20180418144538.4aa2f492.cohuck@redhat.com>
	<20180418125545.GN27579@redhat.com>
	<87sh7rvf27.fsf@dusky.pond.sub.org>
	<20180419093024.27c77433.olaf@aepfle.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20180419093024.27c77433.olaf@aepfle.de>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Thu, 19 Apr 2018 08:00:09 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Thu, 19 Apr 2018 08:00:09 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'berrange@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1] configure: require
 glib-2.24
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
X-List-Received-Date: Thu, 19 Apr 2018 08:01:46 -0000

On Thu, Apr 19, 2018 at 09:30:24AM +0200, Olaf Hering wrote:
> Am Thu, 19 Apr 2018 09:19:28 +0200
> schrieb Markus Armbruster <armbru@redhat.com>:
> 
> > > [1]   https://libvirt.org/platforms.html  
> > This policy looks sensible to me
> 
> Unless I misinterpret that, noone cares about SLE11 anymore.

I wouldn't say people don't care about SLE11 (or other similarly old distros
like RHEL-6). Rather the view in libvirt was that if a user is stuck on such
an old distro, they are likely doing that because they want the stability
inherant in running fixed software versions for years. IOW it is unlikely
that they want the stability of an old distro, combined with cutting edge
libvirt and/or QEMU.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

