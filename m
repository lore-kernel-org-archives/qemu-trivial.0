Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fVIN8-00077K-6e
	for mharc-qemu-trivial@gnu.org; Tue, 19 Jun 2018 11:16:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55585)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1fVIN2-00072k-BX
	for qemu-trivial@nongnu.org; Tue, 19 Jun 2018 11:16:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1fVIN1-0000aG-Hb
	for qemu-trivial@nongnu.org; Tue, 19 Jun 2018 11:16:36 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:39256 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1fVIMs-0000UX-Na; Tue, 19 Jun 2018 11:16:26 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 581AE87903;
	Tue, 19 Jun 2018 15:16:25 +0000 (UTC)
Received: from gondolin (dhcp-192-215.str.redhat.com [10.33.192.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 923DD2156880;
	Tue, 19 Jun 2018 15:16:23 +0000 (UTC)
Date: Tue, 19 Jun 2018 17:15:39 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>, Thomas Huth
	<thuth@redhat.com>, zhang.zhanghailiang@huawei.com, Ben Warren
	<ben@skyportsystems.com>, qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20180619171539.0adc90d6.cohuck@redhat.com>
In-Reply-To: <87k1r24quk.fsf@dusky.pond.sub.org>
References: <1528866321-23886-1-git-send-email-thuth@redhat.com>
	<1528866321-23886-5-git-send-email-thuth@redhat.com>
	<20180613133840.GK24528@stefanha-x1.localdomain>
	<20180613134452.GU19901@redhat.com>
	<b0ebd968-797f-48e0-32c1-869c452feca9@redhat.com>
	<20180613151942.GC19901@redhat.com>
	<87k1r24quk.fsf@dusky.pond.sub.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Tue, 19 Jun 2018 15:16:25 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Tue, 19 Jun 2018 15:16:25 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'cohuck@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [RFC PATCH 4/4] qemu-options: Do
 not show -enable-kvm and -enable-hax in the docs anymore
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
X-List-Received-Date: Tue, 19 Jun 2018 15:16:40 -0000

On Wed, 13 Jun 2018 18:02:27 +0200
Markus Armbruster <armbru@redhat.com> wrote:

> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> > If I'm a user looking for how to enable KVM, then -enable-kvm is the
> > one I'll pick because of the obvious name. =20
>=20
> Why does a user have to know how to enable KVM?  Oh, because our default
> is "run this guest much slower than necessary".  Great!

Should we try again to default to a better accelerator, if possible? I
don't quite recall why we didn't do so the last time that came up...
was it tests?

