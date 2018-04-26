Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fBfjF-00046U-6b
	for mharc-qemu-trivial@gnu.org; Thu, 26 Apr 2018 08:10:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59049)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1fBfjC-00043m-Nu
	for qemu-trivial@nongnu.org; Thu, 26 Apr 2018 08:10:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1fBfj9-000889-Go
	for qemu-trivial@nongnu.org; Thu, 26 Apr 2018 08:10:22 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:60214 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1fBfj0-00085y-LO; Thu, 26 Apr 2018 08:10:10 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 28786F8FE3;
	Thu, 26 Apr 2018 12:10:10 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.4])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E19A2202323B;
	Thu, 26 Apr 2018 12:10:04 +0000 (UTC)
Date: Thu, 26 Apr 2018 13:10:02 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Olaf Hering <olaf@aepfle.de>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Fam Zheng <famz@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	"open list:All patches CC here" <qemu-devel@nongnu.org>,
	Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20180426121002.GG26812@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20180418123838.3511-1-olaf@aepfle.de>
	<20180418124753.GM27579@redhat.com>
	<CAFEAcA_TtC-p4JJFRPaBFwim1a8J9G+z79KAK8vqrTx7ZKjOKg@mail.gmail.com>
	<20180418144433.GV27579@redhat.com>
	<CAFEAcA8jXwo35B7KVdVZEiqZTtMRvVXCP87iHKECjWPkHiTJ_A@mail.gmail.com>
	<c9b7c417-e714-658b-20da-7150c9ec8ab9@redhat.com>
	<20180426140807.4a4a577b.olaf@aepfle.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20180426140807.4a4a577b.olaf@aepfle.de>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Thu, 26 Apr 2018 12:10:10 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Thu, 26 Apr 2018 12:10:10 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
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
X-List-Received-Date: Thu, 26 Apr 2018 12:10:23 -0000

On Thu, Apr 26, 2018 at 02:08:07PM +0200, Olaf Hering wrote:
> Am Thu, 26 Apr 2018 13:52:04 +0200
> schrieb Paolo Bonzini <pbonzini@redhat.com>:
> 
> > min-glib Dockerfile is using glib 2.22
> 
> Why did it not prevent the bad commit from entering 2.12?

Presumably the min-glib docker job didn't enable the vfio feature, which
is what contained the bad code.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

