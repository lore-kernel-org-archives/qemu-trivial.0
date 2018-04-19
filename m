Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f95n6-0004Hp-7F
	for mharc-qemu-trivial@gnu.org; Thu, 19 Apr 2018 05:23:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36832)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1f95n2-0004G5-SM
	for qemu-trivial@nongnu.org; Thu, 19 Apr 2018 05:23:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1f95n1-0005En-PQ
	for qemu-trivial@nongnu.org; Thu, 19 Apr 2018 05:23:40 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:34908 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1f95mw-00059R-I5; Thu, 19 Apr 2018 05:23:34 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F33B28D76C;
	Thu, 19 Apr 2018 09:23:23 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 65FA52166BAE;
	Thu, 19 Apr 2018 09:23:22 +0000 (UTC)
Date: Thu, 19 Apr 2018 10:23:20 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Olaf Hering <olaf@aepfle.de>,
	Markus Armbruster <armbru@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>, Fam Zheng <famz@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	"open list:All patches CC here" <qemu-devel@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20180419092320.GJ10259@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20180418123838.3511-1-olaf@aepfle.de>
	<20180418144538.4aa2f492.cohuck@redhat.com>
	<20180418125545.GN27579@redhat.com>
	<87sh7rvf27.fsf@dusky.pond.sub.org>
	<20180419093024.27c77433.olaf@aepfle.de>
	<20180419075958.GD10259@redhat.com>
	<CAFEAcA9UYM3hifEbs_sp9jcFkwu5sSSXaLq9CLWuhNbV67+MBQ@mail.gmail.com>
	<20180419092017.olujzxzlwvjlt6en@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20180419092017.olujzxzlwvjlt6en@sirius.home.kraxel.org>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Thu, 19 Apr 2018 09:23:24 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Thu, 19 Apr 2018 09:23:24 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
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
X-List-Received-Date: Thu, 19 Apr 2018 09:23:42 -0000

On Thu, Apr 19, 2018 at 11:20:17AM +0200, Gerd Hoffmann wrote:
>   Hi,
> 
> > Well, it depends. You might be stuck with an old distro because
> > some software you want to run depends on it, but also want to run
> > newer versions of some programs like QEMU. If you're in that
> > boat you can probably live with having to also compile a newer
> > version of glib to go with your newer QEMU, though.
> 
> Core libraries like glib might not be that easy, I've seen updating glib
> breaking apps in the past.

You would likely just have to build it all into /opt/qemu so it is
isolated from whatever the distro included. 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

