Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fT65L-0005VW-9X
	for mharc-qemu-trivial@gnu.org; Wed, 13 Jun 2018 09:45:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35036)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1fT65E-0005Nc-65
	for qemu-trivial@nongnu.org; Wed, 13 Jun 2018 09:45:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1fT658-0007tZ-3S
	for qemu-trivial@nongnu.org; Wed, 13 Jun 2018 09:45:08 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:47572 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1fT654-0007gq-L4; Wed, 13 Jun 2018 09:44:58 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3197D4021FCA;
	Wed, 13 Jun 2018 13:44:58 +0000 (UTC)
Received: from redhat.com (unknown [10.42.22.189])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0EAF21C5B4;
	Wed, 13 Jun 2018 13:44:54 +0000 (UTC)
Date: Wed, 13 Jun 2018 14:44:52 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, zhang.zhanghailiang@huawei.com,
	Ben Warren <ben@skyportsystems.com>, qemu-trivial@nongnu.org,
	Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20180613134452.GU19901@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <1528866321-23886-1-git-send-email-thuth@redhat.com>
	<1528866321-23886-5-git-send-email-thuth@redhat.com>
	<20180613133840.GK24528@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20180613133840.GK24528@stefanha-x1.localdomain>
User-Agent: Mutt/1.9.5 (2018-04-13)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Wed, 13 Jun 2018 13:44:58 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Wed, 13 Jun 2018 13:44:58 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'berrange@redhat.com' RCPT:''
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
X-List-Received-Date: Wed, 13 Jun 2018 13:45:12 -0000

On Wed, Jun 13, 2018 at 02:38:40PM +0100, Stefan Hajnoczi wrote:
> On Wed, Jun 13, 2018 at 07:05:21AM +0200, Thomas Huth wrote:
> > We've got three ways of enabling an accelerator: -machine accel=xyz,
> > -accel xyz and -enable-xyz. For new QEMU users, this must be very
> > confusing ("Which one do I have to use? Is there a difference between
> > the options?"). While -enable-kvm was useful in the past, there is no
> > real good reason for using it anymore today ("-accel kvm" is even less
> > to type than "-enable-kvm"), so let's decrease the confusing amount of
> > options in our documenation a little bit by removing the -enable-xyz
> > here. Note that the option itself is neither removed nor marked as
> > deprecated - since -enable-kvm is likely used in a lot of scripts and
> > since its code is easy to maintain, we should keep it around to avoid
> > to break old setups.
> > 
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > ---
> >  PS: I guess Paolo won't like this patch ... let's try it anyway ;-)
> 
> It's widely used and we're removing the documentation for it?!  That is
> likely to cause issues for new users who refer to the man page to
> understand the QEMU command-lines they see online, in scripts, etc.

Agreed, this is a very bad idea. Any option that is accepted by QEMU,
but not documented is a bug that must be fixed. IOW removing docs
is creating bugs.

If we want to help users understand why we have -enable-kvm, just
make the docs say that it is syntactic for '-machine accel=kvm'.
Users can decide for themselves whether they want to switch to
the more verbose way or not

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

