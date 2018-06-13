Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fT8Ea-0005kf-Es
	for mharc-qemu-trivial@gnu.org; Wed, 13 Jun 2018 12:02:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46616)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fT8ET-0005ec-Qf
	for qemu-trivial@nongnu.org; Wed, 13 Jun 2018 12:02:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fT8EN-0006bp-Pg
	for qemu-trivial@nongnu.org; Wed, 13 Jun 2018 12:02:49 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:57776 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1fT8EC-00063q-P0; Wed, 13 Jun 2018 12:02:32 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6190C859C5;
	Wed, 13 Jun 2018 16:02:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-1.ams2.redhat.com [10.36.117.1])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CF7221116706;
	Wed, 13 Jun 2018 16:02:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id A33BE1138645; Wed, 13 Jun 2018 18:02:27 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, zhang.zhanghailiang@huawei.com,
	Ben Warren <ben@skyportsystems.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>
References: <1528866321-23886-1-git-send-email-thuth@redhat.com>
	<1528866321-23886-5-git-send-email-thuth@redhat.com>
	<20180613133840.GK24528@stefanha-x1.localdomain>
	<20180613134452.GU19901@redhat.com>
	<b0ebd968-797f-48e0-32c1-869c452feca9@redhat.com>
	<20180613151942.GC19901@redhat.com>
Date: Wed, 13 Jun 2018 18:02:27 +0200
In-Reply-To: <20180613151942.GC19901@redhat.com> ("Daniel P. =?utf-8?Q?Ber?=
	=?utf-8?Q?rang=C3=A9=22's?=
	message of "Wed, 13 Jun 2018 16:19:42 +0100")
Message-ID: <87k1r24quk.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Wed, 13 Jun 2018 16:02:31 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Wed, 13 Jun 2018 16:02:31 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'armbru@redhat.com' RCPT:''
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
X-List-Received-Date: Wed, 13 Jun 2018 16:02:56 -0000

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Wed, Jun 13, 2018 at 05:11:51PM +0200, Thomas Huth wrote:
>> On 13.06.2018 15:44, Daniel P. Berrang=C3=A9 wrote:
>> > On Wed, Jun 13, 2018 at 02:38:40PM +0100, Stefan Hajnoczi wrote:
>> >> On Wed, Jun 13, 2018 at 07:05:21AM +0200, Thomas Huth wrote:
>> >>> We've got three ways of enabling an accelerator: -machine accel=3Dxy=
z,
>> >>> -accel xyz and -enable-xyz. For new QEMU users, this must be very
>> >>> confusing ("Which one do I have to use? Is there a difference between
>> >>> the options?"). While -enable-kvm was useful in the past, there is no
>> >>> real good reason for using it anymore today ("-accel kvm" is even le=
ss
>> >>> to type than "-enable-kvm"), so let's decrease the confusing amount =
of
>> >>> options in our documenation a little bit by removing the -enable-xyz
>> >>> here. Note that the option itself is neither removed nor marked as
>> >>> deprecated - since -enable-kvm is likely used in a lot of scripts and
>> >>> since its code is easy to maintain, we should keep it around to avoid
>> >>> to break old setups.
>> >>>
>> >>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> >>> ---
>> >>>  PS: I guess Paolo won't like this patch ... let's try it anyway ;-)
>> >>
>> >> It's widely used and we're removing the documentation for it?!  That =
is
>> >> likely to cause issues for new users who refer to the man page to
>> >> understand the QEMU command-lines they see online, in scripts, etc.
>> >=20
>> > Agreed, this is a very bad idea. Any option that is accepted by QEMU,
>> > but not documented is a bug that must be fixed. IOW removing docs
>> > is creating bugs.
>>=20
>> Not documenting unliked options that are still kept for compatibility
>> was at least a common practice in the past (see -no-kvm for example, or
>> many of those deprecated options like -net channel that have been
>> removed in the past year).

Not least because both --help output and the user manual are hard enough
to read without them droning about umpteen deprecated things you could
also use, but shouldn't.

> If we're planning to deprecate & then delete an option, then I
> don't mind if docs are dropped,

De-documenting deprecated options that warn "use this instead" feels
like a no-brainer to me.

>                                 but IIUC, in this case we're
> not doing that - the option will essentially exist forever.

Deprecated option: something we don't want users to use, and intend to
remove.  It should warn on use, pointing to the replacement, and
documentation should no longer cover it.

Convenience option: something we consider perfectly fine to use, say
because it's much less typing.  Document normally.

Legacy option: something in between, i.e. we don't intend to remove it,
but we don't want to advertise it, either.  The less of those we have,
the happier I am.  Their documentation to be shunted out of the way, so
users can find it if they need it, but won't find it *first* when they
look for how to do something.

>> > If we want to help users understand why we have -enable-kvm, just
>> > make the docs say that it is syntactic for '-machine accel=3Dkvm'.
>> > Users can decide for themselves whether they want to switch to
>> > the more verbose way or not
>>=20
>> Uh, well, in this case "-enable-kvm" is already the more verbose way:
>> "-accel kvm" is shorter :-)
>
> If I'm a user looking for how to enable KVM, then -enable-kvm is the
> one I'll pick because of the obvious name.

Why does a user have to know how to enable KVM?  Oh, because our default
is "run this guest much slower than necessary".  Great!

By "pick", I guess you mean "pick out of output of --help".  If the only
occurence of KVM there was --accel kvm, I trust the user would pick that
without any trouble.  Less confusing than what we have now, I'd say.

>> It's just a big mess: We've got -enable-kvm, -enable-hax, but there is
>> no -enable-hvf, -enable-whpx or -enable-xen option. And to force TCG
>> mode, you've got to use -no-kvm ... honestly, if I were a new user, I'd
>> simply say: WTF!?!
>
> Personally I'd just clean that up by just adding the missing
> -enable-xxx options for consistency :-)

I disagree.  The way to a saner QEMU CLI is reducing crap, not adding
crap for consistency.

>> But ok, since -enable-kvm has such a big tradition and is used in a lot
>> of examples out there, it's likely really better if we keep it in the
>> documentation. But we should either move it to a "obsolete option"
>> chapter, or update the current documentation with some words like
>> "obsolete" or "legacy" (to make it clear that nobody gets the idea of
>> introducing -enable-hvf or other similar options in the future).
>>=20
>> And what about -enable-hax? That hardly has any tradtion. Should we
>> maybe even deprecate it?

I would, but it's not a hill I'm prepared to die on.

