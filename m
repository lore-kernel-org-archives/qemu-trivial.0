Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cr3Ps-0002Hw-RG
	for mharc-qemu-trivial@gnu.org; Thu, 23 Mar 2017 10:08:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46493)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cr3Pp-0002Fa-Se
	for qemu-trivial@nongnu.org; Thu, 23 Mar 2017 10:08:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cr3Po-0004JJ-Vr
	for qemu-trivial@nongnu.org; Thu, 23 Mar 2017 10:08:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57690)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1cr3Pi-0004Hn-Qb; Thu, 23 Mar 2017 10:08:30 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DBF6E8C1AF;
	Thu, 23 Mar 2017 14:08:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com DBF6E8C1AF
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=armbru@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com DBF6E8C1AF
Received: from blackfin.pond.sub.org (ovpn-116-26.ams2.redhat.com
	[10.36.116.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EC961914B;
	Thu, 23 Mar 2017 14:08:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id ED5611138645; Thu, 23 Mar 2017 15:08:24 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>,  Peter Crosthwaite
	<crosthwaite.peter@gmail.com>, qemu-trivial@nongnu.org, Alexander Graf
	<agraf@suse.de>,  qemu-devel@nongnu.org,  =?utf-8?Q?Marc-Andr=C3=A9?=
	Lureau <marcandre.lureau@gmail.com>, Philippe =?utf-8?Q?Mathieu-Daud?=
	=?utf-8?Q?=C3=A9?= <f4bug@amsat.org>
References: <20170322204844.446-1-f4bug@amsat.org>
	<20170322204844.446-2-f4bug@amsat.org>
	<87y3vw1o94.fsf@dusky.pond.sub.org>
	<1490255007.463.11.camel@redhat.com>
	<CAJ+F1CJNy+e83EHR_8uzAHURxDk6idnNTTL_FoD-krWPue7Lww@mail.gmail.com>
	<1490262680.463.27.camel@redhat.com>
	<87tw6ktban.fsf@dusky.pond.sub.org>
	<1490277406.13302.1.camel@redhat.com>
Date: Thu, 23 Mar 2017 15:08:24 +0100
In-Reply-To: <1490277406.13302.1.camel@redhat.com> (Gerd Hoffmann's message of
	"Thu, 23 Mar 2017 14:56:46 +0100")
Message-ID: <878tnwm6g7.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 23 Mar 2017 14:08:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH RESEND 1/3] usb-ccid: make
 ccid_write_data_block() cope with null buffers
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
X-List-Received-Date: Thu, 23 Mar 2017 14:08:38 -0000

Gerd Hoffmann <kraxel@redhat.com> writes:

> On Do, 2017-03-23 at 13:41 +0100, Markus Armbruster wrote:
>> Gerd Hoffmann <kraxel@redhat.com> writes:
>> 
>> >   Hi,
>> >
>> >>  oops, there are hard-coded calls with NULL/0. I suppose to fix clang
>> >> warning, it would need to check if data != null for memcpy.
>> >
>> > I'd check for len > 0, and in that if branch we can also assert on data
>> > == NULL and thereby check that len and data are consistent.
>> 
>> If len is non-zero but data is null, memcpy() will crash just fine by
>> itself, so why bother asserting.
>
> To make clang happy?  But maybe clang is clever enough to figure data
> can't be null at that point in case we call memcpy with len != 0
> only ...

If Clang needs another hint to become happy, then an assertion is a fine
way to provide it.

