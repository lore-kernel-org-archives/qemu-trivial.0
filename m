Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fWQWo-0001uq-5i
	for mharc-qemu-trivial@gnu.org; Fri, 22 Jun 2018 14:11:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60316)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fWQWm-0001tW-9j
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2018 14:11:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fWQWl-0000iO-Fv
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2018 14:11:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33480)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1fWQWg-0000hK-4v; Fri, 22 Jun 2018 14:11:14 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0E8473082A39;
	Fri, 22 Jun 2018 18:11:13 +0000 (UTC)
Received: from localhost (ovpn-116-16.gru2.redhat.com [10.97.116.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AF89C413B;
	Fri, 22 Jun 2018 18:11:10 +0000 (UTC)
Date: Fri, 22 Jun 2018 15:11:09 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Thomas Huth <thuth@redhat.com>, zhang.zhanghailiang@huawei.com,
	Ben Warren <ben@skyportsystems.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20180622181108.GY7451@localhost.localdomain>
References: <1528866321-23886-1-git-send-email-thuth@redhat.com>
	<1528866321-23886-5-git-send-email-thuth@redhat.com>
	<20180613133840.GK24528@stefanha-x1.localdomain>
	<20180613134452.GU19901@redhat.com>
	<b0ebd968-797f-48e0-32c1-869c452feca9@redhat.com>
	<20180613151942.GC19901@redhat.com>
	<87k1r24quk.fsf@dusky.pond.sub.org>
	<20180619171539.0adc90d6.cohuck@redhat.com>
	<d4e02083-c372-3ce5-d4a2-4809579fc8f2@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4e02083-c372-3ce5-d4a2-4809579fc8f2@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Fri, 22 Jun 2018 18:11:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Fri, 22 Jun 2018 18:11:21 -0000

On Tue, Jun 19, 2018 at 06:16:33PM +0200, Paolo Bonzini wrote:
> On 19/06/2018 17:15, Cornelia Huck wrote:
> >> Why does a user have to know how to enable KVM?  Oh, because our default
> >> is "run this guest much slower than necessary".  Great!
> > Should we try again to default to a better accelerator, if possible? I
> > don't quite recall why we didn't do so the last time that came up...
> > was it tests?
> 
> My plan was to create qemu-{kvm,hax,hvf,whpx} binaries that default to a
> better accelerator, and leave qemu-system-* as defaulting to TCG.  This
> matches what distributions already do.

Why is this better than using KVM by default if it's available?

-- 
Eduardo

