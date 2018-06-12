Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSgC0-0006we-Qt
	for mharc-qemu-trivial@gnu.org; Tue, 12 Jun 2018 06:06:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40295)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fSgBy-0006uU-WE
	for qemu-trivial@nongnu.org; Tue, 12 Jun 2018 06:06:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fSgBy-0007zo-5E
	for qemu-trivial@nongnu.org; Tue, 12 Jun 2018 06:06:22 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:45424 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1fSgBn-0007w8-8P; Tue, 12 Jun 2018 06:06:11 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CED047C6C4;
	Tue, 12 Jun 2018 10:06:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-109.ams2.redhat.com
	[10.36.116.109])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 975F1111C481;
	Tue, 12 Jun 2018 10:06:10 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 19D723B6; Tue, 12 Jun 2018 12:06:09 +0200 (CEST)
Date: Tue, 12 Jun 2018 12:06:09 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Laurent Vivier <laurent@vivier.eu>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20180612100609.7k4u4a7quhqwjkjg@sirius.home.kraxel.org>
References: <20180608170933.9137-1-berrange@redhat.com>
	<20180608170933.9137-3-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20180608170933.9137-3-berrange@redhat.com>
User-Agent: NeoMutt/20180512
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Tue, 12 Jun 2018 10:06:10 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Tue, 12 Jun 2018 10:06:10 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH 2/8] hw/usb: switch MTP to use new
 inotify APIs
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
X-List-Received-Date: Tue, 12 Jun 2018 10:06:23 -0000

On Fri, Jun 08, 2018 at 06:09:27PM +0100, Daniel P. Berrang=E9 wrote:
> The internal inotify APIs allow alot of conditional statements to be
> cleared out, and provide a simpler callback for handling events.
>=20
> Signed-off-by: Daniel P. Berrang=E9 <berrange@redhat.com>

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>


