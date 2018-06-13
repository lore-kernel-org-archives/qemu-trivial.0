Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fT8Lt-0002eN-Gs
	for mharc-qemu-trivial@gnu.org; Wed, 13 Jun 2018 12:10:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48621)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fT8Lr-0002cP-Eg
	for qemu-trivial@nongnu.org; Wed, 13 Jun 2018 12:10:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fT8Lq-0001IV-H9
	for qemu-trivial@nongnu.org; Wed, 13 Jun 2018 12:10:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44882)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1fT8Lk-00012m-Lj; Wed, 13 Jun 2018 12:10:20 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 81FE13082A21;
	Wed, 13 Jun 2018 16:10:19 +0000 (UTC)
Received: from localhost (ovpn-116-19.gru2.redhat.com [10.97.116.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6987E89D35;
	Wed, 13 Jun 2018 16:10:13 +0000 (UTC)
Date: Wed, 13 Jun 2018 13:10:12 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Ben Warren <ben@skyportsystems.com>, zhang.zhanghailiang@huawei.com,
	Markus Armbruster <armbru@redhat.com>, qemu-trivial@nongnu.org
Message-ID: <20180613161012.GT7451@localhost.localdomain>
References: <1528866321-23886-1-git-send-email-thuth@redhat.com>
	<1528866321-23886-2-git-send-email-thuth@redhat.com>
	<540abc07-2b96-bf0b-6f5a-2a4efc5184d9@redhat.com>
	<c203ab47-c88b-544d-0233-f7ba48e5e639@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c203ab47-c88b-544d-0233-f7ba48e5e639@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Wed, 13 Jun 2018 16:10:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH 1/4] Replace '-machine accel=xyz' with
 '-accel xyz'
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
X-List-Received-Date: Wed, 13 Jun 2018 16:10:28 -0000

On Wed, Jun 13, 2018 at 02:53:04PM +0200, Thomas Huth wrote:
> On 13.06.2018 14:48, Paolo Bonzini wrote:
> > On 13/06/2018 07:05, Thomas Huth wrote:
> >> diff --git a/tests/vmgenid-test.c b/tests/vmgenid-test.c
> >> index 8d915c6..4324034 100644
> >> --- a/tests/vmgenid-test.c
> >> +++ b/tests/vmgenid-test.c
> >> @@ -131,7 +131,7 @@ static void read_guid_from_monitor(QemuUUID *guid)
> >>  static char disk[] = "tests/vmgenid-test-disk-XXXXXX";
> >>  
> >>  #define GUID_CMD(guid)                          \
> >> -    "-machine accel=kvm:tcg "                   \
> >> +    "-accel kvm:tcg "                           \
> >>      "-device vmgenid,id=testvgid,guid=%s "      \
> > 
> > "-accel kvm:tcg" works, but it really shouldn't (and I think we can
> > change it without a deprecation period).   The right syntax would be
> > "-accel kvm -accel tcg", so that you can specify options that are valid
> > only for KVM, or onlty for TCG.
> 
> I see your point, but this would break these qtests that are trying to
> override the "-machine accel=qtest" from libqtest.c this way... and if
> any other tool out there in the wild is already depending on this
> behavior, too, we can not change it so easily anymore.

Tools might rely in "-machine accel=kvm:tcg", but I don't think
anybody should be relying on "-accel kvm:tcg" to work.

I agree with Paolo.  If "-accel kvm:tcg" works today, I think we
should either remove that behavior immediately, or deprecate it
on QEMU 3.0.

We should also make sure "-accel kvm,FOO=BAR -accel tcg" won't
set FOO=BAR in the TCG accelerator if KVM is unavailable.

-- 
Eduardo

